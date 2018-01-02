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
SET search_path = public, pg_catalog;--
-- Data for Name: resources; Type: TABLE DATA; Schema: public; Owner: smartsiterole
--
INSERT INTO resources VALUES (2, 'wysiwyg', '2017-11-20 15:05:01.664-05', '2017-11-20 15:05:01.664-05');
INSERT INTO resources VALUES (3, 'page', '2017-11-20 15:45:30.869-05', '2017-11-20 15:45:30.869-05');
INSERT INTO resources VALUES (6, 'blog', '2017-11-26 19:33:55.197-05', '2017-11-26 19:33:55.197-05');
INSERT INTO resources VALUES (10, 'page_components', '2017-11-30 16:40:16.934-05', '2017-11-30 16:40:16.934-05');
--
-- Name: resources_id_seq; Type: SEQUENCE SET; Schema: public; Owner: smartsiterole
--
SELECT pg_catalog.setval('resources_id_seq', 10, true);
--
-- PostgreSQL database dump complete
--
