--
-- PostgreSQL database dump
--

-- Dumped from database version 14.12 (Ubuntu 14.12-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.12 (Ubuntu 14.12-0ubuntu0.22.04.1)

-- Started on 2024-07-29 12:06:33 +0530

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
-- TOC entry 213 (class 1259 OID 32793)
-- Name: Shipments; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."Shipments" (
    sid integer NOT NULL,
    "senderUid" integer NOT NULL,
    recipient_name text NOT NULL,
    recipient_address text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    status text NOT NULL
);


ALTER TABLE public."Shipments" OWNER TO admin;

--
-- TOC entry 212 (class 1259 OID 32792)
-- Name: Shipments_sid_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public."Shipments_sid_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Shipments_sid_seq" OWNER TO admin;

--
-- TOC entry 3505 (class 0 OID 0)
-- Dependencies: 212
-- Name: Shipments_sid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public."Shipments_sid_seq" OWNED BY public."Shipments".sid;


--
-- TOC entry 211 (class 1259 OID 32784)
-- Name: User; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."User" (
    uid integer NOT NULL,
    email text NOT NULL,
    fname text NOT NULL,
    lname text,
    password character varying(60) NOT NULL,
    "privilegeLevel" integer NOT NULL,
    "refreshToken" text,
    address text DEFAULT ''::text NOT NULL
);


ALTER TABLE public."User" OWNER TO admin;

--
-- TOC entry 210 (class 1259 OID 32783)
-- Name: User_uid_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public."User_uid_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."User_uid_seq" OWNER TO admin;

--
-- TOC entry 3506 (class 0 OID 0)
-- Dependencies: 210
-- Name: User_uid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public."User_uid_seq" OWNED BY public."User".uid;


--
-- TOC entry 209 (class 1259 OID 32772)
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public._prisma_migrations OWNER TO admin;

--
-- TOC entry 3344 (class 2604 OID 32796)
-- Name: Shipments sid; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."Shipments" ALTER COLUMN sid SET DEFAULT nextval('public."Shipments_sid_seq"'::regclass);


--
-- TOC entry 3342 (class 2604 OID 32787)
-- Name: User uid; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."User" ALTER COLUMN uid SET DEFAULT nextval('public."User_uid_seq"'::regclass);


--
-- TOC entry 3499 (class 0 OID 32793)
-- Dependencies: 213
-- Data for Name: Shipments; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public."Shipments" (sid, "senderUid", recipient_name, recipient_address, "createdAt", "updatedAt", status) FROM stdin;
3	6	Samarasighe Gmage	185B, RAJAPIHILLA MW, KANDY	2024-07-27 05:38:16.762	2024-07-28 11:53:11.935	Delivered
4	6	Kevin D	42/2, WATAMAWATHA ROAD, NAWINNA, MAHARAGAMA	2024-07-27 05:38:26.522	2024-07-28 11:58:45.453	Delivered
6	6	Ryan S	NO 29 "DUMIDU SEVANA", DEVI ROAD, WATAPULUWA, KANDY.	2024-07-27 05:38:59.052	2024-07-28 11:58:51.701	Delivered
7	6	Anuththara Fernando	425/15, HAVELOCK ROAD, COLOMBO 06.	2024-07-27 07:21:12.228	2024-07-28 12:25:54.036	Delivered
8	6	Saman	YALEGAMA, MIRISWATTE ROAD, GONAGALA, INDURUWA	2024-07-27 07:21:51.615	2024-07-28 11:18:44.168	Pending
10	6	Priyasiri	WERAHERAWATTA,MEEPE,HABARADUWA,GALLE.	2024-07-27 15:15:54.06	2024-07-28 11:26:56.496	Delivered
11	6	Kevin F	PALAGITURAI, KOCHCHIKADE, NEGOMBO.	2024-07-27 15:18:29.091	2024-07-28 11:58:59.048	Delivering
13	6	Sheron perera	435,R.A DE MEL MAWATHA,COLOMBO 03	2024-07-28 06:23:36.281	2024-07-28 14:38:51.652	Delivered
29	4	Lal Perera	102A, KIRULAPONE AVENUE, BASELINE ROAD, COLOMBO 05.	2024-07-29 04:29:27.867	2024-07-29 04:29:27.867	Pending
2	6	Senarath Fernando	4C/8 FIRST STAGE, MIHINDU MAWATHA, ANURADHAPURA	2024-07-27 05:37:27.265	2024-07-29 05:34:01.073	Processing
26	6	Kamala	MULANAGODA ROAD, ANGUNUKOLAPELASSA.	2024-07-28 07:06:24.426	2024-07-28 07:06:24.426	Pending
30	14	Kevin Perera	426, MAIN STREET, NEGAMBO	2024-07-29 06:26:33.831	2024-07-29 06:26:33.831	Pending
\.


--
-- TOC entry 3497 (class 0 OID 32784)
-- Dependencies: 211
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public."User" (uid, email, fname, lname, password, "privilegeLevel", "refreshToken", address) FROM stdin;
15	kevin@csa.com	Kevin	Silva	$2b$10$hFAvtb4LskrsgdpvWqfKxeiMTl4RwfGZL.QTOkuB0UW50YMiUK89y	0	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOjE1LCJwcml2aWxlZ2VMZXZlbCI6MCwiaWF0IjoxNzIyMTU3MjY3fQ.GnvAhLCF9n19GLzzT8cBFcdWuJ3WU3K-Qc91BD1-wqk	90/15(90/13A), BILYMORIA MAWATHA, IHALA INDEBEDDA, MORATUWA
4	amaya@csa.com	Amaya	Fernando	$2b$10$H0dekcrR63.ZJ6MTUPxzz.gpXE46yWnBdTF5Dpmj7cT5psZY2ZvWa	0	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOjQsInByaXZpbGVnZUxldmVsIjowLCJpYXQiOjE3MjIyMjczMzMsImV4cCI6MTcyNDgxOTMzM30.unawYHTyrO23Um97fVWIumgO5xU-1XH6_kCYtXwoZzo	351, ABIMANGAMA ROAD, KUMBALGAMA, WELIGAMA
6	admin@csa.com	Admin	Admin	$2b$10$ZZFQ8pQ81bx6c9rPf8p.IO5Hd/aw6rjmBg73Gu1jLmhHVHC.1rYm.	1	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOjYsInByaXZpbGVnZUxldmVsIjoxLCJpYXQiOjE3MjIyMzEwMjIsImV4cCI6MTcyNDgyMzAyMn0._3VkbfXRb639BN7PSeugdO8-BaBHuOkZCq5BXide3hc	"WASALA" , MULLE WATTA, ELLA GAMA, DIYATALAWA
14	tharusha@csa.com	Tharusha	Jayasooriya	$2b$10$8U36Ta.cy75f61peSIGHM.cn.0lIZEyyqVNDn.t/6B/HZs.zFo1Jq	0	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOjE0LCJwcml2aWxlZ2VMZXZlbCI6MCwiaWF0IjoxNzIyMjM0MzA0LCJleHAiOjE3MjQ4MjYzMDR9.CyMEyy3EUhRnWISI190pCU4AquDozvq1CsrgYiz8ojc	"THAMBARAVILA",NO.44/5,5TH LANE,NAWALA ROAD,RAJAGIRIYA
\.


--
-- TOC entry 3495 (class 0 OID 32772)
-- Dependencies: 209
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
618dde17-88bf-4954-a822-fd9c32cb952d	d0275f8293c0847dca7829ae6159f3f89f8641b36f46171b7da64896dcc95a62	2024-07-26 16:06:47.601395+05:30	20240726103647_initial	\N	\N	2024-07-26 16:06:47.251767+05:30	1
73213c8f-5dd3-4a48-8205-484384b6d88b	c81c7411380a3cce6ef374732143da218a86cde42fa6ffdb93c1664c70c93b81	2024-07-26 16:50:01.110357+05:30	20240726112000_implementing_hashed_passwords	\N	\N	2024-07-26 16:50:00.849858+05:30	1
eaec8643-4581-4af9-a9ae-e98c5f665a10	80e88563e1bce2ab4b91d5a7e354f1e6664951af02e1c55f600765dc6c576619	2024-07-26 20:35:21.561543+05:30	20240726150521_refresh_tokens_for_users	\N	\N	2024-07-26 20:35:21.514652+05:30	1
c51e9fef-5fba-4e7d-a945-0fe9f60844df	2f07450bd11f3642b202573289565034f52b00928ee01a43b794aee996d377e9	2024-07-27 21:47:46.999534+05:30	20240727161746_tracking_numbers_to_shipments	\N	\N	2024-07-27 21:47:46.940057+05:30	1
794e2af6-446a-4638-9a41-30eed1af12ec	66612a1458fc64957cbe7a6f9f22a3fdf8fd46c9e21b8b0c9b8e8823d1451afd	2024-07-27 21:53:04.601497+05:30	20240727162304_	\N	\N	2024-07-27 21:53:04.487132+05:30	1
0332e0e2-e075-4746-94d3-5373a20f04af	2034f56319ad82944473e2fa73607665663179c785e92846d41a26140593e8a9	2024-07-28 14:26:41.600068+05:30	20240728085641_user_addresses	\N	\N	2024-07-28 14:26:41.482032+05:30	1
\.


--
-- TOC entry 3507 (class 0 OID 0)
-- Dependencies: 212
-- Name: Shipments_sid_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public."Shipments_sid_seq"', 30, true);


--
-- TOC entry 3508 (class 0 OID 0)
-- Dependencies: 210
-- Name: User_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public."User_uid_seq"', 15, true);


--
-- TOC entry 3353 (class 2606 OID 32801)
-- Name: Shipments Shipments_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."Shipments"
    ADD CONSTRAINT "Shipments_pkey" PRIMARY KEY (sid);


--
-- TOC entry 3350 (class 2606 OID 32791)
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (uid);


--
-- TOC entry 3347 (class 2606 OID 32780)
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 3354 (class 1259 OID 32804)
-- Name: Shipments_sid_key; Type: INDEX; Schema: public; Owner: admin
--

CREATE UNIQUE INDEX "Shipments_sid_key" ON public."Shipments" USING btree (sid);


--
-- TOC entry 3348 (class 1259 OID 32803)
-- Name: User_email_key; Type: INDEX; Schema: public; Owner: admin
--

CREATE UNIQUE INDEX "User_email_key" ON public."User" USING btree (email);


--
-- TOC entry 3351 (class 1259 OID 32802)
-- Name: User_uid_key; Type: INDEX; Schema: public; Owner: admin
--

CREATE UNIQUE INDEX "User_uid_key" ON public."User" USING btree (uid);


--
-- TOC entry 3355 (class 2606 OID 32805)
-- Name: Shipments Shipments_senderUid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."Shipments"
    ADD CONSTRAINT "Shipments_senderUid_fkey" FOREIGN KEY ("senderUid") REFERENCES public."User"(uid) ON UPDATE CASCADE ON DELETE RESTRICT;


-- Completed on 2024-07-29 12:06:34 +0530

--
-- PostgreSQL database dump complete
--

