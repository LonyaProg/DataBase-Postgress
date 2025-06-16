--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

-- Started on 2024-12-13 21:11:23



DROP DATABASE IF EXISTS [medclinic];
   CREATE DATABASE [medclinic];
   USE [medclinic];


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
-- TOC entry 222 (class 1259 OID 41102)
-- Name: appointments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.appointments (
    id_appointment integer NOT NULL,
    date_appointment timestamp without time zone,
    id_patient integer,
    id_doctor integer,
    id_service integer,
    id_payment integer
);


ALTER TABLE public.appointments OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 41105)
-- Name: appointments_id_appointment_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.appointments_id_appointment_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.appointments_id_appointment_seq OWNER TO postgres;

--
-- TOC entry 4896 (class 0 OID 0)
-- Dependencies: 223
-- Name: appointments_id_appointment_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.appointments_id_appointment_seq OWNED BY public.appointments.id_appointment;


--
-- TOC entry 218 (class 1259 OID 32840)
-- Name: doctors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.doctors (
    fullname text,
    salary double precision,
    phone character varying(20) NOT NULL,
    id_doctor integer NOT NULL,
    id_speciality integer
);


ALTER TABLE public.doctors OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 41059)
-- Name: doctors_id_doctor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.doctors_id_doctor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.doctors_id_doctor_seq OWNER TO postgres;

--
-- TOC entry 4897 (class 0 OID 0)
-- Dependencies: 219
-- Name: doctors_id_doctor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.doctors_id_doctor_seq OWNED BY public.doctors.id_doctor;


--
-- TOC entry 215 (class 1259 OID 32812)
-- Name: patients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.patients (
    id_patient integer NOT NULL,
    date_of_birthday date,
    history_of_visiting text,
    fullname character varying(255),
    policy character varying(20)
);


ALTER TABLE public.patients OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 32826)
-- Name: payments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payments (
    payment_method text,
    id_payment integer NOT NULL
);


ALTER TABLE public.payments OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 41080)
-- Name: payments_id_payment_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payments_id_payment_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payments_id_payment_seq OWNER TO postgres;

--
-- TOC entry 4898 (class 0 OID 0)
-- Dependencies: 220
-- Name: payments_id_payment_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payments_id_payment_seq OWNED BY public.payments.id_payment;


--
-- TOC entry 217 (class 1259 OID 32833)
-- Name: services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.services (
    service text,
    description text,
    price double precision,
    id_service integer NOT NULL
);


ALTER TABLE public.services OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 41088)
-- Name: services_id_serice_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.services_id_serice_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.services_id_serice_seq OWNER TO postgres;

--
-- TOC entry 4899 (class 0 OID 0)
-- Dependencies: 221
-- Name: services_id_serice_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.services_id_serice_seq OWNED BY public.services.id_service;


--
-- TOC entry 224 (class 1259 OID 41154)
-- Name: specialties; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.specialties (
    id_speciality integer NOT NULL,
    speciality character varying(30)
);


ALTER TABLE public.specialties OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 41157)
-- Name: specities_id_specity_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.specities_id_specity_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.specities_id_specity_seq OWNER TO postgres;

--
-- TOC entry 4900 (class 0 OID 0)
-- Dependencies: 225
-- Name: specities_id_specity_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.specities_id_specity_seq OWNED BY public.specialties.id_speciality;


--
-- TOC entry 4715 (class 2604 OID 41106)
-- Name: appointments id_appointment; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments ALTER COLUMN id_appointment SET DEFAULT nextval('public.appointments_id_appointment_seq'::regclass);


--
-- TOC entry 4714 (class 2604 OID 41060)
-- Name: doctors id_doctor; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctors ALTER COLUMN id_doctor SET DEFAULT nextval('public.doctors_id_doctor_seq'::regclass);


--
-- TOC entry 4712 (class 2604 OID 41081)
-- Name: payments id_payment; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments ALTER COLUMN id_payment SET DEFAULT nextval('public.payments_id_payment_seq'::regclass);


--
-- TOC entry 4713 (class 2604 OID 41089)
-- Name: services id_service; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services ALTER COLUMN id_service SET DEFAULT nextval('public.services_id_serice_seq'::regclass);


--
-- TOC entry 4716 (class 2604 OID 41158)
-- Name: specialties id_speciality; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.specialties ALTER COLUMN id_speciality SET DEFAULT nextval('public.specities_id_specity_seq'::regclass);


