--
-- PostgreSQL database dump
--

-- Dumped from database version 10.0
-- Dumped by pg_dump version 10.0

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
-- Data for Name: fields; Type: TABLE DATA; Schema: public; Owner: smartsiterole
--
UPDATE fields SET id = 52 WHERE resource_id = 2 AND field_set = 'templates' AND name = 'vue';
UPDATE fields SET id = 58 WHERE resource_id = 1 AND field_set = 'templates' AND name = 'vue';
UPDATE fields SET id = 55 WHERE resource_id = 4 AND field_set = 'templates' AND name = 'vue';
UPDATE fields SET id = 54 WHERE resource_id = 3 AND field_set = 'templates' AND name = 'vue';
UPDATE fields SET id = 59 WHERE resource_id = 6 AND field_set = 'templates' AND name = 'vue';
UPDATE fields SET id = 61 WHERE resource_id = 10 AND field_set = 'templates' AND name = 'vue';
INSERT INTO fields VALUES (1, 1, 'items', 'path', 'text', '2017-11-20 12:08:49.182-05', '2017-11-20 12:08:49.182-05', 'text');
INSERT INTO fields VALUES (6, 3, 'items', 'path', 'text', '2017-11-20 15:52:20.59-05', '2017-11-20 15:52:20.59-05', 'text');
INSERT INTO fields VALUES (19, 2, 'items', 'title', 'text', '2017-11-22 12:57:44.21-05', '2017-11-22 12:57:44.21-05', 'text');
INSERT INTO fields VALUES (20, 2, 'items', 'keywords', 'text', '2017-11-22 12:59:40.131-05', '2017-11-22 12:59:40.131-05', 'text');
INSERT INTO fields VALUES (17, 2, 'items', 'wysiwyg', 'text', '2017-11-26 18:29:47.448-05', '2017-11-26 18:29:47.448-05', 'vue-wysiwyg');
INSERT INTO fields VALUES (2, 1, 'items', 'template', 'text', '2017-11-26 20:34:54.833-05', '2017-11-26 20:34:54.833-05', 'adminPageSelect');
INSERT INTO fields VALUES (7, 3, 'items', 'template', 'text', '2017-11-26 21:42:12.845-05', '2017-11-26 21:42:12.845-05', 'vueWysiwyg');
INSERT INTO fields VALUES (62, 10, 'items', 'wyiswyg', 'text', '2017-12-01 13:13:36.02-05', '2017-12-01 13:13:36.02-05', 'vueWysiwyg');
INSERT INTO fields VALUES (63, 10, 'items', 'title', 'text', '2017-12-01 13:18:14.853-05', '2017-12-01 13:18:14.853-05', 'text');
INSERT INTO fields VALUES (66, 3, 'items', 'props', 'text', '2017-12-07 10:10:01.134-05', '2017-12-07 10:10:01.134-05', 'text');


--
-- Name: fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: smartsiterole
--

SELECT pg_catalog.setval('fields_id_seq', 66, true);


--
-- PostgreSQL database dump complete
--

