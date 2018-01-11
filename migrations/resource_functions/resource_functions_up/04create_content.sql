CREATE OR REPLACE FUNCTION create_field_function (resource_name text, field_set text, field_name text, field_type text) RETURNS void AS $create_field_function$
  DECLARE
    resource_id INTEGER := (SELECT id FROM resources WHERE name = resource_name);
  BEGIN
    EXECUTE format('CREATE OR REPLACE FUNCTION %I_%I (thing %I) RETURNS %I AS $$
      SELECT content.value::%I from content, "versions" WHERE content.version_id = versions.id AND "versions".id = (SELECT current_version_id(thing.id, %L))
      AND content.name = %L AND thing.id = content.field_set_id $$ language sql stable', 
      (SELECT resource_field_set_name(resource_name, field_set)), -- First part of function name 
      field_name, -- second part of function name
      -- field_set, -- parameter
      (SELECT resource_field_set_name(resource_name, field_set)), -- PARAMETER type
      field_type, -- returns type
      field_type, -- casted type
      field_set, -- Content version first pararm field_set
      field_name  -- content name,
      );
    EXECUTE format('
      CREATE OR REPLACE FUNCTION %I_by_%I(searchValue %I)returns setof %I as $$
        SELECT * FROM search_%I(%I, ARRAY[searchValue])
      $$ LANGUAGE SQL STABLE
    ', (
      SELECT resource_field_set_name(resource_name, field_set), 
      field_name, 
      field_type, 
      (SELECT resource_field_set_name(resource_name, field_set), 
      (SELECT resource_field_set_name(resource_name, field_set),
      field_name
      )
      EXECUTE format('
      CREATE OR REPLACE FUNCTION %I_by_any_%I(searchValue %I[])returns setof %I as $$
        SELECT * FROM search_%I(%I, searchValue)
      $$ LANGUAGE SQL STABLE
    ', (
      SELECT resource_field_set_name(resource_name, field_set), 
      field_name, 
      field_type, 
      (SELECT resource_field_set_name(resource_name, field_set), 
      (SELECT resource_field_set_name(resource_name, field_set),
      field_name
      )
  END
$create_field_function$ LANGUAGE plpgsql;

CREATE TYPE content_results AS (
  field_set_id INTEGER,
  version_id INTEGER
);

CREATE TYPE latest_versions AS (
  major_version INTEGER,
  minor_version INTEGER,
  field_set_id INTEGER,
  id INTEGER
);

CREATE OR REPLACE FUNCTION latest_versions(field_set text) returns setof latest_versions as $$
  SELECT major_version, MAX(minor_version) AS minor_version, field_set_id, MAX(id) AS id  FROM versions WHERE field_set_table = field_set GROUP BY major_version, field_set_id;
$$ LANGUAGE SQL STABLE; 

CREATE OR REPLACE FUNCTION search_exact_content(field_set text, resource_id int, field_name text, search_value text[]) returns setof content_results as $$
  DECLARE
  BEGIN
    RETURN QUERY 
      EXECUTE format ('
      SELECT DISTINCT ON (content.field_set_id) content.field_set_id, MAX(content.version_id) AS version_id 
      FROM %I, content
      WHERE content.name = %L AND content."value" = ANY(%L) AND %I.resource_id = %L
      GROUP BY field_set_id', 
      field_set, -- FROM %I,
      field_name, -- content.name = %L 
      search_value, -- content."value" = %L,
      field_set, --%I.resource_id 
      resource_id -- resource_id = %L
      );
    RETURN;
  END
$$ LANGUAGE plpgsql STABLE; 

CREATE OR REPLACE FUNCTION register_field() RETURNS TRIGGER AS $register_field$
  BEGIN
    IF NEW.name IS NULL THEN
      RAISE EXCEPTION 'Name cannot be null';
    END IF;
    PERFORM create_field_function((resource_name_from_id(NEW."resource_id")), NEW.field_set, NEW.name, NEW.type);
    RETURN NEW;
  END
$register_field$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION update_resource_field_set() RETURNS TRIGGER AS $update_resource_field_set$
  BEGIN
    PERFORM resource_fields(NEW.field_set, NEW.resource_id);
    IF NEW.field_set = 'templates' THEN
      IF  NEW.input_template IS NULL THEN
        NEW.input_template = NEW.type;
      END IF;
    END IF;
    RETURN NEW;
  END
$update_resource_field_set$ LANGUAGE plpgsql;

CREATE TRIGGER register_field BEFORE INSERT OR UPDATE ON fields
FOR EACH ROW EXECUTE PROCEDURE register_field(); 

CREATE TRIGGER update_resource_field_set AFTER INSERT OR UPDATE ON fields
FOR EACH ROW EXECUTE PROCEDURE update_resource_field_set(); 


CREATE OR REPLACE FUNCTION resource_name_from_id (resource_id integer) RETURNS text AS $$
  SELECT name FROM resources WHERE id = resource_id
$$ LANGUAGE SQL stable;  

CREATE OR REPLACE FUNCTION resource_field_set_name(resource_name TEXT, field_set TEXT) RETURNS text AS $$
SELECT resource_name || '_' || field_set;
$$ LANGUAGE SQL STABLE;