--
-- TOC entry 4887 (class 0 OID 41102)
-- Dependencies: 222
-- Data for Name: appointments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.appointments (id_appointment, date_appointment, id_patient, id_doctor, id_service, id_payment) FROM stdin;
1	2020-03-03 02:28:55	38	1	31	\N
2	2022-06-24 08:21:33	38	31	53	\N
4	2021-08-26 21:21:36	34	46	13	\N
6	2021-09-02 06:06:02	2	34	63	\N
7	2020-04-05 14:22:49	28	36	39	\N
11	2022-07-05 08:02:46	82	3	29	\N
12	2020-04-30 13:07:21	90	30	45	\N
16	2021-06-23 09:48:47	20	29	37	\N
18	2020-06-05 12:34:46	77	32	61	\N
22	2021-01-09 12:09:32	67	43	29	\N
24	2021-08-04 00:30:17	42	7	60	\N
26	2022-06-30 17:24:36	17	42	33	\N
29	2022-11-24 22:11:39	30	26	13	\N
31	2021-07-03 03:22:06	23	5	57	\N
34	2022-09-14 17:25:33	80	45	59	\N
36	2022-09-14 03:49:59	15	40	63	\N
38	2021-05-26 23:10:19	19	39	7	\N
39	2022-05-09 20:10:28	63	31	29	\N
43	2020-10-11 22:59:47	26	20	18	\N
44	2021-04-13 09:28:25	12	1	51	\N
47	2020-10-18 23:04:04	9	38	23	\N
48	2020-09-11 00:58:00	91	7	7	\N
49	2021-06-20 00:15:00	16	44	33	\N
50	2021-01-22 16:33:10	91	18	38	\N
56	2020-06-23 19:08:41	49	16	5	\N
57	2020-04-16 07:59:48	97	50	5	\N
58	2020-04-01 21:39:55	59	3	39	\N
59	2020-04-30 07:51:15	65	30	31	\N
61	2022-08-19 03:44:04	15	34	41	\N
64	2021-01-16 06:53:39	47	23	59	\N
66	2021-05-17 07:59:13	26	1	22	\N
68	2022-10-05 13:46:30	14	36	20	\N
70	2021-10-24 20:09:04	60	47	54	\N
71	2022-08-24 15:30:39	28	37	12	\N
72	2022-09-15 11:50:54	27	22	47	\N
74	2020-06-28 17:43:21	48	36	6	\N
76	2020-10-16 23:42:00	58	10	10	\N
77	2022-03-17 19:22:27	15	36	13	\N
80	2021-05-04 13:49:55	48	24	16	\N
83	2021-01-18 13:14:43	62	1	24	\N
85	2020-07-01 14:19:06	70	24	44	\N
87	2021-03-25 08:25:48	35	7	28	\N
88	2020-11-11 14:37:10	74	44	33	\N
89	2020-08-22 15:53:21	57	2	56	\N
91	2020-07-20 06:59:04	30	37	7	\N
95	2022-10-14 13:34:27	91	35	51	\N
97	2022-02-26 15:41:25	40	35	15	\N
98	2022-01-01 17:06:58	46	11	34	\N
100	2022-06-17 19:35:01	55	5	5	\N
102	2020-10-16 13:03:13	6	41	45	\N
103	2022-10-27 22:16:02	42	24	6	\N
105	2022-10-25 03:02:58	61	39	28	\N
107	2022-06-15 02:37:36	84	41	61	\N
110	2020-04-07 06:17:59	21	43	6	\N
112	2020-06-16 17:59:25	57	49	27	\N
114	2021-08-18 11:50:04	95	42	5	\N
115	2020-08-10 14:17:14	33	50	14	\N
116	2021-03-16 20:32:44	16	2	2	\N
117	2020-11-28 14:00:28	42	18	5	\N
118	2021-01-15 22:49:37	34	10	16	\N
119	2022-04-22 03:23:03	19	5	24	\N
121	2021-02-14 18:01:33	52	26	14	\N
122	2022-09-09 07:17:11	43	29	55	\N
123	2021-09-28 06:34:28	56	4	24	\N
124	2021-12-21 10:30:49	50	40	43	\N
125	2020-04-25 19:33:33	95	10	59	\N
126	2022-04-02 15:22:03	85	40	51	\N
128	2020-09-19 15:15:10	71	30	4	\N
132	2022-01-23 19:25:16	65	23	25	\N
133	2020-04-01 19:04:05	73	45	30	\N
8	2021-08-05 03:43:22	57	16	49	4
10	2021-11-16 08:20:30	90	10	1	9
13	2020-09-04 00:27:49	19	18	15	10
15	2022-03-21 19:42:10	100	13	36	11
17	2021-01-19 19:10:29	38	39	36	2
25	2020-11-26 18:29:56	45	51	40	8
30	2022-11-18 13:39:38	91	43	24	3
3	2021-02-28 21:12:19	88	9	48	51
5	2020-08-01 05:56:06	18	10	43	52
9	2022-09-26 22:21:17	70	44	25	53
14	2022-08-26 02:43:09	36	27	22	54
19	2020-01-02 09:56:13	54	32	36	55
27	2022-07-21 16:38:17	72	36	6	56
28	2020-02-12 07:00:14	26	30	36	57
32	2020-07-03 13:47:12	75	45	7	58
40	2020-08-04 13:36:32	6	15	57	59
41	2020-09-01 06:49:44	8	34	11	62
42	2021-05-24 09:58:25	97	6	36	60
46	2022-08-10 06:09:22	64	3	13	61
52	2020-07-04 14:42:44	4	13	12	64
53	2022-06-22 02:41:46	40	34	33	63
60	2022-04-18 19:42:29	28	17	23	65
62	2020-02-09 01:22:47	89	45	41	66
78	2021-10-13 14:12:30	59	7	30	69
81	2021-04-12 16:02:13	65	3	4	70
84	2021-11-20 01:05:30	66	20	7	71
92	2020-08-11 17:07:24	74	47	15	73
93	2021-12-28 17:37:26	53	31	10	72
96	2021-04-14 05:02:34	2	5	22	74
101	2021-12-31 16:27:54	74	45	63	75
104	2022-06-25 17:53:14	99	47	17	76
108	2021-05-15 04:19:57	5	40	40	77
109	2022-11-01 09:22:46	45	49	43	78
111	2021-05-20 06:28:51	3	13	12	79
136	2022-07-17 00:52:28	72	43	33	80
138	2021-07-19 14:01:04	79	4	36	\N
139	2021-12-26 11:44:15	40	46	18	\N
140	2022-08-03 08:51:29	27	28	26	\N
142	2021-07-21 01:43:37	65	50	7	\N
143	2021-12-28 20:02:03	26	37	47	\N
144	2022-10-21 10:44:39	68	17	39	\N
145	2022-07-13 07:48:30	90	2	20	\N
147	2020-12-26 03:37:20	44	39	45	\N
148	2022-01-26 11:34:49	96	7	34	\N
149	2020-02-03 13:17:37	44	26	18	\N
154	2022-10-30 06:57:56	42	37	62	\N
155	2020-12-26 12:05:42	90	46	17	\N
156	2020-02-17 01:51:04	97	11	50	\N
157	2020-10-04 19:56:58	10	24	62	\N
158	2021-07-23 20:45:04	78	44	52	\N
159	2022-05-17 18:35:35	73	23	13	\N
160	2021-10-01 04:19:54	1	38	63	\N
161	2020-04-13 22:59:24	77	46	58	\N
163	2021-07-15 11:49:52	95	37	62	\N
164	2021-02-12 00:45:36	73	30	42	\N
165	2020-11-28 18:50:42	92	49	42	\N
166	2022-10-10 20:33:33	39	48	19	\N
167	2022-02-28 23:08:01	54	49	57	\N
168	2020-05-06 23:35:35	62	6	33	\N
169	2021-09-13 08:27:46	30	44	16	\N
170	2020-12-28 09:09:43	57	3	27	\N
171	2022-12-21 09:19:05	10	20	6	\N
173	2020-03-14 16:25:04	63	33	27	\N
174	2020-06-14 19:34:51	91	35	6	\N
175	2021-02-13 10:18:43	95	39	34	\N
176	2020-11-01 01:48:23	45	21	9	\N
177	2022-01-28 23:13:28	11	30	34	\N
178	2020-03-19 00:37:50	23	12	53	\N
180	2021-06-18 07:14:28	41	23	10	\N
182	2021-08-01 18:54:41	43	15	52	\N
183	2021-01-22 23:23:04	26	24	52	\N
184	2021-11-20 13:22:39	10	33	7	\N
188	2020-07-27 22:42:27	27	33	36	\N
194	2020-09-25 22:17:56	13	18	5	\N
196	2022-04-15 02:09:57	53	19	28	\N
198	2021-03-31 11:45:47	39	5	46	\N
200	2020-02-10 06:07:39	95	20	3	\N
20	2023-09-01 09:19:12	26	48	48	\N
23	2023-08-16 03:14:29	88	47	62	\N
45	2024-07-31 18:04:51	30	17	38	\N
54	2023-02-06 19:08:31	44	48	21	\N
162	2024-03-11 03:35:25	44	21	12	\N
172	2024-09-12 08:32:40	60	31	5	\N
186	2024-06-11 14:55:50	79	42	52	\N
195	2024-06-02 19:39:45	96	43	62	\N
21	2023-07-15 01:32:29	34	12	27	1
33	2022-10-23 11:01:54	100	24	20	7
35	2023-06-29 11:18:15	23	24	9	6
37	2020-12-04 22:01:32	32	36	27	5
51	2021-04-06 07:33:36	38	49	10	13
55	2020-06-28 10:43:01	39	45	16	12
63	2020-05-14 02:33:01	67	49	40	15
65	2021-01-22 10:26:54	55	33	47	16
67	2022-07-08 22:14:28	53	14	11	14
75	2021-10-23 13:18:53	15	49	26	17
79	2022-02-21 05:21:48	6	18	30	18
82	2021-07-24 17:32:15	89	50	26	19
86	2020-07-05 19:39:54	27	33	49	20
90	2020-02-08 07:54:20	81	48	59	21
94	2020-10-27 13:28:29	27	16	51	22
99	2020-03-06 12:34:03	72	18	45	23
106	2020-02-10 21:51:59	14	41	43	24
113	2022-05-24 10:51:35	11	25	25	25
120	2022-08-21 21:48:24	1	22	8	26
127	2022-04-04 08:33:51	13	41	41	27
129	2022-10-27 07:37:40	41	44	27	30
130	2020-06-11 18:55:48	10	17	52	28
131	2021-06-23 13:23:43	50	32	2	29
134	2020-07-16 07:24:04	14	25	46	32
135	2021-02-05 21:09:17	38	44	24	33
137	2021-12-14 07:42:32	48	31	28	31
141	2021-06-26 18:09:10	16	30	11	34
146	2021-10-12 21:40:18	39	5	38	35
150	2021-09-06 21:25:08	2	28	39	36
151	2020-06-20 11:07:05	92	1	2	39
152	2022-07-03 21:51:01	31	13	62	37
153	2020-01-20 04:25:25	40	12	31	38
179	2021-11-03 16:16:35	71	7	2	40
181	2021-08-30 13:26:47	59	32	54	41
185	2022-12-04 14:50:24	49	22	33	42
187	2021-07-06 20:39:24	100	21	35	43
189	2020-05-26 16:39:43	24	11	20	48
190	2021-02-14 12:00:45	88	48	10	47
191	2021-03-08 14:18:48	29	14	39	44
192	2022-03-09 02:25:07	50	4	48	45
193	2020-09-28 22:24:03	84	30	34	46
197	2022-10-02 21:55:00	53	26	14	49
199	2022-02-12 14:56:13	42	13	16	50
69	2023-01-28 20:28:37	57	37	4	67
73	2024-01-09 13:17:19	52	25	59	68
\.


