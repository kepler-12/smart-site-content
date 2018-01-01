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
-- Data for Name: templates; Type: TABLE DATA; Schema: public; Owner: smartsiterole
--

INSERT INTO templates VALUES (1, 1, 'adminHome', '2017-11-20 12:28:44.927062-05', '2017-11-20 12:28:44.927062-05');
INSERT INTO templates VALUES (2, 1, 'defaultAdminPage', '2017-11-20 12:52:38.565244-05', '2017-11-20 12:52:38.565244-05');
INSERT INTO templates VALUES (10, 3, 'homePage', '2017-11-20 16:37:39.30728-05', '2017-11-20 16:37:39.30728-05');
INSERT INTO templates VALUES (11, 3, 'defaultPage', '2017-11-20 16:38:09.974158-05', '2017-11-20 16:38:09.974158-05');
INSERT INTO templates VALUES (13, 1, 'adminResourceList', '2017-11-21 11:24:59.740006-05', '2017-11-21 11:24:59.740006-05');
INSERT INTO templates VALUES (14, 4, 'adminButton', '2017-11-21 12:31:27.5281-05', '2017-11-21 12:31:27.5281-05');
INSERT INTO templates VALUES (12, 4, 'adminCard', '2017-11-21 10:33:53.8591-05', '2017-11-21 10:33:53.8591-05');
INSERT INTO templates VALUES (15, 1, 'adminCreateResource', '2017-11-21 13:03:17.09148-05', '2017-11-21 13:03:17.09148-05');
INSERT INTO templates VALUES (16, 4, 'adminInputField', '2017-11-21 14:50:59.866608-05', '2017-11-21 14:50:59.866608-05');
INSERT INTO templates VALUES (17, 4, 'adminInputText', '2017-11-21 14:51:35.814129-05', '2017-11-21 14:51:35.814129-05');
INSERT INTO templates VALUES (18, 4, 'adminInputSubmit', '2017-11-21 15:26:50.55511-05', '2017-11-21 15:26:50.55511-05');
INSERT INTO templates VALUES (20, 4, 'wysiwyg-preview', '2017-11-25 23:28:10.749504-05', '2017-11-25 23:28:10.749504-05');
INSERT INTO templates VALUES (22, 2, 'defaultWysiwyg', '2017-11-26 18:13:19.431962-05', '2017-11-26 18:13:19.431962-05');
INSERT INTO templates VALUES (23, 2, 'wysiwyg', '2017-11-26 18:14:54.460032-05', '2017-11-26 18:14:54.460032-05');
INSERT INTO templates VALUES (24, 4, 'adminInputVueWysiwyg', '2017-11-26 18:32:22.426231-05', '2017-11-26 18:32:22.426231-05');
INSERT INTO templates VALUES (25, 4, 'adminInputTemplateSelect', '2017-11-26 19:50:34.849792-05', '2017-11-26 19:50:34.849792-05');
INSERT INTO templates VALUES (26, 4, 'adminInputAdminPageSelect', '2017-11-26 20:33:29.715558-05', '2017-11-26 20:33:29.715558-05');
INSERT INTO templates VALUES (27, 1, 'adminEditResource', '2017-11-26 20:35:29.801402-05', '2017-11-26 20:35:29.801402-05');
INSERT INTO templates VALUES (29, 4, 'adminAlert', '2017-11-28 14:14:29.901312-05', '2017-11-28 14:14:29.901312-05');
INSERT INTO templates VALUES (6, 4, 'adminMenuItem', '2017-11-28 14:39:41.050861-05', '2017-11-28 14:39:41.050861-05');
INSERT INTO templates VALUES (3, 4, 'adminMenu', '2017-11-28 14:39:47.830182-05', '2017-11-28 14:39:47.830182-05');
INSERT INTO templates VALUES (30, 6, 'defaultBlog', '2017-11-29 16:15:32.279503-05', '2017-11-29 16:15:32.279503-05');
INSERT INTO templates VALUES (31, 1, 'adminCreateResource', '2017-11-30 16:26:55.219-05', '2017-11-30 16:26:55.219-05');
INSERT INTO templates VALUES (32, 10, 'menuItem', '2017-12-01 12:27:17.611-05', '2017-12-01 12:27:17.611-05');
INSERT INTO templates VALUES (33, 10, 'pageComponent', '2017-12-01 13:13:45.784-05', '2017-12-01 13:13:45.784-05');
INSERT INTO templates VALUES (34, 10, 'pageMenu', '2017-12-01 13:32:45.352-05', '2017-12-01 13:32:45.352-05');
INSERT INTO templates VALUES (35, 10, 'pageMenu', '2017-12-01 13:33:29.269-05', '2017-12-01 13:33:29.269-05');
INSERT INTO templates VALUES (36, 10, 'pageMenu', '2017-12-01 13:35:25.884-05', '2017-12-01 13:35:25.884-05');
INSERT INTO templates VALUES (37, 10, 'pageMenu', '2017-12-01 13:35:29.265-05', '2017-12-01 13:35:29.265-05');
INSERT INTO templates VALUES (38, 10, 'pageMenu', '2017-12-01 13:36:03.198-05', '2017-12-01 13:36:03.198-05');
INSERT INTO templates VALUES (39, 2, 'imageText', '2017-12-04 11:49:38.401-05', '2017-12-04 11:49:38.401-05');
INSERT INTO templates VALUES (47, 2, 'wysiwygImageCard', '2017-12-06 13:57:51.059-05', '2017-12-06 13:57:51.059-05');
INSERT INTO templates VALUES (46, 2, 'wysiwygImage', '2017-12-06 14:05:19.929-05', '2017-12-06 14:05:19.929-05');


--
-- Name: templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: smartsiterole
--

SELECT pg_catalog.setval('templates_id_seq', 47, true);


--
-- PostgreSQL database dump complete
--

