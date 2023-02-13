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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying(30) NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (76, 2018, 'Final', 193, 195, 4, 2);
INSERT INTO public.games VALUES (77, 2018, 'Third Place', 194, 197, 2, 0);
INSERT INTO public.games VALUES (78, 2018, 'Semi-Final', 195, 197, 2, 1);
INSERT INTO public.games VALUES (79, 2018, 'Semi-Final', 193, 194, 1, 0);
INSERT INTO public.games VALUES (80, 2018, 'Quarter-Final', 195, 196, 3, 2);
INSERT INTO public.games VALUES (81, 2018, 'Quarter-Final', 197, 201, 2, 0);
INSERT INTO public.games VALUES (82, 2018, 'Quarter-Final', 194, 198, 2, 1);
INSERT INTO public.games VALUES (83, 2018, 'Quarter-Final', 193, 199, 2, 0);
INSERT INTO public.games VALUES (84, 2018, 'Eighth-Final', 197, 200, 2, 1);
INSERT INTO public.games VALUES (85, 2018, 'Eighth-Final', 201, 215, 1, 0);
INSERT INTO public.games VALUES (86, 2018, 'Eighth-Final', 194, 202, 3, 2);
INSERT INTO public.games VALUES (87, 2018, 'Eighth-Final', 198, 203, 2, 0);
INSERT INTO public.games VALUES (88, 2018, 'Eighth-Final', 195, 204, 2, 1);
INSERT INTO public.games VALUES (89, 2018, 'Eighth-Final', 196, 205, 2, 1);
INSERT INTO public.games VALUES (90, 2018, 'Eighth-Final', 199, 206, 2, 1);
INSERT INTO public.games VALUES (91, 2018, 'Eighth-Final', 193, 207, 4, 3);
INSERT INTO public.games VALUES (92, 2014, 'Final', 208, 207, 1, 0);
INSERT INTO public.games VALUES (93, 2014, 'Third Place', 209, 198, 3, 0);
INSERT INTO public.games VALUES (94, 2014, 'Semi-Final', 207, 209, 1, 0);
INSERT INTO public.games VALUES (95, 2014, 'Semi-Final', 208, 198, 7, 1);
INSERT INTO public.games VALUES (96, 2014, 'Quarter-Final', 209, 210, 1, 0);
INSERT INTO public.games VALUES (97, 2014, 'Quarter-Final', 207, 194, 1, 0);
INSERT INTO public.games VALUES (98, 2014, 'Quarter-Final', 198, 200, 2, 1);
INSERT INTO public.games VALUES (99, 2014, 'Quarter-Final', 208, 193, 1, 0);
INSERT INTO public.games VALUES (100, 2014, 'Eighth-Final', 198, 211, 2, 1);
INSERT INTO public.games VALUES (101, 2014, 'Eighth-Final', 200, 199, 2, 0);
INSERT INTO public.games VALUES (102, 2014, 'Eighth-Final', 193, 212, 2, 0);
INSERT INTO public.games VALUES (103, 2014, 'Eighth-Final', 208, 213, 2, 1);
INSERT INTO public.games VALUES (104, 2014, 'Eighth-Final', 209, 203, 2, 1);
INSERT INTO public.games VALUES (105, 2014, 'Eighth-Final', 210, 214, 2, 1);
INSERT INTO public.games VALUES (106, 2014, 'Eighth-Final', 207, 215, 1, 0);
INSERT INTO public.games VALUES (107, 2014, 'Eighth-Final', 194, 216, 2, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (193, 'France');
INSERT INTO public.teams VALUES (194, 'Belgium');
INSERT INTO public.teams VALUES (195, 'Croatia');
INSERT INTO public.teams VALUES (196, 'Russia');
INSERT INTO public.teams VALUES (197, 'England');
INSERT INTO public.teams VALUES (198, 'Brazil');
INSERT INTO public.teams VALUES (199, 'Uruguay');
INSERT INTO public.teams VALUES (200, 'Colombia');
INSERT INTO public.teams VALUES (201, 'Sweden');
INSERT INTO public.teams VALUES (202, 'Japan');
INSERT INTO public.teams VALUES (203, 'Mexico');
INSERT INTO public.teams VALUES (204, 'Denmark');
INSERT INTO public.teams VALUES (205, 'Spain');
INSERT INTO public.teams VALUES (206, 'Portugal');
INSERT INTO public.teams VALUES (207, 'Argentina');
INSERT INTO public.teams VALUES (208, 'Germany');
INSERT INTO public.teams VALUES (209, 'Netherlands');
INSERT INTO public.teams VALUES (210, 'Costa Rica');
INSERT INTO public.teams VALUES (211, 'Chile');
INSERT INTO public.teams VALUES (212, 'Nigeria');
INSERT INTO public.teams VALUES (213, 'Algeria');
INSERT INTO public.teams VALUES (214, 'Greece');
INSERT INTO public.teams VALUES (215, 'Switzerland');
INSERT INTO public.teams VALUES (216, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 107, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 216, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