--
-- TOC entry 4883 (class 0 OID 32840)
-- Dependencies: 218
-- Data for Name: doctors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.doctors (fullname, salary, phone, id_doctor, id_speciality) FROM stdin;
Brianna Mouat	197045.61	+86 (331) 341-9928	1	2
Nanice Tackley	115286.01	+7 (334) 576-4895	2	5
Courtnay Bowdrey	57435.55	+63 (726) 925-1351	3	27
Tadd Hierro	142456.95	+55 (527) 992-8961	4	26
Carly Voak	177242.51	+60 (545) 119-2353	5	21
Iorgo Featherston	161864.73	+86 (365) 259-6087	6	22
Cass Riediger	193760.85	+598 (478) 605-8096	7	1
Kalinda Polin	191682.44	+970 (848) 252-2314	8	3
Winifred MacDunleavy	173109.39	+55 (225) 838-9601	9	4
Eunice Scothorne	127510.89	+58 (856) 379-9353	10	6
Dehlia Keppie	158177.1	+353 (629) 324-9857	11	7
Tabbie O'Monahan	129820.75	+81 (482) 457-8468	12	29
Theodoric Charlon	179093.84	+55 (965) 442-2337	13	30
Shepard O'Heneghan	56184.85	+351 (104) 557-2279	14	2
Felice Gianotti	61805.69	+86 (691) 494-4343	15	17
Louise Winram	182395.26	+86 (659) 723-4940	16	11
Cacilia McClifferty	79426.61	+264 (271) 161-9146	17	12
Pen Augustine	155818.3	+62 (952) 324-4731	18	16
Toddy Neild	69927.8	+86 (220) 549-4521	19	13
Edi Neve	159224.69	+420 (208) 241-2729	20	19
Tabbie Cogdell	115645.77	+1 (816) 680-3428	21	18
Wyatan Tregido	185875.48	+51 (170) 292-4861	22	27
Mandy Patershall	165515.78	+86 (382) 850-2992	23	23
Nannie Corre	124453.81	+380 (870) 203-8551	24	20
Lois Gloyens	67162.31	+51 (976) 506-5580	25	10
Sollie Skyner	143923.78	+998 (147) 670-3252	26	8
Jonie Biddles	95079.31	+62 (882) 484-5900	27	9
Taffy Butterfint	88342.77	+385 (130) 549-9162	28	17
Cullen Frances	103051.72	+7 (101) 688-3895	29	19
Ted Applegate	69319.43	+55 (957) 154-0816	30	22
Andras Clutram	183142.53	+48 (522) 941-0717	31	26
Claudius Aleksandrov	51992.07	+86 (513) 240-5892	32	23
Virginie Beadham	119289.5	+86 (576) 387-3330	33	24
Rona Rawcliff	160480.64	+351 (612) 166-2311	34	27
Barbra Shackleton	142360.23	+62 (997) 406-7571	35	15
Lorianna Delafoy	70063.15	+62 (825) 388-4367	36	25
Laureen Maccaddie	147737.81	+7 (485) 813-7762	37	19
Toby Sherbrooke	173779.31	+86 (405) 302-5614	38	20
Nert Stapley	190919.56	+86 (815) 215-0863	39	3
Henderson Ducker	181502.51	+86 (129) 352-1855	40	30
Aubree Conti	129936.3	+86 (664) 769-1506	41	23
Kingston Toun	72043.75	+86 (975) 356-2914	42	14
Merle Rake	129038.63	+51 (209) 756-2992	43	9
Sarina Elvidge	53955.06	+86 (299) 774-2849	44	5
Clarisse Baroc	84071.23	+33 (213) 362-8316	45	13
Keefer Shickle	195562.56	+212 (746) 182-2902	46	3
Lorita Kohneke	98353.5	+220 (923) 241-3959	47	21
Tabbatha Rapo	61174.54	+1 (916) 298-6661	48	16
Charles Spincke	150345.39	+972 (321) 592-4750	49	15
Dulcinea Wylie	79153.94	+46 (225) 868-4879	50	27
\.


