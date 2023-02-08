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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    disc_year integer,
    constellation character varying(30),
    a_magnitude numeric(4,2)
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
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    is_spherical boolean,
    diameter_km integer
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
    name character varying(30) NOT NULL,
    has_life boolean,
    description text,
    star_id integer NOT NULL,
    moons integer
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
-- Name: rodzaje_planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.rodzaje_planet (
    rodzaje_planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    "pierścienie" boolean
);


ALTER TABLE public.rodzaje_planet OWNER TO freecodecamp;

--
-- Name: rodzaje_planet_rodzaj_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.rodzaje_planet_rodzaj_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rodzaje_planet_rodzaj_id_seq OWNER TO freecodecamp;

--
-- Name: rodzaje_planet_rodzaj_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.rodzaje_planet_rodzaj_id_seq OWNED BY public.rodzaje_planet.rodzaje_planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    planet_count integer,
    distance_from_earth_ly numeric(4,2)
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
-- Name: rodzaje_planet rodzaje_planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.rodzaje_planet ALTER COLUMN rodzaje_planet_id SET DEFAULT nextval('public.rodzaje_planet_rodzaj_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Droga mleczna', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Alfa Centauri', 1689, 'Centaur', -0.27);
INSERT INTO public.galaxy VALUES (3, 'WISE 1049-5319', 2013, 'Żagiel', 10.73);
INSERT INTO public.galaxy VALUES (4, 'Alfa Canis Majoris', 1844, 'Wielki Pies', -1.47);
INSERT INTO public.galaxy VALUES (5, 'Luyten 762-8', 1949, 'Wieloryb', 12.54);
INSERT INTO public.galaxy VALUES (6, 'Epsilon Eridani', NULL, 'Erydan', 3.73);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Księżyc', 3, true, 3476);
INSERT INTO public.moon VALUES (2, 'Deimos', 4, false, NULL);
INSERT INTO public.moon VALUES (3, 'Fobos', 4, true, 22);
INSERT INTO public.moon VALUES (4, 'Metis', 5, false, NULL);
INSERT INTO public.moon VALUES (5, 'Adrates', 5, true, 16);
INSERT INTO public.moon VALUES (6, 'Amaltea', 5, false, NULL);
INSERT INTO public.moon VALUES (7, 'Tebe', 5, false, NULL);
INSERT INTO public.moon VALUES (8, 'Io', 5, true, 3642);
INSERT INTO public.moon VALUES (9, 'Europa', 5, true, 3122);
INSERT INTO public.moon VALUES (10, 'Ganimedes', 5, true, 5262);
INSERT INTO public.moon VALUES (11, 'Kallisto', 5, true, 4821);
INSERT INTO public.moon VALUES (12, 'Miranda', 7, true, 471);
INSERT INTO public.moon VALUES (13, 'Ariel', 7, true, 1158);
INSERT INTO public.moon VALUES (14, 'Umbriel', 7, true, 1169);
INSERT INTO public.moon VALUES (15, 'Tytania', 7, true, 1578);
INSERT INTO public.moon VALUES (16, 'Oberon', 7, true, 1522);
INSERT INTO public.moon VALUES (17, 'Larissa', 8, false, 192);
INSERT INTO public.moon VALUES (18, 'Proteusz', 8, false, 416);
INSERT INTO public.moon VALUES (19, 'Tryton', 8, true, 2706);
INSERT INTO public.moon VALUES (20, 'Nereida', 8, false, 340);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Merkury', false, 'Najmniejsza planeta układu słonecznego', 1, 0);
INSERT INTO public.planet VALUES (2, 'Wenus', false, 'Trzecie pod względem jasności ciało niebieskie widoczne na niebie', 1, 0);
INSERT INTO public.planet VALUES (3, 'Ziemia', true, 'Piąta pod względem wielkości planeta układu słonecznego', 1, 1);
INSERT INTO public.planet VALUES (4, 'Mars', false, 'Może kiedyś tam zamieszkamy', 1, 2);
INSERT INTO public.planet VALUES (5, 'Jowisz', false, 'Największa planeta układu słonecznego', 1, 79);
INSERT INTO public.planet VALUES (6, 'Saturn', false, 'Ma pierścienie', 1, 82);
INSERT INTO public.planet VALUES (7, 'Uran', false, 'Nazwa planety pochodzi od Uranosa', 1, 27);
INSERT INTO public.planet VALUES (8, 'Neptun', false, 'Ostatnia planeta układu słonecznego', 1, 14);
INSERT INTO public.planet VALUES (9, 'Proxima_Centauri_b', false, 'Odkryta przez Roberta Inessa', 2, NULL);
INSERT INTO public.planet VALUES (10, 'Proxima_Centauri_c', false, 'Prawdopodobna', 2, NULL);
INSERT INTO public.planet VALUES (11, 'Proxima_Centauri_d', false, 'Prawdopodobna', 2, NULL);
INSERT INTO public.planet VALUES (12, 'AEgir', false, 'Gazowy olbrzym', 11, NULL);


--
-- Data for Name: rodzaje_planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.rodzaje_planet VALUES (1, 'skalista', false);
INSERT INTO public.rodzaje_planet VALUES (2, 'gazowa', true);
INSERT INTO public.rodzaje_planet VALUES (3, 'gazowo-lodowa', true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Słońce', 1, 8, NULL);
INSERT INTO public.star VALUES (2, 'Proxima_Centauri', 2, 3, 4.24);
INSERT INTO public.star VALUES (3, 'Alfa_Centauri_A', 2, 1, 4.32);
INSERT INTO public.star VALUES (4, 'Alfa_Centauri_B', 2, 0, 4.32);
INSERT INTO public.star VALUES (5, 'WISE_5319-A', 3, 0, 6.59);
INSERT INTO public.star VALUES (6, 'Wise_5319-B', 3, 0, 6.59);
INSERT INTO public.star VALUES (7, 'Syriusz', 4, 0, 8.60);
INSERT INTO public.star VALUES (8, 'Alfa_Canis_Majoris_B', 4, 0, 8.60);
INSERT INTO public.star VALUES (9, 'BL_Ceti', 5, 0, 8.82);
INSERT INTO public.star VALUES (10, 'UV_Ceti', 5, 0, 8.82);
INSERT INTO public.star VALUES (11, 'Ran', 6, 1, 10.49);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 9, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: rodzaje_planet_rodzaj_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.rodzaje_planet_rodzaj_id_seq', 8, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 11, true);


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
-- Name: rodzaje_planet rodzaje_planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.rodzaje_planet
    ADD CONSTRAINT rodzaje_planet_pkey PRIMARY KEY (rodzaje_planet_id);


--
-- Name: rodzaje_planet rodzaje_planet_rodzaje_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.rodzaje_planet
    ADD CONSTRAINT rodzaje_planet_rodzaje_planet_id_key UNIQUE (rodzaje_planet_id);


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
-- Name: moon constraint_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT constraint_fk FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star galaxy_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_id_fk FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: planet star_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_id_fk FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

