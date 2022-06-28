--
-- PostgreSQL database dump
--

-- Dumped from database version 13.1
-- Dumped by pg_dump version 13.1

-- Started on 2022-06-21 14:17:37

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
-- TOC entry 2 (class 3079 OID 30028)
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- TOC entry 3963 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 209 (class 1259 OID 31056)
-- Name: city; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.city (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    description character varying,
    zoom_level smallint NOT NULL,
    image_url_location character varying NOT NULL,
    geom public.geometry(Point,3857)
);


ALTER TABLE public.city OWNER TO postgres;

--
-- TOC entry 3964 (class 0 OID 0)
-- Dependencies: 209
-- Name: COLUMN city.zoom_level; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.city.zoom_level IS 'Zoom level for web presentation.';


--
-- TOC entry 208 (class 1259 OID 31054)
-- Name: city_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.city_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.city_id_seq OWNER TO postgres;

--
-- TOC entry 3965 (class 0 OID 0)
-- Dependencies: 208
-- Name: city_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.city_id_seq OWNED BY public.city.id;


--
-- TOC entry 219 (class 1259 OID 31121)
-- Name: city_translation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.city_translation (
    id integer NOT NULL,
    language_id integer NOT NULL,
    city_id integer NOT NULL,
    text character varying NOT NULL
);


ALTER TABLE public.city_translation OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 31119)
-- Name: city_translation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.city_translation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.city_translation_id_seq OWNER TO postgres;

--
-- TOC entry 3966 (class 0 OID 0)
-- Dependencies: 218
-- Name: city_translation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.city_translation_id_seq OWNED BY public.city_translation.id;


--
-- TOC entry 217 (class 1259 OID 31110)
-- Name: language; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.language (
    id integer NOT NULL,
    name character varying(20) NOT NULL,
    image_url character varying NOT NULL
);


ALTER TABLE public.language OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 31108)
-- Name: language_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.language_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.language_id_seq OWNER TO postgres;

--
-- TOC entry 3967 (class 0 OID 0)
-- Dependencies: 216
-- Name: language_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.language_id_seq OWNED BY public.language.id;


--
-- TOC entry 215 (class 1259 OID 31099)
-- Name: legend_attribute; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.legend_attribute (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    image_url character varying NOT NULL,
    description character varying
);


ALTER TABLE public.legend_attribute OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 31097)
-- Name: legend_attribute_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.legend_attribute_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.legend_attribute_id_seq OWNER TO postgres;

--
-- TOC entry 3968 (class 0 OID 0)
-- Dependencies: 214
-- Name: legend_attribute_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.legend_attribute_id_seq OWNED BY public.legend_attribute.id;


--
-- TOC entry 223 (class 1259 OID 31158)
-- Name: legend_attribute_translation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.legend_attribute_translation (
    id integer NOT NULL,
    language_id integer NOT NULL,
    legend_attribute_id integer NOT NULL,
    text character varying NOT NULL
);


ALTER TABLE public.legend_attribute_translation OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 31156)
-- Name: legend_attribute_translation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.legend_attribute_translation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.legend_attribute_translation_id_seq OWNER TO postgres;

--
-- TOC entry 3969 (class 0 OID 0)
-- Dependencies: 222
-- Name: legend_attribute_translation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.legend_attribute_translation_id_seq OWNED BY public.legend_attribute_translation.id;


--
-- TOC entry 213 (class 1259 OID 31078)
-- Name: location; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.location (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    description character varying,
    web_address character varying,
    email character varying,
    facebook character varying,
    instagram character varying,
    address character varying,
    phone_number character varying,
    mobile_phone_number character varying,
    image_url_location character varying NOT NULL,
    location_type_id integer NOT NULL,
    city_id integer NOT NULL,
    priority integer NOT NULL,
    availability boolean NOT NULL,
    geom public.geometry(Point,3857),
    image_position character varying(50)
);


ALTER TABLE public.location OWNER TO postgres;

--
-- TOC entry 3970 (class 0 OID 0)
-- Dependencies: 213
-- Name: COLUMN location.priority; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.location.priority IS 'Visit priority, 1 - highest, 5 - lowest.';


--
-- TOC entry 3971 (class 0 OID 0)
-- Dependencies: 213
-- Name: COLUMN location.availability; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.location.availability IS 'Should (not) be visible on map.';


--
-- TOC entry 212 (class 1259 OID 31076)
-- Name: location_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.location_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.location_id_seq OWNER TO postgres;

