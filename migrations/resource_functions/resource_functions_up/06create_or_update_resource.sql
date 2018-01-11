CREATE OR REPLACE FUNCTION register_resource() RETURNS TRIGGER AS $register_resource$
    BEGIN
        IF NEW.name IS NULL THEN
            RAISE EXCEPTION 'resource name cannot be null';
        END IF;
        
        EXECUTE format('CREATE TYPE %I AS (
          id integer,
          name text,
          created_at timestamptz,
          updated_at timestamptz
        )', NEW.name);
        PERFORM attach_field_set_to_resource(NEW.id, 'templates', '{"vue": "text"}');
        UPDATE fields SET input_template = 'vueWysiwyg' WHERE resource_id = NEW.id AND field_set = 'templates' AND name = 'vue';
        EXECUTE format('CREATE FUNCTION %I () returns setof %I as $$
            SELECT id, name, created_at, updated_at FROM resources WHERE name = %L;
        $$ LANGUAGE SQL STABLE', NEW.name, NEW.name, NEW.name);
        PERFORM attach_field_set_to_resource(NEW.id, 'items');
        EXECUTE format('CREATE OR REPLACE FUNCTION %I_resource (item %I) returns setof resources as $$
        SELECT * from resources where name = %L
        $$language sql stable;', NEW.name, NEW.name, NEW.name);
        RETURN NEW;
    END;
$register_resource$ LANGUAGE plpgsql;

CREATE TRIGGER register_resource AFTER INSERT OR UPDATE ON resources
        FOR EACH ROW EXECUTE PROCEDURE register_resource(); 

CREATE OR REPLACE FUNCTION resource_name_by_id(resource_id int)RETURNS text as $$
    SELECT name from resources WHERE id = resource_id;
$$ LANGUAGE SQL STABLE;