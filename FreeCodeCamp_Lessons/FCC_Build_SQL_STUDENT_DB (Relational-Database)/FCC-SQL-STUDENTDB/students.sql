SELECT pg_terminate_backend(pg_stat_activity.pid)
FROM pg_stat_activity
WHERE usename = 'freecodecamp';

--
-- PostgreSQL database dump
--

-- Dumped from database version 12.6 (Debian 12.6-1.pgdg90+1)
-- Dumped by pg_dump version 12.6 (Debian 12.6-1.pgdg90+1)

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

DROP DATABASE IF EXISTS students;
--
-- Name: students; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE students WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE students OWNER TO freecodecamp;

\connect students

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
-- Name: courses; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.courses (
    course_id integer NOT NULL,
    course character varying(100) NOT NULL
);


ALTER TABLE public.courses OWNER TO freecodecamp;

--
-- Name: courses_course_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.courses_course_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.courses_course_id_seq OWNER TO freecodecamp;

--
-- Name: courses_course_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.courses_course_id_seq OWNED BY public.courses.course_id;


--
-- Name: majors; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.majors (
    major_id integer NOT NULL,
    major character varying(50) NOT NULL
);


ALTER TABLE public.majors OWNER TO freecodecamp;

--
-- Name: majors_courses; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.majors_courses (
    major_id integer NOT NULL,
    course_id integer NOT NULL
);


ALTER TABLE public.majors_courses OWNER TO freecodecamp;

--
-- Name: majors_major_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.majors_major_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.majors_major_id_seq OWNER TO freecodecamp;

--
-- Name: majors_major_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.majors_major_id_seq OWNED BY public.majors.major_id;


--
-- Name: students; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.students (
    student_id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    major_id integer,
    gpa numeric(2,1)
);


ALTER TABLE public.students OWNER TO freecodecamp;

--
-- Name: students_student_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.students_student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.students_student_id_seq OWNER TO freecodecamp;

--
-- Name: students_student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.students_student_id_seq OWNED BY public.students.student_id;


--
-- Name: courses course_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.courses ALTER COLUMN course_id SET DEFAULT nextval('public.courses_course_id_seq'::regclass);


--
-- Name: majors major_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.majors ALTER COLUMN major_id SET DEFAULT nextval('public.majors_major_id_seq'::regclass);


--
-- Name: students student_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.students ALTER COLUMN student_id SET DEFAULT nextval('public.students_student_id_seq'::regclass);


--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.courses VALUES (23, 'Data Structures and Algorithms');
INSERT INTO public.courses VALUES (24, 'Web Programming');
INSERT INTO public.courses VALUES (25, 'Database Systems');
INSERT INTO public.courses VALUES (26, 'Computer Networks');
INSERT INTO public.courses VALUES (27, 'SQL');
INSERT INTO public.courses VALUES (28, 'Machine Learning');
INSERT INTO public.courses VALUES (29, 'Computer Systems');
INSERT INTO public.courses VALUES (30, 'Web Applications');
INSERT INTO public.courses VALUES (31, 'Artificial Intelligence');
INSERT INTO public.courses VALUES (32, 'Python');
INSERT INTO public.courses VALUES (33, 'Object-Oriented Programming');
INSERT INTO public.courses VALUES (34, 'Calculus');
INSERT INTO public.courses VALUES (35, 'Game Architecture');
INSERT INTO public.courses VALUES (36, 'Algorithms');
INSERT INTO public.courses VALUES (37, 'UNIX');
INSERT INTO public.courses VALUES (38, 'Server Administration');
INSERT INTO public.courses VALUES (39, 'Network Security');


--
-- Data for Name: majors; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.majors VALUES (36, 'Database Administration');
INSERT INTO public.majors VALUES (37, 'Web Development');
INSERT INTO public.majors VALUES (38, 'Data Science');
INSERT INTO public.majors VALUES (39, 'Network Engineering');
INSERT INTO public.majors VALUES (40, 'Computer Programming');
INSERT INTO public.majors VALUES (41, 'Game Design');
INSERT INTO public.majors VALUES (42, 'System Administration');