--
-- TOC entry 4880 (class 0 OID 32812)
-- Dependencies: 215
-- Data for Name: patients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.patients (id_patient, date_of_birthday, history_of_visiting, fullname, policy) FROM stdin;
1	1991-10-13	Туберкулез	Ivar Covely	5304859399513863
2	1912-02-14	Здоров	Ferrel Springtorpe	3496270095841921
3	1958-04-01	Анемия	Vivien Cerith	6063958395856105
4	1992-09-08	Инфаркт миокарда	Linnet Skinner	7757871579124546
5	1973-10-18	Дислексия	Ruthi Camerati	3616508414895061
6	1966-09-24	Рак груди	Duke Aven	6529778476619494
7	2013-12-13	Здоров	Oberon Wooles	9808328081383851
8	1970-08-24	Рак груди	Harriet Balsdone	5209040067424549
9	1922-10-24	Лейкемия	Dorise Kubicka	1082098839765458
10	1990-04-19	Здоров	Chere Cordova	1230877809938628
11	1924-11-05	Синдром беспокойных ног	Julia Monketon	8691960148534005
12	1920-03-19	Подагра	Caddric Flook	6799597814535792
13	1989-03-10	Сердечная недостаточность	Jorry Tarren	2884031307815281
14	1996-08-23	Грыжа межпозвоночного диска	Thom Bartaletti	8400356312470381
15	1971-12-15	Артрит	Merralee Latan	7440168659470515
16	1907-07-10	Гипертиреоз	Tye Limbrick	9959235305507457
17	1948-05-26	Кифоз	Olav Kisbey	9911141544852258
18	2003-05-29	Рак легкого	Cazzie Greenshields	5885320885382688
19	1937-07-25	Язва желудка	Armstrong Lawrenz	1761889769895667
20	1980-12-23	Диарея	Aguie Aireton	9225595515689477
21	1990-04-09	Ожирение	Rozelle MacComiskey	3779883554680982
22	1949-06-23	Хронический панкреатит	Minda Mulhall	5353788216407119
23	1904-04-13	Бактериальный вагиноз	Arabella Gerritsma	6970357084183978
24	1993-07-13	Здоров	Jewel Scamerden	8562359331021191
25	1934-07-01	Ишемическая болезнь сердца	Johannes Schoolfield	2368189752503374
26	1997-07-29	Здоров	Dorotea Hindmore	1112688190766933
27	1917-10-13	Отит	Eachelle Coule	2470858127799178
28	1930-08-07	Синдром Туретта	Jere Garie	1599001017639132
29	1985-10-23	Здоров	Willie Arlt	5377184958677667
30	1992-01-11	Грыжа межпозвоночного диска	Rhianna Capinetti	2154014498019276
31	1988-02-14	Варикозное расширение вен	Bartholomew Steers	8921052556470502
32	1972-08-14	Здоров	Clifford Molan	6611168408600340
33	1965-08-01	Здоров	Bentlee Medway	3669534832710076
34	1993-04-06	Гипогликемия	Wilhelmine Learoyde	1765933215217456
35	1964-01-07	Здоров	Amelina Potteril	1882618712850959
36	1930-02-28	Здоров	Bendick Tilney	6784966756642535
37	1964-08-29	Нейропатия	Milli Jee	1079243694799663
38	1995-05-02	Аллергия на пыльцу (поллиноз)	Maryjo Trevenu	5669891479023759
39	1920-10-07	Рассеянный склероз	Tiphany Crich	1785494740800071
40	1908-12-03	Синдром беспокойных ног	Leila Wanjek	1474106811876812
41	2014-03-08	Синдром беспокойных ног	Jennica Tripcony	1447815756872622
42	1967-09-29	Сердечные шумы	Thea D'Aeth	9363172210653668
43	1919-06-15	Инфаркт миокарда	Saunderson De Freyne	5611642389291172
44	1964-04-16	Здоров	Dani Strippel	9801786154252851
45	1917-06-13	Аневризма аорты	Gun Veldman	8165299459195206
46	2006-05-30	Ишемическая болезнь сердца	Steffane Giovani	4478684928169445
47	1929-05-08	Здоров	Whit Nutbean	9376766544675810
48	1936-03-25	Здоров	Minni Dunsford	2752646677051043
49	1914-04-15	Обсессивно-компульсивное расстройство	Annora Barlass	3548831930181864
50	1989-06-12	Гонорея	Burgess Heugh	6642900146503822
51	2009-10-22	Артрит	Lisetta Beardsall	3124243569205011
52	1983-03-19	Здоров	Ruby Mewett	6736308502677409
53	1954-02-24	Здоров	Candy Forlong	1289112195477543
54	1923-04-10	Эмболия легочной артерии	Vilma Lenahan	1806010760557924
55	1929-01-01	Здоров	Vi Devote	9642864182584857
56	1941-12-28	Здоров	Kandace Pirkis	8152562158282516
57	2003-06-08	Здоров	Alexina Jefferson	5206362808139839
58	1984-04-07	Диарея	Violet Trever	4446892041026096
59	1905-03-20	Подагра	Chris Hemphall	3268819920550131
60	1988-11-20	Аллергия на пыльцу (поллиноз)	Otha Andreia	4248935716571382
61	1930-03-21	Аллергический ринит	Shandeigh Cutting	1660783561898481
62	1915-01-20	Ишемическая болезнь сердца	Laurena Arber	1978037076173587
63	1924-12-26	Аллергический ринит	Anny Lardez	9091695068724139
64	1926-02-20	Здоров	Martita Skelhorne	7435204665667611
65	1978-01-30	Здоров	Nalani Llopis	5804444856170261
66	1906-08-09	Здоров	Rosemary Stockdale	2003452284847873
67	1969-07-05	Сахарный диабет с осложнениями (например: диабетическая ретинопатия)	Tawnya Reims	8914116108480032
68	1954-03-19	Здоров	Anatola FitzAlan	2074433913626363
69	1993-08-13	Отит	Shayna Watmore	7316005162207812
70	1909-04-02	Бактериальный вагиноз	Courtenay Rops	7586067957444758
71	1906-03-23	Здоров	Kennedy Braysher	2617563298849978
72	1904-08-29	Невралгия тройничного нерва	Miguel Uc	1451997691718555
73	2012-08-29	Депрессия	Howie Hume	4865134142857105
74	1960-08-22	Инсульт	Carlye Scandrett	1376918760017769
75	2006-11-10	Бронхит	Luciano Raleston	4156882146583419
76	1918-05-14	Катаракта.	Rivi Ogdahl	9327345704209953
77	1907-12-26	Невралгия тройничного нерва	Guthrie Willox	6275462041057700
78	1917-12-02	Здоров	Roseann Henmarsh	5264642966817420
79	1986-04-16	Здоров	Chloris Lanigan	7518492005445574
80	1950-02-14	Здоров	Ginger Greenwell	6075532103309582
81	1998-01-01	Здоров	Jone Gough	7225558863688602
82	1937-01-16	Сифилис	Heidie Silbermann	9626625429498696
83	1939-08-29	Гипотиреоз	Violetta Robroe	7824712220185849
84	1947-04-05	Псориаз	Brena Ismail	8153417159605208
85	1934-02-17	Здоров	Coralyn Vickerstaff	4382219405038474
86	1932-11-21	Рак легкого	Anthe Balsdon	9585457388490772
87	1958-10-08	Экзема	Geri Reddecliffe	6967583394384954
88	2016-07-12	Здоров	Bibbye Dix	6125650172993401
89	1975-08-18	Грипп	Stacie Sandars	9318607060669222
90	1917-09-28	Кератит (воспаление роговицы)	Yvon Plaister	7917755248853668
91	1977-06-05	Здоров	Melany Putley	5037571377883791
92	1981-01-29	Сердечная недостаточность	Curt Lumsdall	2048723448710132
93	1939-01-01	Здоров	Sal Clelland	7308127152996865
94	1975-06-16	Подагра	Jacques Saleway	7735865045442867
95	1942-11-22	Грипп	Henry Corcut	3062975197028425
96	1993-08-05	Сифилис	Concordia O'Hartagan	5086358911076480
97	1953-06-14	Рак груди	Deedee Slocumb	8368099017981961
98	1925-10-13	Простатит	Deina Lundon	7901299758198036
99	1929-04-15	Альцгеймер (болезнь Альцгеймера)	Corissa Sheahan	7056360132396964
100	1952-09-17	Импотенция	Butch Swinerd	6953495330364443
\.


