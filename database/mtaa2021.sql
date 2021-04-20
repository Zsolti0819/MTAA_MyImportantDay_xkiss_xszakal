PGDMP                         y           mtaa2021    13.2    13.2 \    ,           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            -           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            .           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            /           1262    12354286    mtaa2021    DATABASE     l   CREATE DATABASE mtaa2021 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE mtaa2021;
                postgres    false            �            1259    12354300    MyAPI_account    TABLE     �  CREATE TABLE public."MyAPI_account" (
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
 #   DROP TABLE public."MyAPI_account";
       public         heap    postgres    false            �            1259    12354298    MyAPI_account_id_seq    SEQUENCE     �   CREATE SEQUENCE public."MyAPI_account_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."MyAPI_account_id_seq";
       public          postgres    false    203            0           0    0    MyAPI_account_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."MyAPI_account_id_seq" OWNED BY public."MyAPI_account".id;
          public          postgres    false    202            �            1259    12354312    MyAPI_event    TABLE     [  CREATE TABLE public."MyAPI_event" (
    id integer NOT NULL,
    subject character varying(200) NOT NULL,
    date timestamp with time zone NOT NULL,
    place character varying(200) NOT NULL,
    priority character varying(1) NOT NULL,
    advanced character varying(500) NOT NULL,
    pic character varying(100),
    user_id integer NOT NULL
);
 !   DROP TABLE public."MyAPI_event";
       public         heap    postgres    false            �            1259    12354310    MyAPI_event_id_seq    SEQUENCE     �   CREATE SEQUENCE public."MyAPI_event_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public."MyAPI_event_id_seq";
       public          postgres    false    205            1           0    0    MyAPI_event_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public."MyAPI_event_id_seq" OWNED BY public."MyAPI_event".id;
          public          postgres    false    204            �            1259    12354373 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public         heap    postgres    false            �            1259    12354371    auth_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public          postgres    false    213            2           0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
          public          postgres    false    212            �            1259    12354383    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         heap    postgres    false            �            1259    12354381    auth_group_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public          postgres    false    215            3           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
          public          postgres    false    214            �            1259    12354365    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         heap    postgres    false            �            1259    12354363    auth_permission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public          postgres    false    211            4           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
          public          postgres    false    210            �            1259    12354415    authtoken_token    TABLE     �   CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);
 #   DROP TABLE public.authtoken_token;
       public         heap    postgres    false            �            1259    12354341    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
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
 $   DROP TABLE public.django_admin_log;
       public         heap    postgres    false            �            1259    12354339    django_admin_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public          postgres    false    209            5           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
          public          postgres    false    208            �            1259    12354331    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         heap    postgres    false            �            1259    12354329    django_content_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public          postgres    false    207            6           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
          public          postgres    false    206            �            1259    12354289    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         heap    postgres    false            �            1259    12354287    django_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public          postgres    false    201            7           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
          public          postgres    false    200            �            1259    12354433    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         heap    postgres    false            Y           2604    12354303    MyAPI_account id    DEFAULT     x   ALTER TABLE ONLY public."MyAPI_account" ALTER COLUMN id SET DEFAULT nextval('public."MyAPI_account_id_seq"'::regclass);
 A   ALTER TABLE public."MyAPI_account" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    202    203    203            Z           2604    12354315    MyAPI_event id    DEFAULT     t   ALTER TABLE ONLY public."MyAPI_event" ALTER COLUMN id SET DEFAULT nextval('public."MyAPI_event_id_seq"'::regclass);
 ?   ALTER TABLE public."MyAPI_event" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    205    204    205            _           2604    12354376    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    213    212    213            `           2604    12354386    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215            ^           2604    12354368    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    211    211            \           2604    12354344    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    208    209            [           2604    12354334    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    206    207    207            X           2604    12354292    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    201    200    201                      0    12354300    MyAPI_account 
   TABLE DATA           �   COPY public."MyAPI_account" (id, password, email, username, date_joined, last_login, is_admin, is_active, is_staff, is_superuser) FROM stdin;
    public          postgres    false    203   �x                 0    12354312    MyAPI_event 
   TABLE DATA           c   COPY public."MyAPI_event" (id, subject, date, place, priority, advanced, pic, user_id) FROM stdin;
    public          postgres    false    205   �y       %          0    12354373 
   auth_group 
   TABLE DATA           .   COPY public.auth_group (id, name) FROM stdin;
    public          postgres    false    213   �y       '          0    12354383    auth_group_permissions 
   TABLE DATA           M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public          postgres    false    215   z       #          0    12354365    auth_permission 
   TABLE DATA           N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public          postgres    false    211   !z       (          0    12354415    authtoken_token 
   TABLE DATA           @   COPY public.authtoken_token (key, created, user_id) FROM stdin;
    public          postgres    false    216   ~{       !          0    12354341    django_admin_log 
   TABLE DATA           �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public          postgres    false    209   �{                 0    12354331    django_content_type 
   TABLE DATA           C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public          postgres    false    207   |                 0    12354289    django_migrations 
   TABLE DATA           C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public          postgres    false    201   �|       )          0    12354433    django_session 
   TABLE DATA           P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public          postgres    false    217   n~       8           0    0    MyAPI_account_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."MyAPI_account_id_seq"', 2, true);
          public          postgres    false    202            9           0    0    MyAPI_event_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."MyAPI_event_id_seq"', 1, false);
          public          postgres    false    204            :           0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
          public          postgres    false    212            ;           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
          public          postgres    false    214            <           0    0    auth_permission_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_permission_id_seq', 32, true);
          public          postgres    false    210            =           0    0    django_admin_log_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);
          public          postgres    false    208            >           0    0    django_content_type_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.django_content_type_id_seq', 8, true);
          public          postgres    false    206            ?           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 20, true);
          public          postgres    false    200            e           2606    12354307 %   MyAPI_account MyAPI_account_email_key 
   CONSTRAINT     e   ALTER TABLE ONLY public."MyAPI_account"
    ADD CONSTRAINT "MyAPI_account_email_key" UNIQUE (email);
 S   ALTER TABLE ONLY public."MyAPI_account" DROP CONSTRAINT "MyAPI_account_email_key";
       public            postgres    false    203            g           2606    12354305     MyAPI_account MyAPI_account_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."MyAPI_account"
    ADD CONSTRAINT "MyAPI_account_pkey" PRIMARY KEY (id);
 N   ALTER TABLE ONLY public."MyAPI_account" DROP CONSTRAINT "MyAPI_account_pkey";
       public            postgres    false    203            j           2606    12354309 (   MyAPI_account MyAPI_account_username_key 
   CONSTRAINT     k   ALTER TABLE ONLY public."MyAPI_account"
    ADD CONSTRAINT "MyAPI_account_username_key" UNIQUE (username);
 V   ALTER TABLE ONLY public."MyAPI_account" DROP CONSTRAINT "MyAPI_account_username_key";
       public            postgres    false    203            l           2606    12354320    MyAPI_event MyAPI_event_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."MyAPI_event"
    ADD CONSTRAINT "MyAPI_event_pkey" PRIMARY KEY (id);
 J   ALTER TABLE ONLY public."MyAPI_event" DROP CONSTRAINT "MyAPI_event_pkey";
       public            postgres    false    205            }           2606    12354413    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public            postgres    false    213            �           2606    12354399 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public            postgres    false    215    215            �           2606    12354388 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public            postgres    false    215                       2606    12354378    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public            postgres    false    213            x           2606    12354390 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public            postgres    false    211    211            z           2606    12354370 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public            postgres    false    211            �           2606    12354419 $   authtoken_token authtoken_token_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);
 N   ALTER TABLE ONLY public.authtoken_token DROP CONSTRAINT authtoken_token_pkey;
       public            postgres    false    216            �           2606    12354421 +   authtoken_token authtoken_token_user_id_key 
   CONSTRAINT     i   ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);
 U   ALTER TABLE ONLY public.authtoken_token DROP CONSTRAINT authtoken_token_user_id_key;
       public            postgres    false    216            t           2606    12354350 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public            postgres    false    209            o           2606    12354338 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public            postgres    false    207    207            q           2606    12354336 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public            postgres    false    207            b           2606    12354297 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public            postgres    false    201            �           2606    12354440 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public            postgres    false    217            c           1259    12354321 !   MyAPI_account_email_b7777fe4_like    INDEX     t   CREATE INDEX "MyAPI_account_email_b7777fe4_like" ON public."MyAPI_account" USING btree (email varchar_pattern_ops);
 7   DROP INDEX public."MyAPI_account_email_b7777fe4_like";
       public            postgres    false    203            h           1259    12354322 $   MyAPI_account_username_c817cfaa_like    INDEX     z   CREATE INDEX "MyAPI_account_username_c817cfaa_like" ON public."MyAPI_account" USING btree (username varchar_pattern_ops);
 :   DROP INDEX public."MyAPI_account_username_c817cfaa_like";
       public            postgres    false    203            m           1259    12354328    MyAPI_event_user_id_c668d7c0    INDEX     [   CREATE INDEX "MyAPI_event_user_id_c668d7c0" ON public."MyAPI_event" USING btree (user_id);
 2   DROP INDEX public."MyAPI_event_user_id_c668d7c0";
       public            postgres    false    205            {           1259    12354414    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public            postgres    false    213            �           1259    12354410 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public            postgres    false    215            �           1259    12354411 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public            postgres    false    215            v           1259    12354396 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public            postgres    false    211            �           1259    12354427 !   authtoken_token_key_10f0b77e_like    INDEX     p   CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);
 5   DROP INDEX public.authtoken_token_key_10f0b77e_like;
       public            postgres    false    216            r           1259    12354361 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public            postgres    false    209            u           1259    12354362 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public            postgres    false    209            �           1259    12354442 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public            postgres    false    217            �           1259    12354441 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public            postgres    false    217            �           2606    12354323 <   MyAPI_event MyAPI_event_user_id_c668d7c0_fk_MyAPI_account_id    FK CONSTRAINT     �   ALTER TABLE ONLY public."MyAPI_event"
    ADD CONSTRAINT "MyAPI_event_user_id_c668d7c0_fk_MyAPI_account_id" FOREIGN KEY (user_id) REFERENCES public."MyAPI_account"(id) DEFERRABLE INITIALLY DEFERRED;
 j   ALTER TABLE ONLY public."MyAPI_event" DROP CONSTRAINT "MyAPI_event_user_id_c668d7c0_fk_MyAPI_account_id";
       public          postgres    false    203    2919    205            �           2606    12354405 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public          postgres    false    215    211    2938            �           2606    12354400 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public          postgres    false    215    2943    213            �           2606    12354391 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public          postgres    false    2929    207    211            �           2606    12354428 D   authtoken_token authtoken_token_user_id_35299eff_fk_MyAPI_account_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT "authtoken_token_user_id_35299eff_fk_MyAPI_account_id" FOREIGN KEY (user_id) REFERENCES public."MyAPI_account"(id) DEFERRABLE INITIALLY DEFERRED;
 p   ALTER TABLE ONLY public.authtoken_token DROP CONSTRAINT "authtoken_token_user_id_35299eff_fk_MyAPI_account_id";
       public          postgres    false    2919    203    216            �           2606    12354351 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public          postgres    false    2929    207    209            �           2606    12354356 F   django_admin_log django_admin_log_user_id_c564eba6_fk_MyAPI_account_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT "django_admin_log_user_id_c564eba6_fk_MyAPI_account_id" FOREIGN KEY (user_id) REFERENCES public."MyAPI_account"(id) DEFERRABLE INITIALLY DEFERRED;
 r   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT "django_admin_log_user_id_c564eba6_fk_MyAPI_account_id";
       public          postgres    false    203    2919    209               �   x�u�OO�@��3|
ܚ���&&���ZI՘*�"5��~zi<���4y/�c|-T��^�H��,�=k�X&t�A5��O��ǫŰ���-�[��O��<�4V˻��g�N��Ω�,R���L�Y���gp���l �����"J<��w&릊Pf\J�oa�~He�:_'Z�:�rY��i��o�)r�����E��Tڧ*-��Y�wX�GD�i=T�Q���ئi� �+]            x������ � �      %      x������ � �      '      x������ � �      #   M  x�]�An�0��}���������TE�EQ���Pq��ɳg&;��-~����!6�45�tlB�קqf��w�ZOd��1(�<1l	N�����-��)�)�z`�ղK���n�S��S?؝�Su��e����D%�Q�C�<^��bZ
��uW��q���xN)�*0nk��b��]���`���׋u[��¨R��m+�D�w��ԫ�V���m;
�ͺ^ƲAge��y���1��J\-�H?!�����z�(s����/ b���y�qL��͞p�^-;tT���Z*+Έz*�����3=��ٶj��- j�A����a�Yk����1      (   n   x�e̱�0�ښ"}`�I�Eҳ��hk��Թ�K�4�X\k�!gŭ"ɺ$�k\
pS����r���x�xC7i}V�S4��W8a.��i�\��?"�A��_��s�־��!]      !      x������ � �         s   x�M��
1�ϓ��[�z� � ^JwX��L�L���KU���/k
㜄�:�xi�P�~��eNfI�O3�;�*�L�e���=w�~CG],�����L!F��8~3���V ޼1/         �  x���͎� ���St_�.fv]vQ�P�
%ԃj�����CR��d��ǽ�\�͏��BE7��L� �D��/@_�3h)�Wh�~�v��<�����(YcN��0)��~� ��K׆3;�7�f�����Z�mf��]I����wo:<�zwL��M3K~j>��60��h{��V��T��fh&�4�V��8�0�y�M�q0��۱K��PZYlՕ�6�2����w!�'%ï1y)��)���H����!���c˥Ζ~���"Sj%(̞�`��*Cm���ޝL�a.�bC�;Ϧ�1(�S���xŵ���s��>**Ir�1����(J6T�2=�I���`��R�˔,�8�~����H"[]�0G��>�!p�)���u��@�$ ��j����f�[�w/$�J�����?(k�      )      x������ � �     