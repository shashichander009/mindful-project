--
-- PostgreSQL database dump
--
-- Dumped from database version 12.3
-- Dumped by pg_dump version 12.3
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
CREATE SEQUENCE public.auth_group_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
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
CREATE SEQUENCE public.auth_group_permissions_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
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
CREATE SEQUENCE public.auth_permission_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
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
CREATE SEQUENCE public.django_admin_log_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
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
CREATE SEQUENCE public.django_content_type_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
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
CREATE SEQUENCE public.django_migrations_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
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
CREATE SEQUENCE public.mindful_api_bookmarks_bookmark_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
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
CREATE SEQUENCE public.mindful_api_followings_following_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
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
CREATE SEQUENCE public.mindful_api_likes_like_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
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
CREATE SEQUENCE public.mindful_api_post_post_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
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
CREATE SEQUENCE public.mindful_api_reportpost_report_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
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
    last_active timestamp with time zone NOT NULL,
    is_superuser boolean NOT NULL,
    is_admin boolean NOT NULL,
    security_ans text,
    security_que text
);
ALTER TABLE public.mindful_api_user OWNER TO mindful;
--
-- Name: mindful_api_user_user_id_seq; Type: SEQUENCE; Schema: public; Owner: mindful
--
CREATE SEQUENCE public.mindful_api_user_user_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE public.mindful_api_user_user_id_seq OWNER TO mindful;
--
-- Name: mindful_api_user_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mindful
--
ALTER SEQUENCE public.mindful_api_user_user_id_seq OWNED BY public.mindful_api_user.user_id;
--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: mindful
--
ALTER TABLE ONLY public.auth_group
ALTER COLUMN id
SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: mindful
--
ALTER TABLE ONLY public.auth_group_permissions
ALTER COLUMN id
SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: mindful
--
ALTER TABLE ONLY public.auth_permission
ALTER COLUMN id
SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: mindful
--
ALTER TABLE ONLY public.django_admin_log
ALTER COLUMN id
SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: mindful
--
ALTER TABLE ONLY public.django_content_type
ALTER COLUMN id
SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: mindful
--
ALTER TABLE ONLY public.django_migrations
ALTER COLUMN id
SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
--
-- Name: mindful_api_bookmarks bookmark_id; Type: DEFAULT; Schema: public; Owner: mindful
--
ALTER TABLE ONLY public.mindful_api_bookmarks
ALTER COLUMN bookmark_id
SET DEFAULT nextval(
        'public.mindful_api_bookmarks_bookmark_id_seq'::regclass
    );
--
-- Name: mindful_api_followings following_id; Type: DEFAULT; Schema: public; Owner: mindful
--
ALTER TABLE ONLY public.mindful_api_followings
ALTER COLUMN following_id
SET DEFAULT nextval(
        'public.mindful_api_followings_following_id_seq'::regclass
    );
--
-- Name: mindful_api_likes like_id; Type: DEFAULT; Schema: public; Owner: mindful
--
ALTER TABLE ONLY public.mindful_api_likes
ALTER COLUMN like_id
SET DEFAULT nextval('public.mindful_api_likes_like_id_seq'::regclass);
--
-- Name: mindful_api_post post_id; Type: DEFAULT; Schema: public; Owner: mindful
--
ALTER TABLE ONLY public.mindful_api_post
ALTER COLUMN post_id
SET DEFAULT nextval('public.mindful_api_post_post_id_seq'::regclass);
--
-- Name: mindful_api_reportpost report_id; Type: DEFAULT; Schema: public; Owner: mindful
--
ALTER TABLE ONLY public.mindful_api_reportpost
ALTER COLUMN report_id
SET DEFAULT nextval(
        'public.mindful_api_reportpost_report_id_seq'::regclass
    );
--
-- Name: mindful_api_user user_id; Type: DEFAULT; Schema: public; Owner: mindful
--
ALTER TABLE ONLY public.mindful_api_user
ALTER COLUMN user_id
SET DEFAULT nextval('public.mindful_api_user_user_id_seq'::regclass);
--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: mindful
--
COPY public.auth_group (id, name)
FROM stdin;
\.--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: mindful
--
COPY public.auth_group_permissions (id, group_id, permission_id)
FROM stdin;
\.--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: mindful
--
COPY public.auth_permission (id, name, content_type_id, codename)
FROM stdin;
1 Can
add log entry 1 add_logentry 2 Can change log entry 1 change_logentry 3 Can delete log entry 1 delete_logentry 4 Can view log entry 1 view_logentry 5 Can
add permission 2 add_permission 6 Can change permission 2 change_permission 7 Can delete permission 2 delete_permission 8 Can view permission 2 view_permission 9 Can
add group 3 add_group 10 Can change group 3 change_group 11 Can delete group 3 delete_group 12 Can view group 3 view_group 13 Can
add content type 4 add_contenttype 14 Can change content type 4 change_contenttype 15 Can delete content type 4 delete_contenttype 16 Can view content type 4 view_contenttype 17 Can
add session 5 add_session 18 Can change session 5 change_session 19 Can delete session 5 delete_session 20 Can view session 5 view_session 21 Can
add user 6 add_user 22 Can change user 6 change_user 23 Can delete user 6 delete_user 24 Can view user 6 view_user 25 Can
add post 7 add_post 26 Can change post 7 change_post 27 Can delete post 7 delete_post 28 Can view post 7 view_post 29 Can
add report post 8 add_reportpost 30 Can change report post 8 change_reportpost 31 Can delete report post 8 delete_reportpost 32 Can view report post 8 view_reportpost 33 Can
add likes 9 add_likes 34 Can change likes 9 change_likes 35 Can delete likes 9 delete_likes 36 Can view likes 9 view_likes 37 Can
add followings 10 add_followings 38 Can change followings 10 change_followings 39 Can delete followings 10 delete_followings 40 Can view followings 10 view_followings 41 Can
add bookmarks 11 add_bookmarks 42 Can change bookmarks 11 change_bookmarks 43 Can delete bookmarks 11 delete_bookmarks 44 Can view bookmarks 11 view_bookmarks \.--
    -- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: mindful
    --
    COPY public.django_admin_log (
        id,
        action_time,
        object_id,
        object_repr,
        action_flag,
        change_message,
        content_type_id,
        user_id
    )