--
-- TOC entry 4881 (class 0 OID 32826)
-- Dependencies: 216
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payments (payment_method, id_payment) FROM stdin;
credit card	1
credit card	2
PayPal	3
PayPal	4
debit card	5
PayPal	6
debit card	7
debit card	8
PayPal	9
credit card	10
credit card	11
debit card	12
debit card	13
debit card	14
credit card	15
debit card	16
PayPal	17
debit card	18
debit card	19
PayPal	20
credit card	21
credit card	22
credit card	23
PayPal	24
credit card	25
credit card	26
PayPal	27
credit card	28
credit card	29
debit card	30
PayPal	31
credit card	32
PayPal	33
debit card	34
debit card	35
PayPal	36
PayPal	37
debit card	38
debit card	39
debit card	40
PayPal	41
PayPal	42
credit card	43
debit card	44
debit card	45
debit card	46
PayPal	47
PayPal	48
debit card	49
debit card	50
credit card	51
credit card	52
credit card	53
PayPal	54
credit card	55
PayPal	56
debit card	57
debit card	58
debit card	59
debit card	60
credit card	61
PayPal	62
PayPal	63
PayPal	64
PayPal	65
credit card	66
credit card	67
debit card	68
PayPal	69
credit card	70
PayPal	71
debit card	72
credit card	73
credit card	74
credit card	75
debit card	76
debit card	77
PayPal	78
debit card	79
PayPal	80
\.


