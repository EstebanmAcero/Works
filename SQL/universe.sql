--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: additional_table; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.additional_table (
    additional_table_id integer NOT NULL,
    name character varying(255) NOT NULL,
    column1 integer NOT NULL,
    column2 boolean
);


ALTER TABLE public.additional_table OWNER TO freecodecamp;

--
-- Name: additional_table_additional_table_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.additional_table_additional_table_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.additional_table_additional_table_id_seq OWNER TO freecodecamp;

--
-- Name: additional_table_additional_table_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.additional_table_additional_table_id_seq OWNED BY public.additional_table.additional_table_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    galaxy_type character varying(50) NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    is_spherical boolean NOT NULL,
    distance_from_earth numeric,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    has_life boolean NOT NULL,
    planet_type character varying(50) NOT NULL,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    distance_from_earth numeric,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: additional_table additional_table_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.additional_table ALTER COLUMN additional_table_id SET DEFAULT nextval('public.additional_table_additional_table_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: additional_table; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.additional_table VALUES (1, 'Row 1', 123, true);
INSERT INTO public.additional_table VALUES (2, 'Row 2', 456, false);
INSERT INTO public.additional_table VALUES (3, 'Row 12', 789, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', 13000, 'Spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Closest spiral galaxy to Milky Way', 22000, 'Spiral');
INSERT INTO public.galaxy VALUES (8, 'Messier 87', 'Located in the Virgo Cluster', 6420, 'Elliptical');
INSERT INTO public.galaxy VALUES (9, 'Sombrero', 'Known for its bright nucleus and large central bulge', 9500, 'Spiral');
INSERT INTO public.galaxy VALUES (10, 'Whirlpool', 'Interacting with a smaller galaxy', 5500, 'Spiral');
INSERT INTO public.galaxy VALUES (11, 'Triangulum', 'Third-largest galaxy in the Local Group', 13000, 'Spiral');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', true, 0.384, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', true, 0.0094, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', true, 0.0234, 2);
INSERT INTO public.moon VALUES (4, 'Europa', true, 0.6711, 34);
INSERT INTO public.moon VALUES (5, 'Ganymede', true, 1.0704, 34);
INSERT INTO public.moon VALUES (6, 'Callisto', true, 1.8827, 34);
INSERT INTO public.moon VALUES (7, 'Titan', true, 1.222, 36);
INSERT INTO public.moon VALUES (8, 'Enceladus', true, 1.271, 35);
INSERT INTO public.moon VALUES (9, 'Triton', true, 0.3548, 38);
INSERT INTO public.moon VALUES (10, 'Io', true, 0.4218, 34);
INSERT INTO public.moon VALUES (11, 'Charon', true, 0.1957, 37);
INSERT INTO public.moon VALUES (12, 'Phoebe', true, 13.17, 39);
INSERT INTO public.moon VALUES (13, 'Lapetus', true, 3.5613, 39);
INSERT INTO public.moon VALUES (14, 'Hyperion', true, 1.481, 39);
INSERT INTO public.moon VALUES (15, 'Miranda', true, 0.1298, 2);
INSERT INTO public.moon VALUES (16, 'Tethys', true, 1.097, 35);
INSERT INTO public.moon VALUES (17, 'Rhea', true, 1.527, 35);
INSERT INTO public.moon VALUES (18, 'Dione', true, 1.234, 35);
INSERT INTO public.moon VALUES (19, 'Mimas', true, 0.1855, 35);
INSERT INTO public.moon VALUES (20, 'Oberon', true, 0.764, 38);
INSERT INTO public.moon VALUES (21, 'Titania', true, 0.788, 38);
INSERT INTO public.moon VALUES (22, 'Ariel', true, 0.191, 38);
INSERT INTO public.moon VALUES (23, 'Umbriel', true, 0.266, 38);
INSERT INTO public.moon VALUES (24, 'Proteus', true, 0.1176, 35);
INSERT INTO public.moon VALUES (25, 'Charon 2', true, 0.132, 37);
INSERT INTO public.moon VALUES (26, 'Nereid', true, 0.5514, 36);
INSERT INTO public.moon VALUES (27, 'Proteus 2', true, 0.136, 35);
INSERT INTO public.moon VALUES (28, 'Charon 3', true, 0.134, 37);
INSERT INTO public.moon VALUES (29, 'Proteus 3', true, 0.137, 35);
INSERT INTO public.moon VALUES (30, 'Charon 4', true, 0.135, 37);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', true, 'Terrestrial', 1);
INSERT INTO public.planet VALUES (2, 'Mars', false, 'Terrestrial', 1);
INSERT INTO public.planet VALUES (31, 'Venus', false, 'Terrestrial', 1);
INSERT INTO public.planet VALUES (32, 'Jupiter', false, 'Gas Giant', 2);
INSERT INTO public.planet VALUES (33, 'Saturn', false, 'Gas Giant', 2);
INSERT INTO public.planet VALUES (34, 'Neptune', false, 'Ice Giant', 13);
INSERT INTO public.planet VALUES (35, 'Mercury', false, 'Terrestrial', 1);
INSERT INTO public.planet VALUES (36, 'Uranus', false, 'Ice Giant', 2);
INSERT INTO public.planet VALUES (37, 'Pluto', false, 'Dwarf Planet', 1);
INSERT INTO public.planet VALUES (38, 'Exoplanet 1', false, 'Exoplanet', 14);
INSERT INTO public.planet VALUES (39, 'Exoplanet 2', false, 'Exoplanet', 14);
INSERT INTO public.planet VALUES (40, 'Exoplanet 3', false, 'Exoplanet', 14);
INSERT INTO public.planet VALUES (41, 'Exoplanet 4', false, 'Exoplanet', 14);
INSERT INTO public.planet VALUES (42, 'Exoplanet 5', false, 'Exoplanet', 14);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', false, true, 0, 1);
INSERT INTO public.star VALUES (2, 'Alpha Centauri', false, true, 4.37, 1);
INSERT INTO public.star VALUES (11, 'Betelgeuse', false, true, 642.5, 2);
INSERT INTO public.star VALUES (12, 'Sirius', false, true, 8.6, 1);
INSERT INTO public.star VALUES (13, 'Proxima Centauri', false, true, 4.24, 1);
INSERT INTO public.star VALUES (14, 'Antares', false, true, 550, 2);
INSERT INTO public.star VALUES (15, 'Vega', false, true, 25.04, 1);
INSERT INTO public.star VALUES (16, 'Rigel', false, true, 860, 2);


--
-- Name: additional_table_additional_table_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.additional_table_additional_table_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 11, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 30, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 42, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 16, true);


--
-- Name: additional_table additional_table_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.additional_table
    ADD CONSTRAINT additional_table_name_key UNIQUE (name);


--
-- Name: additional_table additional_table_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.additional_table
    ADD CONSTRAINT additional_table_pkey PRIMARY KEY (additional_table_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


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