FROM stdin;
1 2020 -09 -21 16 :22 :15.333195 + 05 :30 1 4 is posted by name: shashi,
email: shashi @mountblue.io is liked by name: preetam,
email: preetam @mountblue.io 1 [{"added": {}}] 9 1 2 2020 -09 -21 16 :22 :24.485047 + 05 :30 2 6 is posted by name: shashi,
email: shashi @mountblue.io is liked by name: preetam,
email: preetam @mountblue.io 1 [{"added": {}}] 9 1 3 2020 -09 -21 16 :22 :31.701859 + 05 :30 3 17 is posted by name: None,
email: admin @mountblue.io is liked by name: aditya,
email: aditya @gmail.com 1 [{"added": {}}] 9 1 4 2020 -09 -21 16 :22 :41.632003 + 05 :30 4 60 is posted by name: preetom,
email: preetom @gmail.com is liked by name: Rohit,
email: rohit @gmail.com 1 [{"added": {}}] 9 1 5 2020 -09 -21 16 :22 :48.086575 + 05 :30 5 9 is posted by name: shashi,
email: shashi @mountblue.io is liked by name: preetom,
email: preetom @gmail.com 1 [{"added": {}}] 9 1 6 2020 -09 -21 16 :22 :56.664116 + 05 :30 6 64 is posted by name: preetom,
email: preetom @gmail.com is liked by name: mukund,
email: mukund @gmail.com 1 [{"added": {}}] 9 1 7 2020 -09 -21 16 :23 :07.154048 + 05 :30 7 19 is posted by name: None,
email: admin @mountblue.io is liked by name: shashi,
email: shashi @mountblue.io 1 [{"added": {}}] 9 1 8 2020 -09 -21 16 :23 :25.282276 + 05 :30 1 name: Rohit,
email: rohit @gmail.com is following name: preetam,
email: preetam @mountblue.io 1 [{"added": {}}] 10 1 9 2020 -09 -21 16 :23 :32.84795 + 05 :30 2 name: aditya,
email: aditya @gmail.com is following name: mukund,
email: mukund @gmail.com 1 [{"added": {}}] 10 1 10 2020 -09 -21 16 :23 :41.291023 + 05 :30 3 name: None,
email: admin @mountblue.io is following name: preetam,
email: preetam @mountblue.io 1 [{"added": {}}] 10 1 11 2020 -09 -21 16 :23 :47.573151 + 05 :30 4 name: shashi,
email: shashi @mountblue.io is following name: preetom,
email: preetom @gmail.com 1 [{"added": {}}] 10 1 12 2020 -09 -21 16 :23 :54.071095 + 05 :30 5 name: preetom,
email: preetom @gmail.com is following name: shashi,
email: shashi @mountblue.io 1 [{"added": {}}] 10 1 13 2020 -09 -21 16 :24 :00.341247 + 05 :30 6 name: mukund,
email: mukund @gmail.com is following name: Rohit,
email: rohit @gmail.com 1 [{"added": {}}] 10 1 14 2020 -09 -21 16 :24 :16.864559 + 05 :30 1 22 is posted by name: Rohit,
email: rohit @gmail.com is bookmarked by name: Rohit,
email: rohit @gmail.com 1 [{"added": {}}] 11 1 15 2020 -09 -21 16 :24 :23.130242 + 05 :30 2 4 is posted by name: shashi,
email: shashi @mountblue.io is bookmarked by name: mukund,
email: mukund @gmail.com 1 [{"added": {}}] 11 1 16 2020 -09 -21 16 :24 :29.620044 + 05 :30 3 48 is posted by name: mukund,
email: mukund @gmail.com is bookmarked by name: preetom,
email: preetom @gmail.com 1 [{"added": {}}] 11 1 17 2020 -09 -21 16 :24 :35.919303 + 05 :30 4 23 is posted by name: Rohit,
email: rohit @gmail.com is bookmarked by name: preetom,
email: preetom @gmail.com 1 [{"added": {}}] 11 1 18 2020 -09 -21 16 :24 :42.392992 + 05 :30 5 71 is posted by name: preetom,
email: preetom @gmail.com is bookmarked by name: preetom,
email: preetom @gmail.com 1 [{"added": {}}] 11 1 19 2020 -09 -21 16 :24 :49.409327 + 05 :30 6 78 is posted by name: preetom,
email: preetom @gmail.com is bookmarked by name: preetom,
email: preetom @gmail.com 1 [{"added": {}}] 11 1 20 2020 -09 -21 16 :25 :08.728671 + 05 :30 1 20 is posted by name: Rohit,
email: rohit @gmail.com is reported by name: aditya,
email: aditya @gmail.com 1 [{"added": {}}] 8 1 21 2020 -09 -21 16 :25 :17.851573 + 05 :30 2 70 is posted by name: preetom,
email: preetom @gmail.com is reported by name: preetom,
email: preetom @gmail.com 1 [{"added": {}}] 8 1 22 2020 -09 -21 16 :25 :27.564841 + 05 :30 3 66 is posted by name: preetom,
email: preetom @gmail.com is reported by name: preetom,
email: preetom @gmail.com 1 [{"added": {}}] 8 1 23 2020 -09 -21 16 :25 :36.138105 + 05 :30 4 70 is posted by name: preetom,
email: preetom @gmail.com is reported by name: mukund,
email: mukund @gmail.com 1 [{"added": {}}] 8 1 \.--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: mindful
--
COPY public.django_content_type (id, app_label, model)
FROM stdin;
1 admin logentry 2 auth permission 3 auth group 4 contenttypes contenttype 5 sessions session 6 mindful_api user 7 mindful_api post 8 mindful_api reportpost 9 mindful_api likes 10 mindful_api followings 11 mindful_api bookmarks \.--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: mindful
--
COPY public.django_migrations (id, app, name, applied)
FROM stdin;
1 mindful_api 0001_initial 2020 -09 -21 15 :24 :12.473346 + 05 :30 2 contenttypes 0001_initial 2020 -09 -21 15 :24 :12.579481 + 05 :30 3 admin 0001_initial 2020 -09 -21 15 :24 :12.605372 + 05 :30 4 admin 0002_logentry_remove_auto_add 2020 -09 -21 15 :24 :12.636045 + 05 :30 5 admin 0003_logentry_add_action_flag_choices 2020 -09 -21 15 :24 :12.647629 + 05 :30 6 contenttypes 0002_remove_content_type_name 2020 -09 -21 15 :24 :12.672535 + 05 :30 7 auth 0001_initial 2020 -09 -21 15 :24 :12.748481 + 05 :30 8 auth 0002_alter_permission_name_max_length 2020 -09 -21 15 :24 :12.782754 + 05 :30 9 auth 0003_alter_user_email_max_length 2020 -09 -21 15 :24 :12.792292 + 05 :30 10 auth 0004_alter_user_username_opts 2020 -09 -21 15 :24 :12.802022 + 05 :30 11 auth 0005_alter_user_last_login_null 2020 -09 -21 15 :24 :12.812127 + 05 :30 12 auth 0006_require_contenttypes_0002 2020 -09 -21 15 :24 :12.815999 + 05 :30 13 auth 0007_alter_validators_add_error_messages 2020 -09 -21 15 :24 :12.825285 + 05 :30 14 auth 0008_alter_user_username_max_length 2020 -09 -21 15 :24 :12.841497 + 05 :30 15 auth 0009_alter_user_last_name_max_length 2020 -09 -21 15 :24 :12.853088 + 05 :30 16 auth 0010_alter_group_name_max_length 2020 -09 -21 15 :24 :12.873287 + 05 :30 17 auth 0011_update_proxy_permissions 2020 -09 -21 15 :24 :12.889965 + 05 :30 18 mindful_api 0002_auto_20200915_1635 2020 -09 -21 15 :24 :12.905947 + 05 :30 19 mindful_api 0003_auto_20200917_1058 2020 -09 -21 15 :24 :12.934049 + 05 :30 20 sessions 0001_initial 2020 -09 -21 15 :24 :12.948225 + 05 :30 \.--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: mindful
--
COPY public.django_session (session_key, session_data, expire_date)
FROM stdin;
4sy7lzlqqgnl7fyqyhivvfb0rpoe1juf Yjg4NGZhNGQ0ZjAzYzBlMjhjNzhhMWVmNTEyNzk5ZjkzZTI2YmQwMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhMTdkZjNiZjU5ZTdhZDRhNTg1M2YwYjNkNmQ0ZGI2NTZkYjM1ZTY0In0 = 2020 -10 -05 15 :25 :01.14475 + 05 :30 kqp0kzjo6pyy1d1khkfm44pgkbhtov1r N2QyY2M5MDAwMjA5NjgxMmNkYjE2ODUyOTk2OWMwMGQxZWY5YmFkYjp7Il9hdXRoX3VzZXJfaWQiOiI3IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlNDM3M2NkZmNlNWRiNTExNTlmM2IwZjhkOThhMzVhNmEwMjY0OTE2In0 = 2020 -10 -05 16 :20 :11.682483 + 05 :30 \.--
-- Data for Name: mindful_api_bookmarks; Type: TABLE DATA; Schema: public; Owner: mindful
--
COPY public.mindful_api_bookmarks (
    bookmark_id,
    bookmark_time,
    post_id_id,
    user_id_id
)
FROM stdin;
1 2020 -09 -21 16 :24 :16.85977 + 05 :30 22 4 2 2020 -09 -21 16 :24 :23.126565 + 05 :30 4 6 3 2020 -09 -21 16 :24 :29.617418 + 05 :30 48 7 4 2020 -09 -21 16 :24 :35.914943 + 05 :30 23 7 5 2020 -09 -21 16 :24 :42.389622 + 05 :30 71 7 6 2020 -09 -21 16 :24 :49.40677 + 05 :30 78 7 \.--
-- Data for Name: mindful_api_followings; Type: TABLE DATA; Schema: public; Owner: mindful
--
COPY public.mindful_api_followings (
    following_id,
    follow_time,
    followed_by_id_id,
    follower_id_id
)
FROM stdin;
1 2020 -09 -21 16 :23 :25.27862 + 05 :30 4 3 2 2020 -09 -21 16 :23 :32.846641 + 05 :30 5 6 3 2020 -09 -21 16 :23 :41.289708 + 05 :30 1 3 4 2020 -09 -21 16 :23 :47.571829 + 05 :30 2 7 5 2020 -09 -21 16 :23 :54.069594 + 05 :30 7 2 6 2020 -09 -21 16 :24 :00.339953 + 05 :30 6 4 \.--
-- Data for Name: mindful_api_likes; Type: TABLE DATA; Schema: public; Owner: mindful
--
COPY public.mindful_api_likes (like_id, like_time, post_id_id, user_id_id)
FROM stdin;
1 2020 -09 -21 16 :22 :15.327453 + 05 :30 4 3 2 2020 -09 -21 16 :22 :24.482152 + 05 :30 6 3 3 2020 -09 -21 16 :22 :31.698023 + 05 :30 17 5 4 2020 -09 -21 16 :22 :41.628992 + 05 :30 60 4 5 2020 -09 -21 16 :22 :48.083148 + 05 :30 9 7 6 2020 -09 -21 16 :22 :56.661067 + 05 :30 64 6 7 2020 -09 -21 16 :23 :07.151515 + 05 :30 19 2 \.--
-- Data for Name: mindful_api_post; Type: TABLE DATA; Schema: public; Owner: mindful
--
COPY public.mindful_api_post (
    post_id,
    content,
    image,
    has_media,
    created_at,
    tags,
    user_id_id
)
FROM stdin;
1 Only in your most desperate hour.f 2020 -09 -21 15 :29 :27.173729 + 05 :30 { "hashtag": [],
"sentiment": "neutral" } 2 2 Apparently I wouldn ’ t make a good spy because I have no idea what just happened.f 2020 -09 -21 15 :29 :27.214889 + 05 :30 { "hashtag": [],
"sentiment": "neutral" } 2 3 If you have to watch two hours of movie video game you pray that this one is it.f 2020 -09 -21 15 :29 :27.230343 + 05 :30 { "hashtag": [],
"sentiment": "neutral" } 2 4 If you ’ re lucky enough to miss the opening scene this movie might be the best of its ilk.f 2020 -09 -21 15 :29 :27.237725 + 05 :30 { "hashtag": [],
"sentiment": "positive" } 2 5 Somehow this goofy #Christian redux of #The Road Warrior with amazing look and feel ends up a little flat.		f	2020-09-21 15:29:27.248115+05:30	{"hashtag": ["#Christian", "#The"], "sentiment": "positive"}	2
6 Just proves that #Ridley is the best filmmaker on Earth AND on Mars.		f	2020-09-21 15:29:27.249249+05:30	{"hashtag": ["#Ridley"], "sentiment": "positive"}	2
7 If theatre has become just an excuse to write snappy dialogue then film about theatre is just an excuse to write snappy dialogue on steroids.f 2020 -09 -21 15 :29 :27.27739 + 05 :30 { "hashtag": [],
"sentiment": "neutral" } 2 8 Weird sad
and boring but I kinda liked it.f 2020 -09 -21 15 :29 :27.282828 + 05 :30 { "hashtag": [],
"sentiment": "neutral" } 2 9 I just watched a video game for two hours because someone told me it got like 98 % on #Rotten Tomatoes.		f	2020-09-21 15:29:27.293626+05:30	{"hashtag": ["#Rotten"], "sentiment": "neutral"}	2
10 I don ’ t know if there ’ s ever been a better man for exactly this kind of job than #Franco.		f	2020-09-21 15:29:27.303992+05:30	{"hashtag": ["#Franco"], "sentiment": "neutral"}	2
11 Her is to dialogue what #Cirque du Soleil is to tents.		f	2020-09-21 15:31:10.08855+05:30	{"hashtag": ["#Cirque"], "sentiment": "neutral"}	1
12 They got the look of the film right but then the movie is just one thing
after another that they got wrong.f 2020 -09 -21 15 :31 :10.094094 + 05 :30 { "hashtag": [],
    "sentiment": "negative" } 1 13 Hands down the ultimate #Christmas movie.		f	2020-09-21 15:31:10.105011+05:30	{"hashtag": ["#Christmas"], "sentiment": "neutral"}	1
    14 What foodie could ’ ve imagined a heartfelt movie about food produced by #Oprah the foodie Winfrey.		f	2020-09-21 15:31:10.110245+05:30	{"hashtag": ["#Oprah"], "sentiment": "positive"}	1
    15 For being the coolest looking movie I ’ ve ever seen it sure was hard to get through.f 2020 -09 -21 15 :31 :10.115515 + 05 :30 { "hashtag": [],
    "sentiment": "neutral" } 1 16 I ’ m trying to find a reason not to say that this is the most important film I ’ ve ever seen but really this is the most important film I ’ ve ever seen.f 2020 -09 -21 15 :31 :10.12304 + 05 :30 { "hashtag": [],
    "sentiment": "neutral" } 1 17 They had a great thing goin until some dumbass decided to make it about kids losing their parents
    and thus insuring that it sucks.f 2020 -09 -21 15 :31 :10.149793 + 05 :30 { "hashtag": [],
    "sentiment": "negative" } 1 18 I didn ’ t hate the #Empire nearly as much for blowing up #Alderaan as I did for making this movie leave the ice planet #Hoth.		f	2020-09-21 15:31:10.159885+05:30	{"hashtag": ["#Empire", "#Alderaan", "#Hoth"], "sentiment": "negative"}	1
    19 They got the look of the film right but then the movie is just one thing
