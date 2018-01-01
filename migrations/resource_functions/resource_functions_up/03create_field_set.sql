--0 CREATES A FUNCTION  'resourceName'_'field_set' That returns all of 'resourceName'_'field_set' as the type
CREATE OR REPLACE FUNCTION field_set_resource_type(field_set text, resource_id INTEGER) RETURNS VOID AS $field_set_resource_type$
BEGIN
    EXECUTE format('CREATE TYPE %I_%I AS (
    id integer,
    %I_id integer,
    name text,
    created_at timestamptz,
    updated_at timestamptz,'|| columns_on_field_set_as_types(field_set) ||'
    major_version integer,
    minor_version integer)',
    (SELECT(resource_name_by_id(resource_id))), -- first part of name %I_
    field_set, -- second part of name _%I
    field_set -- id %I_id integer
    );
    EXECUTE format('CREATE OR REPLACE FUNCTION %I_%I (%I %I) returns setof %I_%I as $$ 
    SELECT %I.*, versions.major_version, MAX(versions.minor_version) as minor_version
    FROM %I, resources, versions WHERE resources.name = %L AND %I.resource_id = resources.id AND versions.field_set_id = %I.id 
    GROUP BY %I.id, versions.major_version, versions.field_set_id; 
    $$ LANGUAGE SQL stable;', 
    (SELECT(resource_name_by_id(resource_id))), -- Name before _
    field_set,    -- Name after _
    (SELECT(resource_name_by_id(resource_id))), -- First Parmater 
    (SELECT(resource_name_by_id(resource_id))), -- Second PARAMETER
    (SELECT(resource_name_by_id(resource_id))), -- Returns set of before _
    field_set, -- returns set of after _
    field_set, --%I.* id
    field_set, -- FROM %I
    (SELECT(resource_name_by_id(resource_id))), -- resources.name = %L
    field_set, -- Group by id
    field_set, -- WHERE
    field_set); 
    EXECUTE format('CREATE OR REPLACE FUNCTION %I_by_id(searchValue int4, major int4 DEFAULT 0) RETURNS SETOF %I AS $$ 
    SELECT DISTINCT ON (versions.major_version)  %I.*, versions.major_version, MAX(versions.minor_version) as minor_version
    FROM %I, versions WHERE %I.id = searchValue AND %I.resource_id = %L AND versions.major_version = major
    GROUP BY %I.id, versions.major_version;
    $$ LANGUAGE SQL STABLE;',
    (SELECT resource_field_set_name((SELECT(resource_name_by_id(resource_id))), field_set)), -- FIRST PART OF FUNCTION NAME
    (SELECT resource_field_set_name((SELECT(resource_name_by_id(resource_id))), field_set)), -- returns set OF
    field_set, -- SELECT %I.*
    field_set, --FROM %I,
    field_set, --WHERE %I.id,
    field_set, --%I.resource_id,
    resource_id, -- .resource_id = %L
    field_set --group by,
    );
        EXECUTE format('CREATE OR REPLACE FUNCTION %I_by_any_id(searchValue int4[], major int4 DEFAULT 0) RETURNS SETOF %I AS $$ 
    SELECT  %I.*, versions.major_version, MAX(versions.minor_version) as minor_version
    FROM %I, versions WHERE %I.id = ANY (searchValue) AND %I.resource_id = %L AND versions.major_version = major
    GROUP BY %I.id, versions.major_version;
    $$ LANGUAGE SQL STABLE;',
    (SELECT resource_field_set_name((SELECT(resource_name_by_id(resource_id))), field_set)), -- FIRST PART OF FUNCTION NAME
    (SELECT resource_field_set_name((SELECT(resource_name_by_id(resource_id))), field_set)), -- returns set OF
    field_set, -- SELECT %I.*
    field_set, --FROM %I,
    field_set, --WHERE %I.id,
    field_set, --%I.resource_id,
    resource_id, -- .resource_id = %L
    field_set --group by,
    );
END
$field_set_resource_type$ LANGUAGE plpgsql;

--1 CREATE A FIELD SET
CREATE OR REPLACE FUNCTION create_field_set(name TEXT, fields TEXT) RETURNS VOID AS $create_field_set$
  DECLARE
  i record;
  BEGIN
  EXECUTE format('
  CREATE TABLE %I(
    id SERIAL PRIMARY KEY,
    resource_id integer REFERENCES resources,
    name varchar(40),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
  );',name);
    FOR i IN SELECT * FROM json_each_text(fields::json)
    LOOP
      EXECUTE format('ALTER TABLE %I ADD COLUMN %I %I', name, i.key, i.value);
    END LOOP;
  END
  $create_field_set$ LANGUAGE plpgsql;

--2 ATTACH A FIELD SET TO A RESOURCE TYPE
CREATE OR REPLACE FUNCTION attach_field_set_to_resource(resource_id INTEGER, field_set TEXT, fields TEXT DEFAULT NULL) 
  RETURNS void AS $attach_field_set_to_resource$
  DECLARE
    i record;
  BEGIN
    PERFORM field_set_resource_type(field_set, resource_id);
    IF (SELECT 1 FROM information_schema.tables WHERE TABLE_SCHEMA = 'public' AND table_name = field_set) IS NULL THEN
      RAISE EXCEPTION 'There is no field set ';
    ELSE
      IF fields != NULL THEN
        FOR i IN SELECT * FROM json_each_text(fields::json)
        LOOP
          INSERT INTO fields ("resource_id", "name", "type",  "field_set") 
          VALUES(resource_id::INTEGER, i.key, i.value, field_set);
        END LOOP;
      END IF;
    END IF;
    -- PERFORM resource_fields(field_set, resource_id);
  END
$attach_field_set_to_resource$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION columns_on_field_Set_as_types(field_set TEXT) returns TEXT as $$
  DECLARE
    s TEXT := (SELECT string_agg(column_name || ' ' || data_type, ', ')
    FROM information_schema.columns
    WHERE table_schema = 'public'
      AND table_name   = field_set 
      AND column_name != 'id'
      AND column_name != 'name'
      AND column_name != 'resource_id'
      AND column_name != 'updated_at'
      AND column_name != 'created_at');
  BEGIN
    if (s <> '') IS NOT TRUE
    THEN
      return ' ';
    ELSE
      return s || ',';
    END IF;
  END
$$ LANGUAGE plpgsql STABLE;
