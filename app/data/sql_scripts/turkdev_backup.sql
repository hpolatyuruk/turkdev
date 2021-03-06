PGDMP         !                x           turkdev    12.0    12.0 F    n           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            o           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            p           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            q           1262    24586    turkdev    DATABASE     �   CREATE DATABASE turkdev WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE turkdev;
                postgres    false            �            1259    24631    comments    TABLE     B  CREATE TABLE public.comments (
    comment text NOT NULL,
    upvotes integer NOT NULL,
    storyid integer NOT NULL,
    parentid integer,
    replycount integer DEFAULT 0 NOT NULL,
    userid integer NOT NULL,
    commentedon timestamp with time zone NOT NULL,
    id integer NOT NULL,
    downvotes integer NOT NULL
);
    DROP TABLE public.comments;
       public         heap    postgres    false            �            1259    24927    comments_id_seq    SEQUENCE     �   CREATE SEQUENCE public.comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.comments_id_seq;
       public          postgres    false    204            r           0    0    comments_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;
          public          postgres    false    207            �            1259    49710    commentvotes    TABLE     �   CREATE TABLE public.commentvotes (
    commentid integer NOT NULL,
    userid integer NOT NULL,
    votetype integer NOT NULL
);
     DROP TABLE public.commentvotes;
       public         heap    postgres    false            �            1259    33149 	   customers    TABLE        CREATE TABLE public.customers (
    id integer NOT NULL,
    email character varying(50) NOT NULL,
    name character varying(25) NOT NULL,
    domain character varying(50) NOT NULL,
    registeredon timestamp with time zone NOT NULL,
    imglogo bytea
);
    DROP TABLE public.customers;
       public         heap    postgres    false            �            1259    33147    customers_id_seq    SEQUENCE     �   CREATE SEQUENCE public.customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.customers_id_seq;
       public          postgres    false    209            s           0    0    customers_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;
          public          postgres    false    208            �            1259    33223    invitecodes    TABLE     �   CREATE TABLE public.invitecodes (
    code character varying(20) NOT NULL,
    inviteruserid integer NOT NULL,
    createdon timestamp with time zone NOT NULL,
    invitedemail character varying(50) NOT NULL,
    used boolean DEFAULT false NOT NULL
);
    DROP TABLE public.invitecodes;
       public         heap    postgres    false            �            1259    24914    resetpasswordtokens    TABLE     s   CREATE TABLE public.resetpasswordtokens (
    token character varying(20) NOT NULL,
    userid integer NOT NULL
);
 '   DROP TABLE public.resetpasswordtokens;
       public         heap    postgres    false            �            1259    24670    saved    TABLE     �   CREATE TABLE public.saved (
    storyid integer NOT NULL,
    userid integer NOT NULL,
    savedon timestamp with time zone NOT NULL
);
    DROP TABLE public.saved;
       public         heap    postgres    false            �            1259    24596    stories    TABLE     s  CREATE TABLE public.stories (
    id integer NOT NULL,
    url character varying(500),
    title character varying(150) NOT NULL,
    text text,
    upvotes integer DEFAULT 0 NOT NULL,
    commentcount integer DEFAULT 0 NOT NULL,
    userid integer NOT NULL,
    submittedon timestamp with time zone NOT NULL,
    tags text[],
    downvotes integer DEFAULT 0 NOT NULL
);
    DROP TABLE public.stories;
       public         heap    postgres    false            �            1259    24594    stories_id_seq    SEQUENCE     �   CREATE SEQUENCE public.stories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.stories_id_seq;
       public          postgres    false    203            t           0    0    stories_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.stories_id_seq OWNED BY public.stories.id;
          public          postgres    false    202            �            1259    49695 
   storyvotes    TABLE     }   CREATE TABLE public.storyvotes (
    storyid integer NOT NULL,
    userid integer NOT NULL,
    votetype integer NOT NULL
);
    DROP TABLE public.storyvotes;
       public         heap    postgres    false            �            1259    33167    users    TABLE     �  CREATE TABLE public.users (
    fullname character varying(50),
    email character varying(50) NOT NULL,
    password character varying(500) NOT NULL,
    website character varying(50),
    about character varying(100),
    invitecode character varying(20),
    karma double precision DEFAULT 0 NOT NULL,
    username character varying(15) NOT NULL,
    id integer NOT NULL,
    registeredon timestamp with time zone NOT NULL,
    customerid integer
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    33165    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    211            u           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    210            �
           2604    24929    comments id    DEFAULT     j   ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);
 :   ALTER TABLE public.comments ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    207    204            �
           2604    33152    customers id    DEFAULT     l   ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);
 ;   ALTER TABLE public.customers ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    208    209    209            �
           2604    24599 
   stories id    DEFAULT     h   ALTER TABLE ONLY public.stories ALTER COLUMN id SET DEFAULT nextval('public.stories_id_seq'::regclass);
 9   ALTER TABLE public.stories ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    202    203    203            �
           2604    33171    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    211    211            a          0    24631    comments 
   TABLE DATA           w   COPY public.comments (comment, upvotes, storyid, parentid, replycount, userid, commentedon, id, downvotes) FROM stdin;
    public          postgres    false    204   ;R       k          0    49710    commentvotes 
   TABLE DATA           C   COPY public.commentvotes (commentid, userid, votetype) FROM stdin;
    public          postgres    false    214   �R       f          0    33149 	   customers 
   TABLE DATA           S   COPY public.customers (id, email, name, domain, registeredon, imglogo) FROM stdin;
    public          postgres    false    209   �R       i          0    33223    invitecodes 
   TABLE DATA           Y   COPY public.invitecodes (code, inviteruserid, createdon, invitedemail, used) FROM stdin;
    public          postgres    false    212   $S       c          0    24914    resetpasswordtokens 
   TABLE DATA           <   COPY public.resetpasswordtokens (token, userid) FROM stdin;
    public          postgres    false    206   �S       b          0    24670    saved 
   TABLE DATA           9   COPY public.saved (storyid, userid, savedon) FROM stdin;
    public          postgres    false    205   T       `          0    24596    stories 
   TABLE DATA           t   COPY public.stories (id, url, title, text, upvotes, commentcount, userid, submittedon, tags, downvotes) FROM stdin;
    public          postgres    false    203   ;T       j          0    49695 
   storyvotes 
   TABLE DATA           ?   COPY public.storyvotes (storyid, userid, votetype) FROM stdin;
    public          postgres    false    213   W\       h          0    33167    users 
   TABLE DATA           �   COPY public.users (fullname, email, password, website, about, invitecode, karma, username, id, registeredon, customerid) FROM stdin;
    public          postgres    false    211   t\       v           0    0    comments_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.comments_id_seq', 65, true);
          public          postgres    false    207            w           0    0    customers_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.customers_id_seq', 1, true);
          public          postgres    false    208            x           0    0    stories_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.stories_id_seq', 43, true);
          public          postgres    false    202            y           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 9, true);
          public          postgres    false    210            �
           2606    24937    comments comments_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_pkey;
       public            postgres    false    204            �
           2606    49714    commentvotes commentvotes_pk 
   CONSTRAINT     s   ALTER TABLE ONLY public.commentvotes
    ADD CONSTRAINT commentvotes_pk PRIMARY KEY (commentid, userid, votetype);
 F   ALTER TABLE ONLY public.commentvotes DROP CONSTRAINT commentvotes_pk;
       public            postgres    false    214    214    214            �
           2606    33154    customers id_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT id_pkey PRIMARY KEY (id);
 ;   ALTER TABLE ONLY public.customers DROP CONSTRAINT id_pkey;
       public            postgres    false    209            �
           2606    33227    invitecodes invitecodes_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.invitecodes
    ADD CONSTRAINT invitecodes_pkey PRIMARY KEY (code);
 F   ALTER TABLE ONLY public.invitecodes DROP CONSTRAINT invitecodes_pkey;
       public            postgres    false    212            �
           2606    24918 ,   resetpasswordtokens resetpasswordtokens_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.resetpasswordtokens
    ADD CONSTRAINT resetpasswordtokens_pkey PRIMARY KEY (token);
 V   ALTER TABLE ONLY public.resetpasswordtokens DROP CONSTRAINT resetpasswordtokens_pkey;
       public            postgres    false    206            �
           2606    24796    saved saved_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.saved
    ADD CONSTRAINT saved_pkey PRIMARY KEY (userid, storyid);
 :   ALTER TABLE ONLY public.saved DROP CONSTRAINT saved_pkey;
       public            postgres    false    205    205            �
           2606    24604    stories stories_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.stories
    ADD CONSTRAINT stories_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.stories DROP CONSTRAINT stories_pkey;
       public            postgres    false    203            �
           2606    49699    storyvotes storyvotes_pk 
   CONSTRAINT     m   ALTER TABLE ONLY public.storyvotes
    ADD CONSTRAINT storyvotes_pk PRIMARY KEY (storyid, userid, votetype);
 B   ALTER TABLE ONLY public.storyvotes DROP CONSTRAINT storyvotes_pk;
       public            postgres    false    213    213    213            �
           2606    33156    customers uc_domain 
   CONSTRAINT     a   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT uc_domain UNIQUE (domain) INCLUDE (domain);
 =   ALTER TABLE ONLY public.customers DROP CONSTRAINT uc_domain;
       public            postgres    false    209    209            �
           2606    41421    customers uc_email 
   CONSTRAINT     ^   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT uc_email UNIQUE (email) INCLUDE (email);
 <   ALTER TABLE ONLY public.customers DROP CONSTRAINT uc_email;
       public            postgres    false    209    209            �
           2606    41412    customers uc_name 
   CONSTRAINT     [   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT uc_name UNIQUE (name) INCLUDE (name);
 ;   ALTER TABLE ONLY public.customers DROP CONSTRAINT uc_name;
       public            postgres    false    209    209            �
           2606    33178    users unique_email 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT unique_email UNIQUE (email);
 <   ALTER TABLE ONLY public.users DROP CONSTRAINT unique_email;
       public            postgres    false    211            �
           2606    33180    users unique_username 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT unique_username UNIQUE (username);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT unique_username;
       public            postgres    false    211            �
           2606    33176    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    211            �
           1259    24954    ix_commentedon    INDEX     Z   CREATE INDEX ix_commentedon ON public.comments USING btree (commentedon DESC NULLS LAST);
 "   DROP INDEX public.ix_commentedon;
       public            postgres    false    204            �
           1259    33186    ix_email    INDEX     ;   CREATE INDEX ix_email ON public.users USING btree (email);
    DROP INDEX public.ix_email;
       public            postgres    false    211            �
           1259    33187    ix_email_password    INDEX     N   CREATE INDEX ix_email_password ON public.users USING btree (email, password);
 %   DROP INDEX public.ix_email_password;
       public            postgres    false    211    211            �
           1259    24952 
   ix_savedon    INDEX     O   CREATE INDEX ix_savedon ON public.saved USING btree (savedon DESC NULLS LAST);
    DROP INDEX public.ix_savedon;
       public            postgres    false    205            �
           1259    24953    ix_submittedon    INDEX     Y   CREATE INDEX ix_submittedon ON public.stories USING btree (submittedon DESC NULLS LAST);
 "   DROP INDEX public.ix_submittedon;
       public            postgres    false    203            �
           1259    24926    ix_tags    INDEX     ;   CREATE INDEX ix_tags ON public.stories USING btree (tags);
    DROP INDEX public.ix_tags;
       public            postgres    false    203            �
           1259    33188    ix_username    INDEX     A   CREATE INDEX ix_username ON public.users USING btree (username);
    DROP INDEX public.ix_username;
       public            postgres    false    211            �
           1259    33189    ix_username_password    INDEX     T   CREATE INDEX ix_username_password ON public.users USING btree (username, password);
 (   DROP INDEX public.ix_username_password;
       public            postgres    false    211    211            �
           2606    49715    commentvotes commentid_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.commentvotes
    ADD CONSTRAINT commentid_fk FOREIGN KEY (commentid) REFERENCES public.comments(id) ON DELETE CASCADE;
 C   ALTER TABLE ONLY public.commentvotes DROP CONSTRAINT commentid_fk;
       public          postgres    false    214    2744    204            �
           2606    33181    users customerid_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT customerid_fk FOREIGN KEY (customerid) REFERENCES public.customers(id) ON UPDATE CASCADE ON DELETE CASCADE;
 =   ALTER TABLE ONLY public.users DROP CONSTRAINT customerid_fk;
       public          postgres    false    209    211    2752            �
           2606    24938    comments parentId_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT "parentId_fk" FOREIGN KEY (parentid) REFERENCES public.comments(id) ON DELETE CASCADE NOT VALID;
 @   ALTER TABLE ONLY public.comments DROP CONSTRAINT "parentId_fk";
       public          postgres    false    204    2744    204            �
           2606    24644    comments storyid_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT storyid_fk FOREIGN KEY (storyid) REFERENCES public.stories(id) ON DELETE CASCADE NOT VALID;
 =   ALTER TABLE ONLY public.comments DROP CONSTRAINT storyid_fk;
       public          postgres    false    203    204    2742            �
           2606    24680    saved storyid_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.saved
    ADD CONSTRAINT storyid_fk FOREIGN KEY (storyid) REFERENCES public.stories(id) ON DELETE CASCADE;
 :   ALTER TABLE ONLY public.saved DROP CONSTRAINT storyid_fk;
       public          postgres    false    203    205    2742            �
           2606    49700    storyvotes storyid_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.storyvotes
    ADD CONSTRAINT storyid_fk FOREIGN KEY (storyid) REFERENCES public.stories(id) ON DELETE CASCADE NOT VALID;
 ?   ALTER TABLE ONLY public.storyvotes DROP CONSTRAINT storyid_fk;
       public          postgres    false    213    2742    203            �
           2606    33209    comments userid_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT userid_fk FOREIGN KEY (userid) REFERENCES public.users(id) ON DELETE CASCADE NOT VALID;
 <   ALTER TABLE ONLY public.comments DROP CONSTRAINT userid_fk;
       public          postgres    false    204    211    2768            �
           2606    33228    invitecodes userid_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.invitecodes
    ADD CONSTRAINT userid_fk FOREIGN KEY (inviteruserid) REFERENCES public.users(id) ON DELETE CASCADE;
 ?   ALTER TABLE ONLY public.invitecodes DROP CONSTRAINT userid_fk;
       public          postgres    false    211    2768    212            �
           2606    49705    storyvotes userid_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.storyvotes
    ADD CONSTRAINT userid_fk FOREIGN KEY (userid) REFERENCES public.users(id) ON DELETE CASCADE NOT VALID;
 >   ALTER TABLE ONLY public.storyvotes DROP CONSTRAINT userid_fk;
       public          postgres    false    211    213    2768            �
           2606    49720    commentvotes userid_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.commentvotes
    ADD CONSTRAINT userid_fk FOREIGN KEY (userid) REFERENCES public.users(id) ON DELETE CASCADE;
 @   ALTER TABLE ONLY public.commentvotes DROP CONSTRAINT userid_fk;
       public          postgres    false    2768    214    211            a   ^   x�v�q��4�46���f�FF�ƺ��
�VFFVƆz��&�f���f&�\�E��%�@�F��u�ZZ�������u�u��qqq �7�      k      x������ � �      f   N   x�3���+��I,�,-*�vH�M���K�������(����t�tL�̀H������\���3Ə+F��� g��      i   �   x�e�M�0@�5=�{c3ӿ��<��)�
"o��2x�/���j�t�1�#�п�B
@�v��ހ$G*���C&~�{Om��.�GWd�$��,�J+����!xm���16]jΒS�i�5���UѺ�f�z�^�$W�{����8v�6X�f�n��Y���M�ݴ+�ƒ`-�)��k�Y
!>�V9      c      x�KLJNIMK��44����� 0�G      b      x������ � �      `     x��W�r�F>�O��=����rI��R,;ZQk%)_����0�t�ϱ��ba�IEV����(jf�����&L�ژ��=�7����(�T��K��B6��<��F��������#�-�|�֦m�ŸF-¿��5�
g�n�b���	�����)a�y2s�,��[?p>�w�ahC��A���6��f7��ښ�AfM��Fh�:���NTl٫��b�KC��Lv�ݡ�l��4���*� ���\�*`�HT � �A�C׾�8��A��?q-���w�ϲ�k���v�u�U�C���Q+�V[6.���ך�Z0#ʚi�˵s��pm���s����X����!A���(v�4�%��!Qp0�R�vWJ�1f�^�Z������z�n,����~Yo�W��ϳn�ӛ�a�n�������۵'*i����߃0˲(���&Ј�~'�1��F6S�͖��c8��(�#B�<�� 8"e�8gz��s����h�
(�Zk��0�@W�	6���l*J�W�Di�+�9C�:L���T�%LA��V�;4��7����X���(M}��}sQ#<
�I�]�cD�f���P������ФRt�����
�6��Ѓ�7�	�Ң �<��GgD�������g�M#Kk�~���{
�"�l���Tx��p0q��>�vm�3~�}�}o�5|-�i�m&��^���(s�T�L/$:�1������Xt�����>�΅+��V3բ���x#�K�V����bՠE�d�Ұ�(Y�'�еڸ�J�<�l<�����?�[=ީ�ЗB?тg�}<Ϛ�s����4v"�����93<��w����ۘ�)Z��J�9N�8s����cό�G���]����<u���3�[uō`�g�l���~UR��Ѱݧ��ڰ�����Å9vzJ���4%�f�B▤�f���,��_z�a%y��<�OK���_�N�~��Ȳ�A� t��;���P�ETbJ�F�s-��V���B�ҦV�`��8�<�nT�
x�*��
P��\�Z&UpPEKV�U����0_������8>N�hv�f��}=t��4#��z���`t��� [���(��@���Q��L��ģ��o��7��t�t��$u�Y�G'x��l���8:<j�۱rh��o�����zZeR�m�n�Z��K���Fδ
�Y��rg~��#�g��G�zTAU~_+�=�D���{��J�%R��4p,��<M��
�Ƒ���h�6L���A�k�4H*��Uϱ=��@[�&��;��I $�-��  �f�$�*	�~�h��H��2r�ȥ�-F��ԲOJ4l��[�U7����\��Y!j�H,����8��Y���7-���ͤa�M����/H�[X���!��<��h����Sȩ�+�ly�+W�+����/�{�z�t��U�����H9o�Ջ�����],�Iٳp�nix4�I���\o�N�O�i����R������,=P��=�D������A4����t�dX���D�A�Ϣ������M�����x�����I8O�'�>C��x{$kr�Q!�84���Sv��r�p����w���Ǵ5�������L�,�����Yxb�>n��D�����(!�KT;#Q�41�_)j������_%�`��#$/F)�G&��������O�Ο���������?v�(�z��u���W�S�±'��X/�,�*(��մO-���ٞ(�*e�����Z�Nm��U�y�an�}���9�:N���fD+¨��������q�-l���Z`��JWaR�	vGwIx��S���r���Ze�fw�#"��ph�,��Ko�����"��L"0���J.�<��(�2w��)������l�vl�N�/�~�J�2�Q��B�{�;��^>+���1����ؙ�����[�j؜R-mI�M᫈�P<�M�Y�1>�oq�X��^ώ�0����	�H�l6X�ޞ��q�Ɏe��B�����=RjWY��B���ŋ��Ck�      j      x������ � �      h   �  x�u�Kw�0�5�]t7gb� VU�J} �*��&�S@A�O?�>��-'Kr��ssI$�F�W�OS�L��;��N�Ә�a'%���n�	c��(+�cS�f�-�v#a�[a����mO���ꊒ,a��o�C�q��˄�D����۪ܖ��:A�o>i����ɣ� ��w,O.���<hQ�a��������Yx�ոz˿���'�[5�j����wD
"Q�zϵ�ʘ~h�	���p�L�ṩwG-6���N6�S�kp���G�p2�����E9û$'�,����E�n���s{T�f���eV�2|��ZwO/�L���ԩa�Spr��7q`�XE�p��!�e�-3Z�6[N����K�B�i�! H����v�+
 �B쾱E�v��w��è��,����,s3;.zo�ӝ;Q����,���hٯmD�5?�(Z��mu�[��|�0}�AY�*P�)y�U�\�`��oƊ�{�
45����86G���91N�j��I�HiWj�Ώ�2o�_��pP��+�Ϊ�$�?b� Q"vݵk����s�O�,�,Kd��&���]̪�;$&��P�x`z����Q�4Mb_�֣� L��?��Y�⇻�W�lP˪�w�B/����ӓ�U�3�V�n���qb��D���.�������A�1��~��pss���N{     