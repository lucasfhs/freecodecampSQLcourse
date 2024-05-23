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
    name character varying(40) NOT NULL,
    description character varying(100),
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_year numeric,
    galaxy_type text,
    distance_from_earth integer NOT NULL
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
    planet_id integer,
    moon_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description character varying(100),
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_year numeric,
    moon_type text,
    distance_from_earth integer NOT NULL
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
-- Name: more_celestial_bodies; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.more_celestial_bodies (
    more_celestial_bodies_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description character varying(100) NOT NULL,
    distance_from_earth integer NOT NULL
);


ALTER TABLE public.more_celestial_bodies OWNER TO freecodecamp;

--
-- Name: more_celestial_bodies_more_celestial_bodies_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.more_celestial_bodies_more_celestial_bodies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.more_celestial_bodies_more_celestial_bodies_id_seq OWNER TO freecodecamp;

--
-- Name: more_celestial_bodies_more_celestial_bodies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.more_celestial_bodies_more_celestial_bodies_id_seq OWNED BY public.more_celestial_bodies.more_celestial_bodies_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    star_id integer,
    planet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description character varying(100),
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_year numeric,
    planet_type text,
    distance_from_earth integer NOT NULL
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
    galaxy_id integer,
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description character varying(100),
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_year numeric,
    star_type text,
    distance_from_earth integer NOT NULL
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
-- Name: more_celestial_bodies more_celestial_bodies_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_celestial_bodies ALTER COLUMN more_celestial_bodies_id SET DEFAULT nextval('public.more_celestial_bodies_more_celestial_bodies_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda Galaxy', 'Closest spiral galaxy to Milky Way', false, true, 13000, 'Spiral', 3);
INSERT INTO public.galaxy VALUES (2, 'Milky Way Galaxy', 'Our home galaxy', true, NULL, 13500, 'Spiral', 0);
INSERT INTO public.galaxy VALUES (3, 'Messier 87', 'Elliptical galaxy with supermassive black hole', NULL, true, 15000, 'Elliptical', 54);
INSERT INTO public.galaxy VALUES (4, 'Triangulum Galaxy', 'Third largest galaxy in Local Group', NULL, true, 11000, 'Spiral', 3);
INSERT INTO public.galaxy VALUES (5, 'Centaurus A', 'Elliptical galaxy with dust lanes', NULL, true, 16000, 'Elliptical', 16);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'Irregular dwarf galaxy', NULL, NULL, 16500, 'Irregular', 165);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'Luna', 'Earth natural satellite', false, true, 4500, 'Terrestrial', 0);
INSERT INTO public.moon VALUES (2, 2, 'Phobos', 'Larger and closer of Mars moons', false, true, 4500, 'Asteroid-like', 4);
INSERT INTO public.moon VALUES (2, 3, 'Deimos', 'Smaller and farther of Mars moons', false, true, 4500, 'Asteroid-like', 4);
INSERT INTO public.moon VALUES (3, 4, 'Io', 'Jupiters moon with intense volcanic activity', false, true, 4500, 'Volcanic', 628);
INSERT INTO public.moon VALUES (3, 5, 'Europa', 'Icy moon with potential subsurface ocean', false, true, 4500, 'Icy', 628);
INSERT INTO public.moon VALUES (3, 6, 'Ganymede', 'Largest moon in the solar system', false, true, 4500, 'Icy', 628);
INSERT INTO public.moon VALUES (3, 7, 'Callisto', 'Heavily cratered moon of Jupiter', false, true, 4500, 'Icy', 628);
INSERT INTO public.moon VALUES (4, 8, 'Titan', 'Largest moon of Saturn with thick atmosphere', false, true, 4500, 'Icy', 1400);
INSERT INTO public.moon VALUES (4, 9, 'Enceladus', 'Icy moon with geysers', false, true, 4500, 'Icy', 1400);
INSERT INTO public.moon VALUES (4, 10, 'Mimas', 'Moon of Saturn with large crater', false, true, 4500, 'Icy', 1400);
INSERT INTO public.moon VALUES (4, 11, 'Rhea', 'Second largest moon of Saturn', false, true, 4500, 'Icy', 1400);
INSERT INTO public.moon VALUES (5, 12, 'Triton', 'Largest moon of Neptune with retrograde orbit', false, true, 4500, 'Icy', 4500);
INSERT INTO public.moon VALUES (5, 13, 'Proteus', 'Second largest moon of Neptune', false, true, 4500, 'Icy', 4500);
INSERT INTO public.moon VALUES (5, 14, 'Nereid', 'Neptune moon with highly eccentric orbit', false, true, 4500, 'Icy', 4500);
INSERT INTO public.moon VALUES (6, 15, 'Charon', 'Largest moon of Pluto', false, true, 4500, 'Icy', 5900);
INSERT INTO public.moon VALUES (6, 16, 'Nix', 'Small moon of Pluto', false, true, 4500, 'Icy', 5900);
INSERT INTO public.moon VALUES (6, 17, 'Hydra', 'Outer moon of Pluto', false, true, 4500, 'Icy', 5900);
INSERT INTO public.moon VALUES (6, 18, 'Kerberos', 'Small moon of Pluto', false, true, 4500, 'Icy', 5900);
INSERT INTO public.moon VALUES (6, 19, 'Styx', 'Smallest moon of Pluto', false, true, 4500, 'Icy', 5900);
INSERT INTO public.moon VALUES (7, 20, 'Miranda', 'Smallest and innermost of Uranus major moons', false, true, 4500, 'Icy', 2870);


