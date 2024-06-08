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
-- Name: universe; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO postgres;

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    description text,
    galaxy_type character varying(30),
    has_life boolean NOT NULL
);


ALTER TABLE public.galaxy OWNER TO postgres;

--
-- Name: galaxy_num_row_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.galaxy_num_row_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_num_row_seq OWNER TO postgres;

--
-- Name: galaxy_num_row_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.galaxy_num_row_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30),
    description text,
    distance_from_earth integer,
    has_life boolean,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO postgres;

--
-- Name: moon_num_row_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.moon_num_row_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_num_row_seq OWNER TO postgres;

--
-- Name: moon_num_row_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.moon_num_row_seq OWNED BY public.moon.moon_id;


--
-- Name: new_table; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.new_table (
    new_table_id integer NOT NULL,
    name character varying(30),
    description text,
    has_life boolean NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.new_table OWNER TO postgres;

--
-- Name: new_table_row_num_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.new_table_row_num_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.new_table_row_num_seq OWNER TO postgres;

--
-- Name: new_table_row_num_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.new_table_row_num_seq OWNED BY public.new_table.new_table_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30),
    description text,
    distance_from_earth numeric(4,1),
    has_life boolean,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO postgres;

--
-- Name: planet_num_row_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.planet_num_row_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_num_row_seq OWNER TO postgres;

--
-- Name: planet_num_row_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.planet_num_row_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    description text,
    age_in_millions_of_years integer,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO postgres;

--
-- Name: star_num_row_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.star_num_row_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_num_row_seq OWNER TO postgres;

--
-- Name: star_num_row_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.star_num_row_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_num_row_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_num_row_seq'::regclass);


