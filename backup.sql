--
-- PostgreSQL database cluster dump
--

-- Started on 2020-05-21 00:01:58 +07

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'md53175bce1d3201d16594cebf9d7eb3f9d';






--
-- Database creation
--

CREATE DATABASE orion_test WITH TEMPLATE = template0 OWNER = postgres;
REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


\connect orion_test

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)

-- Started on 2020-05-21 00:01:58 +07

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
-- TOC entry 1 (class 3079 OID 13043)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2976 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 197 (class 1259 OID 16390)
-- Name: applications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.applications (
    id integer NOT NULL,
    fio "char" NOT NULL,
    adres "char" NOT NULL,
    number numeric NOT NULL,
    comment text NOT NULL,
    city_id integer NOT NULL,
    cause_id integer NOT NULL
);


ALTER TABLE public.applications OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16484)
-- Name: applications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.applications ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.applications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 198 (class 1259 OID 16422)
-- Name: causes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.causes (
    id integer NOT NULL,
    text text NOT NULL
);


ALTER TABLE public.causes OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 16435)
-- Name: causes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.causes ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.causes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 196 (class 1259 OID 16385)
-- Name: cities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cities (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.cities OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16447)
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.cities ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.cities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 203 (class 1259 OID 16459)
-- Name: junction_application_plan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.junction_application_plan (
    plan_id integer NOT NULL,
    application_id integer NOT NULL
);


ALTER TABLE public.junction_application_plan OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16451)
-- Name: plans; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plans (
    id integer NOT NULL,
    text text NOT NULL
);


ALTER TABLE public.plans OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16449)
-- Name: plans_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.plans ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.plans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 205 (class 1259 OID 16486)
-- Name: script_texts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.script_texts (
    id integer NOT NULL,
    text text NOT NULL
);


ALTER TABLE public.script_texts OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16494)
-- Name: script_texts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.script_texts ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.script_texts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


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
\.


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
-- TOC entry 2965 (class 0 OID 16459)
-- Dependencies: 203
-- Data for Name: junction_application_plan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.junction_application_plan (plan_id, application_id) FROM stdin;
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
-- TOC entry 2977 (class 0 OID 0)
-- Dependencies: 204
-- Name: applications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.applications_id_seq', 12, true);


--
-- TOC entry 2978 (class 0 OID 0)
-- Dependencies: 199
-- Name: causes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.causes_id_seq', 3, true);


--
-- TOC entry 2979 (class 0 OID 0)
-- Dependencies: 200
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cities_id_seq', 1, false);


--
-- TOC entry 2980 (class 0 OID 0)
-- Dependencies: 201
-- Name: plans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.plans_id_seq', 2, true);


--
-- TOC entry 2981 (class 0 OID 0)
-- Dependencies: 206
-- Name: script_texts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.script_texts_id_seq', 4, true);


--
-- TOC entry 2824 (class 2606 OID 16397)
-- Name: applications applications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_pkey PRIMARY KEY (id);


--
-- TOC entry 2826 (class 2606 OID 16429)
-- Name: causes causes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.causes
    ADD CONSTRAINT causes_pkey PRIMARY KEY (id);


--
-- TOC entry 2822 (class 2606 OID 16389)
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- TOC entry 2830 (class 2606 OID 16463)
-- Name: junction_application_plan junction_application_plan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.junction_application_plan
    ADD CONSTRAINT junction_application_plan_pkey PRIMARY KEY (plan_id, application_id);


--
-- TOC entry 2828 (class 2606 OID 16455)
-- Name: plans plans_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plans
    ADD CONSTRAINT plans_pkey PRIMARY KEY (id);


--
-- TOC entry 2832 (class 2606 OID 16493)
-- Name: script_texts script_texts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.script_texts
    ADD CONSTRAINT script_texts_pkey PRIMARY KEY (id);


--
-- TOC entry 2836 (class 2606 OID 16469)
-- Name: junction_application_plan fk_application_junction; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.junction_application_plan
    ADD CONSTRAINT fk_application_junction FOREIGN KEY (application_id) REFERENCES public.applications(id);


--
-- TOC entry 2833 (class 2606 OID 16474)
-- Name: applications fk_cause_application; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT fk_cause_application FOREIGN KEY (cause_id) REFERENCES public.causes(id) NOT VALID;


--
-- TOC entry 2834 (class 2606 OID 16479)
-- Name: applications fk_city_application; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT fk_city_application FOREIGN KEY (city_id) REFERENCES public.cities(id) NOT VALID;


--
-- TOC entry 2835 (class 2606 OID 16464)
-- Name: junction_application_plan fk_plan_junction; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.junction_application_plan
    ADD CONSTRAINT fk_plan_junction FOREIGN KEY (plan_id) REFERENCES public.plans(id);


-- Completed on 2020-05-21 00:01:59 +07

--
-- PostgreSQL database dump complete
--

\connect postgres

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)

-- Started on 2020-05-21 00:01:59 +07

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
-- TOC entry 2909 (class 0 OID 0)
-- Dependencies: 2908
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- TOC entry 1 (class 3079 OID 13043)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2911 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


-- Completed on 2020-05-21 00:01:59 +07

--
-- PostgreSQL database dump complete
--

\connect template1

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)

-- Started on 2020-05-21 00:01:59 +07

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
-- TOC entry 2909 (class 0 OID 0)
-- Dependencies: 2908
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- TOC entry 1 (class 3079 OID 13043)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2911 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


-- Completed on 2020-05-21 00:02:00 +07

--
-- PostgreSQL database dump complete
--

-- Completed on 2020-05-21 00:02:00 +07

--
-- PostgreSQL database cluster dump complete
--

