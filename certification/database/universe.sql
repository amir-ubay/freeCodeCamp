--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    size integer NOT NULL,
    age integer,
    diameter numeric,
    description text,
    is_habbitable boolean,
    is_reachable boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20) NOT NULL,
    planet_id integer,
    size integer,
    diameter integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(20) NOT NULL,
    star_id integer,
    diameter integer,
    is_habbitable boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: satelit; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.satelit (
    name character varying(40) NOT NULL,
    satelit_id integer NOT NULL,
    launched_year integer
);


ALTER TABLE public.satelit OWNER TO freecodecamp;

--
-- Name: satelit_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.satelit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.satelit_id_seq OWNER TO freecodecamp;

--
-- Name: satelit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.satelit_id_seq OWNED BY public.satelit.satelit_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(20) NOT NULL,
    galaxy_id integer,
    cycle integer,
    distance integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: satelit satelit_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satelit ALTER COLUMN satelit_id SET DEFAULT nextval('public.satelit_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000, 13000, 105700, 'The galaxy that contains our Solar System', true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 110000, 10000, 220000, 'The nearest major galaxy to the Milky Way', false, false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 60000, 8000, 60000, 'A smaller spiral galaxy near the Milky Way and Andromeda', false, true);
INSERT INTO public.galaxy VALUES (4, 'Jenah Quo', 100000, 13000, 105700, 'The galaxy that contains our Solar System', true, true);
INSERT INTO public.galaxy VALUES (5, 'Darmondur', 110000, 10000, 220000, 'The nearest major galaxy to the Milky Way', false, false);
INSERT INTO public.galaxy VALUES (6, 'Freanta', 60000, 8000, 60000, 'A smaller spiral galaxy near the Milky Way and Andromeda', false, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'VONEX', 1, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'GINTEE', 2, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'TRAX', 3, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'BONEX', 1, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'GTEE', 2, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'CXAT', 3, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'VOXD', 1, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'GIGANTEE', 2, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'THRAX', 3, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'CERT', 1, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'GFERT', 2, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'XERN', 3, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'JUKT', 3, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'BCEKTE', 2, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'ZUNDT', 1, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'KFLIP', 1, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'PRES', 2, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'GVB', 3, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'AWDS', 1, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'DDVG', 2, NULL, NULL);
INSERT INTO public.moon VALUES (21, 'CRUX', 3, NULL, NULL);
INSERT INTO public.moon VALUES (22, 'GRIOP', 1, NULL, NULL);
INSERT INTO public.moon VALUES (23, 'LOPX', 2, NULL, NULL);
INSERT INTO public.moon VALUES (24, 'KIYT', 3, NULL, NULL);
INSERT INTO public.moon VALUES (25, 'POTP', 3, NULL, NULL);
INSERT INTO public.moon VALUES (26, 'VERT', 2, NULL, NULL);
INSERT INTO public.moon VALUES (27, 'DOODM', 1, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'VOXEN', 1, NULL, NULL);
INSERT INTO public.planet VALUES (2, 'GIGANTEE', 2, NULL, NULL);
INSERT INTO public.planet VALUES (3, 'THRAX', 3, NULL, NULL);
INSERT INTO public.planet VALUES (4, 'VOXEN', 1, NULL, NULL);
INSERT INTO public.planet VALUES (5, 'GIGANTEE', 2, NULL, NULL);
INSERT INTO public.planet VALUES (6, 'THRAX', 3, NULL, NULL);
INSERT INTO public.planet VALUES (7, 'CERT', 1, NULL, NULL);
INSERT INTO public.planet VALUES (8, 'GFERT', 2, NULL, NULL);
INSERT INTO public.planet VALUES (9, 'XERN', 3, NULL, NULL);
INSERT INTO public.planet VALUES (10, 'JUKT', 3, NULL, NULL);
INSERT INTO public.planet VALUES (11, 'BCEKTE', 2, NULL, NULL);
INSERT INTO public.planet VALUES (12, 'ZUNDT', 1, NULL, NULL);


--
-- Data for Name: satelit; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.satelit VALUES ('APOLLO', 1, NULL);
INSERT INTO public.satelit VALUES ('MAXIMUS', 2, NULL);
INSERT INTO public.satelit VALUES ('GRANDE', 3, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 1, NULL, NULL);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 2, NULL, NULL);
INSERT INTO public.star VALUES (3, 'Altair', 3, NULL, NULL);
INSERT INTO public.star VALUES (4, 'Trus', 4, NULL, NULL);
INSERT INTO public.star VALUES (5, 'Benthe', 5, NULL, NULL);
INSERT INTO public.star VALUES (6, 'Akamt', 6, NULL, NULL);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 27, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 12, true);


--
-- Name: satelit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.satelit_id_seq', 3, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 6, true);


--
-- Name: galaxy galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id_key UNIQUE (planet_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: satelit satelit_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satelit
    ADD CONSTRAINT satelit_id_key UNIQUE (satelit_id);


--
-- Name: satelit satelit_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satelit
    ADD CONSTRAINT satelit_pkey PRIMARY KEY (satelit_id);


--
-- Name: star star_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