--
-- Data for Name: majors_courses; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.majors_courses VALUES (36, 23);
INSERT INTO public.majors_courses VALUES (37, 24);
INSERT INTO public.majors_courses VALUES (36, 25);
INSERT INTO public.majors_courses VALUES (38, 23);
INSERT INTO public.majors_courses VALUES (39, 26);
INSERT INTO public.majors_courses VALUES (36, 27);
INSERT INTO public.majors_courses VALUES (38, 28);
INSERT INTO public.majors_courses VALUES (39, 29);
INSERT INTO public.majors_courses VALUES (40, 26);
INSERT INTO public.majors_courses VALUES (36, 30);
INSERT INTO public.majors_courses VALUES (41, 31);
INSERT INTO public.majors_courses VALUES (38, 32);
INSERT INTO public.majors_courses VALUES (40, 33);
INSERT INTO public.majors_courses VALUES (42, 29);
INSERT INTO public.majors_courses VALUES (41, 34);
INSERT INTO public.majors_courses VALUES (37, 23);
INSERT INTO public.majors_courses VALUES (38, 34);
INSERT INTO public.majors_courses VALUES (37, 33);
INSERT INTO public.majors_courses VALUES (41, 35);
INSERT INTO public.majors_courses VALUES (42, 26);
INSERT INTO public.majors_courses VALUES (41, 36);
INSERT INTO public.majors_courses VALUES (42, 37);
INSERT INTO public.majors_courses VALUES (42, 38);
INSERT INTO public.majors_courses VALUES (40, 29);
INSERT INTO public.majors_courses VALUES (40, 32);
INSERT INTO public.majors_courses VALUES (39, 39);
INSERT INTO public.majors_courses VALUES (37, 30);
INSERT INTO public.majors_courses VALUES (39, 36);


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.students VALUES (6, 'Rhea', 'Kellems', 36, 2.5);
INSERT INTO public.students VALUES (7, 'Emma', 'Gilbert', NULL, NULL);
INSERT INTO public.students VALUES (8, 'Kimberly', 'Whitley', 37, 3.8);
INSERT INTO public.students VALUES (9, 'Jimmy', 'Felipe', 36, 3.7);
INSERT INTO public.students VALUES (10, 'Kyle', 'Stimson', NULL, 2.8);
INSERT INTO public.students VALUES (11, 'Casares', 'Hijo', 41, 4.0);
INSERT INTO public.students VALUES (12, 'Noe', 'Savage', NULL, 3.6);
INSERT INTO public.students VALUES (13, 'Sterling', 'Boss', 41, 3.9);
INSERT INTO public.students VALUES (14, 'Brian', 'Davis', NULL, 2.3);
INSERT INTO public.students VALUES (15, 'Kaija', 'Uronen', 41, 3.7);
INSERT INTO public.students VALUES (16, 'Faye', 'Conn', 41, 2.1);
INSERT INTO public.students VALUES (17, 'Efren', 'Reilly', 37, 3.9);
INSERT INTO public.students VALUES (18, 'Danh', 'Nhung', NULL, 2.4);
INSERT INTO public.students VALUES (19, 'Maxine', 'Hagenes', 36, 2.9);
INSERT INTO public.students VALUES (20, 'Larry', 'Saunders', 38, 2.2);
INSERT INTO public.students VALUES (21, 'Karl', 'Kuhar', 37, NULL);
INSERT INTO public.students VALUES (22, 'Lieke', 'Hazenveld', 41, 3.5);
INSERT INTO public.students VALUES (23, 'Obie', 'Hilpert', 37, NULL);
INSERT INTO public.students VALUES (24, 'Peter', 'Booysen', NULL, 2.9);
INSERT INTO public.students VALUES (25, 'Nathan', 'Turner', 36, 3.3);
INSERT INTO public.students VALUES (26, 'Gerald', 'Osiki', 38, 2.2);
INSERT INTO public.students VALUES (27, 'Vanya', 'Hassanah', 41, 4.0);
INSERT INTO public.students VALUES (28, 'Roxelana', 'Florescu', 36, 3.2);
INSERT INTO public.students VALUES (29, 'Helene', 'Parker', 38, 3.4);
INSERT INTO public.students VALUES (30, 'Mariana', 'Russel', 37, 1.8);
INSERT INTO public.students VALUES (31, 'Ajit', 'Dhungel', NULL, 3.0);
INSERT INTO public.students VALUES (32, 'Mehdi', 'Vandenberghe', 36, 1.9);
INSERT INTO public.students VALUES (33, 'Dejon', 'Howell', 37, 4.0);
INSERT INTO public.students VALUES (34, 'Aliya', 'Gulgowski', 42, 2.6);
INSERT INTO public.students VALUES (35, 'Ana', 'Tupajic', 38, 3.1);
INSERT INTO public.students VALUES (36, 'Hugo', 'Duran', NULL, 3.8);


--
-- Name: courses_course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.courses_course_id_seq', 39, true);


--
-- Name: majors_major_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.majors_major_id_seq', 42, true);


--
-- Name: students_student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.students_student_id_seq', 36, true);


--
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (course_id);


--
-- Name: majors_courses majors_courses_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.majors_courses
    ADD CONSTRAINT majors_courses_pkey PRIMARY KEY (major_id, course_id);


--
-- Name: majors majors_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.majors
    ADD CONSTRAINT majors_pkey PRIMARY KEY (major_id);


--
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (student_id);


--
-- Name: majors_courses majors_courses_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.majors_courses
    ADD CONSTRAINT majors_courses_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.courses(course_id);


--
-- Name: majors_courses majors_courses_major_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.majors_courses
    ADD CONSTRAINT majors_courses_major_id_fkey FOREIGN KEY (major_id) REFERENCES public.majors(major_id);


--
-- Name: students students_major_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_major_id_fkey FOREIGN KEY (major_id) REFERENCES public.majors(major_id);


