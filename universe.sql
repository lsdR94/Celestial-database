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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    galaxy_id integer,
    name character varying(30) NOT NULL
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    constellation character varying(30) NOT NULL,
    type character varying(20) NOT NULL,
    avg_distance_million_ly numeric(6,2),
    avg_mass_trillion_mo numeric(3,2),
    related_black_holes boolean,
    description text
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
    planet_id integer,
    name character varying(30) NOT NULL,
    estimated_mass_earth numeric(6,4),
    description text
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
    star_id integer,
    name character varying(30) NOT NULL,
    estimated_mass_earth numeric(7,3),
    number_of_moons integer,
    contains_life boolean,
    min_temp_k integer,
    max_temp_k integer
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
    galaxy_id integer,
    name character varying(30) NOT NULL,
    class character varying(20),
    avg_distance_ly numeric(8,3),
    avg_mass_mo numeric(8,3)
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.constellation (constellation_id, galaxy_id, name) FROM stdin;
1	1	Sagittarius
2	2	Andromeda
3	3	Pavo
4	4	Dorado/Mensa
5	5	Triangulum
6	6	Canes Venatici
\.


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.galaxy (galaxy_id, name, constellation, type, avg_distance_million_ly, avg_mass_trillion_mo, related_black_holes, description) FROM stdin;
1	Milky Way	Sagittarius	Spiral	0.00	1.50	t	Galaxy that contains our solar system. Has a supermassive black hole at the center
2	Andromeda	Andromeda	Spiral	2.45	1.50	t	Nearest large galaxy from Milky Way. The mass seems to be of the same order of magnitude a the Milky Way
3	Condor	Pavo	Spiral	212.00	0.10	f	Largest known spiral galaxy
4	Large Magellanic Cloud	Dorado/Mensa	Spiral	163.00	0.14	t	Major satellite galaxy of the Milky Way. Not as massive as Milky Way
5	Triangulum	Triangulum	Spiral	3.20	0.05	t	Smallest spiral galaxy in the local group of galaxies; even smaller than the Magellanic Clouds
6	Eye of Sauron	Canes Venatici	Spiral	51.50	\N	t	Scientifics gave its name, Eye of Sauron, due to its resembance to the fictional character with the same name in The Lord of the Rings. Has a supermassive blac khole as its core
\.


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.moon (moon_id, planet_id, name, estimated_mass_earth, description) FROM stdin;
1	3	The Moon	0.0123	One and only moon
2	4	Deimos	0.2471	Mars two moons
3	4	Phobos	1.7840	Mars two moons
4	5	Metis	\N	Jupiter's inner moons
5	5	Adrastea	\N	Jupiter's inner moons
6	5	Amalthea	\N	Jupiter's inner moons
7	5	Thebe	\N	Jupiter's inner moons
8	5	Io	0.0150	Jupiter's Galilean moons
9	5	Ganymede	0.0250	Jupiter's Galilean moons
10	5	Europa	0.0080	Jupiter's Galilean moons
11	5	Callisto	0.0180	Jupiter's Galilean moons
12	5	Leda	\N	Jupiter's Himalian moons
13	5	Ersa	\N	Jupiter's Himalian moons
14	5	Himalia	\N	Jupiter's Himalian moons
15	5	Pandia	\N	Jupiter's Himalian moons
16	5	Lysithea	\N	Jupiter's Himalian moons
17	5	Elara	\N	Jupiter's Himalian moons
18	5	Dia	\N	Jupiter's Himalian moons
19	6	Mimas	0.0000	Saturns major  moons
20	6	Enceladus	0.0000	Saturns major  moons
21	6	Tethys	0.0001	Saturns major  moons
22	6	Dione	0.0002	Saturns major  moons
23	6	Rhea	0.0004	Saturns major  moons
24	6	Iapetus	\N	Saturns major  moons
\.


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.planet (planet_id, star_id, name, estimated_mass_earth, number_of_moons, contains_life, min_temp_k, max_temp_k) FROM stdin;
1	1	Mercury	0.055	0	f	100	700
2	1	Venus	0.857	0	f	53	700
3	1	Earth	1.000	1	t	184	330
5	1	Jupyter	317.800	80	f	78	165
6	1	Saturn	95.159	83	f	88	151
7	1	Uranus	14.536	27	f	47	76
4	1	Mars	0.107	2	f	163	308
8	1	Neptune	17.147	13	f	55	72
15	7	Trappist-g	1.148	0	f	194	194
16	7	Trappist-h	0.331	0	f	169	169
10	7	Trappist-b	1.017	0	f	750	1500
11	7	Trappist-c	1.156	0	f	335	335
12	7	Trappist-d	0.297	0	f	282	282
13	7	Trappist-e	0.772	0	f	246	246
14	7	Trappist-f	0.680	0	f	219	219
\.


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.star (star_id, galaxy_id, name, class, avg_distance_ly, avg_mass_mo) FROM stdin;
1	1	The Sun	G2V	0.000	1.000
2	1	Antares	M1	550.000	15.500
3	1	Betelgeuse	M1-M2	550.000	17.750
4	1	Aldebaran	K5	65.000	1.160
5	2	Alpheratz	B8-A3	97.000	3.800
6	2	Almach	K2	350.000	23.700
7	1	Trappist-1	M8	40.660	0.089
\.


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 16, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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