--
-- TOC entry 4882 (class 0 OID 32833)
-- Dependencies: 217
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.services (service, description, price, id_service) FROM stdin;
Консультации терапевта	Консультации терапевта — первичный осмотр и диагностика заболеваний	36123.49	1
консультации узких специалистов	Консультации узких специалистов — специализированная помощь в конкретной области медицины	44297.98	2
диагностика заболеваний	Диагностика заболеваний — использование методов для выявления болезней	82372.2	3
лабораторные анализы	Лабораторные анализы — исследование биологических образцов для диагностики	7979.32	4
рентгенография	Рентгенография — визуализация внутренних структур с помощью рентгеновских лучей	84626.65	5
УЗИ-диагностика	УЗИ-диагностика — использование ультразвука для исследования органов	35111.12	6
магнитно-резонансная томография (МРТ)	Магнитно-резонансная томография (МРТ) — детальное изображение тканей с помощью магнитных полей	22694.08	7
компьютерная томография (КТ)	Компьютерная томография (КТ) — послойная визуализация органов с использованием рентгеновских лучей	92460.81	8
физиотерапия	Физиотерапия — лечение с помощью физических методов	84892.84	9
массаж	Массаж — мануальная терапия для расслабления и улучшения кровообращения	15983.99	10
мануальная терапия	Мануальная терапия — коррекция позвоночника и суставов руками	75645.49	11
реабилитация после травм	Реабилитация после травм — восстановление функций после травм или операций	32151.71	12
вакцинация	Вакцинация — профилактическое введение вакцин для защиты от инфекций	1295.54	13
профилактические осмотры	Профилактические осмотры — регулярные проверки здоровья для раннего выявления заболеваний	78111.33	14
онкологический скрининг	Онкологический скрининг — тестирование на наличие рака на ранних стадиях	90320.73	15
кардиологические исследования	Кардиологические исследования — диагностика сердечно-сосудистых заболеваний	75311.61	16
эндокринологические исследования	Эндокринологические исследования — оценка работы гормональной системы	78969.53	17
гастроэнтерологические обследования	Гастроэнтерологические обследования — диагностика заболеваний пищеварительной системы	25713.36	18
дерматологические консультации	Дерматологические консультации — лечение кожных заболеваний и проблем	20526.14	19
аллергологические тесты	Аллергологические тесты — выявление аллергенов и аллергических реакций	35186	20
психотерапия	Психотерапия — помощь в решении психологических проблем через разговор	75463.15	21
психиатрическая помощь	Психиатрическая помощь — диагностика и лечение психических расстройств	73294.29	22
стоматологические услуги	Стоматологические услуги — уход за зубами и полостью рта	87953.9	23
хирургические вмешательства	Хирургические вмешательства — операции для лечения заболеваний или травм	19506.87	24
анестезия и анестезиология	Анестезия и анестезиология — обеспечение безболезненности во время операций	88385.57	25
лабораторная диагностика инфекционных заболеваний	Лабораторная диагностика инфекционных заболеваний — анализы для выявления инфекций	29784.28	26
генетическое тестирование	Генетическое тестирование — исследование ДНК для выявления наследственных заболеваний	76051.55	27
уход за беременными	Уход за беременными — медицинское сопровождение на протяжении беременности	51726.17	28
родовспоможение	Родовспоможение — помощь при родах и послеродовой уход	60816.3	29
неонатальный уход	Неонатальный уход — забота о новорожденных в первые дни жизни	30896.61	30
педиатрические услуги	Педиатрические услуги — медицинская помощь детям и подросткам	25851.41	31
гинекологические осмотры	Гинекологические осмотры — здоровье женской репродуктивной системы	17107.68	32
урологические исследования	Урологические исследования — диагностика заболеваний мочеполовой системы	31111	33
ортопедические консультации	Ортопедические консультации — лечение заболеваний опорно-двигательного аппарата	18947.5	34
травматология	Травматология — лечение травм и их последствий	23261.04	35
офтальмология	Офтальмология — диагностика и лечение заболеваний глаз	43412.62	36
отоларингология	Отоларингология — лечение заболеваний уха/горла и носа	15036.94	37
неврология	Неврология — диагностика и лечение заболеваний нервной системы	77150.35	38
терапия болевого синдрома	Терапия болевого синдрома — управление и лечение хронической боли	70530.14	39
кардиология	Кардиология — изучение и лечение сердечно-сосудистых заболеваний	58830.75	40
сосудистая хирургия	Сосудистая хирургия — операции на сосудах для лечения различных заболеваний	7685.93	41
дерматоскопия	Дерматоскопия — исследование кожи с помощью специального прибора для ранней диагностики рака кожи	81511.56	42
рефлексотерапия	Рефлексотерапия — воздействие на точки тела для улучшения здоровья	22911.15	43
диетология и нутрициология	Диетология и нутрициология — составление индивидуальных планов питания для здоровья	34999.6	44
спортивная медицина	Спортивная медицина — лечение и профилактика травм у спортсменов	25928.97	45
косметология и дерматология	Косметология и дерматология — уход за кожей и эстетические процедуры	78905.65	46
лазерная терапия	Лазерная терапия — использование лазера для лечения различных заболеваний кожи и тканей	31658.86	47
лечение хронических заболеваний	Лечение хронических заболеваний — долгосрочное управление состояниями (диабет или астма)	22862.81	48
медицинская реабилитация	Медицинская реабилитация — восстановление после серьезных заболеваний или операций	29535.73	49
паллиативная помощь	Паллиативная помощь — поддержка пациентов с неизлечимыми заболеваниями для улучшения качества жизни	35769.26	50
медицинские осмотры для водителей и работников	Медицинские осмотры для водителей и работников — проверка здоровья для получения лицензий или допуска к работе	89458.18	51
освидетельствование на трудоспособность	Освидетельствование на трудоспособность — оценка состояния здоровья для определения способности к работе	33737.58	52
консультации по здоровому образу жизни	Консультации по здоровому образу жизни — рекомендации по питанию/физической активности и психическому здоровью	49364.86	53
программы по снижению веса	Программы по снижению веса — индивидуальные планы для достижения здорового веса	44758.38	54
лечение зависимостей	Лечение зависимостей — помощь в преодолении зависимостей от веществ или поведения	90648.24	55
поддержка при диабете	Поддержка при диабете — управление состоянием и профилактика осложнений при диабете	70029.79	56
лечение астмы и аллергий	Лечение астмы и аллергий — контроль симптомов и предотвращение обострений заболеваний дыхательной системы	11245.44	57
ведение пациентов с сердечно-сосудистыми заболеваниями	Ведение пациентов с сердечно-сосудистыми заболеваниями — комплексный подход к лечению и профилактике сердечно-сосудистых проблем	36184.11	58
остеопатия	Остеопатия — мануальная терапия для улучшения общего состояния здоровья через работу с мышцами и суставами	96583.44	59
диагностика и лечение инфекционных заболеваний	Диагностика и лечение инфекционных заболеваний — выявление и терапия инфекций различной этиологии	21431.28	60
детоксикационные программы	Детоксикационные программы — очищение организма от токсинов для улучшения здоровья	92995.95	61
помощь в подготовке к операциям	Помощь в подготовке к операциям — консультации по предоперационным обследованиям и рекомендациям	99824.91	62
постоперационный уход и наблюдение.	Постоперационный уход и наблюдение — контроль за состоянием пациента после хирургического вмешательства	72234.99	63
\.


