--
-- PostgreSQL database dump
--

-- Dumped from database version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)

-- Started on 2020-05-21 09:07:34 +07

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
-- TOC entry 2965 (class 0 OID 0)
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


-- Completed on 2020-05-21 09:07:34 +07

--
-- PostgreSQL database dump complete
--

