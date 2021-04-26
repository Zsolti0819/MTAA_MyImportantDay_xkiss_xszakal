--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

-- Started on 2021-04-26 18:47:15

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
-- TOC entry 203 (class 1259 OID 12356474)
-- Name: MyAPI_account; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."MyAPI_account" (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    email character varying(60) NOT NULL,
    username character varying(30) NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    last_login timestamp with time zone NOT NULL,
    is_admin boolean NOT NULL,
    is_active boolean NOT NULL,
    is_staff boolean NOT NULL,
    is_superuser boolean NOT NULL
);


ALTER TABLE public."MyAPI_account" OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 12356472)
-- Name: MyAPI_account_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."MyAPI_account_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."MyAPI_account_id_seq" OWNER TO postgres;

--
-- TOC entry 3119 (class 0 OID 0)
-- Dependencies: 202
-- Name: MyAPI_account_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."MyAPI_account_id_seq" OWNED BY public."MyAPI_account".id;


--
-- TOC entry 205 (class 1259 OID 12356486)
-- Name: MyAPI_event; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."MyAPI_event" (
    id integer NOT NULL,
    subject character varying(256) NOT NULL,
    date timestamp with time zone NOT NULL,
    place character varying(256) NOT NULL,
    priority character varying(12) NOT NULL,
    advanced character varying(512) NOT NULL,
    pic character varying(100),
    user_id integer NOT NULL
);


ALTER TABLE public."MyAPI_event" OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 12356484)
-- Name: MyAPI_event_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."MyAPI_event_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."MyAPI_event_id_seq" OWNER TO postgres;

--
-- TOC entry 3120 (class 0 OID 0)
-- Dependencies: 204
-- Name: MyAPI_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."MyAPI_event_id_seq" OWNED BY public."MyAPI_event".id;


--
-- TOC entry 213 (class 1259 OID 12356547)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 12356545)
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- TOC entry 3121 (class 0 OID 0)
-- Dependencies: 212
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- TOC entry 215 (class 1259 OID 12356557)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 12356555)
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 3122 (class 0 OID 0)
-- Dependencies: 214
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- TOC entry 211 (class 1259 OID 12356539)
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 12356537)
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- TOC entry 3123 (class 0 OID 0)
-- Dependencies: 210
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- TOC entry 216 (class 1259 OID 12356589)
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 12356515)
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 12356513)
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- TOC entry 3124 (class 0 OID 0)
-- Dependencies: 208
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- TOC entry 207 (class 1259 OID 12356505)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 12356503)
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- TOC entry 3125 (class 0 OID 0)
-- Dependencies: 206
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- TOC entry 201 (class 1259 OID 12356463)
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 12356461)
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- TOC entry 3126 (class 0 OID 0)
-- Dependencies: 200
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- TOC entry 217 (class 1259 OID 12356607)
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- TOC entry 2905 (class 2604 OID 12356477)
-- Name: MyAPI_account id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MyAPI_account" ALTER COLUMN id SET DEFAULT nextval('public."MyAPI_account_id_seq"'::regclass);


--
-- TOC entry 2906 (class 2604 OID 12356489)
-- Name: MyAPI_event id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MyAPI_event" ALTER COLUMN id SET DEFAULT nextval('public."MyAPI_event_id_seq"'::regclass);


--
-- TOC entry 2911 (class 2604 OID 12356550)
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- TOC entry 2912 (class 2604 OID 12356560)
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 2910 (class 2604 OID 12356542)
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- TOC entry 2908 (class 2604 OID 12356518)
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- TOC entry 2907 (class 2604 OID 12356508)
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- TOC entry 2904 (class 2604 OID 12356466)
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- TOC entry 3099 (class 0 OID 12356474)
-- Dependencies: 203
-- Data for Name: MyAPI_account; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."MyAPI_account" (id, password, email, username, date_joined, last_login, is_admin, is_active, is_staff, is_superuser) FROM stdin;
1	pbkdf2_sha256$180000$bElF9kWBt9Kd$K/UbmXOzMMLsuA1kZnQMn0FNIieIw8vIMTsGWDAzIBk=	xkiss@stuba.sk	Zsolti	2021-04-26 20:45:48.014024+02	2021-04-26 20:45:48.019045+02	t	t	t	t
2	pbkdf2_sha256$180000$Q2HtVcxniEe6$5/E6i0SHrKahYJ/uPwoMW9nR4R/WfCPqG4xihEhPm+Y=	xszakal@stuba.sk	Szaki	2021-04-26 20:46:07.151952+02	2021-04-26 20:46:07.15701+02	t	t	t	t
\.