--
-- TOC entry 3972 (class 0 OID 0)
-- Dependencies: 212
-- Name: location_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.location_id_seq OWNED BY public.location.id;


--
-- TOC entry 221 (class 1259 OID 31137)
-- Name: location_translation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.location_translation (
    id integer NOT NULL,
    language_id integer NOT NULL,
    location_id integer NOT NULL,
    city_id integer NOT NULL,
    text character varying NOT NULL
);


ALTER TABLE public.location_translation OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 31135)
-- Name: location_translation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.location_translation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.location_translation_id_seq OWNER TO postgres;

--
-- TOC entry 3973 (class 0 OID 0)
-- Dependencies: 220
-- Name: location_translation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.location_translation_id_seq OWNED BY public.location_translation.id;


--
-- TOC entry 211 (class 1259 OID 31067)
-- Name: location_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.location_type (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    description character varying
);


ALTER TABLE public.location_type OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 31065)
-- Name: location_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.location_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.location_type_id_seq OWNER TO postgres;

--
-- TOC entry 3974 (class 0 OID 0)
-- Dependencies: 210
-- Name: location_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.location_type_id_seq OWNED BY public.location_type.id;


--
-- TOC entry 207 (class 1259 OID 31045)
-- Name: municipality; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.municipality (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    geom public.geometry(MultiPolygon,3857)
);


ALTER TABLE public.municipality OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 31043)
-- Name: municipality_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.municipality_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.municipality_id_seq OWNER TO postgres;

--
-- TOC entry 3975 (class 0 OID 0)
-- Dependencies: 206
-- Name: municipality_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.municipality_id_seq OWNED BY public.municipality.id;


--
-- TOC entry 224 (class 1259 OID 31225)
-- Name: test_app_cities; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.test_app_cities AS
 SELECT city.id,
    city.name,
    city.description,
    city_translation.text AS description_eng,
    city.zoom_level,
    city.image_url_location,
    city.geom,
    round((public.st_y(public.st_transform(city.geom, 4326)))::numeric, 4) AS x_coord,
    round((public.st_x(public.st_transform(city.geom, 4326)))::numeric, 4) AS y_coord
   FROM (public.city
     JOIN public.city_translation ON ((city.id = city_translation.city_id)));


ALTER TABLE public.test_app_cities OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 31229)
-- Name: test_app_locations; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.test_app_locations AS
 SELECT location.id AS location_id,
    city.id AS city_id,
    city.name AS city_name,
    location.name,
    location.image_url_location,
    location_type.name AS location_type,
    location_type.id AS location_type_id,
    location.priority,
    location.availability,
    location.geom,
    round((public.st_y(public.st_transform(location.geom, 4326)))::numeric, 4) AS x_coord,
    round((public.st_x(public.st_transform(location.geom, 4326)))::numeric, 4) AS y_coord,
    location.description,
    location_translation.text AS description_eng,
    location.image_position
   FROM (((public.location
     JOIN public.location_type ON ((location.location_type_id = location_type.id)))
     JOIN public.city ON ((location.city_id = city.id)))
     JOIN public.location_translation ON ((location.id = location_translation.location_id)));


ALTER TABLE public.test_app_locations OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 31238)
-- Name: test_app_locationtypes; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.test_app_locationtypes AS
 SELECT location_type.id,
    location_type.name,
    location_type.description
   FROM public.location_type;


ALTER TABLE public.test_app_locationtypes OWNER TO postgres;

--
-- TOC entry 3785 (class 2604 OID 31059)
-- Name: city id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city ALTER COLUMN id SET DEFAULT nextval('public.city_id_seq'::regclass);


--
-- TOC entry 3790 (class 2604 OID 31124)
-- Name: city_translation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city_translation ALTER COLUMN id SET DEFAULT nextval('public.city_translation_id_seq'::regclass);


--
-- TOC entry 3789 (class 2604 OID 31113)
-- Name: language id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.language ALTER COLUMN id SET DEFAULT nextval('public.language_id_seq'::regclass);


--
-- TOC entry 3788 (class 2604 OID 31102)
-- Name: legend_attribute id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.legend_attribute ALTER COLUMN id SET DEFAULT nextval('public.legend_attribute_id_seq'::regclass);


--
-- TOC entry 3792 (class 2604 OID 31161)
-- Name: legend_attribute_translation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.legend_attribute_translation ALTER COLUMN id SET DEFAULT nextval('public.legend_attribute_translation_id_seq'::regclass);


--
-- TOC entry 3787 (class 2604 OID 31081)
-- Name: location id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.location ALTER COLUMN id SET DEFAULT nextval('public.location_id_seq'::regclass);


