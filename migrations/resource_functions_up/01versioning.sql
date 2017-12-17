SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;
SET search_path = public, pg_catalog;

--
--
--
/*
  VERSIONING FUNCTIONS
*/
--
-- SELECTS THE MOST CURRENT VERSION ID BASED ON THE FIELD SET; 
CREATE OR REPLACE FUNCTION current_version_id(field_set_id_value INTEGER, field_set_value text) RETURNS INTEGER AS $$
  SELECT id from versions WHERE versions.field_set_id = field_set_id_value AND versions.field_set_table = field_set_value ORDER BY major_version DESC, minor_version DESC LIMIT 1 ;
$$ LANGUAGE SQL STABLE;

-- SELECTS THE 2nd most CURRENT VERSION ID BASED ON THE FIELD SET; 
CREATE OR REPLACE FUNCTION last_version_id(field_set_id_value INTEGER, field_set_value text) RETURNS INTEGER AS $$
  SELECT id from versions WHERE versions.field_set_id = field_set_id_value AND versions.field_set_table = field_set_value
  ORDER BY major_version DESC, minor_version DESC LIMIT 2 OFFSET 1;
$$ LANGUAGE SQL STABLE;


-- ITERATE THE VERSION OF A SPECIFIC FIELD SET AND RETURN THE ID
CREATE OR REPLACE FUNCTION iterate_version(field_set_id_value INTEGER, field_set_value text, major INTEGER DEFAULT 0) RETURNS INTEGER AS $iterate_version$
  DECLARE 
    new_version_id INTEGER;
    version record;
    major_version_int INTEGER := major;
    minor_version_int INTEGER;
  BEGIN 
    SELECT id, MAX(minor_version) as minor_version FROM versions 
    WHERE major_version = major AND field_set_id = field_set_id_value AND field_set_table = field_set_value GROUP BY versions.id ORDER BY minor_version DESC LIMIT 1 INTO version;
    -- Default Values SHOULD BE DONe ANOThEr WAY
    IF version.minor_version IS NULL THEN
        minor_version_int = 1;
    ELSE
      minor_version_int = version.minor_version + 1;
    END IF;
    INSERT INTO versions (field_set_table, field_set_id, major_version, minor_version)
      VALUES (field_set_value, field_set_id_value, major_version_int, minor_version_int) RETURNING id INTO new_version_id;
    RETURN new_version_id;
  END
$iterate_version$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION delete_old_version(field_set_id INTEGER, field_set_table TEXT) returns void as $$
  DELETE from versions WHERE id != (SELECT current_version_id(field_set_id, field_set_table));
$$ LANGUAGE SQL;

CREATE OR REPLACE FUNCTION delete_all_old_versions(field_set_table TEXT) returns void as $$
  DECLARE
    i record;
  BEGIN
     FOR i IN EXECUTE('SELECT * FROM ' || field_set_table)
     LOOP
      PERFORM delete_old_version(i.id, field_set_table);
     END LOOP;
  END
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION all_field_set(field_set_table TEXT) returns record as $$
  BEGIN
    EXECUTE format('SELECT * FROM %I', field_set_table);
  END
$$LANGUAGE plpgsql;