--
-- TOC entry 3101 (class 0 OID 12356486)
-- Dependencies: 205
-- Data for Name: MyAPI_event; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."MyAPI_event" (id, subject, date, place, priority, advanced, pic, user_id) FROM stdin;
\.


--
-- TOC entry 3109 (class 0 OID 12356547)
-- Dependencies: 213
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- TOC entry 3111 (class 0 OID 12356557)
-- Dependencies: 215
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- TOC entry 3107 (class 0 OID 12356539)
-- Dependencies: 211
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add Token	6	add_token
22	Can change Token	6	change_token
23	Can delete Token	6	delete_token
24	Can view Token	6	view_token
25	Can add account	7	add_account
26	Can change account	7	change_account
27	Can delete account	7	delete_account
28	Can view account	7	view_account
29	Can add event	8	add_event
30	Can change event	8	change_event
31	Can delete event	8	delete_event
32	Can view event	8	view_event
\.


--
-- TOC entry 3112 (class 0 OID 12356589)
-- Dependencies: 216
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
1f7e66b144980a738e89d3477d04eaa96c6b8a1d	2021-04-26 20:45:48.017033+02	1
20aa52aa5dd95a2a6ebffd8ea345059f1b7450ef	2021-04-26 20:46:07.15701+02	2
\.


--
-- TOC entry 3105 (class 0 OID 12356515)
-- Dependencies: 209
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- TOC entry 3103 (class 0 OID 12356505)
-- Dependencies: 207
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	authtoken	token
7	MyAPI	account
8	MyAPI	event
\.


--
-- TOC entry 3097 (class 0 OID 12356463)
-- Dependencies: 201
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	MyAPI	0001_initial	2021-04-26 20:45:26.628147+02
2	contenttypes	0001_initial	2021-04-26 20:45:26.656962+02
3	admin	0001_initial	2021-04-26 20:45:26.668973+02
4	admin	0002_logentry_remove_auto_add	2021-04-26 20:45:26.681985+02
5	admin	0003_logentry_add_action_flag_choices	2021-04-26 20:45:26.684756+02
6	contenttypes	0002_remove_content_type_name	2021-04-26 20:45:26.690762+02
7	auth	0001_initial	2021-04-26 20:45:26.717692+02
8	auth	0002_alter_permission_name_max_length	2021-04-26 20:45:26.746717+02
9	auth	0003_alter_user_email_max_length	2021-04-26 20:45:26.749721+02
10	auth	0004_alter_user_username_opts	2021-04-26 20:45:26.752724+02
11	auth	0005_alter_user_last_login_null	2021-04-26 20:45:26.754725+02
12	auth	0006_require_contenttypes_0002	2021-04-26 20:45:26.755726+02
13	auth	0007_alter_validators_add_error_messages	2021-04-26 20:45:26.758729+02
14	auth	0008_alter_user_username_max_length	2021-04-26 20:45:26.761731+02
15	auth	0009_alter_user_last_name_max_length	2021-04-26 20:45:26.764735+02
16	auth	0010_alter_group_name_max_length	2021-04-26 20:45:26.77074+02
17	auth	0011_update_proxy_permissions	2021-04-26 20:45:26.774744+02
18	authtoken	0001_initial	2021-04-26 20:45:26.786144+02
19	authtoken	0002_auto_20160226_1747	2021-04-26 20:45:26.809169+02
20	sessions	0001_initial	2021-04-26 20:45:26.818345+02
\.


--
-- TOC entry 3113 (class 0 OID 12356607)
-- Dependencies: 217
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- TOC entry 3127 (class 0 OID 0)
-- Dependencies: 202
-- Name: MyAPI_account_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."MyAPI_account_id_seq"', 2, true);


--
-- TOC entry 3128 (class 0 OID 0)
-- Dependencies: 204
-- Name: MyAPI_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."MyAPI_event_id_seq"', 1, false);


--
-- TOC entry 3129 (class 0 OID 0)
-- Dependencies: 212
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- TOC entry 3130 (class 0 OID 0)
-- Dependencies: 214
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 3131 (class 0 OID 0)
-- Dependencies: 210
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 32, true);


