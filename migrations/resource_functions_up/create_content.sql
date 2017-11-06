CREATE OR REPLACE FUNCTION resource_name_from_id (resourceid integer) RETURNS text AS $$
  SELECT name FROM resources WHERE id = resourceid
$$LANGUAGE SQL stable; 

CREATE OR REPLACE FUNCTION create_field_function (resource_name text, field_name text, field_type text) RETURNS void AS $create_field_function$
  BEGIN
  EXECUTE format('CREATE OR REPLACE FUNCTION %I_%I (item %I) RETURNS %I AS $$
    SELECT content.value::%I from content, "itemVersions" WHERE content.version = "itemVersions".id AND "itemVersions".id = (select max(id) from "itemVersions") 
    AND content.name = %L $$ language sql stable', resource_name, field_name, resource_name, field_type, field_type, field_name);
  END 
$create_field_function$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION register_field() RETURNS TRIGGER AS $register_field$
  BEGIN
    IF NEW.name IS NULL THEN
      RAISE EXCEPTION 'empname cannot be null';
    END IF;
    PERFORM create_field_function((resource_name_from_id(NEW."resourceId")), new.name, new.type);
    RETURN NEW;
  END
$register_field$ LANGUAGE plpgsql;

CREATE TRIGGER register_field BEFORE INSERT OR UPDATE ON fields
        FOR EACH ROW EXECUTE PROCEDURE register_field(); 