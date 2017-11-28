--0 CREATES A FUNCTION  'resourceName'_'field_set' That returns all of 'resourceName'_'field_set' as the type
CREATE OR REPLACE FUNCTION field_set_resource_type(field_set text, resource_id INTEGER) RETURNS VOID AS $field_set_resource_type$
BEGIN
    EXECUTE format('CREATE TYPE %I_%I AS (
    id integer,
    %I_id integer,
    name text,
    created_at timestamptz,
    updated_at timestamptz
    )',(SELECT(resource_name_by_id(resource_id))), field_set, field_set);
    EXECUTE format('CREATE OR REPLACE FUNCTION %I_%I (%I %I) returns setof %I_%I as $$ 
      SELECT %I.id, %I."resource_id", %I.name, %I."created_at", %I."updated_at" 
    FROM %I, resources WHERE resources.name = %L AND %I.resource_id = resources.id; 
    $$ LANGUAGE SQL stable;', 
    (SELECT(resource_name_by_id(resource_id))), -- Name before _
    field_set,    -- Name after _
    (SELECT(resource_name_by_id(resource_id))), -- First Parmater 
    (SELECT(resource_name_by_id(resource_id))), -- Second PARAMETER
    (SELECT(resource_name_by_id(resource_id))), -- Returns set of before _
    field_set, -- returns set of after _
    field_set, --id
    field_set, --resource_id
    field_set, --name
    field_set, --created_at
    field_set, --updated_at
    field_set, -- FROM
    (SELECT(resource_name_by_id(resource_id))), -- WHERE
    field_set); 
    EXECUTE format('CREATE OR REPLACE FUNCTION %I_by_id(searchValue int4) RETURNS SETOF %I AS $$ 
    SELECT id, resource_id, name, created_at, updated_at FROM %I WHERE id = searchValue AND resource_id = %L;
    $$ LANGUAGE SQL STABLE;',
    (SELECT resource_field_set_name((SELECT(resource_name_by_id(resource_id))), field_set)), -- FIRST PART OF FUNCTION NAME
    (SELECT resource_field_set_name((SELECT(resource_name_by_id(resource_id))), field_set)), -- returns set OF
    field_set, --from,
    resource_id);
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
CREATE OR REPLACE FUNCTION attach_field_set_to_resource(resource_id INTEGER, field_set TEXT, fields TEXT) 
  RETURNS void AS $attach_field_set_to_resource$
  DECLARE
    i record;
  BEGIN
    PERFORM field_set_resource_type(field_set, resource_id);
    IF (SELECT 1 FROM information_schema.tables WHERE TABLE_SCHEMA = 'public' AND table_name = field_set) IS NULL THEN
      RAISE EXCEPTION 'There is no field set ';
    ELSE
      FOR i IN SELECT * FROM json_each_text(fields::json)
      LOOP
        INSERT INTO fields ("resource_id", "name", "type",  "field_set") 
        VALUES(resource_id::INTEGER, i.key, i.value, field_set);
      END LOOP;
    END IF;
    PERFORM resource_fields(field_set, resource_id);
  END
$attach_field_set_to_resource$ LANGUAGE plpgsql;