--
-- TOC entry 4889 (class 0 OID 41154)
-- Dependencies: 224
-- Data for Name: specialties; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.specialties (id_speciality, speciality) FROM stdin;
1	Терапевт
2	Хирург
3	Педиатр
4	Кардиолог
5	Невролог
6	Офтальмолог
7	Отоларинголог
8	Дерматолог
9	Гинеколог
10	Уролог
11	Психиатр
12	Анестезиолог
13	Рентгенолог
14	Онколог
15	Эндокринолог
16	Нарколог
17	Реаниматолог
18	Инфекционист
19	Травматолог
20	Аллерголог
21	Стоматолог
22	Хирург-ортопед
23	Физиотерапевт
24	Генетик
25	Лабораторный врач
26	Спортивный врач
27	Врач общей практики
28	Врач-эксперт
29	Врач-эпидемиолог
30	Врач-психотерапевт
\.


--
-- TOC entry 4901 (class 0 OID 0)
-- Dependencies: 223
-- Name: appointments_id_appointment_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.appointments_id_appointment_seq', 200, true);


--
-- TOC entry 4902 (class 0 OID 0)
-- Dependencies: 219
-- Name: doctors_id_doctor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.doctors_id_doctor_seq', 87, true);


--
-- TOC entry 4903 (class 0 OID 0)
-- Dependencies: 220
-- Name: payments_id_payment_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payments_id_payment_seq', 1, false);