--
-- PostgreSQL database dump complete
--

-- CODE SYNTAX TEST 
SELECT ROUND (AVG(major_id)) FROM students;
SELECT CEIL (AVG(major_id)) FROM students;
SELECT FLOOR (AVG(major_id)) FROM students;

SELECT ROUND (AVG(major_id), 5) FROM students;
SELECT ROUND (AVG(gpa), 2) FROM students; 

-- 8º RETURN
SELECT COUNT (major_id) FROM majors;
SELECT major_id FROM students GROUP BY major_id;
SELECT major_id, COUNT (*) FROM STUDENTS GROUP BY major_id;
SELECT COUNT (*) FROM students ORDER BY major_id;
SELECT major_id, gpa FROM students ORDER BY gpa;
SELECT major_id, MIN(gpa) FROM students GROUP BY major_id;
SELECT major_id, MIN (gpa), MAX(gpa) FROM students GROUP BY major_id;
SELECT major_id, MIN(gpa), MAX(gpa) FROM students GROUP BY major_id HAVING MAX(gpa) = 4.0;

-- RETURNS MORE DESCRIPTIVE TABLE 
SELECT major_id, MIN(gpa) AS min_gpa, MAX(gpa) AS max_gpa FROM students GROUP BY major_id HAVING MAX(gpa) = 4.0;
SELECT major_id, COUNT (*) AS number_of_students FROM students GROUP BY major_id;
SELECT major_id, COUNT (*) AS number_of_students FROM students GROUP BY major_id HAVING COUNT(*) < 8;

-- RETURNS THE MOST DESCRIPTIVE TABLE
SELECT major_id, COUNT (*) AS number_of_students, MIN(gpa) AS min_gpa, MAX(gpa) AS max_gpa FROM students GROUP BY major_id HAVING MAX(gpa) = 4.0;

-- 9º RETURN
-- RETURNS COMPLETE TABLES REQUIREDS
-- It's showing all the columns from both tables, the two major_id columns are the same in each row for the ones that have it. You can see that there are some students without a major, and some majors without any students.
SELECT * FROM students FULL JOIN majors ON students.major_id = majors.major_id;

--There's a few less rows than the last query. In the LEFT JOIN you used, the students table was the left table since it was on the left side of the JOIN. majors was the right table. A LEFT JOIN gets all rows from the left table, but only rows from the right table that are linked to from the left one.
SELECT * FROM students LEFT JOIN majors ON students.major_id = majors.major_id;

--The right join showed all the rows from the right table (majors), but only rows from the left table (students) if they have a major
SELECT * FROM students RIGHT JOIN majors ON students.major_id = majors.major_id;

--The INNER JOIN only returned students if they have a major and majors that have a student. In other words, it only returned rows if they have a value in the foreign key column (major_id) of the opposite table.
SELECT * FROM students INNER JOIN majors ON students.major_id = majors.major_id;

SELECT * FROM majors LEFT JOIN students ON majors.major_id = students.major_id; 
SELECT * FROM majors INNER JOIN students ON majors.major_id = students.major_id;
SELECT * FROM majors RIGHT JOIN students ON majors.major_id = students.major_id;
SELECT * FROM majors FULL JOIN students ON majors.major_id = students.major_id;
SELECT * FROM majors JOIN students ON students.major_id = majors.major_id;

SELECT DISTINCT (major) FROM students INNER JOIN majors ON students.major_id = majors.major_id;

SELECT * FROM majors INNER JOIN students ON majors.major_id = students.major_id ORDER BY MAJOR, WHERE first_name NOT LIKE '%MA'; 

SELECT * FROM students RIGHT JOIN majors ON students.major_id = majors.major_id WHERE student_id IS NULL;
SELECT major FROM students RIGHT JOIN majors ON students.major_id = majors.major_id WHERE student_id IS NULL;

SELECT * FROM students LEFT JOIN majors ON students.major_id = majors.major_id WHERE major = 'Data Science' OR gpa >= 3.8;

SELECT first_name, last_name, major, gpa FROM students LEFT JOIN majors ON students.major_id = majors.major_id WHERE major = 'Data Science' OR gpa >= 3.8;

SELECT * FROM students RIGHT JOIN majors ON students.major_id = majors.major_id;
SELECT first_name, major FROM students FULL JOIN majors ON students.major_id = majors.major_id WHERE major LIKE '%ri%' or first_name LIKE '%ri%'; 

-- 10º RETURN
SELECT students.major_id FROM students FULL JOIN majors ON students.major_id = majors.major_id;

SELECT students.major_id FROM students FULL JOIN majors AS m ON students.major_id = m.major_id;

SELECT s.major_id FROM students AS s FULL JOIN majors AS m ON s.major_id = m.major_id;

SELECT * FROM students FULL JOIN majors USING(major_id) FULL JOIN majors_courses USING(major_id);

SELECT * FROM students FULL JOIN majors USING(major_id) FULL JOIN majors_courses USING(major_id) FULL JOIN courses USING(course_id);

