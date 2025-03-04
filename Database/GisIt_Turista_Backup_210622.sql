PGDMP          %                z           gisit_turista    13.1    13.1 S    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    30027    gisit_turista    DATABASE     q   CREATE DATABASE gisit_turista WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE gisit_turista;
                postgres    false                        3079    30028    postgis 	   EXTENSION     ;   CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;
    DROP EXTENSION postgis;
                   false            �           0    0    EXTENSION postgis    COMMENT     ^   COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';
                        false    2            �            1259    31056    city    TABLE     �   CREATE TABLE public.city (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    description character varying,
    zoom_level smallint NOT NULL,
    image_url_location character varying NOT NULL,
    geom public.geometry(Point,3857)
);
    DROP TABLE public.city;
       public         heap    postgres    false    2    2    2    2    2    2    2    2            �           0    0    COLUMN city.zoom_level    COMMENT     P   COMMENT ON COLUMN public.city.zoom_level IS 'Zoom level for web presentation.';
          public          postgres    false    209            �            1259    31054    city_id_seq    SEQUENCE     �   CREATE SEQUENCE public.city_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.city_id_seq;
       public          postgres    false    209            �           0    0    city_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.city_id_seq OWNED BY public.city.id;
          public          postgres    false    208            �            1259    31121    city_translation    TABLE     �   CREATE TABLE public.city_translation (
    id integer NOT NULL,
    language_id integer NOT NULL,
    city_id integer NOT NULL,
    text character varying NOT NULL
);
 $   DROP TABLE public.city_translation;
       public         heap    postgres    false            �            1259    31119    city_translation_id_seq    SEQUENCE     �   CREATE SEQUENCE public.city_translation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.city_translation_id_seq;
       public          postgres    false    219            �           0    0    city_translation_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.city_translation_id_seq OWNED BY public.city_translation.id;
          public          postgres    false    218            �            1259    31110    language    TABLE     �   CREATE TABLE public.language (
    id integer NOT NULL,
    name character varying(20) NOT NULL,
    image_url character varying NOT NULL
);
    DROP TABLE public.language;
       public         heap    postgres    false            �            1259    31108    language_id_seq    SEQUENCE     �   CREATE SEQUENCE public.language_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.language_id_seq;
       public          postgres    false    217            �           0    0    language_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.language_id_seq OWNED BY public.language.id;
          public          postgres    false    216            �            1259    31099    legend_attribute    TABLE     �   CREATE TABLE public.legend_attribute (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    image_url character varying NOT NULL,
    description character varying
);
 $   DROP TABLE public.legend_attribute;
       public         heap    postgres    false            �            1259    31097    legend_attribute_id_seq    SEQUENCE     �   CREATE SEQUENCE public.legend_attribute_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.legend_attribute_id_seq;
       public          postgres    false    215            �           0    0    legend_attribute_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.legend_attribute_id_seq OWNED BY public.legend_attribute.id;
          public          postgres    false    214            �            1259    31158    legend_attribute_translation    TABLE     �   CREATE TABLE public.legend_attribute_translation (
    id integer NOT NULL,
    language_id integer NOT NULL,
    legend_attribute_id integer NOT NULL,
    text character varying NOT NULL
);
 0   DROP TABLE public.legend_attribute_translation;
       public         heap    postgres    false            �            1259    31156 #   legend_attribute_translation_id_seq    SEQUENCE     �   CREATE SEQUENCE public.legend_attribute_translation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.legend_attribute_translation_id_seq;
       public          postgres    false    223            �           0    0 #   legend_attribute_translation_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.legend_attribute_translation_id_seq OWNED BY public.legend_attribute_translation.id;
          public          postgres    false    222            �            1259    31078    location    TABLE       CREATE TABLE public.location (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    description character varying,
    web_address character varying,
    email character varying,
    facebook character varying,
    instagram character varying,
    address character varying,
    phone_number character varying,
    mobile_phone_number character varying,
    image_url_location character varying NOT NULL,
    location_type_id integer NOT NULL,
    city_id integer NOT NULL,
    priority integer NOT NULL,
    availability boolean NOT NULL,
    geom public.geometry(Point,3857),
    image_position character varying(50)
);
    DROP TABLE public.location;
       public         heap    postgres    false    2    2    2    2    2    2    2    2            �           0    0    COLUMN location.priority    COMMENT     Z   COMMENT ON COLUMN public.location.priority IS 'Visit priority, 1 - highest, 5 - lowest.';
          public          postgres    false    213            �           0    0    COLUMN location.availability    COMMENT     U   COMMENT ON COLUMN public.location.availability IS 'Should (not) be visible on map.';
          public          postgres    false    213            �            1259    31076    location_id_seq    SEQUENCE     �   CREATE SEQUENCE public.location_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.location_id_seq;
       public          postgres    false    213            �           0    0    location_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.location_id_seq OWNED BY public.location.id;
          public          postgres    false    212            �            1259    31137    location_translation    TABLE     �   CREATE TABLE public.location_translation (
    id integer NOT NULL,
    language_id integer NOT NULL,
    location_id integer NOT NULL,
    city_id integer NOT NULL,
    text character varying NOT NULL
);
 (   DROP TABLE public.location_translation;
       public         heap    postgres    false            �            1259    31135    location_translation_id_seq    SEQUENCE     �   CREATE SEQUENCE public.location_translation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.location_translation_id_seq;
       public          postgres    false    221            �           0    0    location_translation_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.location_translation_id_seq OWNED BY public.location_translation.id;
          public          postgres    false    220            �            1259    31067    location_type    TABLE     �   CREATE TABLE public.location_type (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    description character varying
);
 !   DROP TABLE public.location_type;
       public         heap    postgres    false            �            1259    31065    location_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.location_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.location_type_id_seq;
       public          postgres    false    211            �           0    0    location_type_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.location_type_id_seq OWNED BY public.location_type.id;
          public          postgres    false    210            �            1259    31045    municipality    TABLE     �   CREATE TABLE public.municipality (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    geom public.geometry(MultiPolygon,3857)
);
     DROP TABLE public.municipality;
       public         heap    postgres    false    2    2    2    2    2    2    2    2            �            1259    31043    municipality_id_seq    SEQUENCE     �   CREATE SEQUENCE public.municipality_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.municipality_id_seq;
       public          postgres    false    207            �           0    0    municipality_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.municipality_id_seq OWNED BY public.municipality.id;
          public          postgres    false    206            �            1259    31225    test_app_cities    VIEW     �  CREATE VIEW public.test_app_cities AS
 SELECT city.id,
    city.name,
    city.description,
    city_translation.text AS description_eng,
    city.zoom_level,
    city.image_url_location,
    city.geom,
    round((public.st_y(public.st_transform(city.geom, 4326)))::numeric, 4) AS x_coord,
    round((public.st_x(public.st_transform(city.geom, 4326)))::numeric, 4) AS y_coord
   FROM (public.city
     JOIN public.city_translation ON ((city.id = city_translation.city_id)));
 "   DROP VIEW public.test_app_cities;
       public          postgres    false    209    209    209    2    2    2    2    2    2    2    2    2    209    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    209    219    219    209    2    2    2    2    2    2    2    2            �            1259    31229    test_app_locations    VIEW     q  CREATE VIEW public.test_app_locations AS
 SELECT location.id AS location_id,
    city.id AS city_id,
    city.name AS city_name,
    location.name,
    location.image_url_location,
    location_type.name AS location_type,
    location_type.id AS location_type_id,
    location.priority,
    location.availability,
    location.geom,
    round((public.st_y(public.st_transform(location.geom, 4326)))::numeric, 4) AS x_coord,
    round((public.st_x(public.st_transform(location.geom, 4326)))::numeric, 4) AS y_coord,
    location.description,
    location_translation.text AS description_eng,
    location.image_position
   FROM (((public.location
     JOIN public.location_type ON ((location.location_type_id = location_type.id)))
     JOIN public.city ON ((location.city_id = city.id)))
     JOIN public.location_translation ON ((location.id = location_translation.location_id)));
 %   DROP VIEW public.test_app_locations;
       public          postgres    false    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    2    209    209    211    211    213    213    213    213    213    213    213    213    213    213    221    221    2    2    2    2    2    2    2    2            �            1259    31238    test_app_locationtypes    VIEW     �   CREATE VIEW public.test_app_locationtypes AS
 SELECT location_type.id,
    location_type.name,
    location_type.description
   FROM public.location_type;
 )   DROP VIEW public.test_app_locationtypes;
       public          postgres    false    211    211    211            �           2604    31059    city id    DEFAULT     b   ALTER TABLE ONLY public.city ALTER COLUMN id SET DEFAULT nextval('public.city_id_seq'::regclass);
 6   ALTER TABLE public.city ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    208    209            �           2604    31124    city_translation id    DEFAULT     z   ALTER TABLE ONLY public.city_translation ALTER COLUMN id SET DEFAULT nextval('public.city_translation_id_seq'::regclass);
 B   ALTER TABLE public.city_translation ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218    219            �           2604    31113    language id    DEFAULT     j   ALTER TABLE ONLY public.language ALTER COLUMN id SET DEFAULT nextval('public.language_id_seq'::regclass);
 :   ALTER TABLE public.language ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217            �           2604    31102    legend_attribute id    DEFAULT     z   ALTER TABLE ONLY public.legend_attribute ALTER COLUMN id SET DEFAULT nextval('public.legend_attribute_id_seq'::regclass);
 B   ALTER TABLE public.legend_attribute ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215            �           2604    31161    legend_attribute_translation id    DEFAULT     �   ALTER TABLE ONLY public.legend_attribute_translation ALTER COLUMN id SET DEFAULT nextval('public.legend_attribute_translation_id_seq'::regclass);
 N   ALTER TABLE public.legend_attribute_translation ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    223    223            �           2604    31081    location id    DEFAULT     j   ALTER TABLE ONLY public.location ALTER COLUMN id SET DEFAULT nextval('public.location_id_seq'::regclass);
 :   ALTER TABLE public.location ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    213    212    213            �           2604    31140    location_translation id    DEFAULT     �   ALTER TABLE ONLY public.location_translation ALTER COLUMN id SET DEFAULT nextval('public.location_translation_id_seq'::regclass);
 F   ALTER TABLE public.location_translation ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220    221            �           2604    31070    location_type id    DEFAULT     t   ALTER TABLE ONLY public.location_type ALTER COLUMN id SET DEFAULT nextval('public.location_type_id_seq'::regclass);
 ?   ALTER TABLE public.location_type ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    210    211            �           2604    31048    municipality id    DEFAULT     r   ALTER TABLE ONLY public.municipality ALTER COLUMN id SET DEFAULT nextval('public.municipality_id_seq'::regclass);
 >   ALTER TABLE public.municipality ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    207    206    207            y          0    31056    city 
   TABLE DATA           [   COPY public.city (id, name, description, zoom_level, image_url_location, geom) FROM stdin;
    public          postgres    false    209   �k       �          0    31121    city_translation 
   TABLE DATA           J   COPY public.city_translation (id, language_id, city_id, text) FROM stdin;
    public          postgres    false    219   Hl       �          0    31110    language 
   TABLE DATA           7   COPY public.language (id, name, image_url) FROM stdin;
    public          postgres    false    217   �l                 0    31099    legend_attribute 
   TABLE DATA           L   COPY public.legend_attribute (id, name, image_url, description) FROM stdin;
    public          postgres    false    215   �l       �          0    31158    legend_attribute_translation 
   TABLE DATA           b   COPY public.legend_attribute_translation (id, language_id, legend_attribute_id, text) FROM stdin;
    public          postgres    false    223   �l       }          0    31078    location 
   TABLE DATA           �   COPY public.location (id, name, description, web_address, email, facebook, instagram, address, phone_number, mobile_phone_number, image_url_location, location_type_id, city_id, priority, availability, geom, image_position) FROM stdin;
    public          postgres    false    213   m       �          0    31137    location_translation 
   TABLE DATA           [   COPY public.location_translation (id, language_id, location_id, city_id, text) FROM stdin;
    public          postgres    false    221   [�       {          0    31067    location_type 
   TABLE DATA           >   COPY public.location_type (id, name, description) FROM stdin;
    public          postgres    false    211   ��       w          0    31045    municipality 
   TABLE DATA           6   COPY public.municipality (id, name, geom) FROM stdin;
    public          postgres    false    207   "�       �          0    30335    spatial_ref_sys 
   TABLE DATA           X   COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
    public          postgres    false    202   �       �           0    0    city_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.city_id_seq', 1, true);
          public          postgres    false    208            �           0    0    city_translation_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.city_translation_id_seq', 1, true);
          public          postgres    false    218            �           0    0    language_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.language_id_seq', 2, true);
          public          postgres    false    216            �           0    0    legend_attribute_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.legend_attribute_id_seq', 1, false);
          public          postgres    false    214            �           0    0 #   legend_attribute_translation_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.legend_attribute_translation_id_seq', 1, false);
          public          postgres    false    222            �           0    0    location_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.location_id_seq', 76, true);
          public          postgres    false    212            �           0    0    location_translation_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.location_translation_id_seq', 11, true);
          public          postgres    false    220            �           0    0    location_type_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.location_type_id_seq', 13, true);
          public          postgres    false    210            �           0    0    municipality_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.municipality_id_seq', 1, true);
          public          postgres    false    206            �           2606    31064    city city_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.city DROP CONSTRAINT city_pkey;
       public            postgres    false    209            �           2606    31129 &   city_translation city_translation_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.city_translation
    ADD CONSTRAINT city_translation_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.city_translation DROP CONSTRAINT city_translation_pkey;
       public            postgres    false    219            �           2606    31118    language language_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.language
    ADD CONSTRAINT language_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.language DROP CONSTRAINT language_pkey;
       public            postgres    false    217            �           2606    31107 &   legend_attribute legend_attribute_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.legend_attribute
    ADD CONSTRAINT legend_attribute_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.legend_attribute DROP CONSTRAINT legend_attribute_pkey;
       public            postgres    false    215            �           2606    31166 >   legend_attribute_translation legend_attribute_translation_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.legend_attribute_translation
    ADD CONSTRAINT legend_attribute_translation_pkey PRIMARY KEY (id);
 h   ALTER TABLE ONLY public.legend_attribute_translation DROP CONSTRAINT legend_attribute_translation_pkey;
       public            postgres    false    223            �           2606    31086    location location_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.location
    ADD CONSTRAINT location_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.location DROP CONSTRAINT location_pkey;
       public            postgres    false    213            �           2606    31145 .   location_translation location_translation_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.location_translation
    ADD CONSTRAINT location_translation_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.location_translation DROP CONSTRAINT location_translation_pkey;
       public            postgres    false    221            �           2606    31075     location_type location_type_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.location_type
    ADD CONSTRAINT location_type_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.location_type DROP CONSTRAINT location_type_pkey;
       public            postgres    false    211            �           2606    31050    municipality municipality_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.municipality
    ADD CONSTRAINT municipality_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.municipality DROP CONSTRAINT municipality_pkey;
       public            postgres    false    207            �           2606    31130 2   city_translation city_translation_language_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.city_translation
    ADD CONSTRAINT city_translation_language_id_fkey FOREIGN KEY (language_id) REFERENCES public.language(id) ON DELETE SET NULL;
 \   ALTER TABLE ONLY public.city_translation DROP CONSTRAINT city_translation_language_id_fkey;
       public          postgres    false    217    219    3806            �           2606    31167 J   legend_attribute_translation legend_attribute_translation_language_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.legend_attribute_translation
    ADD CONSTRAINT legend_attribute_translation_language_id_fkey FOREIGN KEY (language_id) REFERENCES public.language(id) ON DELETE SET NULL;
 t   ALTER TABLE ONLY public.legend_attribute_translation DROP CONSTRAINT legend_attribute_translation_language_id_fkey;
       public          postgres    false    217    223    3806            �           2606    31172 R   legend_attribute_translation legend_attribute_translation_legend_attribute_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.legend_attribute_translation
    ADD CONSTRAINT legend_attribute_translation_legend_attribute_id_fkey FOREIGN KEY (legend_attribute_id) REFERENCES public.legend_attribute(id) ON DELETE SET NULL;
 |   ALTER TABLE ONLY public.legend_attribute_translation DROP CONSTRAINT legend_attribute_translation_legend_attribute_id_fkey;
       public          postgres    false    223    215    3804            �           2606    31092    location location_city_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.location
    ADD CONSTRAINT location_city_id_fkey FOREIGN KEY (city_id) REFERENCES public.city(id) ON DELETE SET NULL;
 H   ALTER TABLE ONLY public.location DROP CONSTRAINT location_city_id_fkey;
       public          postgres    false    213    209    3798            �           2606    31087 '   location location_location_type_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.location
    ADD CONSTRAINT location_location_type_id_fkey FOREIGN KEY (location_type_id) REFERENCES public.location_type(id) ON DELETE SET NULL;
 Q   ALTER TABLE ONLY public.location DROP CONSTRAINT location_location_type_id_fkey;
       public          postgres    false    211    3800    213            �           2606    31151 6   location_translation location_translation_city_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.location_translation
    ADD CONSTRAINT location_translation_city_id_fkey FOREIGN KEY (city_id) REFERENCES public.city(id) ON DELETE SET NULL;
 `   ALTER TABLE ONLY public.location_translation DROP CONSTRAINT location_translation_city_id_fkey;
       public          postgres    false    221    209    3798            �           2606    31146 :   location_translation location_translation_language_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.location_translation
    ADD CONSTRAINT location_translation_language_id_fkey FOREIGN KEY (language_id) REFERENCES public.language(id) ON DELETE SET NULL;
 d   ALTER TABLE ONLY public.location_translation DROP CONSTRAINT location_translation_language_id_fkey;
       public          postgres    false    3806    221    217            y   j   x^3����OJ��J��/�W�JU�/�,V�JT�I��qpf��X����$&����%��r!��X0`bjidbd�50p6prt46511����� ~��      �   6   x^3�4�4���,V �D�����̂���<���"������ļ�D=�=... b��      �   7   x^3�.*(����())���/J-�ILN--��K���2�t�K��,��!���� !r            x^����� � �      �      x^����� � �      }      x^���n�X��Ǫ�80�3Ǧ$�g�lWW�*	ڕ�Ph �,F���5Шg�tj~qQ� �F�����o���,�p� �ɳ�>{���:ǭ���$���(��`z�*��#��x��׫/��]��??O�e���Y��$Q���Nc�p���O�i6�+�*������r���3p���6�vc��qp�%�k/���$�綡Ϡwo����6��oSo�Zx&Y���b��]л��:���ƛ�a�{�>�Q���\t��v4n��s�8�O\}���k\$��NSo~��G�Ak��.���o\/}M8�=3)��U��j17�׭���ʸ|њ��ԏ�;����_Vp�:�!�v�]譎�y�z ���ѩ;�ƻa��K/b�sl�ׯF~��W��;��w��ɑ9~xP���_�������"������A���0;��l�����gܭ;}\���n�IR�\���sx��ᠷ����^9h��Ǻ}����#���}���
����E0���������'������푯�l������WJ�W_U�_�u��;eƵZ�x�i�0��p�H����z�s*����lz���G�ެ�<v�������<L�m�������9��'�׬�?��6��*�Fߡ��N���cg\��z&�$���$���6VՂ~c$�E�|��P[�Z��jTq��񃿎q�2�&�H�������*��v��/f�f�o��ؒ�9Xᛗ�Q�U;�}ַ��q��![��;w�p�_�zN�mE��Ǝj��/[z�?4sǹt�xOT�f�]~q������G�E�j�Kǵ/wmw7�����,hמ���3�ۭЪd\��x㥋'V�����jժM��i�����3����;��A�tý�]�:���>O�{0lU���iU�h\+���1��
�^�C&8N4��u��}�s[�k兞�_�	�3t���Z\v���溴5i����T�Ɵ~�U�5:�Ѯ�s�ƅ�k0�M0Kith�}�+d��,��#����;u�Q)n�K���0�E�C�@�.�IBP���%SFI
?��)}�[#�}������ћdz|�r	��hP)V��s+����$]K��%i�*��1����E���H�;�Z�8vzW[�2�0] K�J��е]���i�گ�b�ޔ�t�Y�����A�}�4/?�D`n!�����C�q��^^���?�krſdMg��h��I
������F�*,��n\�Ua+��D]�2X��>�=��z�}U�r:n�EE���Bn<s�)��l�w8t�
����Em�:�Ɗ������=4lV�1�wEh�~桓�ű�wu��ӳ����d:I�����;U��?�1,0��7��mo��.��WhM�:��/+��#Q�	�Ա���䉭aU�M��h��P���nOhO���Aoث(�lô�;!��,���j-a*y��:� 7�M^zdT4mE!
��$i\ٛ�v����n����](�s��vc���I&@\>eA;`ܩ�I��h��S��!u���˳�־q�v�H����FVk^o���E#�#Ȏw|�n��p�8�t�=�Ug�%u{���s�����vl�z�۝�_��ڣ^Y��}u��,D����{��Z�����/�ly�(v����N�:���xM3�J	?^ ��?�U���t���깍�^dޤ�j����Y�R����ٶ;��6�VC��Ы�:���ض��.��> ��~e/�q�W��2�z�ƏW`?5כ33Lo�x��{?%i��>>�E}g8��J%:ή��ƏAH�7�<1iX�zʿ����x��B��\��H��v���\'�d��3^������z��l�� 1��ߚ|�z"����G��e�I��!P��3�A+?3�L��Y�o�1��
z`�O�S��}���}��՚�zO�>e�&[���7���?R��zۘ��X�����M��<�䛕Ow1_�>S�u:�+��kv�|�M��W�Cw��;66����%vf2��W��c
e.�_�e��X��V�&�rpb"DL;t6㚀�k�B��&s��'����DKuj�e�HV���X���j�c]!Lexm�ݪԦ��٤>W՝M-dd�Q��m=^�M1������,�֊����3��Ǜ{g_��s�`��󸁊���
���yo���;�/gm�4�v�� ��^����Hʻd�,���g��؎���m�1'��Mt���Zk�@i���Xɴ0��"�E�#�yjhe%ޝ����[;/5n����m�L�l���fz���aQ��'����ԟ�I�gC2B�Ȗ�?�����,�~�	&r;��^h�����$11X%E"F��o�i6���[<���٣`+�d�24b�Jf�����;��\'K�$�gd��@�D�`�Y+mtG�4x]
���j�S=R���/�,)�yx���SL,2��R��Ȭ����y|\�΋�ߗ���6�T��.Ay����YEW�<�Ph��4O�>���і�3d>�8�OLn�Z	M�"�N���*s&ū+�ˣ��z̞0de�.Y�/Ij�p̳! ��|6�	/	W$#��J�$�������0���*��#(?>=�"ZL`g)�����dc��TH���J6�׀��]+�my�����;E�c���<�Ef�c��
�y��kq�@�g�F�M��]��S:�<��-~�UBϷ$k���(�0���O���5I�Y�b��x� ȇ3͔�����t��$��S|�gˋ�&,��Л�ǹR��\�YyS/��['v�s�pl7��p��,&�H=>���M,A�-��������m�fphLX������ƹ����TR~�NR�m�B�UR�l�Rަ:�3~0@J.^�(�j�-y<+l\E)���;��}���u�Ry�2eƴ�(�D� ����GS������3n��C�=���]�yLq��g�,���gw�<?���|jolVk[��S�Ѽ(e��jF����M{F��VK8���L��S�N�Sl�Qi�C�w�똣��b?���pķ �m�Af�fU�0@ ���-k���E �╄�F&Ɏc=�(�5ʋ����NV�id �\o)>�:��o���][��%�������SV3b_�W�X�)V���������-����㗱u����~o}���GBt���@
��b�m���l���؝�7*��%Iq�[�Z&	,Y�*�I������d	�����[,N[�Il)q���oJ�%¢�������:e������93?���b
Y����.�k�#sGs�i�T����i)�(���4�3%�~ŏ ^J�QJ���?A:�Kr�u���U��ړ'8�p�,�"ؠ`Q�lY˟%��#�*[9�C�Ĩ��v�M;h��	�������lc3\�Y��N��g�J��lt�S�R<�����E{�}��6
w�zA�m�����˝f�����)>@�r~��&2��ܲp��\`%���B�T�����^�=W0���o���G�l�&�[}3?Z.�ڝq�1X��v������I)=��ӰdLb����ޞ�Zf@��B%�FLX= T�6Wp�/)<Fl��Gv�g���Gt���k,+#�
r��;�z�r�n�|�3�2X��j/]���9	7$�\G�	
3�)�Ν?)����\�,�"罩��-����-TF��cbɊ�, �3Q(�;4�Z�)F��H�iRd�(�D6�W.Y%6|�Je-9y<�6ϯe������.�_~a�N��a
ܻ��Q�%x�4���0v����Gr?ΐ�)�G�L��i�v�B	���Ȣq���E	J^p�#��h.�D��_�������J�I��ȖW�(�x�B�^Z�q�<�w<lk�?���䉌L��ȅj�g,�)-��S��b��)N>؝��[�\�����6���آ휷��0rFˠ�Lx��t�.Sҳ��[ED��0�JFt�I[�6~rd�g��Ѩ�ZlJ5�ҕZ%���V�Q�m�ɋ�w��W].f,�x�wzb�Y�w2��H�ī� 7  �h	�&�9J[-t���+����:��p���}�݁E+8�X,�gSwo��
?y�� UC@��GܳX��<�-��_�{j-�*`+~��� ��ڶm��R�@W�!* H����x�m�`�Ujj���L��֤;`8�AO��P&4�IP+��e�����RN�-4v��"��C>"%!�KTDnud���@?�Z�eؿz�K���0�p���q�@z�d�'�dy�	g�)�+7쿦��hw�������?�5�[=RZ�E0}1R��k������ߩͅp,(��X�J#y�ؖ��لPD�M=G$�8� �)�q�!���EB�¡X���"Fk�Ȥ1����E�(peW�-Ϝ���&��
v�w��
[��9Z��[;���@O&�/�^;Qk�e��:�L���B�D�L��3�&:(�Df	Z�$�C���4��튆�6���� ��i�u�S)�_ɮ_�����>���} �	���V	���'��<_m��P�[���)bJ�ɪ1���eQe�T���]�U�s"{��T���t"�%��&�L�l�I��6���vB�j�7�/�ۭ��S��$:|>��m��9H+P��4�j����S� �ye�Aސ��ɝ#���G�mAf�MR�L���]\T:�H,��fc,�W����(���@�]`ÖL��	�[Ǩ����Yߨ��1��Ut�9�<���(��>0�GC �8��=VP��ŷb���qLq�T��������5���O��8�B�����UlJQ�k0UH�$��&C54x�>�E!�K?�^<6|و�쾎�N��ߎ�W�Ew��D�aɨ�����2�����X���x��k�U� 
�r�>~�/�n�,(��w+�ƹ�l;��&j�e�� ���9���8@��v_h��Ć�N�D���du��,��Y,\��N�N��J�Wk�%�v[����.�gB� ��c�%a��F=)K��\oR����b�	���sՙD�*Ks�cjƊlQݳ�1�ݘ�m���ܵCv�$T$��V� �������s�E˲b�T�:���hs/��履�$�.�F7	!+�z�6�%b��X숤k���E�����h�}�:�[�sd��8��-$�JI�%z��d����r�8$�OS!�#yjk�~,����m�KxE���b_� ����,I/��& )��kI��m/p�QmV0uH{2�v�Y@m���^>�VO]k�w�YE��YOw�@J?-�d?`SEY��P�h��l�Bn��Q��F��<���O7�6�_~�8���������_�" Ͽξ����t_      �   �  x^���r�F��������H,Q?�|i;ٍ���]ٛ�CbD  ���9�.�{��=�T�kSG	����ӧ[��/n�{�|�n0;ۛ":;���m��������ybpQ>��c7��5�}�vU;��.����fpM���LX���L�6ѹ޼uu��~a>q�&��-ͺ!�sreg���֬ch��͕�B�/�;�Y��Ǌ���s���k�㱎�B]�~05���M��;[�t���h���W��u���r�/B�q,څy$>��q\&�ۚ��{Ct�b=���f������g�������������<^�MEX�k]�s/qb9N���9J;_צ���P�MA�6�x�c��Gm[�Ӻ>��|	�d���UW)x)�=���C�X�2{g�di�8==�}=H��8#9}m��c1����Sț@Jڱqd��+$, )bص���O�I��]=�Q��0]`H-ƖfE����=W+(��Iw;B[��[~�������֖�v����R��>!����D";&p!R(��Um���|��O���g/���%%���t��H}��  ,\�98o%v׋�KSa�'�=y����cMbkpMB'ח���]S��%�,Anm��������֞k}o�S��xJ���ۃo~��qlpns}'?//Rݧ���5I��Wa���{��[)y%$������|.�g�f��RX
�"�Y#|�v�zڸ2�����Bp6����j��frT+��c�K�zy���ʺ d�kK�̈́^���#_W~Cqk"v����6�8�r��{R}�5]�gr��b�~�=܀�"�K4��������*�3M"4`��H�����E?�D�8���_��_����c�?-����Т�?��K�:_pYB��ae�G�T��f���{���Y�=-�8>� �p�R��N�x�U��)`Mޖ�I�?�H^4��aA-I��	T��0�D�Rl��#&�������z9}B�t+��DZ(����f��� �����*_B>bs��l������AQ��kt��얜����m5�B�,�(�OPs��JERKDfT�Ѧ}�@ �\�_�=�J_Ч&,đ�+�TZ�����j��x�������J?��m*Ry�{
�L~�䛰�Q��^._�ܞ�Z/�c*
l��~�E:Ͱ0o����ք7`N��'��έwv=��,M�I����Აj+��ǧX?�l�k��N��_����6�����?/ʅ��]e�B�U��յ ��Z݃�Qv��Ǚ�.��5���u�c��Qq-���N<�sEIwW,kl6喔�h/��Zh���Þ�c�;�S�JB(3q��Ry�9��/����+-��-PJ)�4�� �<�aX�[�����&�)7�8}# ��B���e-�N�Z�i�]��h$��s��r'��2;y��C4f{T�R�����zj9L�qrD�uGs.�mlܛ��B�OH�i�zgNMŭ޲stE~jkU�Ә밡�(����Ew��;����~�u���)��[
�X
"��P�@�l�8��gkPE��qUPkgМnCk�G0'�������
��>�19 _�O����|�
��8�>Ҝ�a	�vZ᥍�yf�V7���6Hy��H�+͓��hZ�M΋/��d쁚�	}�d�bW"�981�Z[���LU��:2>U��J��.�56���*>!��
�!i=�\��K���$�b�T=a�Ў_��{�Z�O��&}G�fWv�c��2kP7�B��)=��� q�Q��qD�(=9�i`HH ��j�S[�գ��� ������q����� �gq������#��� B�`��g�>M	fA| ��<�Y7վ=�nUՁ�e�fj��\J�<�g��D~��tv3v��$M�n&y)�=w�y�����])a�F�$�6O�&�������I9w�7��߽����H����$D�J�Of���@Ҕ�2i�o�+�7ۓI��dt�1g��8�T�8��F�����j�۵f��5P%D?�%e��a���ɍ�4�S��㊒�0��A��_d_-S6��%�}���˵�d�����������:�d�:���1H"||�R�*x�X��.^�Zq�)����y�[��Y�˴[*N3��K���~��Qݥ}Y|�uWBv+@�W�J�1��~�@[cC9�piw�,h�ܕKt�<p�2mB�7���#��x11������m�Ĉ-���.i���E@�8Q��HjEz���=�N��0��3�d<J�{(�4�����mO��Y��hqv/��i\��S���e�R��r�M/G��_h�<1�u��7� E��#�L���"�%� �Fn�j�B+OY��,q��8�_tШ���,��OD�椵O��2�	P��:e؍�ߴPzMG��|�e�!^�ep��eL����?8O={�Ԯ�d1�f���`Iƅ�&��iM>��u�F�i�ϗ����tfY��j�9L�6�L�`�"�Y,������_4��f/c}����3�'�M��=���t�L��6��z)�u��_�̂3����+���q�����M�~ҍ-� �N��v	
����Gk6��`V
َ�>�{��XɎK�I��F%�6��:����	K_J����,f.�N�H'
���m!4���5Z��[mK�M�q�舐4��t��L�����Õ��N_��O���^~]��x� B��!���s� ��6�eQ5��8R`�7l���ȓ�
�2��H�"	 �?S�y�{��3��h��}IH��� �;6�	�Idd��03kb)�~߬�&~��{��<߸Z~�!)n~�Y$!���W�~}uu��r��&�����1�+�2�OK�u�^�zy/9�g�#u�o<@{d�F����X1������c�e���s	�rq��GsU'������[}p�7b/��,��tY��F�����
*��i�/�R����ӫ��Pf���_t�@s��|_�3h��ot���4��(��>�^�!���1�%��,�\J���:�F���C��%��G���E�$���+�X?0ǳ2Х�X�@=W��W��'R��`VE�ؠ/�qkZ]�G���Ee��g�� Y��Ґ��"�,�2 l��!�E��S�������bl�      {     x^M�KN�@�מS�	iyn�!��$�ƚ7�q�q*�;p.ދQ"�+˟_��
n}��b�]�黍�P�S6��Ǡt�T��\"gQf�,��\yFb� ��ٜ��u�D6���nV�h'I�y�0�nP�l.�F�yGS��j!a��E�m<�� 7˼����ݣ�����(z	ɾ��HJ!�kh�����U���bLh��e�M��gUA;
e���Á�E*�Z������jO�s�=�Z�^nC"�fZw��c~ v��2      w      x^����,Kn��0FVF^�y���yh���������}�pgUd/k-2��o��?������?��?�m�M���<�~S��o��oj�����������﹦u��cY��.�ú.ӽ���;ֳ��t/K��������;/ӯ-�k؟߷��;ϭ�W�xM�4{ط��߶���/�����=e_�4�m}���絭�~̿�{���2_���}�i[���e��m�m_�V�g���_�|\a�v=�i󽅽]�|=˹����=k�Ϸnwُ���x�^���m�������޾��߼�׾�G��w9��\�ú}����ڟ�=�<��|�]�>{����s<���z���;z������w����sZ������wk�w>ϰ_};��j�����������?_K�����/쿟���x�e}b]���|�mߧm��=���6�r��_�^��ϯ�W�Wog������~]����<y���g��}��9�v����:׾�}߯��=���c��gz�-�o��س���v������_m]�}>~�X�<��wY�r�����9��Ϸ�{�x�r�y�w����������2���L���v�֫�6�랾�7�|�<�|��~[ٿ����_;x�O��ͮ޿���N|��r��v���L�7���~�Z����j����i����w�M��/�ok�׻���!��y�~��������紝_��V_�u��������k�U��L�w�{�Ri�s��e��>�V۹�U�i�������켱m�`���{�����/�#�|��/����-�����߿��{>�~W����|��������xoٿ���O�3�>7�HF+;���-��ao}ӧD�����7�ǳ>�?�um�Q�Hs;�7�x�/9�O������wJe��y=����3��O���6��$���ە��mI�q�����<d_�x�ؿ�M�<;�{����}J��x~ߥ������/oݿ���>Ώ�����S��v����>��}�9��������K�)Wƿ�������tm����eg�#-�Ԅ|��}<�}�ۖ���ꥠ,eo�K��H�z�	9�����u㟗���Y(��o�2�;�z�fe���u٧+��O�J��:�}����Z�Z���c�3
D��>s�����_��<�v�,�����-ϕ���4��߬e��}�) �O@�缽S��vJ��)�;���$�8�ϴ�����+���>|P�_�~
lδ/ە���v�Yը�����m �(���E�y�}����#�>Iƿ�7���~6�^��!���U0�KL��r�u[����%ȩ]�M�!��mG{o¾�����+����",�{��g�>N_�9�|� &����6}�n�/��ͽ����=�k����~��ˌ�za�����S��7>�ww�~_/���J��lH�_߶�/ԑ��Z��}���7�E�ԅ<�6�S��{��X�{��@�ݷU�V���x��}�����K�J����̿����3�޲��j�]�ǫ-��e��Q�n���eAa�S�"��~U��'�RJ��,}��s>ܻZy�����]�Gw����2��m���������?i�ܥޫ7i�����iߖU�:?x3�*���E<��ϻ�-����~�<��i�=�[Ε%�nG�u~Fz5���N>�~�YET�����t�}��ߗs���W��{��6��} �o�D`ڏ7 �OR+�z���ʾ:ޮRE����fP��mb���n�ֳ����%��_�-�ퟥ�<�iQk���P��A����5lb�����#�~�[{�8-�E@�W���?|T���+;�&��!_ُ.��gR���]hAH���V�gi���ҷYK���g6�~g�h@B������Q�/��"�=�vB/���H�����~��󉲟�y���W~h��7�o<� ڻ��7��ӯ��]=�ϟ7@
b���{��G}L���bI�_�.|��{�ߴ��~� �\v�M�'S���㺎�����~�]B���Q��;��w����[�P�{U��?���>��7��ӎ
9��_��I����uj~Wa~�'h������ˎp���Wþ�O0�j=?-*�5��<׆�}[79F�Y��	z{�gY*�'��# r�3�s���)��WPMF|.�:ogٝ�����m��n���}�������H�P�۟i��c=0�.����(�����.�Ž���z�rPv���_�oޥb��-[? 
��,�D�xeG�9R���N�۾��ܽ`%��o:!����e�vw5��T��o��GX�L�M)k�_P�1m��+;n��]���?�}�� x���_[G�ǈ��#�����L�	���,<�Q7����[�?�\ ?��o�t�� {��E�=wx�����r�	{��٧]��݅��OƂ��'�/�w(�`{ٻ�[>��HW�A-7�(��ނ�_A��m��bg��R*S�)����k��.]��)_����|=��TD�ۧ�G)�m��-����+H?�-
��k�醒�Ĵo,�a������p�4�����D��/0�2)�+� �������7�B�ʾn+J�"�e'����#�]>�%��\��后c�Up뒤j���������Y ;-8I~?�ė.�k��V�����7`B����g�_lY��=���av���[�ߺ����EwKp��%<6���J'UK��D����S���vJio���������:�^��V���S~Tߕ�6��M����ǔ��Qq�����>$5��
��a|o��I4��9�CA�nK�%��2쎲����W�T_��������~+a�S���0�*��������<B��c��%�f���G�A�����L��]�3�����3P}�/iu�Wq����*I~�[��HzO��<��nvg��`=)a��f!�Q����R�_��맷<���/܋�� ]�/m��y�~�~�l�t��
�f|^�}�7e���M`R)Ỵ����`� "��g'�e|�J�/^x�vv��` �QT���/���a�"��*�'~��u�uv-��.����[v�xB��_�S�p���?t��ue:0��[�1�H)}k�� �h~�o��}�1������L���_$o/,���s��h�����ܐ���v�:b7��xc��KvN�Y���'�t&m򞲋G�v=�:��`=�Y�Q�^vY� �Oe�N8��y�wܮ>���BB���r(=��(}`��p������e��_Bz ���S�)���`�9ٟ�f�1�y	9�w}�Of��OJ����]o@I�gi�⃾s��r�HI@����T�)b/Ҙ�OI�k����VW9#c��B~�+>� wb�%����$�Q_ �p"Z��j�~8$�*���P@�zأ$F�e�'H�]$����M�l����/{?B����m�%�7썘��B����6 �k�N�Bo{��u��Ҳ��J�I��CyΆ�q�]a��0#��ׇ��X�O�f'3��G�I`Ks�_�c��p��G��$S���韲�%?�ɴ_�eC���AJ�0������,�q�8?+��ezP���������pH\�N���d����R5R������d�[�W�����`�a�2�s�磩�=��/<I�~��G��O=���?�oeH���ť���e�τ���@y�}�iu_��@:���^�Wgl�?���	��M�t١S����1Q�&��u� 6��\?j"�~��r��@���^߭���y������*p�_R��i6`��|4�ơ*���{��_�~|�^���O��s�PX�U�G��RU	�c�l�;�������>|0�Ҽ@��~�t="ڞv~@Z�TG�|��%S�����U��V��# ����ܥ�h_[��i����ǫ�!Ǟ��k R3������߸�Xa�p��>@|><39O�Q3R5i�o2ăkeGG�x�h�d�AKrw�?�x��Y5#�N����]Bk=/�����}ѥk}�&>L�){�)�'���\���|�y#:r�4��?8~�#�~    $�1�~���oǎe�aw� �����;�7�o����{�����՟���)������O���D�������'�+�<����1s�:?�ICϹ���|W��{q!����5�j�z��,����u,����[�e��5zm�|�(���6�V�a/��z~���$�����N�*xR���h�z��3�)�/��a&���T~��^�Տҟ (ͤU
H{����E�(��:m	���K��G|9@�ϡ� s�ȅ!ɴ?�_F�k� \����������&��lw�G�eP
�/�urmu����K����V����e�0F+��D�'�'u��I�r3���^�����$]�Q?Q�P3��ň>6����Uw}�?����&��3�w�^]5T?����ӈ���;�h����hԮ���q>�]ã옷-���[�>1'����';���OP)`m�o����B���i�4����g���۸q���J?�����/�|��5d$���Uhr��׹�@7�F����z��ӎ�����zX���e2�}��1I�
^=��n�M����'t�|�����%e|���z[��c
�r=�q��]H�C
d�T�C�����ӹ�Ur�b��y>�֧U�0���oo�{Kii.��W!r��h�r��+��G@A����Qy�=���`V�D.�ڥK�Z?d��_Y((�ҥ�@���o��fM��?�!�~��� �$���S�S;�Be�1�A�ԧ��6����}c>�t�!>X�oa7��j!��Z��	R�P�v�/�m�"����E��>;��_x�R�����i-�a�14)z�/�G>-C5� ��Z������#��'By����$>�F>+~:�c\b؝���N�/�q���P��������o���m���7�6邖�/'�-�ȫ �����G�^�4�!�ȥ�Z�; �H�m��+<W���gn$�i�'�-��lh���#��%�사�cD��=���P%�]�[���hf~G�ߝ�>fi���=��R�U�5�Eɺ�jC􋱩aG���*�=�[z��۬�d,#8�R�|F�g!��#�zHI�v�wt ���Z�n+[ٛ��h_h���$�졬x��n^#�'���ϐB�,
�~�E�jZv�"�Ud�/!�*�A�-;rj}���A��. ����L�y�>�:RV ��_#HK����jV+��|��F����N(�|P�A�W$e���J]$E��G������s����J�E���t!0;�������V�]�1�\�4M�1�%�g����i�@�8ְK�����ߨ���up���J��γ�}���e�X���ɩ����_?m��=ڇlP�1&��ȫ��MF�u���brL�"Xo��Ѩc�����/ߍ��Z�F�)0�_E,�ky�Kͯ8md)�_����u>tf� �� ���͆�ezu�g��^ ՗�1�������!��ǐ�,��]���T��<�K�*��?��UU{�zX�Ú�W�$���B8�=(�� �r��'B���il'�S��L$C��W0�������]=/ǀ��X�k�`'���_v��B���Ϝ�/��~��a=�������:�����:��ϫZy>�'�F�,{�F�]ė�^ʧ��k/R���e_ȩ����?��i��}'��|��S����̓\�9�I����9�f�g��y���Ү"�P�$�����J:�ߦÔ��G���c
�,������`_8�G�/�Β����'y����O�Զ���o���d�����2ߘv�Lo�n�p���]��Dz�п�A��\�'�)΋��|��d^�t���Aa�^�7�j�^���<��ݢ�Z����Q1F�	WU�t��:y�|'F���
<G��[�G�q�
�B�y����E;��!J����M�
]�R�0�h	C�� �C���T:��N�1����?�	�p� �_��C�B�î]�#��Ῠ��@�e�~�64@e��a�[L[4������7Ǧ4�5hs�;&AC�?�~5R �K�(�^�����������+��C�BՏ�?2A���Y�O�FU̻���%�Lk8����6);ZT��B�p��Rv�T�7�����@
|�q�,��O�5��$+���Yk�nH���0��	�#��g�����ѣ��Ȳ7��;�S��L���f2��Wh�`��K�������th�6�yu;���2V˅`߲�:���;N��+uR�ٰ��u�![>3Y .^ۈ�~	 ��l鏈�������)����Ψ���pE�%]��^N����BS�䪛U��i�1���)���^�q��?z�1�U��}\��P����$3���gH��G�����Sо��:br3�OdV��ևI;$*y,��_�r������W�t_Ͽ���R�,��t��Hl��ÊO�@b�y�g���ŗ�������%�^i�q��C�l}��/�%xK�=�)�+�cpB�.F��T@r�q������㼔��Gw�@/N7�?����b G����)�dV�Ƿ�ɷ��)u��3F��G�r�łF��f������]������s  ��t����x^�i������'�:�R�O��<@� ��LG�����L��D�(m�����������AB���]�w�������aL�v����_:>�xo��[O6�W��c�E���3�H���g���듨%A��_�c�9tl��"�S�e��!����O���(�����G�0e��j���V�W�Re_ur4p���v�Rˎ��A�S�|�1�u*�݈�
�cj}���$���P�X҂3�S����-;�-&�������I&��4����3���d��毤;�� ^���.�$[٣�ī���
�i��|��� �Z�,�i[g>/=��t �"q~ꋊM�/;5���;�� ����O�
m�xD�CA��55g�W�*��C�|�ݟ�Z���H	J4��o`��e�/�~]4��t$6��ײg���%��s3�8�����c�Q�p�~T���`��9����%k��d�1ߧZ�!=����ՙ�b��1�(��tŐP�I���*	�|��a�>����X�u7��:2�*��Ro�px����j���
�2�ï��drhG���5�������4~������x|�����:z�l�MΩlA���nG\@ Q�y��o��nZ<���s�~(7@����޴�E5��~���(���T��<� �1�,��|�C )A����,00f����
>S84�?ax@N�w�XF�Eç�=���ʎ�!HT�1_K|��7�p38)�K8OԴ������G:Ί�3t�� N�A�����Z`/����ڣ>4�'�q��Gm!�:2���k��5�Wv��������$���k�@K�-���=T���^l{��{�r�&���ysh�Բ�}�]i��<�@�..�e~�m���7�n�ؐ�\v�.�?1L��ݪ�+i��������5y�Se����-����;��
[��j�i�z��v�$Oۦ���Ŗ�.���~0�Q��ʤ������+���_vZg�r�]�qI!>��a���C���z^�:�	���%��CR,�v_E�\ۥ�ߘ��3�1���3�O�(�r!:��ج7v�k��A�C&	��棂' d4�:�gӢ���\��7�cj�EK������\���?�#�0}���{0�O�,����V���$=qB1V����0�k~l��e4��!�|�K�F�g��l��[�F~!X9��g�Ĕ���-��7�����m����FR"��C/��U��fJ��7��f��L)��9�����y!$��_�	[�Y(��Om1��1������t����Q�T���3�r���A#��I�{�6��=�	�(*�u?G�N��ui�=�^��z=%���7��Y�o�;���Z�T�|3!e�����2s����.��h������O���G�\w���Z��
�S��S�F�P �  ����ҹKO����0l�'����8���q�P+�L��]�<f�4\��0����+���H�yʙ���?0���z>�G��� ��� G�1"I͟��3���]vu���E۫�4F�b�$�7z?����%N��mj~%o���s�awf�e���8�<eƗ���5Ľ��/h�zl��?j\��TI��s�.�j�?�]�\EѤ�1���~I;����yK?��.9��Q��|�[İ7���3-�CC�Î�!>bĿ>7�=슱Q����h���Svs��<��@��K=F����o�����#sP�ظr�C�Z�r.�6�^�}K�����B����o� 0z�e�6��o�o]�Nv�k�����͡
����2�G?z��:_��|;�.����_��Ã]�W�������a=o<BhEK�����+����W?�5ײG&����+�JL\?/;]��)���߱�Q܏O;7C��#�r0hsJ���7�]R�?�1h�0/��gw�$4W���OBv;��x��b%G�.�1^Cz�T��q����� 4�����G@��/�=~?��x��M���Swdи��������?��\�3�U��!�)��K��^L���u�;�|�����ֿ��i�����Pv�?fi�ܲ��r����m>O���^�j�E67nk��1�(ea�e�	L��Pv��G�S�b,����R�ˮOvq\����5!�i��"��1��ؖb�'�~��RY��nP*fu��c����=	����ʧx4#Xv�,f��=�~��v&�b`�Η宱:\�xF�<���a� P<~��<�B���3�D�k��?����˿��Ȁl��CÞ��iK�������� ƛl��f����U�(Z�y�"C����8Z�"V�/}��,XK,�ߜk��[��7��D3�C��iA���)n7J6�z"���Xin��P�|��ݵ���1��yǑ���	=��|����oi{�0"9g���)����	ێW�d�>؀Mj ���3--���*;�1~�叟�*`w$&�o~�o!���u�;��]���iA1$���en꿤?��|af &a���R����S Usrԟ���7�o���n��t��ߠ8�/�ȿ���%3��&�TW�ɗ�?���������/����,��B�/#'j��LeG��R�pI���Ђ�+p5�,��� ,~��1�#
�%�j���ſ��������n�E+~�m���m��� �Sv�B�!���8�\\φ��8t���4��}��������e��_��`d���Ba1~�D�>��<Q���|qL8���b<^}&���#v ǌ��9B7"��r}�1�����wLP�]��q����w�����+ΜA�����Ígj��1+�0�LV|�یCѥo�f�I���^�����J��?�ۿ����_��O�      �      x^����� � �     