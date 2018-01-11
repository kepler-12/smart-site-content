CREATE TYPE content_results AS (
  field_set_id INTEGER,
  version_id INTEGER
);

CREATE OR REPLACE FUNCTION search_integer_between(field_set text, resource_id int, field_name text, search_value integer[]) returns setof content_results as $$
  DECLARE
  BEGIN
    RETURN QUERY 
      EXECUTE format ('
      SELECT DISTINCT ON (content.field_set_id) content.field_set_id, MAX(content.version_id) AS version_id 
      FROM %I, content
      WHERE content.name = %L AND content."value"BETWEEN %L AND %L AND %I.resource_id = %L
      GROUP BY field_set_id', 
      field_set, -- FROM %I,
      field_name, -- content.name = %L 
      search_value[1], -- content."value" = %L,
      search_value[2], -- content."value" = %L,
      field_set, --%I.resource_id 
      resource_id -- resource_id = %L
      );
    RETURN;
  END
$$ LANGUAGE plpgsql STABLE; 

CREATE OR REPLACE FUNCTION search_integer_greater_than(field_set text, resource_id int, field_name text, search_value integer) returns setof content_results as $$
  DECLARE
  BEGIN
    RETURN QUERY 
      EXECUTE format ('
      SELECT DISTINCT ON (content.field_set_id) content.field_set_id, MAX(content.version_id) AS version_id 
      FROM %I, content
      WHERE content.name = %L AND content."value" > %L AND %I.resource_id = %L
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

CREATE OR REPLACE FUNCTION search_integer_less_than(field_set text, resource_id int, field_name text, search_value integer[]) returns setof content_results as $$
  DECLARE
  BEGIN
    RETURN QUERY 
      EXECUTE format ('
      SELECT DISTINCT ON (content.field_set_id) content.field_set_id, MAX(content.version_id) AS version_id 
      FROM %I, content
      WHERE content.name = %L AND content."value" < %L AND %I.resource_id = %L
      GROUP BY field_set_id', 
      field_set, -- FROM %I,
      field_name, -- content.name = %L 
      search_value[1], -- content."value" = %L,
      field_set, --%I.resource_id 
      resource_id -- resource_id = %L
      );
    RETURN;
  END
$$ LANGUAGE plpgsql STABLE; 