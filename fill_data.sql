--
-- PostgreSQL database dump
--

-- Dumped from database version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)

-- Started on 2020-05-21 09:11:04 +07

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2960 (class 0 OID 16422)
-- Dependencies: 198
-- Data for Name: causes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.causes (id, text) FROM stdin;
2	Причина 1
3	Причина 2
\.


--
-- TOC entry 2958 (class 0 OID 16385)
-- Dependencies: 196
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cities (id, name) FROM stdin;
1	Красноярск
2	Абакан
\.


--
-- TOC entry 2959 (class 0 OID 16390)
-- Dependencies: 197
-- Data for Name: applications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.applications (id, fio, adres, number, comment, city_id, cause_id) FROM stdin;
2	a	a	888	1asdf	1	2
6	a	a	888	asdf	2	2
7	a	a	888	asdf	2	2
8	a	a	888	asdf	2	2
9	a	a	888	asdf	2	2
23	a	a	999	sadf	1	2
24	a	a	888	asdf	1	2
\.


--
-- TOC entry 2964 (class 0 OID 16451)
-- Dependencies: 202
-- Data for Name: plans; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plans (id, text) FROM stdin;
1	План 1
2	План 2
\.


--
-- TOC entry 2965 (class 0 OID 16459)
-- Dependencies: 203
-- Data for Name: junction_application_plan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.junction_application_plan (plan_id, application_id) FROM stdin;
2	2
2	23
1	24
2	24
\.


--
-- TOC entry 2967 (class 0 OID 16486)
-- Dependencies: 205
-- Data for Name: script_texts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.script_texts (id, text) FROM stdin;
1	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur sagittis risus eget justo laoreet vulputate. Nulla ut orci vitae elit tristique imperdiet. Cras suscipit placerat lectus, nec volutpat erat elementum dictum. Pellentesque facilisis, justo eu pharetra ullamcorper, lorem metus scelerisque lacus, quis fringilla purus velit ac libero. Vestibulum ut est facilisis, dictum metus nec, egestas diam. Etiam porttitor dolor quam, pharetra tristique justo varius aliquet. Sed vel hendrerit odio. Ut ut arcu quis risus viverra elementum. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus facilisis mollis pellentesque. Fusce a volutpat est, sit amet facilisis nisl. Etiam in ante sapien. Nulla pellentesque quis leo quis ultricies.
2	Suspendisse hendrerit maximus magna pharetra mattis. Vivamus volutpat cursus enim vulputate accumsan. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Quisque et turpis egestas, viverra massa id, placerat ante. Vivamus id mattis orci, vitae accumsan magna. Nam eget vestibulum quam, at tempor massa. Duis quis dolor velit. Aliquam in accumsan metus, et rutrum augue.
3	Donec ipsum turpis, aliquam et libero eleifend, malesuada scelerisque lectus. Proin vehicula aliquet imperdiet. Suspendisse at gravida odio. Proin ut pretium urna. In elementum vehicula odio, in sollicitudin metus condimentum in. Vivamus convallis pulvinar nulla, sed pulvinar mauris facilisis in. Fusce at nulla varius, elementum magna et, congue dolor. Phasellus vestibulum posuere ex quis lacinia. In hac habitasse platea dictumst. Curabitur vehicula porttitor arcu sed scelerisque.
4	Aliquam ac magna ex. Nullam vel augue non est rhoncus pretium. Nulla imperdiet, arcu in mollis lobortis, odio est blandit augue, ac mollis arcu purus quis nisl. Phasellus vestibulum turpis leo, in commodo est tincidunt gravida. Aliquam ut odio sed nulla aliquam convallis. In tincidunt sapien et metus tempus, dictum faucibus eros vulputate. Proin sit amet tempus massa. Nam auctor tortor eu ligula cursus feugiat. Curabitur at justo lacus. Duis quis nibh semper, ullamcorper sem non, lacinia mi. Aenean lacinia ipsum et libero lacinia dapibus. Integer nec imperdiet turpis. Curabitur id massa eget ipsum convallis faucibus a vel lorem. Morbi vitae sodales mauris, vel posuere felis. Phasellus rhoncus urna eros, eu condimentum nibh sagittis in.
\.


--
-- TOC entry 2974 (class 0 OID 0)
-- Dependencies: 204
-- Name: applications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.applications_id_seq', 24, true);


--
-- TOC entry 2975 (class 0 OID 0)
-- Dependencies: 199
-- Name: causes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.causes_id_seq', 3, true);


--
-- TOC entry 2976 (class 0 OID 0)
-- Dependencies: 200
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cities_id_seq', 1, false);


--
-- TOC entry 2977 (class 0 OID 0)
-- Dependencies: 201
-- Name: plans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.plans_id_seq', 2, true);


--
-- TOC entry 2978 (class 0 OID 0)
-- Dependencies: 206
-- Name: script_texts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.script_texts_id_seq', 4, true);


-- Completed on 2020-05-21 09:11:04 +07

--
-- PostgreSQL database dump complete
--