--
-- TOC entry 3791 (class 2604 OID 31140)
-- Name: location_translation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.location_translation ALTER COLUMN id SET DEFAULT nextval('public.location_translation_id_seq'::regclass);


--
-- TOC entry 3786 (class 2604 OID 31070)
-- Name: location_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.location_type ALTER COLUMN id SET DEFAULT nextval('public.location_type_id_seq'::regclass);


--
-- TOC entry 3784 (class 2604 OID 31048)
-- Name: municipality id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.municipality ALTER COLUMN id SET DEFAULT nextval('public.municipality_id_seq'::regclass);


--
-- TOC entry 3798 (class 2606 OID 31064)
-- Name: city city_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_pkey PRIMARY KEY (id);


--
-- TOC entry 3808 (class 2606 OID 31129)
-- Name: city_translation city_translation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city_translation
    ADD CONSTRAINT city_translation_pkey PRIMARY KEY (id);


--
-- TOC entry 3806 (class 2606 OID 31118)
-- Name: language language_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.language
    ADD CONSTRAINT language_pkey PRIMARY KEY (id);


--
-- TOC entry 3804 (class 2606 OID 31107)
-- Name: legend_attribute legend_attribute_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.legend_attribute
    ADD CONSTRAINT legend_attribute_pkey PRIMARY KEY (id);


--
-- TOC entry 3812 (class 2606 OID 31166)
-- Name: legend_attribute_translation legend_attribute_translation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.legend_attribute_translation
    ADD CONSTRAINT legend_attribute_translation_pkey PRIMARY KEY (id);


--
-- TOC entry 3802 (class 2606 OID 31086)
-- Name: location location_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.location
    ADD CONSTRAINT location_pkey PRIMARY KEY (id);


--
-- TOC entry 3810 (class 2606 OID 31145)
-- Name: location_translation location_translation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.location_translation
    ADD CONSTRAINT location_translation_pkey PRIMARY KEY (id);


--
-- TOC entry 3800 (class 2606 OID 31075)
-- Name: location_type location_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.location_type
    ADD CONSTRAINT location_type_pkey PRIMARY KEY (id);


--
-- TOC entry 3796 (class 2606 OID 31050)
-- Name: municipality municipality_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.municipality
    ADD CONSTRAINT municipality_pkey PRIMARY KEY (id);


--
-- TOC entry 3815 (class 2606 OID 31130)
-- Name: city_translation city_translation_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city_translation
    ADD CONSTRAINT city_translation_language_id_fkey FOREIGN KEY (language_id) REFERENCES public.language(id) ON DELETE SET NULL;


--
-- TOC entry 3818 (class 2606 OID 31167)
-- Name: legend_attribute_translation legend_attribute_translation_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.legend_attribute_translation
    ADD CONSTRAINT legend_attribute_translation_language_id_fkey FOREIGN KEY (language_id) REFERENCES public.language(id) ON DELETE SET NULL;


--
-- TOC entry 3819 (class 2606 OID 31172)
-- Name: legend_attribute_translation legend_attribute_translation_legend_attribute_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.legend_attribute_translation
    ADD CONSTRAINT legend_attribute_translation_legend_attribute_id_fkey FOREIGN KEY (legend_attribute_id) REFERENCES public.legend_attribute(id) ON DELETE SET NULL;


--
-- TOC entry 3814 (class 2606 OID 31092)
-- Name: location location_city_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.location
    ADD CONSTRAINT location_city_id_fkey FOREIGN KEY (city_id) REFERENCES public.city(id) ON DELETE SET NULL;


--
-- TOC entry 3813 (class 2606 OID 31087)
-- Name: location location_location_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.location
    ADD CONSTRAINT location_location_type_id_fkey FOREIGN KEY (location_type_id) REFERENCES public.location_type(id) ON DELETE SET NULL;


--
-- TOC entry 3817 (class 2606 OID 31151)
-- Name: location_translation location_translation_city_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.location_translation
    ADD CONSTRAINT location_translation_city_id_fkey FOREIGN KEY (city_id) REFERENCES public.city(id) ON DELETE SET NULL;


--
-- TOC entry 3816 (class 2606 OID 31146)
-- Name: location_translation location_translation_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.location_translation
    ADD CONSTRAINT location_translation_language_id_fkey FOREIGN KEY (language_id) REFERENCES public.language(id) ON DELETE SET NULL;


-- Completed on 2022-06-21 14:17:38

--
-- PostgreSQL database dump complete
--

