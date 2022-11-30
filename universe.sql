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
    description text,
    galaxy_type character varying(30),
    distance_from_earth_mly numeric(7,4),
    diameter_ly integer,
    is_spherical boolean
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
    description text,
    orbital_period_in_years numeric(7,4),
    is_spherical boolean,
    has_life boolean,
    planet_id integer NOT NULL
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
-- Name: more_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.more_info (
    more_info_id integer NOT NULL,
    constellation character varying(40),
    abs_magnitude numeric(5,2),
    notes text,
    galaxy_id integer NOT NULL,
    name character varying(30)
);


ALTER TABLE public.more_info OWNER TO freecodecamp;

--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.more_info_more_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.more_info_more_info_id_seq OWNER TO freecodecamp;

--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.more_info_more_info_id_seq OWNED BY public.more_info.more_info_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    orbital_period_in_years numeric(7,4),
    has_life boolean,
    planet_type character varying(30),
    is_spherical boolean,
    num_of_moons integer,
    star_id integer NOT NULL
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
    name character varying(30) NOT NULL,
    description text,
    distance_from_earth_ly numeric(7,4),
    star_type character varying(30),
    age_in_million_years integer,
    num_of_planets integer,
    is_spherical boolean,
    galaxy_id integer NOT NULL
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
-- Name: more_info more_info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info ALTER COLUMN more_info_id SET DEFAULT nextval('public.more_info_more_info_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Galaxy containing Sun and its Solar System', 'SB', 0.0260, 100000, false);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 'Nearest Galaxy to the Milky Way', 'SA', 2.5000, 152000, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum Galaxy', 'Third largest member of the Local Group of galaxies', 'SA', 2.9000, 61100, false);
INSERT INTO public.galaxy VALUES (4, 'Centaurus A', 'Fifth brightest in the sky. It is only visible from the southern hemisphere', 'S0 pec', 13.7000, 60000, true);
INSERT INTO public.galaxy VALUES (5, 'Messier 81', 'Its large size and high brightness make it a popular target for amatuer astronomers', 'SA', 12.0000, 90000, false);
INSERT INTO public.galaxy VALUES (6, 'Sculptor Galaxy', 'It is a starburst galaxy currently undergoing intense star formation', 'SAB', 12.0000, 90000, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 'Moon of planet Earth formed as a result of a collision of a Mars sized body with Earth', 0.0748, true, false, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Maybe a captured asteroid. Very difficult to see except in large telescopes due to being so close to Mars', 0.0009, false, false, 4);
INSERT INTO public.moon VALUES (3, 'Delmos', 'Maybe a captured asteroid. Very difficult to see except in large telescopes due to being so close to Mars', 0.0034, false, false, 4);
INSERT INTO public.moon VALUES (4, 'Ganymede', 'Largest and one of 4 Gallilean moons of Jupiter', 0.0195, true, false, 5);
INSERT INTO public.moon VALUES (5, 'Callisto', 'One of 4 Gallilean moons of Jupiter, geologically dead, has a very thin atmosphere carbondioxide and oxygen', 0.0457, true, false, 5);
INSERT INTO public.moon VALUES (6, 'Europa', 'Smallest of 4 Gallilean moons of Jupiter, ice moon possessing a subsurface water ocean and cryogeysers', 0.0097, true, false, 5);
INSERT INTO public.moon VALUES (7, 'Io', 'Hottest moon recording upto 2600 deg F around its 400 volcanoes', 0.0048, true, false, 5);
INSERT INTO public.moon VALUES (8, 'Adrastea', 'Ring maker moon of Jupiter, primary contributor of material for its rings', 0.0008, false, false, 5);
INSERT INTO public.moon VALUES (9, 'Amalthea', 'Small very red irregular shaped moon of Jupiter', 0.0013, false, false, 5);
INSERT INTO public.moon VALUES (10, 'Himalia', '6th largest moon of Jupiter, asteroid chunk moon', 0.7108, false, false, 5);
INSERT INTO public.moon VALUES (11, 'Titan', 'Largest moon of Saturn, liquid methane moon', 0.0436, true, false, 6);
INSERT INTO public.moon VALUES (12, 'Rhea', '2nd largest moon of Saturn, 75% water ice 25% rocky material', 0.0123, true, false, 6);
INSERT INTO public.moon VALUES (13, 'Dione', 'Surface is heavily cratered, has ice cliffs and subsurface liquid ocean', 0.0074, true, false, 6);
INSERT INTO public.moon VALUES (14, 'Tethys', 'Composed almost entirely of pure ice', 0.0052, true, false, 6);
INSERT INTO public.moon VALUES (15, 'Prometheus', 'F-RingShepherd moon of Saturn', 0.0017, false, false, 6);
INSERT INTO public.moon VALUES (16, 'Calypso', 'Sanblasted Trojan moon of Saturn', 0.0052, false, false, 6);
INSERT INTO public.moon VALUES (17, 'Titania', 'Ocean moon of Uranus, believed to harbor subsurface oceans', 0.0238, true, false, 7);
INSERT INTO public.moon VALUES (18, 'Cordelia', 'Inner shepherd moon of the e ring of Uranus', 0.0009, false, false, 7);
INSERT INTO public.moon VALUES (19, 'Triton', 'Cryovolcano moon of Neptune, largest moon of the planet', -0.0161, true, false, 8);
INSERT INTO public.moon VALUES (20, 'Despina', 'Shepherd moon, likely a rubble pile', 0.0009, false, false, 8);


--
-- Data for Name: more_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.more_info VALUES (1, 'Sagittarius', -20.80, 'Estimated to contain 100-400 billion stars', 1, 'Milky Way');
INSERT INTO public.more_info VALUES (2, 'Andromeda', -21.80, 'Named after wife of Perseus in Greek Mythology', 2, 'Andromeda Galaxy');
INSERT INTO public.more_info VALUES (3, 'Triangulum', -18.87, 'One of the most distant permanent objects that can be viewed by the naked eye', 3, 'Triangulum Galaxy');
INSERT INTO public.more_info VALUES (4, 'Centaurus', 6.84, 'Discovered by Scottish astronomer James Dunlop in 1826', 4, 'Centaurus A');
INSERT INTO public.more_info VALUES (5, 'Ursa Major', 6.94, 'Discovered by Johann Eliot Bodein 1774', 5, 'Messier 81');
INSERT INTO public.more_info VALUES (6, 'Sculptor', 7.20, 'A fairly strong radio source', 6, 'Sculptor Galaxy');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Smallest planet in Solar system, closest to the Sun', 0.2408, false, 'Planet', true, 0, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Second planet from the Sun, Closest neighbor to Earth', 0.6152, false, 'Planet', true, 0, 1);
INSERT INTO public.planet VALUES (3, 'Earth', '5th largest planet in solar system, only one known to have liquid water on the surface', 1.0000, true, 'Planet', true, 1, 1);
INSERT INTO public.planet VALUES (4, 'Mars', '4th planet from Sun, a dusty cold desert world with a very thin atmosphere', 1.8808, false, 'Planet', true, 2, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Largest planet in solar system', 11.8626, false, 'Planet', true, 80, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Adorned with thousands of beautiful ringlets, it is unique among the planets', 29.4474, false, 'Planet', true, 82, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'First planet found with aid of a telescope', 84.0168, false, 'Planet', true, 27, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Last of the planets in the solar system, dark cold and very windy', 164.7913, false, 'Planet', true, 14, 1);
INSERT INTO public.planet VALUES (9, 'Upsilon Andromedae b', 'Formally named Saffar, extrasolar planet 44 light years away from Sun', 0.0126, false, 'ExoPlanet', true, 0, 2);
INSERT INTO public.planet VALUES (10, 'HD 9446 b', 'Exoplanet discovered in 2010, 50 parsecs from Earth', 0.0823, false, 'ExoPlanet', true, 0, 3);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri b', 'Referred to as Alpha Centauri Cb sometimes, exoplanet orbiting in the habitable zone of Proxima Centauri', 0.0306, false, 'ExoPlanet', true, 0, 4);
INSERT INTO public.planet VALUES (16, 'TOI-178 e', 'Neptune like exoplanet that orbits a K type star', 0.0272, false, 'ExoPlanet', true, 0, 8);
INSERT INTO public.planet VALUES (15, 'Lalande 21185 b', 'Exoplanet orbiting the star Lalande 21185, 8.3 light years away from the Solar system', 0.0354, false, 'ExoPlanet', true, 0, 7);
INSERT INTO public.planet VALUES (14, '47 Ursae Majoris c', 'Formally named Taphao Kaew, is an exoplanet 46 light years away', 7.1000, false, 'ExoPlanet', true, 0, 6);
INSERT INTO public.planet VALUES (13, '47 Ursae Majoris b', 'Formally named Taphao Thong, is a gas giant exoplanet 46 light years away', 2.9820, false, 'ExoPlanet', true, 0, 6);
INSERT INTO public.planet VALUES (12, 'HD 108236 b', 'A super Earth exoplanet that orbits a G type star', 0.0388, false, 'ExoPlanet', true, 0, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Star around which Earth and other planets of the Solar system revolve', 0.0000, 'G2V', 4572, 9, true, 1);
INSERT INTO public.star VALUES (2, 'Upsilon Andromedae', 'Binary Star located 44 years from Earth', 44.0000, 'F8V', 3781, 4, true, 2);
INSERT INTO public.star VALUES (3, 'HD 9446', 'Star located 164 light years away', 164.0000, 'G5V', 2000, 2, false, 3);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 'Closest star to the Sun with a multi planetary system', 4.2400, 'M5.5Ve', 4850, 3, false, 4);
INSERT INTO public.star VALUES (5, 'HD 108236', 'G Type main sequence star, probably older than the sun', 211.0000, 'G3V', 5800, 5, false, 4);
INSERT INTO public.star VALUES (6, '47 Ursae Majoris', 'Formally named Chalawan, is a yellow dwarf star', 46.0000, 'G0V', 7434, 3, false, 5);
INSERT INTO public.star VALUES (7, 'Lalande 21185', 'Brightest red dwarf star in the northern hemisphere', 8.3000, 'M2V', 8047, 3, false, 5);
INSERT INTO public.star VALUES (8, 'TOI-178', 'The planets are in an orbital resonance', 205.1600, 'K7V', 7100, 6, false, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.more_info_more_info_id_seq', 6, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 16, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


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
-- Name: more_info more_info_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: more_info more_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_pkey PRIMARY KEY (more_info_id);


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
-- Name: more_info more_info_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

