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
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: smartsiterole
--

INSERT INTO items VALUES (1, 1, 'admin-home', '2017-11-20 12:22:53.945-05', '2017-11-20 12:22:53.945-05');
INSERT INTO items VALUES (6, 1, 'pageList', '2017-11-20 16:26:59.228-05', '2017-11-20 16:26:59.228-05');
INSERT INTO items VALUES (10, 1, 'adminResourceList', '2017-11-21 11:28:45.421-05', '2017-11-21 11:28:45.421-05');
INSERT INTO items VALUES (11, 1, 'createResource', '2017-11-21 13:23:54.207-05', '2017-11-21 13:23:54.207-05');
INSERT INTO items VALUES (24, 1, 'Edit Resource', '2017-11-27 11:52:49.858-05', '2017-11-27 11:52:49.858-05');
INSERT INTO items VALUES (35, 2, 'TheColdestSunset', '2017-11-29 11:54:54.36-05', '2017-11-29 11:54:54.36-05');
INSERT INTO items VALUES (36, 3, 'Home', '2017-11-29 12:03:10.064-05', '2017-11-29 12:03:10.064-05');
INSERT INTO items VALUES (38, 1, 'CreateASingleResource', '2017-11-30 16:27:34.282-05', '2017-11-30 16:27:34.282-05');
INSERT INTO items VALUES (37, 3, 'About Us', '2017-12-01 13:10:08.783-05', '2017-12-01 13:10:08.783-05');
INSERT INTO items VALUES (39, 10, 'Header', '2017-12-01 13:33:38.063-05', '2017-12-01 13:33:38.063-05');
INSERT INTO items VALUES (40, 2, 'About Header', '2017-12-04 11:30:33.572-05', '2017-12-04 11:30:33.572-05');
INSERT INTO items VALUES (41, 2, 'About Text', '2017-12-04 11:51:49.901-05', '2017-12-04 11:51:49.901-05');
INSERT INTO items VALUES (42, 2, 'About Header', '2017-12-04 11:56:15.07-05', '2017-12-04 11:56:15.07-05');
INSERT INTO items VALUES (43, 2, 'About Section 1', '2017-12-04 12:22:54.585-05', '2017-12-04 12:22:54.585-05');
INSERT INTO items VALUES (44, 2, 'About Section 2', '2017-12-04 12:23:03.288-05', '2017-12-04 12:23:03.288-05');
INSERT INTO items VALUES (45, 2, 'About Section 3', '2017-12-04 12:23:13.478-05', '2017-12-04 12:23:13.478-05');
INSERT INTO items VALUES (46, 10, 'Footer', '2017-12-07 14:25:57.709-05', '2017-12-07 14:25:57.709-05');
INSERT INTO items VALUES (49, 2, 'Form Join Us', '2017-12-07 15:31:08.416-05', '2017-12-07 15:31:08.416-05');
INSERT INTO items VALUES (50, 2, 'HistoryAwardsExperience', '2017-12-07 15:44:08.066-05', '2017-12-07 15:44:08.066-05');


--
-- Name: items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: smartsiterole
--

SELECT pg_catalog.setval('items_id_seq', 50, true);


--
-- PostgreSQL database dump complete
--

