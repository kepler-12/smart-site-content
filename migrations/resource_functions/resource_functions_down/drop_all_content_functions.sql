CREATE OR REPLACE FUNCTION drop_all_functions() RETURNS void AS $drop_all_functions$
DECLARE
  function_string text;
BEGIN
  FOR function_string IN (SELECT 'DROP FUNCTION ' || ns.nspname || '.' || proname || '(' || oidvectortypes(proargtypes) || ') CASCADE;'
    FROM pg_proc INNER JOIN pg_namespace ns ON (pg_proc.pronamespace = ns.oid)
    WHERE ns.nspname = 'public'  order by proname) LOOP
    EXECUTE format(function_string);
  END LOOP;
END
$drop_all_functions$ LANGUAGE plpgsql;

SELECT drop_all_functions;