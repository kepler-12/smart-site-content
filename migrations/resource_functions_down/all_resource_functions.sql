--  DROP DATABASE smartsite_8;
 
--  CREATE DATABASE smartsite_8 WITH OWNER smartsiterole;

CREATE OR REPLACE FUNCTION dropdb() RETURNS void as $$
SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname = 'smartsite_8';
DROP DATABASE smartsite_8;
CREATE DATABASE smartsite_8 WITH OWNER smartsiterole;
$$ LANGUAGE SQL STABLE;