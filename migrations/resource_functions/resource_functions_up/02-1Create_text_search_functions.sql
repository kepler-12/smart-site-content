
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