--
-- TOC entry 3132 (class 0 OID 0)
-- Dependencies: 208
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- TOC entry 3133 (class 0 OID 0)
-- Dependencies: 206
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 8, true);


--
-- TOC entry 3134 (class 0 OID 0)
-- Dependencies: 200
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 20, true);


--
-- TOC entry 2917 (class 2606 OID 12356481)
-- Name: MyAPI_account MyAPI_account_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MyAPI_account"
    ADD CONSTRAINT "MyAPI_account_email_key" UNIQUE (email);


--
-- TOC entry 2919 (class 2606 OID 12356479)
-- Name: MyAPI_account MyAPI_account_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MyAPI_account"
    ADD CONSTRAINT "MyAPI_account_pkey" PRIMARY KEY (id);


--
-- TOC entry 2922 (class 2606 OID 12356483)
-- Name: MyAPI_account MyAPI_account_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MyAPI_account"
    ADD CONSTRAINT "MyAPI_account_username_key" UNIQUE (username);


--
-- TOC entry 2924 (class 2606 OID 12356494)
-- Name: MyAPI_event MyAPI_event_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MyAPI_event"
    ADD CONSTRAINT "MyAPI_event_pkey" PRIMARY KEY (id);


--
-- TOC entry 2941 (class 2606 OID 12356587)
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 2946 (class 2606 OID 12356573)
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- TOC entry 2949 (class 2606 OID 12356562)
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2943 (class 2606 OID 12356552)
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 2936 (class 2606 OID 12356564)
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- TOC entry 2938 (class 2606 OID 12356544)
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2952 (class 2606 OID 12356593)
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- TOC entry 2954 (class 2606 OID 12356595)
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- TOC entry 2932 (class 2606 OID 12356524)
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 2927 (class 2606 OID 12356512)
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- TOC entry 2929 (class 2606 OID 12356510)
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 2914 (class 2606 OID 12356471)
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 2957 (class 2606 OID 12356614)
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 2915 (class 1259 OID 12356495)
-- Name: MyAPI_account_email_b7777fe4_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "MyAPI_account_email_b7777fe4_like" ON public."MyAPI_account" USING btree (email varchar_pattern_ops);


--
-- TOC entry 2920 (class 1259 OID 12356496)
-- Name: MyAPI_account_username_c817cfaa_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "MyAPI_account_username_c817cfaa_like" ON public."MyAPI_account" USING btree (username varchar_pattern_ops);


--
-- TOC entry 2925 (class 1259 OID 12356502)
-- Name: MyAPI_event_user_id_c668d7c0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "MyAPI_event_user_id_c668d7c0" ON public."MyAPI_event" USING btree (user_id);


--
-- TOC entry 2939 (class 1259 OID 12356588)
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 2944 (class 1259 OID 12356584)
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- TOC entry 2947 (class 1259 OID 12356585)
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- TOC entry 2934 (class 1259 OID 12356570)
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- TOC entry 2950 (class 1259 OID 12356601)
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- TOC entry 2930 (class 1259 OID 12356535)
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- TOC entry 2933 (class 1259 OID 12356536)
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- TOC entry 2955 (class 1259 OID 12356616)
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- TOC entry 2958 (class 1259 OID 12356615)
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- TOC entry 2959 (class 2606 OID 12356497)
-- Name: MyAPI_event MyAPI_event_user_id_c668d7c0_fk_MyAPI_account_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MyAPI_event"
    ADD CONSTRAINT "MyAPI_event_user_id_c668d7c0_fk_MyAPI_account_id" FOREIGN KEY (user_id) REFERENCES public."MyAPI_account"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2964 (class 2606 OID 12356579)
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2963 (class 2606 OID 12356574)
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2962 (class 2606 OID 12356565)
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2965 (class 2606 OID 12356602)
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_MyAPI_account_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT "authtoken_token_user_id_35299eff_fk_MyAPI_account_id" FOREIGN KEY (user_id) REFERENCES public."MyAPI_account"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2960 (class 2606 OID 12356525)
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2961 (class 2606 OID 12356530)
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_MyAPI_account_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT "django_admin_log_user_id_c564eba6_fk_MyAPI_account_id" FOREIGN KEY (user_id) REFERENCES public."MyAPI_account"(id) DEFERRABLE INITIALLY DEFERRED;


-- Completed on 2021-04-26 18:47:15

--
-- PostgreSQL database dump complete
--

