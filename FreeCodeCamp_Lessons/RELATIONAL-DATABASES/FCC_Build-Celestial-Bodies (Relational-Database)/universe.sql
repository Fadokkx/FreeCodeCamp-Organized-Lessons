--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

-- Started on 2024-05-24 16:17:57

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
-- TOC entry 224 (class 1259 OID 57656)
-- Name: dwarfplanet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dwarfplanet (
    dwarfplanet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    "gravityinmsý" real,
    discoveredin date,
    haswater boolean
);


ALTER TABLE public.dwarfplanet OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 57655)
-- Name: dwarfplanet_dwarfplanet_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dwarfplanet_dwarfplanet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dwarfplanet_dwarfplanet_id_seq OWNER TO postgres;

--
-- TOC entry 4894 (class 0 OID 0)
-- Dependencies: 223
-- Name: dwarfplanet_dwarfplanet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dwarfplanet_dwarfplanet_id_seq OWNED BY public.dwarfplanet.dwarfplanet_id;


--
-- TOC entry 216 (class 1259 OID 57599)
-- Name: galaxy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distancefromearth_inlightyears real,
    galaxydesc text,
    dwarfplanetsinto numeric
);


ALTER TABLE public.galaxy OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 57598)
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNER TO postgres;

--
-- TOC entry 4895 (class 0 OID 0)
-- Dependencies: 215
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- TOC entry 222 (class 1259 OID 57640)
-- Name: moon; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    "gravityinmsý" real,
    sizeinkm real,
    moondesc text NOT NULL,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 57639)
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.moon_moon_id_seq OWNER TO postgres;

--
-- TOC entry 4896 (class 0 OID 0)
-- Dependencies: 221
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- TOC entry 220 (class 1259 OID 57626)
-- Name: planet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    "gravityinmsý" real,
    haswater boolean,
    discoveredin date,
    sizeinkm integer,
    star_id integer
);


ALTER TABLE public.planet OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 57625)
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.planet_planet_id_seq OWNER TO postgres;

--
-- TOC entry 4897 (class 0 OID 0)
-- Dependencies: 219
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- TOC entry 218 (class 1259 OID 57610)
-- Name: star; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distancefromearth_inlightyears integer,
    stardesc text,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 57609)
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.star_star_id_seq OWNER TO postgres;

--
-- TOC entry 4898 (class 0 OID 0)
-- Dependencies: 217
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- TOC entry 4712 (class 2604 OID 57659)
-- Name: dwarfplanet dwarfplanet_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dwarfplanet ALTER COLUMN dwarfplanet_id SET DEFAULT nextval('public.dwarfplanet_dwarfplanet_id_seq'::regclass);


--
-- TOC entry 4708 (class 2604 OID 57602)
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- TOC entry 4711 (class 2604 OID 57643)
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- TOC entry 4710 (class 2604 OID 57629)
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- TOC entry 4709 (class 2604 OID 57613)
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- TOC entry 4888 (class 0 OID 57656)
-- Dependencies: 224
-- Data for Name: dwarfplanet; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dwarfplanet (dwarfplanet_id, name, "gravityinmsý", discoveredin, haswater) FROM stdin;
1	P23	0.1151	1930-02-18	t
2	E1	0.2326	2005-01-05	f
3	C2	0.946	1801-01-01	f
4	G3	0.123	2007-07-17	f
5	M4	0.715	2005-03-31	t
6	H5	0.816	2004-12-28	f
\.


--
-- TOC entry 4880 (class 0 OID 57599)
-- Dependencies: 216
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.galaxy (galaxy_id, name, distancefromearth_inlightyears, galaxydesc, dwarfplanetsinto) FROM stdin;
1	m1	26670	aaaa	101
2	a2	2.537e+06	bbbbbb	159
3	e3	4.5e+06	cccccc	234
4	b4	1e+08	ddddddd	20
5	t5	1.729e+08	eeeeeee	790
6	c6	1.142e+07	ffffff	1000
\.


