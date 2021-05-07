--
-- PostgreSQL database dump
--

-- Dumped from database version 12.4 (Ubuntu 12.4-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.4 (Ubuntu 12.4-0ubuntu0.20.04.1)

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: mindful
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO mindful;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: mindful
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO mindful;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mindful
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: mindful
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO mindful;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: mindful
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO mindful;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mindful
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: mindful
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO mindful;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: mindful
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO mindful;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mindful
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: mindful
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


ALTER TABLE public.django_admin_log OWNER TO mindful;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: mindful
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO mindful;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mindful
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: mindful
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO mindful;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: mindful
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO mindful;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mindful
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: mindful
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO mindful;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: mindful
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO mindful;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mindful
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: mindful
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO mindful;

--
-- Name: mindful_api_bookmarks; Type: TABLE; Schema: public; Owner: mindful
--

CREATE TABLE public.mindful_api_bookmarks (
    bookmark_id integer NOT NULL,
    bookmark_time timestamp with time zone NOT NULL,
    post_id_id integer NOT NULL,
    user_id_id integer NOT NULL
);


ALTER TABLE public.mindful_api_bookmarks OWNER TO mindful;

--
-- Name: mindful_api_bookmarks_bookmark_id_seq; Type: SEQUENCE; Schema: public; Owner: mindful
--

CREATE SEQUENCE public.mindful_api_bookmarks_bookmark_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mindful_api_bookmarks_bookmark_id_seq OWNER TO mindful;

--
-- Name: mindful_api_bookmarks_bookmark_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mindful
--

ALTER SEQUENCE public.mindful_api_bookmarks_bookmark_id_seq OWNED BY public.mindful_api_bookmarks.bookmark_id;


--
-- Name: mindful_api_followings; Type: TABLE; Schema: public; Owner: mindful
--

CREATE TABLE public.mindful_api_followings (
    following_id integer NOT NULL,
    follow_time timestamp with time zone NOT NULL,
    followed_by_id_id integer NOT NULL,
    follower_id_id integer NOT NULL
);


ALTER TABLE public.mindful_api_followings OWNER TO mindful;

--
-- Name: mindful_api_followings_following_id_seq; Type: SEQUENCE; Schema: public; Owner: mindful
--

CREATE SEQUENCE public.mindful_api_followings_following_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mindful_api_followings_following_id_seq OWNER TO mindful;

--
-- Name: mindful_api_followings_following_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mindful
--

ALTER SEQUENCE public.mindful_api_followings_following_id_seq OWNED BY public.mindful_api_followings.following_id;


--
-- Name: mindful_api_likes; Type: TABLE; Schema: public; Owner: mindful
--

CREATE TABLE public.mindful_api_likes (
    like_id integer NOT NULL,
    like_time timestamp with time zone NOT NULL,
    post_id_id integer NOT NULL,
    user_id_id integer NOT NULL
);


ALTER TABLE public.mindful_api_likes OWNER TO mindful;

--
-- Name: mindful_api_likes_like_id_seq; Type: SEQUENCE; Schema: public; Owner: mindful
--

CREATE SEQUENCE public.mindful_api_likes_like_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mindful_api_likes_like_id_seq OWNER TO mindful;

--
-- Name: mindful_api_likes_like_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mindful
--

ALTER SEQUENCE public.mindful_api_likes_like_id_seq OWNED BY public.mindful_api_likes.like_id;


--
-- Name: mindful_api_post; Type: TABLE; Schema: public; Owner: mindful
--

CREATE TABLE public.mindful_api_post (
    post_id integer NOT NULL,
    content text,
    image character varying(100),
    has_media boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    tags jsonb NOT NULL,
    user_id_id integer NOT NULL
);


ALTER TABLE public.mindful_api_post OWNER TO mindful;

--
-- Name: mindful_api_post_post_id_seq; Type: SEQUENCE; Schema: public; Owner: mindful
--

CREATE SEQUENCE public.mindful_api_post_post_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mindful_api_post_post_id_seq OWNER TO mindful;

--
-- Name: mindful_api_post_post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mindful
--

ALTER SEQUENCE public.mindful_api_post_post_id_seq OWNED BY public.mindful_api_post.post_id;


--
-- Name: mindful_api_reportpost; Type: TABLE; Schema: public; Owner: mindful
--

CREATE TABLE public.mindful_api_reportpost (
    report_id integer NOT NULL,
    remarks text NOT NULL,
    report_time timestamp with time zone NOT NULL,
    post_id_id integer NOT NULL,
    user_id_id integer NOT NULL
);


ALTER TABLE public.mindful_api_reportpost OWNER TO mindful;

--
-- Name: mindful_api_reportpost_report_id_seq; Type: SEQUENCE; Schema: public; Owner: mindful
--

CREATE SEQUENCE public.mindful_api_reportpost_report_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mindful_api_reportpost_report_id_seq OWNER TO mindful;

--
-- Name: mindful_api_reportpost_report_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mindful
--

ALTER SEQUENCE public.mindful_api_reportpost_report_id_seq OWNED BY public.mindful_api_reportpost.report_id;


--
-- Name: mindful_api_user; Type: TABLE; Schema: public; Owner: mindful
--

CREATE TABLE public.mindful_api_user (
    last_login timestamp with time zone,
    user_id integer NOT NULL,
    email character varying(254) NOT NULL,
    username character varying(16) NOT NULL,
    password character varying(252) NOT NULL,
    name character varying(128),
    date_of_birth date,
    bio character varying(256),
    profile_picture character varying(100),
    allow_posting boolean NOT NULL,
    last_active timestamp with time zone,
    is_superuser boolean NOT NULL,
    is_admin boolean NOT NULL,
    security_ans text,
    security_que text
);


ALTER TABLE public.mindful_api_user OWNER TO mindful;

--
-- Name: mindful_api_user_user_id_seq; Type: SEQUENCE; Schema: public; Owner: mindful
--

CREATE SEQUENCE public.mindful_api_user_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mindful_api_user_user_id_seq OWNER TO mindful;

--
-- Name: mindful_api_user_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mindful
--

ALTER SEQUENCE public.mindful_api_user_user_id_seq OWNED BY public.mindful_api_user.user_id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: mindful
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: mindful
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: mindful
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: mindful
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: mindful
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: mindful
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: mindful_api_bookmarks bookmark_id; Type: DEFAULT; Schema: public; Owner: mindful
--

ALTER TABLE ONLY public.mindful_api_bookmarks ALTER COLUMN bookmark_id SET DEFAULT nextval('public.mindful_api_bookmarks_bookmark_id_seq'::regclass);


--
-- Name: mindful_api_followings following_id; Type: DEFAULT; Schema: public; Owner: mindful
--

ALTER TABLE ONLY public.mindful_api_followings ALTER COLUMN following_id SET DEFAULT nextval('public.mindful_api_followings_following_id_seq'::regclass);


--
-- Name: mindful_api_likes like_id; Type: DEFAULT; Schema: public; Owner: mindful
--

ALTER TABLE ONLY public.mindful_api_likes ALTER COLUMN like_id SET DEFAULT nextval('public.mindful_api_likes_like_id_seq'::regclass);


--
-- Name: mindful_api_post post_id; Type: DEFAULT; Schema: public; Owner: mindful
--

ALTER TABLE ONLY public.mindful_api_post ALTER COLUMN post_id SET DEFAULT nextval('public.mindful_api_post_post_id_seq'::regclass);


--
-- Name: mindful_api_reportpost report_id; Type: DEFAULT; Schema: public; Owner: mindful
--

ALTER TABLE ONLY public.mindful_api_reportpost ALTER COLUMN report_id SET DEFAULT nextval('public.mindful_api_reportpost_report_id_seq'::regclass);


--
-- Name: mindful_api_user user_id; Type: DEFAULT; Schema: public; Owner: mindful
--

ALTER TABLE ONLY public.mindful_api_user ALTER COLUMN user_id SET DEFAULT nextval('public.mindful_api_user_user_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: mindful
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: mindful
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: mindful
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
21	Can add user	6	add_user
22	Can change user	6	change_user
23	Can delete user	6	delete_user
24	Can view user	6	view_user
25	Can add post	7	add_post
26	Can change post	7	change_post
27	Can delete post	7	delete_post
28	Can view post	7	view_post
29	Can add report post	8	add_reportpost
30	Can change report post	8	change_reportpost
31	Can delete report post	8	delete_reportpost
32	Can view report post	8	view_reportpost
33	Can add likes	9	add_likes
34	Can change likes	9	change_likes
35	Can delete likes	9	delete_likes
36	Can view likes	9	view_likes
37	Can add followings	10	add_followings
38	Can change followings	10	change_followings
39	Can delete followings	10	delete_followings
40	Can view followings	10	view_followings
41	Can add bookmarks	11	add_bookmarks
42	Can change bookmarks	11	change_bookmarks
43	Can delete bookmarks	11	delete_bookmarks
44	Can view bookmarks	11	view_bookmarks
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: mindful
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: mindful
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	mindful_api	user
7	mindful_api	post
8	mindful_api	reportpost
9	mindful_api	likes
10	mindful_api	followings
11	mindful_api	bookmarks
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: mindful
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	mindful_api	0001_initial	2020-09-24 16:57:40.712691+05:30
2	contenttypes	0001_initial	2020-09-24 16:57:40.795007+05:30
3	admin	0001_initial	2020-09-24 16:57:40.817904+05:30
4	admin	0002_logentry_remove_auto_add	2020-09-24 16:57:40.875959+05:30
5	admin	0003_logentry_add_action_flag_choices	2020-09-24 16:57:40.885906+05:30
6	contenttypes	0002_remove_content_type_name	2020-09-24 16:57:40.903593+05:30
7	auth	0001_initial	2020-09-24 16:57:40.962972+05:30
8	auth	0002_alter_permission_name_max_length	2020-09-24 16:57:41.003869+05:30
9	auth	0003_alter_user_email_max_length	2020-09-24 16:57:41.012278+05:30
10	auth	0004_alter_user_username_opts	2020-09-24 16:57:41.019498+05:30
11	auth	0005_alter_user_last_login_null	2020-09-24 16:57:41.027315+05:30
12	auth	0006_require_contenttypes_0002	2020-09-24 16:57:41.030418+05:30
13	auth	0007_alter_validators_add_error_messages	2020-09-24 16:57:41.037734+05:30
14	auth	0008_alter_user_username_max_length	2020-09-24 16:57:41.045569+05:30
15	auth	0009_alter_user_last_name_max_length	2020-09-24 16:57:41.053211+05:30
16	auth	0010_alter_group_name_max_length	2020-09-24 16:57:41.062332+05:30
17	auth	0011_update_proxy_permissions	2020-09-24 16:57:41.076211+05:30
18	mindful_api	0002_auto_20200915_1635	2020-09-24 16:57:41.089347+05:30
19	mindful_api	0003_auto_20200917_1058	2020-09-24 16:57:41.116222+05:30
20	mindful_api	0004_auto_20200924_1152	2020-09-24 16:57:41.12625+05:30
21	sessions	0001_initial	2020-09-24 16:57:41.137335+05:30
22	admin	0004_auto_20200914_0617	2020-09-26 08:48:44.546665+05:30
23	admin	0005_auto_20200914_0619	2020-09-26 08:48:44.601103+05:30
24	admin	0006_auto_20200914_0621	2020-09-26 08:48:44.662022+05:30
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: mindful
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
r4cfq5lnowktpl5dp6qwmjyg1vs5oqs2	ZDExNTI3NmJlY2JlZWY4MzE1MDI3MDI2MjA4YzE5MTEyNTNjZjcxYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkNDRhZmVmYzgxOGU1OTA2NTQ0YzdkYjZjYmNjMDgwYjJhYmE1ZTlhIn0=	2020-10-08 17:49:57.42087+05:30
b9remnlskvn1fpw9j7psuzxefw1xdcqf	ZDExNTI3NmJlY2JlZWY4MzE1MDI3MDI2MjA4YzE5MTEyNTNjZjcxYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkNDRhZmVmYzgxOGU1OTA2NTQ0YzdkYjZjYmNjMDgwYjJhYmE1ZTlhIn0=	2020-10-08 17:53:22.168687+05:30
ji3xpozzi5kvaw1d2309db172oag2we0	ZDI2NzcyMWQ0ZDdhMWE5NTQwNzYwZmI5ZTc1ZWZjZTNlMzg3YWMxNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2MzU0ZTViNTc0N2JkMmI3MjI4ZjlmYTZmNmY4MmE1YWRmMGFjMTcwIn0=	2020-10-08 17:55:44.607472+05:30
3zexkbxco0d2wqu5kpw11ih8qymy4v6y	ZDI2NzcyMWQ0ZDdhMWE5NTQwNzYwZmI5ZTc1ZWZjZTNlMzg3YWMxNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2MzU0ZTViNTc0N2JkMmI3MjI4ZjlmYTZmNmY4MmE1YWRmMGFjMTcwIn0=	2020-10-08 17:57:25.208089+05:30
bioy7fytz5o7sij4c0clhy7w133qr8k1	ZDI2NzcyMWQ0ZDdhMWE5NTQwNzYwZmI5ZTc1ZWZjZTNlMzg3YWMxNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2MzU0ZTViNTc0N2JkMmI3MjI4ZjlmYTZmNmY4MmE1YWRmMGFjMTcwIn0=	2020-10-09 06:45:22.787898+05:30
zf41acqhdafapn2ij6iq1zf659175uya	MjVmMmNjM2IxZTA1OGZkNWJmNjk3NzMyYjlmZjE1MTIxZDM0MzhlMjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYjNlODRmNTM0ZDNlMDY4MTNmMWE4Yzg2ZmViZTM0ODdlMjc2OTFmIn0=	2020-10-09 06:47:31.750794+05:30
2f43jyk2e1h8abq2arebkito84ukkxn7	OWM0OGFkZDMzNzJiMjQ1ZjBiYTEwZGY1YzU2ZmQ2MjU5MWFhMDIyNTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1NmZlYmQ5YWZiN2IzYTgyNzhkMGE1ODk3ZTk2NTM2MzljMDMyZDQ5In0=	2020-10-09 06:51:11.29471+05:30
xro8hjqzmsoun2fu04cwiozt1qh4p427	NWY5ZjBmMzA2ZWQ5N2FlNTJmOWI1MzRiMjQzYzk4NmUzYzc3MWUyNTp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhMTI5N2Q5M2YyMDc0MDA4YjJlMTQ3ZTFhZWNhYWRiMmY4MGE4MmFhIn0=	2020-10-09 06:56:14.472345+05:30
74i7u4ex4ewrfvmzt4zbu7hvud2gi1kx	ZDI2NzcyMWQ0ZDdhMWE5NTQwNzYwZmI5ZTc1ZWZjZTNlMzg3YWMxNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2MzU0ZTViNTc0N2JkMmI3MjI4ZjlmYTZmNmY4MmE1YWRmMGFjMTcwIn0=	2020-10-09 07:01:43.142241+05:30
6acwznn1yztnu4nd5q5jev950h85t7jg	ZDI2NzcyMWQ0ZDdhMWE5NTQwNzYwZmI5ZTc1ZWZjZTNlMzg3YWMxNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2MzU0ZTViNTc0N2JkMmI3MjI4ZjlmYTZmNmY4MmE1YWRmMGFjMTcwIn0=	2020-10-09 08:13:51.956267+05:30
b2zvjb2zail1xzexpkv8f0x9ag0vgkco	OTg4MmYwODU5ZTY4NTI4MTQ0MWQzY2UxMDgzZmFkOWU0MjRjMmUyYzp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyZTU0NmQ5N2Q1ZDgwODk1YTQ2OTM2YWU0MTMzMTMxOTkyNjZiNzJhIn0=	2020-10-09 09:05:42.578965+05:30
m4uap3nsmu5tvwewb5llfs4eejrl8mq3	OTg4MmYwODU5ZTY4NTI4MTQ0MWQzY2UxMDgzZmFkOWU0MjRjMmUyYzp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyZTU0NmQ5N2Q1ZDgwODk1YTQ2OTM2YWU0MTMzMTMxOTkyNjZiNzJhIn0=	2020-10-09 14:23:10.680964+05:30
6iym3q1ubssocny1mga8hmmqxjvrhsa3	MTU3MWViYWMzMWVmMDI3YjY3OWQ4NzVhYjZkZGYxMDc3MWFiYWM3Yzp7Il9hdXRoX3VzZXJfaWQiOiI2IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2ZDU1MDA3YmYzMjIwOTA1OWQwZTFhYWFjNWRmMzI4NmMyMjkwMTE1In0=	2020-10-09 14:29:31.528376+05:30
8x3y6sdms4fqp9sqx61imyu7pwsdcrn3	MTU3MWViYWMzMWVmMDI3YjY3OWQ4NzVhYjZkZGYxMDc3MWFiYWM3Yzp7Il9hdXRoX3VzZXJfaWQiOiI2IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2ZDU1MDA3YmYzMjIwOTA1OWQwZTFhYWFjNWRmMzI4NmMyMjkwMTE1In0=	2020-10-09 14:36:36.501199+05:30
ufzhqct0uj7tyf9jvhatmlu9k5omlxsh	YTVlNWRiOWZlMzE0ZDQ4NDViM2FkZWJkZGYwMTczMzJiNGQyMGQzNDp7Il9hdXRoX3VzZXJfaWQiOiI3IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlZDE0NzIyMTM2YTc2MTMwMDNkMDQxMzZkNWEyNjNhZGIwZWRkMzg4In0=	2020-10-09 14:40:29.060303+05:30
d9bvvnpyiur4v81b48uwp94mevgk20sh	MTU3MWViYWMzMWVmMDI3YjY3OWQ4NzVhYjZkZGYxMDc3MWFiYWM3Yzp7Il9hdXRoX3VzZXJfaWQiOiI2IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2ZDU1MDA3YmYzMjIwOTA1OWQwZTFhYWFjNWRmMzI4NmMyMjkwMTE1In0=	2020-10-09 16:53:39.283229+05:30
pgt551tushc27cs6lkvdmnwynem3m9by	ZDI2NzcyMWQ0ZDdhMWE5NTQwNzYwZmI5ZTc1ZWZjZTNlMzg3YWMxNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2MzU0ZTViNTc0N2JkMmI3MjI4ZjlmYTZmNmY4MmE1YWRmMGFjMTcwIn0=	2020-10-09 17:06:50.34609+05:30
ufv196i87hnqlet2tkt5wvejjsgcdcws	Mjg0MzFhNTgxYmY4ZjZkMmI1Y2IwOGI3ZmEwNzE0NDk5ZmQ0NTQzZjp7Il9hdXRoX3VzZXJfaWQiOiI4IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YTlmNTIxMjI0YTg1MWVmNTczMGE3ZGQ0YzBmZWNjNjBhNTA0ZjE5In0=	2020-10-09 17:12:20.51893+05:30
asfcf11sgckytd673kwvq0f0acqs7gzs	ZDI2NzcyMWQ0ZDdhMWE5NTQwNzYwZmI5ZTc1ZWZjZTNlMzg3YWMxNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2MzU0ZTViNTc0N2JkMmI3MjI4ZjlmYTZmNmY4MmE1YWRmMGFjMTcwIn0=	2020-10-09 17:17:44.547616+05:30
hbv3e1v4d92wtrvrd5m2osovh6t10pzd	ZDI2NzcyMWQ0ZDdhMWE5NTQwNzYwZmI5ZTc1ZWZjZTNlMzg3YWMxNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2MzU0ZTViNTc0N2JkMmI3MjI4ZjlmYTZmNmY4MmE1YWRmMGFjMTcwIn0=	2020-10-09 17:20:09.647489+05:30
78a9b5ujr8id3we9z96ye69vxbsyze28	ZDI2NzcyMWQ0ZDdhMWE5NTQwNzYwZmI5ZTc1ZWZjZTNlMzg3YWMxNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2MzU0ZTViNTc0N2JkMmI3MjI4ZjlmYTZmNmY4MmE1YWRmMGFjMTcwIn0=	2020-10-09 17:34:17.565367+05:30
317wum5ncuy21jma4keudlle40319696	Mjg0MzFhNTgxYmY4ZjZkMmI1Y2IwOGI3ZmEwNzE0NDk5ZmQ0NTQzZjp7Il9hdXRoX3VzZXJfaWQiOiI4IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YTlmNTIxMjI0YTg1MWVmNTczMGE3ZGQ0YzBmZWNjNjBhNTA0ZjE5In0=	2020-10-09 18:12:06.993083+05:30
kw7ep5sw6joyl4bh5dgadpnkobkv02l0	ZDI2NzcyMWQ0ZDdhMWE5NTQwNzYwZmI5ZTc1ZWZjZTNlMzg3YWMxNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2MzU0ZTViNTc0N2JkMmI3MjI4ZjlmYTZmNmY4MmE1YWRmMGFjMTcwIn0=	2020-10-09 18:14:29.743939+05:30
ol9qfn8l4airvf8vx1b2a2wh16aq1swv	Mjg0MzFhNTgxYmY4ZjZkMmI1Y2IwOGI3ZmEwNzE0NDk5ZmQ0NTQzZjp7Il9hdXRoX3VzZXJfaWQiOiI4IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YTlmNTIxMjI0YTg1MWVmNTczMGE3ZGQ0YzBmZWNjNjBhNTA0ZjE5In0=	2020-10-09 19:13:23.025734+05:30
k4eycz2tkcedfmss2hxml9lt4g09sd71	ZDI2NzcyMWQ0ZDdhMWE5NTQwNzYwZmI5ZTc1ZWZjZTNlMzg3YWMxNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2MzU0ZTViNTc0N2JkMmI3MjI4ZjlmYTZmNmY4MmE1YWRmMGFjMTcwIn0=	2020-10-09 19:14:12.901938+05:30
gnsbooijpq785xvlnkt5wht6v1gjht1l	OWM0OGFkZDMzNzJiMjQ1ZjBiYTEwZGY1YzU2ZmQ2MjU5MWFhMDIyNTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1NmZlYmQ5YWZiN2IzYTgyNzhkMGE1ODk3ZTk2NTM2MzljMDMyZDQ5In0=	2020-10-09 19:35:00.049989+05:30
dxlefyho3vpfja2nrbf5bpyklpevjwtz	ZDI2NzcyMWQ0ZDdhMWE5NTQwNzYwZmI5ZTc1ZWZjZTNlMzg3YWMxNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2MzU0ZTViNTc0N2JkMmI3MjI4ZjlmYTZmNmY4MmE1YWRmMGFjMTcwIn0=	2020-10-09 19:36:13.754708+05:30
5p3995f1t1bsac3byvdn535af5ojg4pl	Mjg0MzFhNTgxYmY4ZjZkMmI1Y2IwOGI3ZmEwNzE0NDk5ZmQ0NTQzZjp7Il9hdXRoX3VzZXJfaWQiOiI4IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YTlmNTIxMjI0YTg1MWVmNTczMGE3ZGQ0YzBmZWNjNjBhNTA0ZjE5In0=	2020-10-09 19:39:55.144832+05:30
zpruuykmfsb26monnzcv1u25n71u8yh3	ZDI2NzcyMWQ0ZDdhMWE5NTQwNzYwZmI5ZTc1ZWZjZTNlMzg3YWMxNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2MzU0ZTViNTc0N2JkMmI3MjI4ZjlmYTZmNmY4MmE1YWRmMGFjMTcwIn0=	2020-10-09 19:44:22.332943+05:30
zkwcqnruxsnbqqnk8ncyazepjhswgllq	OTg4MmYwODU5ZTY4NTI4MTQ0MWQzY2UxMDgzZmFkOWU0MjRjMmUyYzp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyZTU0NmQ5N2Q1ZDgwODk1YTQ2OTM2YWU0MTMzMTMxOTkyNjZiNzJhIn0=	2020-10-09 19:52:56.886573+05:30
xwia01mkamynx3p1dpiq88eipxnn7skn	NDM3OWY1ZDQyMjA1ZjIwY2M3NmFkZDY3YzA2YzJlYTRlY2UyMzMxZjp7Il9hdXRoX3VzZXJfaWQiOiI5IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzMzMzYmMzNmYzMzRkODIyNDg1MTk1OWIzMWFlYWM4NTJkNWU5NmM4In0=	2020-10-09 20:01:23.045575+05:30
gjn0wglw385esdu1o1hculh0udnqqipr	MDgxZWY0NzFlNTJlMjhhOTY5ZWYzY2YwNGU3YWJlNWI5YTY5ZDQ5YTp7Il9hdXRoX3VzZXJfaWQiOiIxMCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOTM3YjM1MDk2MzI3NGJlNjczZjYyN2IwYmJlODY1ZDdkYzBmZWM3ZCJ9	2020-10-09 20:05:49.032596+05:30
sk05ikn7err1vy820gz10mck4hblkbaa	ZjAzOGU2ZjliYzQ4ZTc3NDAzY2M3ODM4M2E0MmZmMjk5MGE0MjAyZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNGFhNGExNjZhY2RjMWJlZjcxNzlkMWExZDQ3MmZkMTE4ODhlNDcwYiJ9	2020-10-09 20:07:42.470028+05:30
fh3xhggihtt15p1s29ruv7nc7dv2km7q	ZDI2NzcyMWQ0ZDdhMWE5NTQwNzYwZmI5ZTc1ZWZjZTNlMzg3YWMxNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2MzU0ZTViNTc0N2JkMmI3MjI4ZjlmYTZmNmY4MmE1YWRmMGFjMTcwIn0=	2020-10-09 20:08:22.131696+05:30
lq9abet2jeua757sdh485q4yu1c705k1	OGNlNDMzZTFhZGUxZDVjOWU4OWQ1NDZlODE1MjRiMTBjZDkyNDRiZTp7Il9hdXRoX3VzZXJfaWQiOiIxMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZTJhYzBkMTJkM2U1ZDMwYWMxZmFhM2M5ZWRjMGY2YTllYjdjMWEwMCJ9	2020-10-09 20:11:02.695226+05:30
129k7iuqpvj4os1a1ewxvyyjln7ckjdq	OGNlNDMzZTFhZGUxZDVjOWU4OWQ1NDZlODE1MjRiMTBjZDkyNDRiZTp7Il9hdXRoX3VzZXJfaWQiOiIxMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZTJhYzBkMTJkM2U1ZDMwYWMxZmFhM2M5ZWRjMGY2YTllYjdjMWEwMCJ9	2020-10-09 20:12:10.8232+05:30
i5qa4tbfky1xv7w34ga6c5o1evtcu4yv	N2M4YjE3NjhhMTU5NjIwODdhMzJkNjQxZThjNTY0MTYxZDliMzI2OTp7Il9hdXRoX3VzZXJfaWQiOiIxMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNTM1MWE3YzJiNjUyMDE3YWYzNGNhMDA2NTQ4NDAxOGRlNWM5NWUyYyJ9	2020-10-09 20:23:10.294363+05:30
q1dxadiv2ecoix601js5pnq0aqeequeq	OTg4MmYwODU5ZTY4NTI4MTQ0MWQzY2UxMDgzZmFkOWU0MjRjMmUyYzp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyZTU0NmQ5N2Q1ZDgwODk1YTQ2OTM2YWU0MTMzMTMxOTkyNjZiNzJhIn0=	2020-10-10 03:10:21.742869+05:30
w6ht2x3l2x8fevuqb2cql5z6ct94a903	N2M4YjE3NjhhMTU5NjIwODdhMzJkNjQxZThjNTY0MTYxZDliMzI2OTp7Il9hdXRoX3VzZXJfaWQiOiIxMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNTM1MWE3YzJiNjUyMDE3YWYzNGNhMDA2NTQ4NDAxOGRlNWM5NWUyYyJ9	2020-10-10 03:27:00.478065+05:30
2y8pqtybgds8hhwkks6q0dcz2ovx6mz6	OTg4MmYwODU5ZTY4NTI4MTQ0MWQzY2UxMDgzZmFkOWU0MjRjMmUyYzp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyZTU0NmQ5N2Q1ZDgwODk1YTQ2OTM2YWU0MTMzMTMxOTkyNjZiNzJhIn0=	2020-10-10 03:51:42.011484+05:30
s2se6upq8xayuchpo1il3rqrfc1x64pq	ZDI2NzcyMWQ0ZDdhMWE5NTQwNzYwZmI5ZTc1ZWZjZTNlMzg3YWMxNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2MzU0ZTViNTc0N2JkMmI3MjI4ZjlmYTZmNmY4MmE1YWRmMGFjMTcwIn0=	2020-10-10 03:52:22.119905+05:30
bgww7rjszlpp2a7pj3hmunzm56woqscj	Y2ZhYzY1YmYyZTM3ZDAxNWQxYTFlYTcxYmM3MzQzZGIzM2VhNWU1MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjYWU5MWM2NjcwNzYzNmY5YmMzODZkMTNmMDQ2NTg3YzBiZjk4OTg1In0=	2020-10-10 03:53:36.229204+05:30
11o6y6kfb806qe061gbsq448vh9lvcgv	Y2ZhYzY1YmYyZTM3ZDAxNWQxYTFlYTcxYmM3MzQzZGIzM2VhNWU1MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjYWU5MWM2NjcwNzYzNmY5YmMzODZkMTNmMDQ2NTg3YzBiZjk4OTg1In0=	2020-10-10 03:53:51.499233+05:30
9i0uvsa93v1q473p728w0hmwew8vzbbf	ZjAxOWViOGJkMDIzYjliODNjNDkyMmZjZmNkNDdjMjIwNDI5MzFjNjp7Il9hdXRoX3VzZXJfaWQiOiIxNCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZGU2ODkyYTBjM2MzMmMwNjA5YjVkODhiNzYzZmJlNmE4MGU4YjUzMiJ9	2020-10-10 03:59:16.407324+05:30
18l73b5lxnlyxu0outua16z4912zf0o6	ZjAxOWViOGJkMDIzYjliODNjNDkyMmZjZmNkNDdjMjIwNDI5MzFjNjp7Il9hdXRoX3VzZXJfaWQiOiIxNCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZGU2ODkyYTBjM2MzMmMwNjA5YjVkODhiNzYzZmJlNmE4MGU4YjUzMiJ9	2020-10-10 04:12:06.686979+05:30
663q0hzwnrrvfchpytz3zru1e36m3k0a	ZjAxOWViOGJkMDIzYjliODNjNDkyMmZjZmNkNDdjMjIwNDI5MzFjNjp7Il9hdXRoX3VzZXJfaWQiOiIxNCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZGU2ODkyYTBjM2MzMmMwNjA5YjVkODhiNzYzZmJlNmE4MGU4YjUzMiJ9	2020-10-10 04:26:59.65797+05:30
qsbg6sthvxf2sq0nouvrt5glgid1jv6i	ZWRjNmQxYWM4OTI0YzhjMGMwZDA1MzZlZDVkNzZhZDY4ZTAwNmFmYzp7Il9hdXRoX3VzZXJfaWQiOiIxNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzVjNDY4NjY1YTdhYzczNDkxYmU2ZjU1YjQxNTJiZjQ4Nzg2NWZkZCJ9	2020-10-10 04:28:59.278462+05:30
l8tx643k519r9gf6144y4lljbhgmu5ky	NGY1ZDFjMmYzYWE4ZTZkMmQ2NmQ1NTZjMGNjMDc1M2NjODkzMTRjZjp7Il9hdXRoX3VzZXJfaWQiOiIxNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYWUxNGNiOTEyMmI1NzFlMzc4MjdiOWJmMmEzZjQxMGU4NGM4ODRhNiJ9	2020-10-10 04:31:59.739282+05:30
9bccfsf2v52xfzulvjh3zie9ce1ewmdu	YzQ4ZTkzYTkwODBhZTUyYmE0NmU4MTM1MjNmZDJjNjFjNzRmMjk4Mzp7Il9hdXRoX3VzZXJfaWQiOiIxNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZWVlNGY5NWI1YzRkNThmOGJiNGY0ZGI4Yjk1ZDNjYzQzMmVkNGM3NyJ9	2020-10-10 04:36:45.298519+05:30
dxsxfnou4ngffu35ml2afdx68l28heg6	OTg4MmYwODU5ZTY4NTI4MTQ0MWQzY2UxMDgzZmFkOWU0MjRjMmUyYzp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyZTU0NmQ5N2Q1ZDgwODk1YTQ2OTM2YWU0MTMzMTMxOTkyNjZiNzJhIn0=	2020-10-10 04:39:00.839871+05:30
qb7her3nbkjwcpfll5ung164xcys3n8a	Y2ZhYzY1YmYyZTM3ZDAxNWQxYTFlYTcxYmM3MzQzZGIzM2VhNWU1MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjYWU5MWM2NjcwNzYzNmY5YmMzODZkMTNmMDQ2NTg3YzBiZjk4OTg1In0=	2020-10-10 06:03:50.02002+05:30
8h810e5mi77hscpw3bsgkezhqf51wbyz	Y2ZhYzY1YmYyZTM3ZDAxNWQxYTFlYTcxYmM3MzQzZGIzM2VhNWU1MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjYWU5MWM2NjcwNzYzNmY5YmMzODZkMTNmMDQ2NTg3YzBiZjk4OTg1In0=	2020-10-10 06:07:11.636371+05:30
jhqb3hubjsssmtb880xu1lqpb1safynn	Y2ZhYzY1YmYyZTM3ZDAxNWQxYTFlYTcxYmM3MzQzZGIzM2VhNWU1MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjYWU5MWM2NjcwNzYzNmY5YmMzODZkMTNmMDQ2NTg3YzBiZjk4OTg1In0=	2020-10-10 06:10:59.811192+05:30
zvqquysyrfb13ma4o89bwnd2yoslllpa	N2M4YjE3NjhhMTU5NjIwODdhMzJkNjQxZThjNTY0MTYxZDliMzI2OTp7Il9hdXRoX3VzZXJfaWQiOiIxMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNTM1MWE3YzJiNjUyMDE3YWYzNGNhMDA2NTQ4NDAxOGRlNWM5NWUyYyJ9	2020-10-10 06:19:11.105144+05:30
b8y5o6pgnc4uzfaqeoknr9o40henrk13	NGY1ZDFjMmYzYWE4ZTZkMmQ2NmQ1NTZjMGNjMDc1M2NjODkzMTRjZjp7Il9hdXRoX3VzZXJfaWQiOiIxNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYWUxNGNiOTEyMmI1NzFlMzc4MjdiOWJmMmEzZjQxMGU4NGM4ODRhNiJ9	2020-10-10 06:21:17.181837+05:30
595uz6dcg1by18qd2xdaorwdi4ow0nxt	Y2ZhYzY1YmYyZTM3ZDAxNWQxYTFlYTcxYmM3MzQzZGIzM2VhNWU1MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjYWU5MWM2NjcwNzYzNmY5YmMzODZkMTNmMDQ2NTg3YzBiZjk4OTg1In0=	2020-10-10 06:22:08.440602+05:30
1dkgoxml4mifredpmcurdykdv207gvmk	ZjAzOGU2ZjliYzQ4ZTc3NDAzY2M3ODM4M2E0MmZmMjk5MGE0MjAyZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNGFhNGExNjZhY2RjMWJlZjcxNzlkMWExZDQ3MmZkMTE4ODhlNDcwYiJ9	2020-10-10 08:57:18.506405+05:30
\.


--
-- Data for Name: mindful_api_bookmarks; Type: TABLE DATA; Schema: public; Owner: mindful
--

COPY public.mindful_api_bookmarks (bookmark_id, bookmark_time, post_id_id, user_id_id) FROM stdin;
5	2020-09-26 05:07:55.831341+05:30	2	5
6	2020-09-26 06:08:29.941054+05:30	13	1
\.


--
-- Data for Name: mindful_api_followings; Type: TABLE DATA; Schema: public; Owner: mindful
--

COPY public.mindful_api_followings (following_id, follow_time, followed_by_id_id, follower_id_id) FROM stdin;
3	2020-09-25 17:52:23.125912+05:30	1	5
6	2020-09-25 17:52:51.141241+05:30	1	8
8	2020-09-25 18:22:01.907127+05:30	1	2
9	2020-09-25 19:13:29.917174+05:30	8	1
10	2020-09-25 19:35:14.316805+05:30	3	2
11	2020-09-25 19:35:14.328728+05:30	3	1
12	2020-09-25 19:35:14.334527+05:30	3	5
13	2020-09-25 19:35:14.335573+05:30	3	8
14	2020-09-25 19:35:14.342961+05:30	3	4
\.


--
-- Data for Name: mindful_api_likes; Type: TABLE DATA; Schema: public; Owner: mindful
--

COPY public.mindful_api_likes (like_id, like_time, post_id_id, user_id_id) FROM stdin;
17	2020-09-25 19:53:26.663527+05:30	4	5
23	2020-09-26 06:11:10.49855+05:30	12	1
25	2020-09-26 07:21:03.141908+05:30	4	1
\.


--
-- Data for Name: mindful_api_post; Type: TABLE DATA; Schema: public; Owner: mindful
--

COPY public.mindful_api_post (post_id, content, image, has_media, created_at, tags, user_id_id) FROM stdin;
1	Hitman is adjudged the Man of the Match for his match-winning knock of 80 off 54 deliveries.\n#Dream11IPL #KKRvMI	post_images/1.jpeg	t	2020-09-25 09:18:45.807438+05:30	{"word": ["Hitman", "adjudged", "Man", "Match", "knock", "80", "54", "deliveries", "Dream11IPL", "KKRvMI"], "hashtag": ["#dream11ipl", "#kkrvmi"], "sentiment": "neutral"}	5
2	KL Rahul now has the highest score ever by an Indian in IPL.\n#Dream11IPL #KXIPvRCB	post_images/2.jpeg	t	2020-09-25 09:40:16.892283+05:30	{"word": ["KL", "Rahul", "highest", "score", "ever", "Indian", "IPL", "Dream11IPL", "KXIPvRCB"], "hashtag": ["#dream11ipl", "#kxipvrcb"], "sentiment": "neutral"}	5
3	Proud recipients of the Orange and Purple caps respectively.\n\n#Dream11IPL	post_images/3.jpeg	t	2020-09-25 11:08:27.711452+05:30	{"word": ["Proud", "recipients", "Orange", "Purple", "caps", "respectively", "Dream11IPL"], "hashtag": ["#dream11ipl"], "sentiment": "positive"}	5
4	Unacademy Lets Crack It Sixes of the Match award goes to KL Rahul. #LetsCrackIt #Dream11IPL		f	2020-09-25 14:24:51.920177+05:30	{"word": ["Unacademy", "Lets", "Crack", "It", "Sixes", "Match", "award", "goes", "KL", "Rahul", "LetsCrackIt", "Dream11IPL"], "hashtag": ["#letscrackit", "#dream11ipl"], "sentiment": "positive"}	5
5	Amazon's Alexa becomes a better conversationalist and can now ask you questions.		f	2020-09-25 15:00:09.95018+05:30	{"word": ["Amazon", "Alexa", "becomes", "better", "conversationalist", "ask", "questions"], "hashtag": [], "sentiment": "neutral"}	7
6	Twitter plans to bring prompts to read before you retweet to all Twitter users		f	2020-09-25 15:00:59.277068+05:30	{"word": ["Twitter", "plans", "bring", "prompts", "read", "retweet", "Twitter", "users"], "hashtag": [], "sentiment": "neutral"}	7
7	Twitter-backed Indian social network ShareChat raises $40 million; says its short-video app Moj has amassed 80 million users in less than three months.		f	2020-09-25 15:02:40.409874+05:30	{"word": ["Indian", "social", "network", "ShareChat", "raises", "40", "million", "says", "app", "Moj", "amassed", "80", "million", "users", "less", "three", "months"], "hashtag": [], "sentiment": "neutral"}	7
8	In nature, nothing is perfect and everything is perfect. Trees can be contorted, bent in weird ways, and they’re still beautiful.	post_images/8.jpg	t	2020-09-25 17:01:16.729651+05:30	{"word": ["In", "nature", "nothing", "perfect", "everything", "perfect", "Trees", "contorted", "bent", "weird", "ways", "still", "beautiful"], "hashtag": [], "sentiment": "positive"}	6
9	Forget not that the earth delights to feel your bare feet and the winds long to play with your hair.		f	2020-09-25 17:02:02.735931+05:30	{"word": ["Forget", "earth", "delights", "feel", "bare", "feet", "winds", "long", "play", "hair"], "hashtag": [], "sentiment": "positive"}	6
10	Nature does not hurry, yet everything is accomplished.	post_images/10.jpg	t	2020-09-25 17:03:12.866274+05:30	{"word": ["Nature", "hurry", "yet", "everything", "accomplished"], "hashtag": [], "sentiment": "neutral"}	6
11	Leave the road, take the trails.		f	2020-09-25 17:05:42.831019+05:30	{"word": ["Leave", "road", "take", "trails"], "hashtag": [], "sentiment": "neutral"}	6
12	An earthquake of magnitude 5.4 on the Richter scale hit Ladakh at 4:27 pm today: National Centre for Seismology		f	2020-09-25 17:14:43.803183+05:30	{"word": ["An", "earthquake", "magnitude", "Richter", "scale", "hit", "Ladakh", "pm", "today", "National", "Centre", "Seismology"], "hashtag": [], "sentiment": "neutral"}	8
13	The new parliament building is set to be completed in 21 months. If that happens, our Session will be held in the new building when we will celebrate 75th year of Independence: Lok Sabha Speaker Om Birla.		f	2020-09-25 17:15:03.23353+05:30	{"word": ["The", "new", "parliament", "building", "set", "completed", "21", "months", "If", "happens", "Session", "held", "new", "building", "celebrate", "75th", "year", "Independence", "Lok", "Sabha", "Speaker", "Om", "Birla"], "hashtag": [], "sentiment": "positive"}	8
16	Clouds	post_images/16.jpg	t	2020-09-26 04:15:01.014395+05:30	{"word": ["Clouds"], "hashtag": [], "sentiment": "neutral"}	14
\.


--
-- Data for Name: mindful_api_reportpost; Type: TABLE DATA; Schema: public; Owner: mindful
--

COPY public.mindful_api_reportpost (report_id, remarks, report_time, post_id_id, user_id_id) FROM stdin;
\.


--
-- Data for Name: mindful_api_user; Type: TABLE DATA; Schema: public; Owner: mindful
--

COPY public.mindful_api_user (last_login, user_id, email, username, password, name, date_of_birth, bio, profile_picture, allow_posting, last_active, is_superuser, is_admin, security_ans, security_que) FROM stdin;
2020-09-25 06:47:31.450456+05:30	2	aditya@gmail.com	aditya_mani	pbkdf2_sha256$150000$EF0zFO6G6WkA$CtNwCvKD/3uwmDvlxIGk+SR1aNkXluGFvLrhiBQzFO0=	Aditya Mani	2007-12-01	I am Aditya Mani.	user_images/2.jpg	t	\N	f	f	blue	what is your favorite color?
2020-09-26 04:39:00.552863+05:30	5	ipl@gmail.com	ipl	pbkdf2_sha256$150000$XnpUnlQKJEvz$LoQwOmbD9QHVEtp4i3B/0mv/nbzc/mt0iaI1dfDYKqE=	Indian Premier League	2007-12-01	Follow to get exclusive and real-time Indian Premier League news and updates.	user_images/5.jpg	t	2020-09-26 05:08:42.077401+05:30	f	f	blue	what is your favorite color?
2020-09-25 19:39:54.848256+05:30	8	ani@gmail.com	ani_news	pbkdf2_sha256$150000$L8DsV89pG7nH$mXOKgH/R1zgzQMghVYxIsbgiDL0Kps2XedW3Nfg3BDw=	ANI	2007-12-01	Asian News International. Multi-media news agency.	user_images/8.jpeg	t	2020-09-25 19:41:26.186199+05:30	f	f	blue	what is your favorite color?
2020-09-25 06:56:14.150873+05:30	4	shashi@gmail.com	shashi_sha	pbkdf2_sha256$150000$GQNmqMw9o4OD$InQo7/MHB4NT0MFrt17ZJbeUCI55YwYzu7mEF15xDuU=	Shashi Sha	2007-12-01	I am Shashi Sha.	user_images/4.jpg	t	\N	f	f	blue	what is your favorite color?
2020-09-25 16:53:38.033045+05:30	6	nature@gmail.com	nature_quotes	pbkdf2_sha256$150000$o9d246Cchh0e$df/7uucpEfc0FBh0dUPtjztwWCCHRbW9nGwGa8oUJUE=	Nature Quotes	2007-12-01	Best Nature Quotes.	user_images/6.jpg	t	2020-09-25 17:05:43.225585+05:30	f	f	blue	what is your favorite color?
2020-09-25 14:40:28.755299+05:30	7	techcrunch@gmail.com	tech_crunch	pbkdf2_sha256$150000$eFdJ7qRILDmI$yr2Bw6Qm6ZEr/+sKpWC7n/C5qyVsdDwsk+nUP+9RvuQ=	Tech Crunch	2007-12-01	Tech news with an emphasis on early stage startups, raw innovation, and truly disruptive technologies.	user_images/7.png	t	2020-09-25 16:22:31.457511+05:30	f	f	blue	what is your favorite color?
2020-09-25 19:34:59.766053+05:30	3	rohit@gmail.com	rohit_sahoo	pbkdf2_sha256$150000$tb8ibeixMFZu$nEB9gahg02tHQE/VSeP3iUfUSdADrjrWiDhesEsv/dQ=	Rohit Sahoo	2007-12-01	I am Rohit Sahoo.	user_images/3.jpg	t	2020-09-25 19:35:54.068209+05:30	f	f	blue	what is your favorite color?
2020-09-26 04:26:59.387203+05:30	14	amazing@gmail.com	amazing_pics	pbkdf2_sha256$150000$70tHtbAp3XE2$7oYu1UYl9DTDxi/J6WfqmipboRs/ZK+ijL3Wmi6IJPE=	Amazing Pictures	2007-12-01	Only Pictures.	user_images/14.jpg	t	2020-09-26 04:26:59.784292+05:30	f	f	blue	what is your favorite color?
2020-09-26 06:22:08.163084+05:30	1	preetam@gmail.com	preetam_singh	pbkdf2_sha256$150000$IGrhPbNWYpL2$sHph0V0ygjmWEnmXDy3QidHNR9mopVOeG24lC+bMUL0=	Preetam Singh	2007-12-01	I am Preetam Singh.	user_images/1_UG2Z8ir.jpeg	t	2020-09-26 07:38:51.152134+05:30	f	f	sikar	what city were you born in?
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mindful
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mindful
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mindful
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 44, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mindful
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mindful
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 11, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mindful
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 24, true);


--
-- Name: mindful_api_bookmarks_bookmark_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mindful
--

SELECT pg_catalog.setval('public.mindful_api_bookmarks_bookmark_id_seq', 6, true);


--
-- Name: mindful_api_followings_following_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mindful
--

SELECT pg_catalog.setval('public.mindful_api_followings_following_id_seq', 59, true);


--
-- Name: mindful_api_likes_like_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mindful
--

SELECT pg_catalog.setval('public.mindful_api_likes_like_id_seq', 25, true);


--
-- Name: mindful_api_post_post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mindful
--

SELECT pg_catalog.setval('public.mindful_api_post_post_id_seq', 16, true);


--
-- Name: mindful_api_reportpost_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mindful
--

SELECT pg_catalog.setval('public.mindful_api_reportpost_report_id_seq', 1, false);


--
-- Name: mindful_api_user_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mindful
--

SELECT pg_catalog.setval('public.mindful_api_user_user_id_seq', 17, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: mindful
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: mindful
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: mindful
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: mindful
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: mindful
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: mindful
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: mindful
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: mindful
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: mindful
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: mindful
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: mindful
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: mindful_api_bookmarks mindful_api_bookmarks_pkey; Type: CONSTRAINT; Schema: public; Owner: mindful
--

ALTER TABLE ONLY public.mindful_api_bookmarks
    ADD CONSTRAINT mindful_api_bookmarks_pkey PRIMARY KEY (bookmark_id);


--
-- Name: mindful_api_followings mindful_api_followings_pkey; Type: CONSTRAINT; Schema: public; Owner: mindful
--

ALTER TABLE ONLY public.mindful_api_followings
    ADD CONSTRAINT mindful_api_followings_pkey PRIMARY KEY (following_id);


--
-- Name: mindful_api_likes mindful_api_likes_pkey; Type: CONSTRAINT; Schema: public; Owner: mindful
--

ALTER TABLE ONLY public.mindful_api_likes
    ADD CONSTRAINT mindful_api_likes_pkey PRIMARY KEY (like_id);


--
-- Name: mindful_api_post mindful_api_post_pkey; Type: CONSTRAINT; Schema: public; Owner: mindful
--

ALTER TABLE ONLY public.mindful_api_post
    ADD CONSTRAINT mindful_api_post_pkey PRIMARY KEY (post_id);


--
-- Name: mindful_api_reportpost mindful_api_reportpost_pkey; Type: CONSTRAINT; Schema: public; Owner: mindful
--

ALTER TABLE ONLY public.mindful_api_reportpost
    ADD CONSTRAINT mindful_api_reportpost_pkey PRIMARY KEY (report_id);


--
-- Name: mindful_api_user mindful_api_user_email_key; Type: CONSTRAINT; Schema: public; Owner: mindful
--

ALTER TABLE ONLY public.mindful_api_user
    ADD CONSTRAINT mindful_api_user_email_key UNIQUE (email);


--
-- Name: mindful_api_user mindful_api_user_pkey; Type: CONSTRAINT; Schema: public; Owner: mindful
--

ALTER TABLE ONLY public.mindful_api_user
    ADD CONSTRAINT mindful_api_user_pkey PRIMARY KEY (user_id);


--
-- Name: mindful_api_user mindful_api_user_username_key; Type: CONSTRAINT; Schema: public; Owner: mindful
--

ALTER TABLE ONLY public.mindful_api_user
    ADD CONSTRAINT mindful_api_user_username_key UNIQUE (username);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: mindful
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: mindful
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: mindful
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: mindful
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: mindful
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: mindful
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: mindful
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: mindful
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: mindful_api_bookmarks_post_id_id_6341d362; Type: INDEX; Schema: public; Owner: mindful
--

CREATE INDEX mindful_api_bookmarks_post_id_id_6341d362 ON public.mindful_api_bookmarks USING btree (post_id_id);


--
-- Name: mindful_api_bookmarks_user_id_id_b2ded326; Type: INDEX; Schema: public; Owner: mindful
--

CREATE INDEX mindful_api_bookmarks_user_id_id_b2ded326 ON public.mindful_api_bookmarks USING btree (user_id_id);


--
-- Name: mindful_api_followings_followed_by_id_id_5e2f46bb; Type: INDEX; Schema: public; Owner: mindful
--

CREATE INDEX mindful_api_followings_followed_by_id_id_5e2f46bb ON public.mindful_api_followings USING btree (followed_by_id_id);


--
-- Name: mindful_api_followings_follower_id_id_a311b983; Type: INDEX; Schema: public; Owner: mindful
--

CREATE INDEX mindful_api_followings_follower_id_id_a311b983 ON public.mindful_api_followings USING btree (follower_id_id);


--
-- Name: mindful_api_likes_post_id_id_798df67d; Type: INDEX; Schema: public; Owner: mindful
--

CREATE INDEX mindful_api_likes_post_id_id_798df67d ON public.mindful_api_likes USING btree (post_id_id);


--
-- Name: mindful_api_likes_user_id_id_7e2a55f3; Type: INDEX; Schema: public; Owner: mindful
--

CREATE INDEX mindful_api_likes_user_id_id_7e2a55f3 ON public.mindful_api_likes USING btree (user_id_id);


--
-- Name: mindful_api_post_user_id_id_a191a286; Type: INDEX; Schema: public; Owner: mindful
--

CREATE INDEX mindful_api_post_user_id_id_a191a286 ON public.mindful_api_post USING btree (user_id_id);


--
-- Name: mindful_api_reportpost_post_id_id_af333e20; Type: INDEX; Schema: public; Owner: mindful
--

CREATE INDEX mindful_api_reportpost_post_id_id_af333e20 ON public.mindful_api_reportpost USING btree (post_id_id);


--
-- Name: mindful_api_reportpost_user_id_id_e6e4a2c3; Type: INDEX; Schema: public; Owner: mindful
--

CREATE INDEX mindful_api_reportpost_user_id_id_e6e4a2c3 ON public.mindful_api_reportpost USING btree (user_id_id);


--
-- Name: mindful_api_user_email_b92deab7_like; Type: INDEX; Schema: public; Owner: mindful
--

CREATE INDEX mindful_api_user_email_b92deab7_like ON public.mindful_api_user USING btree (email varchar_pattern_ops);


--
-- Name: mindful_api_user_username_1f881235_like; Type: INDEX; Schema: public; Owner: mindful
--

CREATE INDEX mindful_api_user_username_1f881235_like ON public.mindful_api_user USING btree (username varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: mindful
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: mindful
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: mindful
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: mindful
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_mindful_api_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: mindful
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_mindful_api_user_user_id FOREIGN KEY (user_id) REFERENCES public.mindful_api_user(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mindful_api_bookmarks mindful_api_bookmark_post_id_id_6341d362_fk_mindful_a; Type: FK CONSTRAINT; Schema: public; Owner: mindful
--

ALTER TABLE ONLY public.mindful_api_bookmarks
    ADD CONSTRAINT mindful_api_bookmark_post_id_id_6341d362_fk_mindful_a FOREIGN KEY (post_id_id) REFERENCES public.mindful_api_post(post_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mindful_api_bookmarks mindful_api_bookmark_user_id_id_b2ded326_fk_mindful_a; Type: FK CONSTRAINT; Schema: public; Owner: mindful
--

ALTER TABLE ONLY public.mindful_api_bookmarks
    ADD CONSTRAINT mindful_api_bookmark_user_id_id_b2ded326_fk_mindful_a FOREIGN KEY (user_id_id) REFERENCES public.mindful_api_user(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mindful_api_followings mindful_api_followin_followed_by_id_id_5e2f46bb_fk_mindful_a; Type: FK CONSTRAINT; Schema: public; Owner: mindful
--

ALTER TABLE ONLY public.mindful_api_followings
    ADD CONSTRAINT mindful_api_followin_followed_by_id_id_5e2f46bb_fk_mindful_a FOREIGN KEY (followed_by_id_id) REFERENCES public.mindful_api_user(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mindful_api_followings mindful_api_followin_follower_id_id_a311b983_fk_mindful_a; Type: FK CONSTRAINT; Schema: public; Owner: mindful
--

ALTER TABLE ONLY public.mindful_api_followings
    ADD CONSTRAINT mindful_api_followin_follower_id_id_a311b983_fk_mindful_a FOREIGN KEY (follower_id_id) REFERENCES public.mindful_api_user(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mindful_api_likes mindful_api_likes_post_id_id_798df67d_fk_mindful_a; Type: FK CONSTRAINT; Schema: public; Owner: mindful
--

ALTER TABLE ONLY public.mindful_api_likes
    ADD CONSTRAINT mindful_api_likes_post_id_id_798df67d_fk_mindful_a FOREIGN KEY (post_id_id) REFERENCES public.mindful_api_post(post_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mindful_api_likes mindful_api_likes_user_id_id_7e2a55f3_fk_mindful_a; Type: FK CONSTRAINT; Schema: public; Owner: mindful
--

ALTER TABLE ONLY public.mindful_api_likes
    ADD CONSTRAINT mindful_api_likes_user_id_id_7e2a55f3_fk_mindful_a FOREIGN KEY (user_id_id) REFERENCES public.mindful_api_user(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mindful_api_post mindful_api_post_user_id_id_a191a286_fk_mindful_a; Type: FK CONSTRAINT; Schema: public; Owner: mindful
--

ALTER TABLE ONLY public.mindful_api_post
    ADD CONSTRAINT mindful_api_post_user_id_id_a191a286_fk_mindful_a FOREIGN KEY (user_id_id) REFERENCES public.mindful_api_user(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mindful_api_reportpost mindful_api_reportpo_post_id_id_af333e20_fk_mindful_a; Type: FK CONSTRAINT; Schema: public; Owner: mindful
--

ALTER TABLE ONLY public.mindful_api_reportpost
    ADD CONSTRAINT mindful_api_reportpo_post_id_id_af333e20_fk_mindful_a FOREIGN KEY (post_id_id) REFERENCES public.mindful_api_post(post_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mindful_api_reportpost mindful_api_reportpo_user_id_id_e6e4a2c3_fk_mindful_a; Type: FK CONSTRAINT; Schema: public; Owner: mindful
--

ALTER TABLE ONLY public.mindful_api_reportpost
    ADD CONSTRAINT mindful_api_reportpo_user_id_id_e6e4a2c3_fk_mindful_a FOREIGN KEY (user_id_id) REFERENCES public.mindful_api_user(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