--
-- Name: new_table new_table_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.new_table ALTER COLUMN new_table_id SET DEFAULT nextval('public.new_table_row_num_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_num_row_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_num_row_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.galaxy VALUES (1, 'Whirlpool Galaxy', 'he Whirlpool Galaxy, also known as Messier 51, is a spiral galaxy located in the constellation Canes Venatici. It is famous for its striking spiral arms and interactions with its companion galaxy, NGC 5195.', 'Spiral', false);
INSERT INTO public.galaxy VALUES (2, 'Sombrero Galaxy', 'The Sombrero Galaxy, also known as Messier 104, is a spiral galaxy located in the constellation Virgo. It is named for its resemblance to a wide-brimmed hat. The galaxys prominent bulge and dark dust lane give it a distinctive appearance.', 'Spiral Galaxy', false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum Galaxy', 'The Triangulum Galaxy, also known as Messier 33, is a spiral galaxy located in the constellation Triangulum. It is one of the closest galaxies to the Milky Way and is notable for its large number of young, blue stars and extensive star-forming regions.', 'Spiral Galaxy', false);
INSERT INTO public.galaxy VALUES (4, 'Leo Triplet', 'The Leo Triplet is a group of three galaxies located in the constellation Leo. The trio consists of NGC 3628, M65, and M66. These galaxies are gravitationally bound to each other and often appear in astrophotography together.', 'Spiral Galaxy', false);
INSERT INTO public.galaxy VALUES (5, 'Cigar Galaxy', 'The Cigar Galaxy, also known as Messier 82, is a starburst galaxy located in the constellation Ursa Major. It is named for its elongated shape, resembling a cigar. The galaxy is undergoing intense star formation, resulting in vigorous starburst activity.', 'Starburst Galaxy', false);
INSERT INTO public.galaxy VALUES (6, 'Milky Way', 'The Milky Way is the galaxy that contains our Solar System, including Earth. It is a barred spiral galaxy with a diameter of about 100,000 light-years and contains billions of stars, including our Sun. The Milky Way is named for its appearance as a faint band of light stretching across the night sky, which is caused by the combined light of numerous stars and interstellar dust.', 'Barred Spiral Galaxy', true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.moon VALUES (1, 'Caloris', 'Named after the Caloris Basin, this moon is known for its reflective surface.', 77, false, 1);
INSERT INTO public.moon VALUES (2, 'Terminator', 'Named for the sharp transition between Mercury’s day and night, this moon has extreme temperature variations.', 78, false, 1);
INSERT INTO public.moon VALUES (3, 'Messenger', 'Named after the MESSENGER spacecraft, this moon features extensive cratering.', 76, false, 1);
INSERT INTO public.moon VALUES (4, 'Horus', 'Named after the ancient Egyptian god associated with the sky, this moon has a thin exosphere.', 76, false, 1);
INSERT INTO public.moon VALUES (5, 'Aphrodite', 'Named after the Greek goddess of love, this moon has an atmosphere dense with sulfuric acid clouds.', 41, false, 2);
INSERT INTO public.moon VALUES (6, 'Ishtar', 'Named for the Babylonian goddess, this moon features volcanic activity similar to Venus.', 42, false, 2);
INSERT INTO public.moon VALUES (7, 'Dione', 'Named after a Titaness, this moon has numerous impact craters and highland regions.', 42, false, 2);
INSERT INTO public.moon VALUES (8, 'Eros', 'Named after the Greek god of love, this moon is characterized by its elongated shape and irregular orbit.', 41, false, 2);
INSERT INTO public.moon VALUES (9, 'Moon', 'The Earth''s only natural satellite, known for its phases and significant influence on Earth''s tides.', 1, false, 3);
INSERT INTO public.moon VALUES (10, 'Phobos', 'The larger and closer of Mars''s two moons, with a heavily cratered surface.', 78, false, 4);
INSERT INTO public.moon VALUES (11, 'Deimos', 'The smaller and more distant of Mars''s moons, with a smoother surface than Phobos.', 78, false, 4);
INSERT INTO public.moon VALUES (12, 'Phantasia (Hypothetical)', 'A proposed moon of Mars that might be captured in the future, characterized by its irregular shape.', 78, false, 4);
INSERT INTO public.moon VALUES (13, 'Aetheria (Hypothetical)', 'A theoretical moon that could be formed from debris orbiting Mars.', 78, false, 4);
INSERT INTO public.moon VALUES (14, 'Io', 'The innermost of Jupiter''s four Galilean moons, known for its extreme volcanic activity.', 628, false, 5);
INSERT INTO public.moon VALUES (15, 'Europa', 'Known for its smooth, icy surface and potential subsurface ocean, making it a candidate for the search for extraterrestrial life.', 628, false, 5);
INSERT INTO public.moon VALUES (16, 'Ganymede', 'The largest moon in the Solar System, larger than the planet Mercury, with a magnetic field.', 628, false, 5);
INSERT INTO public.moon VALUES (17, 'Callisto', 'The most heavily cratered object in the Solar System, with an ancient, icy surface.', 628, false, 5);
INSERT INTO public.moon VALUES (18, 'Titan', 'The largest moon of Saturn, known for its thick, nitrogen-rich atmosphere and lakes of liquid methane and ethane. It is one of the most Earth-like bodies in the Solar System.', 1200, false, 6);
INSERT INTO public.moon VALUES (19, 'Enceladus', 'A small, icy moon that has geysers erupting from its south pole, indicating the presence of a subsurface ocean beneath its ice crust.', 1200, false, 6);
INSERT INTO public.moon VALUES (20, 'Rhea', 'The second-largest moon of Saturn, known for its heavily cratered surface and thin atmosphere composed mainly of oxygen and carbon dioxide.', 1200, false, 6);


--
-- Data for Name: new_table; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.new_table VALUES (1, 'HELLO', 'My name', true, 1);
INSERT INTO public.new_table VALUES (2, 'WORLD', ' is ', true, 2);
INSERT INTO public.new_table VALUES (3, '!', 'YERLAN', true, 3);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Mercury is the smallest planet in our solar system and the closest to the Sun. It has a heavily cratered surface and no atmosphere.', 77.3, false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Venus is known for its thick, toxic atmosphere composed mainly of carbon dioxide. It has a surface temperature hot enough to melt lead and experiences extreme pressure.', 42.5, false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'Earth is the only planet known to support life. It has a diverse range of ecosystems, including oceans, forests, deserts, and polar regions.', NULL, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Mars is often called the "Red Planet" due to its reddish appearance caused by iron oxide on its surface. It has polar ice caps, canyons, and extinct volcanoes.', 225.0, false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Jupiter is the largest planet in our solar system and is known for its massive size and iconic red spot, a giant storm that has been raging for centuries.', 588.0, false, 1);
INSERT INTO public.planet VALUES (6, 'SATURN', 'Saturn is famous for its beautiful rings made of ice and dust particles. It is the second-largest planet and has many moons, including Titan, which has a thick atmosphere.', 120.0, false, 1);
INSERT INTO public.planet VALUES (7, 'Sirius A I', 'This planet orbits the primary star, Sirius A, and is likely to have extreme temperature variations due to its proximity to a bright, hot star.', 8.6, false, 6);
INSERT INTO public.planet VALUES (8, 'Sirius A II', 'Another planet orbiting Sirius A, it might have similar conditions to Sirius A I but could have different geological features.', 8.6, false, 6);
INSERT INTO public.planet VALUES (9, 'Sirius A III', 'The third planet in the Sirius A system, it could be a gas giant or have a rocky composition, depending on its distance from the star.', 8.6, false, 6);
INSERT INTO public.planet VALUES (10, 'Sirius B I', 'This planet orbits the white dwarf companion star, Sirius B, which is much smaller and cooler than Sirius A. Its surface conditions might be drastically different from those of planets around Sirius A.', 8.6, false, 6);
INSERT INTO public.planet VALUES (11, 'Sirius B II', 'Another planet in orbit around Sirius B, it would experience different environmental conditions due to its proximity to the smaller, cooler star.', 8.6, false, 6);
INSERT INTO public.planet VALUES (12, 'Sirius B III', 'The third known planet around Sirius B, it might have characteristics similar to other planets in its system but would be influenced by the gravitational forces of the white dwarf.', 8.6, false, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.star VALUES (2, 'SGR J1926-2951', 'A soft gamma repeater located in the halo, known for its bursts of gamma-ray emissions.', 10, 2);
INSERT INTO public.star VALUES (3, 'M33-X-7', 'An X-ray binary system with a stellar-mass black hole and a massive O-type companion star.', 12, 3);
INSERT INTO public.star VALUES (4, 'NGC 3628-X1', 'An X-ray binary system with a possible black hole, located in NGC 3628, exhibiting strong X-ray emissions.', 10, 4);
INSERT INTO public.star VALUES (5, 'M82-VLA
', 'A young, massive star cluster emitting strong radio waves, embedded in the starburst region.', 8, 5);
INSERT INTO public.star VALUES (6, 'Sirius', 'The brightest star in the night sky, part of a binary system in the constellation Canis Major.', 200, 6);
INSERT INTO public.star VALUES (1, 'Sun', 'A Type Ic supernova that occurred in the Whirlpool Galaxy, showcasing the end stage of a massive star''s life cycle.', 60, 1);


--
-- Name: galaxy_num_row_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.galaxy_num_row_seq', 6, true);


--
-- Name: moon_num_row_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.moon_num_row_seq', 20, true);


--
-- Name: new_table_row_num_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.new_table_row_num_seq', 3, true);


--
-- Name: planet_num_row_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.planet_num_row_seq', 12, true);


--
-- Name: star_num_row_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.star_num_row_seq', 6, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_num_row_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_num_row_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: new_table new_table_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.new_table
    ADD CONSTRAINT new_table_id_unique UNIQUE (new_table_id);


--
-- Name: new_table new_table_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.new_table
    ADD CONSTRAINT new_table_pkey PRIMARY KEY (new_table_id);


--
-- Name: planet planet_num_row_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_num_row_key UNIQUE (planet_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_id UNIQUE (galaxy_id);


--
-- Name: star unique_star_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_id UNIQUE (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

