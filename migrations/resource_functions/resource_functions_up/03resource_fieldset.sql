-- CU Functions for 'resourceName'_'field_set' 
CREATE OR REPLACE FUNCTION resource_fields(field_set text, resource_id INTEGER) returns void as $resource_fields$
 BEGIN
    EXECUTE format('DROP FUNCTION IF EXISTS update_%I_%I',
      (SELECT(resource_name_by_id(resource_id))), -- first part of function name,
      field_set -- second part of function name
    );
    -- TODO: Add version as a parameter for update. So we can update a specific major version
    EXECUTE format(  
    'CREATE OR REPLACE FUNCTION update_%I_%I (id INTEGER,name text DEFAULT null, ' || (SELECT field_set_as_parameters(field_set, resource_id)) ||', major INTEGER DEFAULT 0) RETURNS VOID AS $update_%I_%I$
      DECLARE
        i record;
        newversion INTEGER;
        field_set_table text := %L;
        resource_id_value INTEGER := %L;
        json_fields json :=  '|| json_field_for_updating(field_set, resource_id) ||';
      BEGIN
        newversion := (SELECT iterate_version(id, field_set_table, major));
        FOR i IN SELECT * FROM json_each_text(json_fields)
        LOOP
            EXECUTE format(%L,  
            field_set_table, --field_set_table_value
            id, -- field_set_id_value
            i.key,   -- field_id_value
            i.value, -- field_value
            (SELECT(field_name_from_field_id(i.key))), -- field_na  me  
            newversion::integer); -- versionid or is it up here in update??E?E
        END LOOP;
      END 
    $update_%I_%I$ LANGUAGE plpgsql',
    (SELECT(resource_name_by_id(resource_id))), -- first part of function name,
    field_set, -- second part of function name
    (SELECT(resource_name_by_id(resource_id))), -- first part of function dolar
    field_set, -- second part of function dolar
    field_set, -- field_set_table,
    resource_id, -- Resource Id table;
    --field_set, -- UPDATE FOR NAME
    (SELECT text_for_update_field()), -- Format in array;
    (SELECT(resource_name_by_id(resource_id))), -- first part of function dolar
    field_set -- second part of function dolar
    );
    -- DROP THE CREATE FUNCTION BEFORE CONTINUING
    EXECUTE format('DROP FUNCTION IF EXISTS create_%I_%I',
      (SELECT(resource_name_by_id(resource_id))), -- first part of function name,
      field_set -- second part of function name
    );
    -- CREATE THE FUNCTION 
    EXECUTE format(
    'CREATE OR REPLACE FUNCTION create_%I_%I (name TEXT,' || (SELECT field_set_as_parameters(field_set, resource_id)) ||', major INTEGER DEFAULT 0) RETURNS VOID AS $create_%I_%I$
      DECLARE
        i record;
        newversion INTEGER;
        field_set_table text := %L;
        resource_id_value INTEGER := %L;
        new_id INTEGER;
        json_fields json :=  '|| json_field_for_updating(field_set, resource_id) ||';
      BEGIN
        INSERT INTO %I (name, resource_id) VALUES (name, resource_id_value) RETURNING id INTO new_id;
        newversion := (SELECT iterate_version(new_id, field_set_table, major));
        FOR i IN SELECT * FROM json_each_text(json_fields)
        LOOP
            EXECUTE format(%L,  
            field_set_table, --field_set_table_value
            new_id, -- field_set_id_value
            i.key,   -- field_id_value
            i.value, -- field_value
            (SELECT(field_name_from_field_id(i.key))), -- field_name
            newversion::integer); -- versionidx IS THIS REAL LIFE?
        END LOOP;
      END
    $create_%I_%I$ LANGUAGE plpgsql',
    (SELECT(resource_name_by_id(resource_id))), -- create_%I first part of function name,
    field_set, -- _%I second part of function name
    (SELECT(resource_name_by_id(resource_id))), -- $create_%I first part of function dolar
    field_set, -- _%I$  second part of function dolar
    field_set, -- field_set_table text := %L;,
    resource_id, -- resource_id_value INTEGER := %L; -- 
    field_set, --  INSERT INTO %I field_set_table,
    (SELECT text_for_update_field()), -- EXECUTE format(%L Format in array;
    (SELECT(resource_name_by_id(resource_id))), -- $create_%I first part of function dolar
    field_set -- %I$ LANGUAGE plpgsq second part of function dolar
    );
    
END
$resource_fields$ LANGUAGE plpgsql;


-- Update the content of a field
CREATE OR REPLACE FUNCTION update_resource_field(field_set_table_value text, field_set_id_value INTEGER, field_id_value INTEGER, field_value text, field_name text, version_id_value INTEGER) RETURNS void AS $$
  DECLARE
    oldvalue text := (SELECT value FROM content WHERE version_id = (SELECT last_version_id(field_set_id_value, field_set_table_value)) AND field_id = field_id_value);
  BEGIN
  IF field_value IS NULL THEN
    INSERT INTO content (field_set_table, field_set_id, field_id, value, name, version_id) 
    VALUES (field_set_table_value, field_set_id_value, field_id_value, oldvalue, field_name, version_id_value);
  ELSE
    INSERT INTO content (field_set_table, field_set_id, field_id, value, name, version_id) 
    VALUES (field_set_table_value, field_set_id_value, field_id_value, field_value, field_name, version_id_value);
  END IF;
  END
$$ LANGUAGE plpgsql;

--update_resource_field(field_set_table_value text, field_set_id_value INTEGER, field_id_value INTEGER, field_value text, field_name text, version_id_value text)
CREATE OR REPLACE FUNCTION text_for_update_field() RETURNS text AS $$
  SELECT 'SELECT update_resource_field(%L, %L, %L, %L, %L, %L)';
$$ LANGUAGE SQL STABLE;

-- SELECTS THE MOST CURRENT VERSION ID BASED ON THE FIELD SET; 
CREATE OR REPLACE FUNCTION field_set_as_parameters(field_set_value text, resource_id_value INTEGER) 
  RETURNS text AS $$
  SELECT string_agg(name || ' '|| "type" || ' DEFAULT NULL ', ' , ') FROM fields WHERE "resource_id" = resource_id_value AND "field_set" = field_set_value;
$$ LANGUAGE SQL STABLE;

-- Returns all fields as array; 
CREATE OR REPLACE FUNCTION field_set_as_array(field_set_table text, resource_id_value INTEGER) RETURNS setof fields AS $$
  SELECT * from fields WHERE "resource_id" = resource_id_value AND "field_set" = field_set_table;
$$ LANGUAGE  SQL STABLE;

-- Turn all fields into json with {id: name}
CREATE OR REPLACE FUNCTION json_field_for_updating(field_set_value text, resource_id_value INTEGER) RETURNS text as $$
SELECT 'json_build_object(' ||(SELECT string_agg('' || id || ', '|| "name",', ') FROM fields WHERE "resource_id" = resource_id_value AND "field_set" = field_set_value) || ')';
$$ LANGUAGE SQL STABLE;

-- Just return the name of field by id
CREATE OR REPLACE FUNCTION field_name_from_field_id(field_id text) RETURNS text AS $$
  SELECT name FROM fields WHERE id = field_id::INTEGER;
$$ LANGUAGE SQL STABLE;