--
-- TOC entry 4904 (class 0 OID 0)
-- Dependencies: 221
-- Name: services_id_serice_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.services_id_serice_seq', 63, true);


--
-- TOC entry 4905 (class 0 OID 0)
-- Dependencies: 225
-- Name: specities_id_specity_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.specities_id_specity_seq', 1, false);


--
-- TOC entry 4729 (class 2606 OID 41138)
-- Name: appointments appointments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_pkey PRIMARY KEY (id_appointment);


--
-- TOC entry 4727 (class 2606 OID 41126)
-- Name: doctors doctors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctors
    ADD CONSTRAINT doctors_pkey PRIMARY KEY (id_doctor);


--
-- TOC entry 4719 (class 2606 OID 32818)
-- Name: patients patiens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patients
    ADD CONSTRAINT patiens_pkey PRIMARY KEY (id_patient);


--
-- TOC entry 4723 (class 2606 OID 41175)
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (id_payment);


--
-- TOC entry 4721 (class 2606 OID 41152)
-- Name: patients policy_uniq ; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patients
    ADD CONSTRAINT "policy_uniq " UNIQUE (policy);


--
-- TOC entry 4717 (class 2606 OID 41173)
-- Name: doctors salary_check; Type: CHECK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE public.doctors
    ADD CONSTRAINT salary_check CHECK ((salary > (0)::double precision)) NOT VALID;


--
-- TOC entry 4725 (class 2606 OID 41145)
-- Name: services services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (id_service);


--
-- TOC entry 4731 (class 2606 OID 41163)
-- Name: specialties specities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.specialties
    ADD CONSTRAINT specities_pkey PRIMARY KEY (id_speciality);


--
-- TOC entry 4733 (class 2606 OID 41127)
-- Name: appointments id_doctor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT id_doctor_fkey FOREIGN KEY (id_doctor) REFERENCES public.doctors(id_doctor) NOT VALID;


--
-- TOC entry 4734 (class 2606 OID 41132)
-- Name: appointments id_patient_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT id_patient_fkey FOREIGN KEY (id_patient) REFERENCES public.patients(id_patient) NOT VALID;


--
-- TOC entry 4735 (class 2606 OID 41176)
-- Name: appointments id_payment_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT id_payment_fkey FOREIGN KEY (id_payment) REFERENCES public.payments(id_payment) NOT VALID;


--
-- TOC entry 4736 (class 2606 OID 41146)
-- Name: appointments id_service_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT id_service_fkey FOREIGN KEY (id_service) REFERENCES public.services(id_service) NOT VALID;


--
-- TOC entry 4732 (class 2606 OID 41164)
-- Name: doctors id_specity_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctors
    ADD CONSTRAINT id_specity_fkey FOREIGN KEY (id_speciality) REFERENCES public.specialties(id_speciality) NOT VALID;


-- Completed on 2024-12-13 21:11:23

--
-- PostgreSQL database dump complete
--