--
-- TOC entry 4886 (class 0 OID 57640)
-- Dependencies: 222
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.moon (moon_id, name, "gravityinmsý", sizeinkm, moondesc, planet_id) FROM stdin;
1	m1	3.92	210.3	aaaaaaa	1
2	m2	3.5	200.1	bbbbbb	2
3	m3	2.1	42.1	ccccc	3
4	p4	1.1	2.2	ddddd	5
5	e33	\N	\N	eeeee	6
6	a23	\N	\N	fffff	6
7	b3a	\N	\N	ggggg	6
8	b2b	\N	\N	hhhhh	6
9	c4p	\N	\N	jjjjj	6
10	dd1	\N	\N	kkkkk	6
11	bc1	\N	\N	lllll	6
12	e3	\N	\N	mmmm	6
13	ae2	\N	\N	nnnn	6
14	bzq	\N	\N	oooo	6
15	b5f	\N	\N	pppp	6
16	gt2	\N	\N	qqqqq	6
17	dr3	\N	\N	rrrr	6
18	g3x	\N	\N	ssss	6
19	bgd	\N	\N	tttt	9
20	lna	\N	\N	uuuuu	8
\.


--
-- TOC entry 4884 (class 0 OID 57626)
-- Dependencies: 220
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.planet (planet_id, name, "gravityinmsý", haswater, discoveredin, sizeinkm, star_id) FROM stdin;
1	e1	9.8	t	1100-03-11	490	1
2	m2	4.5	f	1500-11-28	587	1
3	v3	12.1	f	1600-10-10	1890	3
4	u4	1.1	f	1300-08-31	100	1
5	s5	14.4	f	1200-01-01	2123	1
6	j6	8.23	t	1930-02-20	600	1
7	m7	5.2	t	1940-08-21	300	4
8	l8	10.1	f	2000-12-12	\N	2
9	f9	4.3	f	2004-03-11	1000	2
10	g10	2.2	f	1993-12-09	200	6
11	p11	1.1	f	1973-12-16	228	5
12	q12	2.4	t	1242-05-30	57	1
\.


--
-- TOC entry 4882 (class 0 OID 57610)
-- Dependencies: 218
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.star (star_id, name, distancefromearth_inlightyears, stardesc, galaxy_id) FROM stdin;
1	a1	1000	aaaaaaa	1
2	e2	400	eeeeeee	2
3	v3	5000	vvvvvv	3
4	a4	60	aaaaaaa	4
5	t5	9000	ttttttttttttt	5
6	a6	3200	aaaaaaa	6
\.


--
-- TOC entry 4899 (class 0 OID 0)
-- Dependencies: 223
-- Name: dwarfplanet_dwarfplanet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dwarfplanet_dwarfplanet_id_seq', 1, false);


--
-- TOC entry 4900 (class 0 OID 0)
-- Dependencies: 215
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- TOC entry 4901 (class 0 OID 0)
-- Dependencies: 221
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- TOC entry 4902 (class 0 OID 0)
-- Dependencies: 219
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- TOC entry 4903 (class 0 OID 0)
-- Dependencies: 217
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- TOC entry 4730 (class 2606 OID 57663)
-- Name: dwarfplanet dwarfplanet_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dwarfplanet
    ADD CONSTRAINT dwarfplanet_name_key UNIQUE (name);


--
-- TOC entry 4732 (class 2606 OID 57661)
-- Name: dwarfplanet dwarfplanet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dwarfplanet
    ADD CONSTRAINT dwarfplanet_pkey PRIMARY KEY (dwarfplanet_id);


--
-- TOC entry 4714 (class 2606 OID 57608)
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- TOC entry 4716 (class 2606 OID 57606)
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- TOC entry 4726 (class 2606 OID 57649)
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- TOC entry 4728 (class 2606 OID 57647)
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- TOC entry 4722 (class 2606 OID 57633)
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- TOC entry 4724 (class 2606 OID 57631)
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- TOC entry 4718 (class 2606 OID 57619)
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- TOC entry 4720 (class 2606 OID 57617)
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- TOC entry 4735 (class 2606 OID 57650)
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- TOC entry 4734 (class 2606 OID 57634)
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- TOC entry 4733 (class 2606 OID 57620)
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


-- Completed on 2024-05-24 16:17:59

--
-- PostgreSQL database dump complete
--