--
-- Data for Name: more_celestial_bodies; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.more_celestial_bodies VALUES (1, 'Oumuamua', 'First known interstellar object detected passing through the Solar System', 23000000);
INSERT INTO public.more_celestial_bodies VALUES (2, 'Tabbys Star', 'Star with unusual dimming patterns, sparking speculation about alien megastructures', 1470);
INSERT INTO public.more_celestial_bodies VALUES (3, 'Pulsar PSR B1257+12', 'Pulsar hosting the first exoplanets ever discovered', 980);
INSERT INTO public.more_celestial_bodies VALUES (4, 'Rogue Planet PSO J318.5-22', 'Planet without a parent star, wandering the galaxy', 80);
INSERT INTO public.more_celestial_bodies VALUES (5, 'Hyperion', 'Saturn moon with a bizarre sponge-like appearance', 1200);
INSERT INTO public.more_celestial_bodies VALUES (6, 'Haumea', 'Dwarf planet with a fast rotation and elongated shape', 6500);
INSERT INTO public.more_celestial_bodies VALUES (7, 'Kepler-452b', 'Exoplanet often called Earth cousin due to its similarities in size and orbit', 1400);
INSERT INTO public.more_celestial_bodies VALUES (8, 'KIC 8462852', 'Star exhibiting irregular and significant dips in brightness', 1470);
INSERT INTO public.more_celestial_bodies VALUES (9, 'Hoags Object', 'A rare type of ring galaxy with a peculiar structure', 600);
INSERT INTO public.more_celestial_bodies VALUES (10, 'Voyager 1', 'Human-made spacecraft that has entered interstellar space', 22700);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Mercury', 'Smallest planet in the Solar System and closest to the Sun', false, true, 4600, 'Terrestrial', 77);
INSERT INTO public.planet VALUES (1, 2, 'Venus', 'Second planet from the Sun with a thick, toxic atmosphere', false, true, 4600, 'Terrestrial', 41);
INSERT INTO public.planet VALUES (1, 3, 'Earth', 'Our home planet, the only one known to support life', true, true, 4600, 'Terrestrial', 0);
INSERT INTO public.planet VALUES (1, 4, 'Mars', 'The Red Planet, known for its iron oxide surface', false, true, 4600, 'Terrestrial', 225);
INSERT INTO public.planet VALUES (1, 5, 'Jupiter', 'Largest planet in the Solar System with a Great Red Spot', false, true, 4600, 'Gas giant', 628);
INSERT INTO public.planet VALUES (1, 6, 'Saturn', 'Known for its extensive ring system', false, true, 4600, 'Gas giant', 1277);
INSERT INTO public.planet VALUES (1, 7, 'Uranus', 'An ice giant with a blue-green color due to methane', false, true, 4600, 'Ice giant', 2720);
INSERT INTO public.planet VALUES (1, 8, 'Neptune', 'The farthest known planet in the Solar System', false, true, 4600, 'Ice giant', 4350);
INSERT INTO public.planet VALUES (2, 9, 'Proxima b', 'Closest exoplanet to Earth, potentially habitable', NULL, true, 4.2, 'Terrestrial', 4);
INSERT INTO public.planet VALUES (2, 10, 'Proxima c', 'Second planet in the Proxima Centauri system, a potential super-Earth', NULL, true, 5.3, 'Super-Earth', 4);
INSERT INTO public.planet VALUES (6, 11, 'Gliese 581g', 'Exoplanet in the habitable zone of its star', NULL, true, 7.0, 'Super-Earth', 20);
INSERT INTO public.planet VALUES (6, 12, 'Gliese 667Cc', 'Potentially habitable exoplanet in a triple-star system', NULL, true, 7.2, 'Super-Earth', 24);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sol', 'Our Sun, a yellow dwarf star', true, true, 4600, 'Yellow dwarf', 0);
INSERT INTO public.star VALUES (2, 2, 'Proxima Centauri', 'Closest star to Sun', NULL, true, 4800, 'Red dwarf', 4);
INSERT INTO public.star VALUES (3, 3, 'M87*', 'Supermassive black hole at center of Messier 87', NULL, true, NULL, 'Supermassive black hole', 54);
INSERT INTO public.star VALUES (1, 4, 'Sirius', 'Brightest star in night sky', NULL, true, 250, 'White dwarf', 9);
INSERT INTO public.star VALUES (1, 5, 'Betelgeuse', 'Red supergiant star nearing end of its life', NULL, true, 600, 'Red supergiant', 640);
INSERT INTO public.star VALUES (2, 6, 'Trappist-1', 'Ultracool dwarf star with seven Earth-sized planets', NULL, true, 8, 'Ultracool dwarf', 40);
INSERT INTO public.star VALUES (2, 7, 'Proxima b', 'Closest exoplanet to Earth potentially habitable', NULL, NULL, 4.2, 'Earth-sized planet', 4);
INSERT INTO public.star VALUES (3, 8, 'Polaris', 'North Star, used for navigation', NULL, true, 460, 'Yellow dwarf', 434);
INSERT INTO public.star VALUES (3, 9, 'Vega', 'Fifth brightest star in night sky', NULL, true, 400, 'A-type star', 25);
INSERT INTO public.star VALUES (4, 10, 'Arcturus', 'Fourth brightest star in night sky', NULL, true, 25, 'Orange giant', 37);
INSERT INTO public.star VALUES (5, 11, 'Canopus', 'Second brightest star in night sky', NULL, true, 1500, 'Red giant', 79);
INSERT INTO public.star VALUES (6, 12, 'Rigel', 'Seventh brightest star in night sky', NULL, true, 20, 'Supergiant', 860);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: more_celestial_bodies_more_celestial_bodies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.more_celestial_bodies_more_celestial_bodies_id_seq', 10, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


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
-- Name: more_celestial_bodies more_celestial_bodies_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_celestial_bodies
    ADD CONSTRAINT more_celestial_bodies_description_key UNIQUE (description);


--
-- Name: more_celestial_bodies more_celestial_bodies_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_celestial_bodies
    ADD CONSTRAINT more_celestial_bodies_name_key UNIQUE (name);


--
-- Name: more_celestial_bodies more_celestial_bodies_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_celestial_bodies
    ADD CONSTRAINT more_celestial_bodies_pkey PRIMARY KEY (more_celestial_bodies_id);


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