after another that they got wrong.f 2020 -09 -21 15 :31 :10.171615 + 05 :30 { "hashtag": [],
    "sentiment": "negative" } 1 20
    When yer really really good
    and yer really really #successful you get to carry your friends who have maybe fallen over the years but that’s okay cuz like I said when yer really really good…		f	2020-09-21 15:35:41.745554+05:30	{"hashtag": ["#successful"], "sentiment": "positive"}	4
    21 If this isn ’ t in your top twenty then you ’ re my mom.f 2020 -09 -21 15 :35 :41.760667 + 05 :30 { "hashtag": [],
    "sentiment": "neutral" } 4 22 So good I ’ ve been trying for like three weeks
    and can ’ t find a sentence pithy enough so there that ’ s my pithy enough sentence.*(
        Pithy twice in one sentence #copyright 2014 #Courtney Taylor-Taylor.		f	2020-09-21 15:35:41.78094+05:30	{"hashtag": ["#copyright", "#Courtney"], "sentiment": "positive"}	4
        23 A good idea charming enough
        and not a huge time #commitment.		f	2020-09-21 15:35:41.795878+05:30	{"hashtag": ["#commitment"], "sentiment": "positive"}	4
        24 I can only tell you that there is some seriously goofy business going on in the first 19
        or so minutes.f 2020 -09 -21 15 :35 :41.803521 + 05 :30 { "hashtag": [],
        "sentiment": "neutral" } 4 25 Lord of the #Flies meets #Dr. Who.		f	2020-09-21 15:35:41.8169+05:30	{"hashtag": ["#Flies", "#Dr"], "sentiment": "neutral"}	4
        26 Aptly reviewed by my friend who told me to ignore the first scene then hold onto my hat.f 2020 -09 -21 15 :35 :41.819801 + 05 :30 { "hashtag": [],
        "sentiment": "neutral" } 4 27 Almost completely amazing.f 2020 -09 -21 15 :35 :41.835347 + 05 :30 { "hashtag": [],
        "sentiment": "positive" } 4 28 The opening camera move tells you that you ’ re in for like two hours of spectacular #filmmaking.		f	2020-09-21 15:35:41.835861+05:30	{"hashtag": ["#filmmaking"], "sentiment": "neutral"}	4
        29 If this isn ’ t in your top twenty then you ’ re my mom.f 2020 -09 -21 16 :15 :38.822248 + 05 :30 { "hashtag": [],
        "sentiment": "neutral" } 5 30 So good I ’ ve been trying for like three weeks
        and can ’ t find a sentence pithy enough so there that ’ s my pithy enough sentence.*(
            Pithy twice in one sentence #copyright 2014 #Courtney Taylor-Taylor.		f	2020-09-21 16:15:38.892284+05:30	{"hashtag": ["#copyright", "#Courtney"], "sentiment": "positive"}	5
            31 A good idea charming enough
            and not a huge time #commitment.		f	2020-09-21 16:15:38.904696+05:30	{"hashtag": ["#commitment"], "sentiment": "positive"}	5
            32 Almost completely amazing.f 2020 -09 -21 16 :15 :38.91307 + 05 :30 { "hashtag": [],
            "sentiment": "positive" } 5 33 The opening camera move tells you that you ’ re in for like two hours of spectacular #filmmaking.		f	2020-09-21 16:15:38.933528+05:30	{"hashtag": ["#filmmaking"], "sentiment": "neutral"}	5
            34 Aptly reviewed by my friend who told me to ignore the first scene then hold onto my hat.f 2020 -09 -21 16 :15 :38.940026 + 05 :30 { "hashtag": [],
            "sentiment": "neutral" } 5 35 Lord of the #Flies meets #Dr. Who.		f	2020-09-21 16:15:38.945736+05:30	{"hashtag": ["#Flies", "#Dr"], "sentiment": "neutral"}	5
            36 I can only tell you that there is some seriously goofy business going on in the first 19
            or so minutes.f 2020 -09 -21 16 :15 :38.960392 + 05 :30 { "hashtag": [],
            "sentiment": "neutral" } 5 37
            When yer really really good
            and yer really really #successful you get to carry your friends who have maybe fallen over the years but that’s okay cuz like I said when yer really really good…		f	2020-09-21 16:15:38.976766+05:30	{"hashtag": ["#successful"], "sentiment": "positive"}	5
            38 If this isn ’ t in your top twenty then you ’ re my mom.f 2020 -09 -21 16 :16 :00.620236 + 05 :30 { "hashtag": [],
            "sentiment": "neutral" } 5 39 Almost completely amazing.f 2020 -09 -21 16 :16 :00.64448 + 05 :30 { "hashtag": [],
            "sentiment": "positive" } 5 81 Long
            and boring,
            but at least it has a stupid ending.f 2020 -09 -21 16 :21 :22.581241 + 05 :30 { "hashtag": [],
            "sentiment": "negative" } 7 40
            When yer really really good
            and yer really really #successful you get to carry your friends who have maybe fallen over the years but that’s okay cuz like I said when yer really really good…		f	2020-09-21 16:16:00.687798+05:30	{"hashtag": ["#successful"], "sentiment": "positive"}	5
            41 I can only tell you that there is some seriously goofy business going on in the first 19
            or so minutes.f 2020 -09 -21 16 :16 :00.693177 + 05 :30 { "hashtag": [],
            "sentiment": "neutral" } 5 42 Aptly reviewed by my friend who told me to ignore the first scene then hold onto my hat.f 2020 -09 -21 16 :16 :00.709919 + 05 :30 { "hashtag": [],
            "sentiment": "neutral" } 5 43 A good idea charming enough
            and not a huge time #commitment.		f	2020-09-21 16:16:00.717439+05:30	{"hashtag": ["#commitment"], "sentiment": "positive"}	5
            44 So good I ’ ve been trying for like three weeks
            and can ’ t find a sentence pithy enough so there that ’ s my pithy enough sentence.*(
                Pithy twice in one sentence #copyright 2014 #Courtney Taylor-Taylor.		f	2020-09-21 16:16:00.728653+05:30	{"hashtag": ["#copyright", "#Courtney"], "sentiment": "positive"}	5
                45 Lord of the #Flies meets #Dr. Who.		f	2020-09-21 16:16:00.745004+05:30	{"hashtag": ["#Flies", "#Dr"], "sentiment": "neutral"}	5
                46 The opening camera move tells you that you ’ re in for like two hours of spectacular #filmmaking.		f	2020-09-21 16:16:00.745413+05:30	{"hashtag": ["#filmmaking"], "sentiment": "neutral"}	5
                47 How is it that one can see Bette Davis kick ass in the greatest feat of theatrical writing since Oscar Wilde for less than five bucks.f 2020 -09 -21 16 :18 :59.022996 + 05 :30 { "hashtag": [],
                "sentiment": "neutral" } 6 48 This powerful
                and compelling story appears to have been #filmed for television.		f	2020-09-21 16:18:59.038141+05:30	{"hashtag": ["#filmed"], "sentiment": "positive"}	6
                49 In the
            end,
            I am left wondering how so much can amount to so little.f 2020 -09 -21 16 :18 :59.072674 + 05 :30 { "hashtag": [],
            "sentiment": "neutral" } 6 50 It boasts a cleverer title
            AND it made me less uncomfortable than Meet The Parents f 2020 -09 -21 16 :18 :59.083957 + 05 :30 { "hashtag": [],
            "sentiment": "neutral" } 6 51 #Ashton Kutcher’s acting is a bit stop and go but the writer here is some kind of genius.		f	2020-09-21 16:18:59.090401+05:30	{"hashtag": ["#Ashton"], "sentiment": "neutral"}	6
            52 Just because Gregg Williams grows a beard
            and tells everyone to watch this doesn ’ t actually mean you should.f 2020 -09 -21 16 :18 :59.102048 + 05 :30 { "hashtag": [],
            "sentiment": "neutral" } 6 53 A kinder,
            gentler Tenenbaums.f 2020 -09 -21 16 :18 :59.107871 + 05 :30 { "hashtag": [],
            "sentiment": "positive" } 6 54 Ham fisted does not even begin to describe the dialogue in this visually stunning epic.f 2020 -09 -21 16 :18 :59.118701 + 05 :30 { "hashtag": [],
            "sentiment": "neutral" } 6 55 The shittiest movie I ’ ve seen in a while.f 2020 -09 -21 16 :18 :59.129777 + 05 :30 { "hashtag": [],
            "sentiment": "negative" } 6 56 Unwatchable.f 2020 -09 -21 16 :18 :59.12515 + 05 :30 { "hashtag": [],
            "sentiment": "neutral" } 6 57 I don ’ t know about this whole campy ‘ #Patrick Swayze revival’ thing, but for me this one is right up there with Polyester		f	2020-09-21 16:18:59.13861+05:30	{"hashtag": ["#Patrick"], "sentiment": "neutral"}	6
            58 At the time this movie was made,
            #Paul Ruebens was clearly the smartest man in the world.		f	2020-09-21 16:18:59.157475+05:30	{"hashtag": ["#Paul"], "sentiment": "positive"}	6
            59 A no - bullshit #European style thriller that is actually thrilling.		f	2020-09-21 16:18:59.168844+05:30	{"hashtag": ["#European"], "sentiment": "positive"}	6
            60 I wish I could shake the hand of every person who worked on this amazing movie
            and ask them why it ’ s called #Cloverfield.		f	2020-09-21 16:21:22.217967+05:30	{"hashtag": ["#Cloverfield"], "sentiment": "positive"}	7
            61 Damn this is one hard
            and dark son of a bitch.f 2020 -09 -21 16 :21 :22.247768 + 05 :30 { "hashtag": [],
            "sentiment": "negative" } 7 62 Well now I don ’ t like #Kinski or #Herzog or that actor #lady who says stupid shit like “Kinski was a very intuitive actor… and so am I”		f	2020-09-21 16:21:22.299644+05:30	{"hashtag": ["#Kinski", "#Herzog", "#lady"], "sentiment": "neutral"}	7
            63 Okay,
            if you start this movie nine minutes
            and forty seconds in
            and you mute the sound every time the beautiful dark - haired woman speaks,
            you too might love this movie as much as I.f 2020 -09 -21 16 :21 :22.344492 + 05 :30 { "hashtag": [],
            "sentiment": "positive" } 7 64 I doubt if I could truly like a person who doesn ’ t love this unfortunately titled masterpiece.f 2020 -09 -21 16 :21 :22.355058 + 05 :30 { "hashtag": [],
            "sentiment": "positive" } 7 65
            Go ahead rush out
                and buy this but don ’ t put it on til you ’ re good
                and drunk.f 2020 -09 -21 16 :21 :22.386211 + 05 :30 { "hashtag": [],
                "sentiment": "neutral" } 7 66 Proof that Russians working out deeply philosophical relationship problems in space is no less boring than doing it on Earth.f 2020 -09 -21 16 :21 :22.424042 + 05 :30 { "hashtag": [],
                "sentiment": "negative" } 7 67 how much is it gonna run me to have this incredible movie dubbed into english so that i can watch it instead of read it ? f 2020 -09 -21 16 :21 :22.429068 + 05 :30 { "hashtag": [],
                "sentiment": "neutral" } 7 68 Oh man this is like the episode of Matlock I always dreamed of.f 2020 -09 -21 16 :21 :22.472319 + 05 :30 { "hashtag": [],
                "sentiment": "neutral" } 7 69 Even with a great showing by #Blanchett, this was more embarrassing more often than any movie ever.		f	2020-09-21 16:21:22.482204+05:30	{"hashtag": ["#Blanchett"], "sentiment": "neutral"}	7
                70 If you time it right
                and sleep through the first half,
                you will awaken to one of the greatest psycho - thrillers of all time.f 2020 -09 -21 16 :21 :22.488263 + 05 :30 { "hashtag": [],
                "sentiment": "positive" } 7 71 I ’ m confused
                and delighted at how well they pulled off this dumb idea for a movie.f 2020 -09 -21 16 :21 :22.494014 + 05 :30 { "hashtag": [],
                "sentiment": "neutral" } 7 72 Yep,
                still awesome.f 2020 -09 -21 16 :21 :22.499794 + 05 :30 { "hashtag": [],
                "sentiment": "positive" } 7 73 The scary thing about this movie is that the funniest parts weren ’ t meant to be funny.f 2020 -09 -21 16 :21 :22.507297 + 05 :30 { "hashtag": [],
                "sentiment": "positive" } 7 74 If you ’ re making a Cary
            Grant film,
                don ’ t get Gregory Peck.f 2020 -09 -21 16 :21 :22.529352 + 05 :30 { "hashtag": [],
                "sentiment": "neutral" } 7 75 I really wanted to like this movie but it seemed to be written by an eight year old
                and scored by someone way too special.f 2020 -09 -21 16 :21 :22.534612 + 05 :30 { "hashtag": [],
                "sentiment": "positive" } 7 76 The English at their Englishy best.f 2020 -09 -21 16 :21 :22.535136 + 05 :30 { "hashtag": [],
                "sentiment": "positive" } 7 77 Shitbiscuit.f 2020 -09 -21 16 :21 :22.548392 + 05 :30 { "hashtag": [],
                "sentiment": "neutral" } 7 78 It took being trapped in a #Mobile Alabama hotel room at 3am to find out that thirty minutes into it, the actors start way kicking ass in this #dialogue marathon.		f	2020-09-21 16:21:22.554203+05:30	{"hashtag": ["#Mobile", "#dialogue"], "sentiment": "negative"}	7
                79 Kids this is why we put little breaks between the bits of #soundtrack music.		f	2020-09-21 16:21:22.560252+05:30	{"hashtag": ["#soundtrack"], "sentiment": "neutral"}	7
                80 This movie is just okay,
                but if you ’ re trying to fall asleep
                and can ’ t,
                it ’ s a godsend.f 2020 -09 -21 16 :21 :22.579817 + 05 :30 { "hashtag": [],
                "sentiment": "positive" } 7 \.--
                -- Data for Name: mindful_api_reportpost; Type: TABLE DATA; Schema: public; Owner: mindful
                --
                COPY public.mindful_api_reportpost (
                    report_id,
                    remarks,
                    report_time,
                    post_id_id,
                    user_id_id
                )
            FROM stdin;
1 nohthng 2020 -09 -21 16 :25 :08.721834 + 05 :30 20 5 2 ss 2020 -09 -21 16 :25 :17.847986 + 05 :30 70 7 3 ss 2020 -09 -21 16 :25 :27.562131 + 05 :30 66 7 4 dd 2020 -09 -21 16 :25 :36.134904 + 05 :30 70 6 \.--
-- Data for Name: mindful_api_user; Type: TABLE DATA; Schema: public; Owner: mindful
--
COPY public.mindful_api_user (
    last_login,
    user_id,
    email,
    username,
    password,
    name,
    date_of_birth,
    bio,
    profile_picture,
    allow_posting,
    last_active,
    is_superuser,
    is_admin,
    security_ans,
    security_que
)
FROM stdin;
\ N 3 preetam @mountblue.io preetam preetam 1991 -12 -12 preetam t 2020 -09 -21 15 :26 :19.622957 + 05 :30 f f delhi delhi 2020 -09 -21 15 :28 :56.852719 + 05 :30 2 shashi @mountblue.io shashi pbkdf2_sha256 $150000$Ybvl9mkdJtrh$BXp / wCaosqI5fxs4uO2iwgT4eDDSuE8cZgkljRiMfsY = shashi 1991 -12 -12 shashi is a good boy user_images / 2.jpeg t 2020 -09 -21 15 :25 :38.546799 + 05 :30 f f delhi delhi 2020 -09 -21 15 :29 :40.021351 + 05 :30 1 admin @mountblue.io admin pbkdf2_sha256 $150000$5IilOPOPSHlm$sOqPHwlsDPaxEAOpGp81rS2725B + 4xs8g / Xd92DCSEU = \ N \ N \ N t 2020 -09 -21 15 :24 :38.429713 + 05 :30 t t \ N \ N 2020 -09 -21 15 :33 :58.199712 + 05 :30 4 rohit @gmail.com rohit pbkdf2_sha256 $150000$ozXox9EScqIG$mAdkV6wmGYOiRYpfq + sDQB9EFqfGD6Ug9YekvJQweL8 = Rohit 1996 -12 -13 Rohit is great user_images / 4.jpeg t 2020 -09 -21 15 :33 :45.001315 + 05 :30 f f chess hobby 2020 -09 -21 16 :14 :58.994036 + 05 :30 5 aditya @gmail.com aditya pbkdf2_sha256 $150000$qctfJdyr81GM$zPPuoDlk5Iu / zVbRt3smez9Dfev7lJi29AWUFiky46A = aditya 1996 -12 -13 aditya is great user_images / 5.jpeg t 2020 -09 -21 16 :14 :47.209588 + 05 :30 f f chess hobby 2020 -09 -21 16 :18 :31.706137 + 05 :30 6 mukund @gmail.com mukund pbkdf2_sha256 $150000$sr6fB3AqwIci$wpflydszA + 8p5yQzu2VmfUIr2UER / VgkcQS4b + HzSZc = mukund 1996 -12 -13 mukund is great user_images / 6.jpeg t 2020 -09 -21 16 :18 :22.581832 + 05 :30 f f chess hobby 2020 -09 -21 16 :20 :11.668847 + 05 :30 7 preetom @gmail.com preetamadmin pbkdf2_sha256 $150000$SKMbny9GKAlN$c3aoR / j0Q8y / LivuLRba1APyPUzbvb0AM / ikm7zSlu4 = preetom 1996 -12 -13 preetom is great user_images / 7.jpeg t 2020 -09 -21 16 :20 :00.656572 + 05 :30 f f chess hobby \.--
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
SELECT pg_catalog.setval('public.django_admin_log_id_seq', 23, true);
--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mindful
--
SELECT pg_catalog.setval('public.django_content_type_id_seq', 11, true);
--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mindful
--
SELECT pg_catalog.setval('public.django_migrations_id_seq', 20, true);
--
-- Name: mindful_api_bookmarks_bookmark_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mindful
--
SELECT pg_catalog.setval(
        'public.mindful_api_bookmarks_bookmark_id_seq',
        6,
        true
    );
--
-- Name: mindful_api_followings_following_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mindful
--
SELECT pg_catalog.setval(
        'public.mindful_api_followings_following_id_seq',
        6,
        true
    );
--
-- Name: mindful_api_likes_like_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mindful
--
SELECT pg_catalog.setval('public.mindful_api_likes_like_id_seq', 7, true);
--
-- Name: mindful_api_post_post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mindful
--
SELECT pg_catalog.setval('public.mindful_api_post_post_id_seq', 81, true);
--
-- Name: mindful_api_reportpost_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mindful
--
SELECT pg_catalog.setval(
        'public.mindful_api_reportpost_report_id_seq',
        4,
        true
    );
--
-- Name: mindful_api_user_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mindful
--
SELECT pg_catalog.setval('public.mindful_api_user_user_id_seq', 7, true);
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