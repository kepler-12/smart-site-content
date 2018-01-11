CREATE OR REPLACE FUNCTION create_search_function(field_set text, resource_name text, function_name text, append_function_name text DEFAULT '', input_type text DEFAULT 'text[]') returns void as $$
  DECLARE
      resource_id INTEGER := (SELECT id FROM resources WHERE name = resource_name);
  BEGIN
      EXECUTE format('
        CREATE OR REPLACE FUNCTION search_%I_%I'||append_function_name||'(field_name text, searchValue '|| input_type||') RETURNS SETOF %I_%I AS $function_name$ 
          BEGIN
            RETURN QUERY
              SELECT %I.id, %I.resource_id::INTEGER, %I.name::text, %I.updated_at, %I.created_at, latest_version.major_version, latest_version.minor_version 
              FROM %I,
              (SELECT * FROM %I(%L, %L, field_name, searchValue)) found_content,
              (SELECT * FROM latest_versions(%L)) latest_version
              WHERE %I.id = found_content.field_set_id AND
              latest_version.id = found_content.version_id AND
              found_content.field_set_id = latest_version.field_set_id;
            RETURN;
          END
        $function_name$ LANGUAGE plpgsql STABLE;', 
        resource_name, -- func name
        field_set, -- func name
        resource_name, -- return type
        field_set, -- returnt type
        field_set, -- SELECT %I.*
        field_set, -- FROM %I
        field_set, -- FROM %I
        field_set, -- FROM %I
        field_set, -- FROM %I
        field_set, -- FROM %I
        function_name, 
        field_set, -- search_content(%L (1)
        resource_id, -- , %L, (2)
        field_set, -- latest_version($L)
        field_set --  WHERE %I.id
      );
  END
$$ LANGUAGE plpgsql;
