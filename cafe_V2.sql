PGDMP  %                    }            cafe_v2    16.6    16.6 9    q           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            r           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            s           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            t           1262    21025    cafe_v2    DATABASE     �   CREATE DATABASE cafe_v2 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE cafe_v2;
                postgres    false            �            1259    21041    address    TABLE     d  CREATE TABLE public.address (
    address_id bigint NOT NULL,
    street_address character varying(50) NOT NULL,
    street_address_second_line character varying(50),
    city character varying(30) NOT NULL,
    postal_code character varying(10) NOT NULL,
    country character varying(30) NOT NULL,
    last_update timestamp without time zone NOT NULL
);
    DROP TABLE public.address;
       public         heap    postgres    false            �            1259    21046    cafe    TABLE     �   CREATE TABLE public.cafe (
    cafe_id bigint NOT NULL,
    address_id bigint NOT NULL,
    manager_emp_id bigint NOT NULL,
    phone_number character varying(20) NOT NULL,
    last_update timestamp without time zone NOT NULL
);
    DROP TABLE public.cafe;
       public         heap    postgres    false            �            1259    21036    customer    TABLE     m  CREATE TABLE public.customer (
    customer_id bigint NOT NULL,
    address_id bigint NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    phone_number character varying(20) NOT NULL,
    email character varying(40) NOT NULL,
    active boolean NOT NULL,
    last_update timestamp without time zone NOT NULL
);
    DROP TABLE public.customer;
       public         heap    postgres    false            �            1259    21051    employee    TABLE     0  CREATE TABLE public.employee (
    emp_id bigint NOT NULL,
    cafe_id bigint NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    "position" character varying(50) NOT NULL,
    hourly_rate integer NOT NULL,
    address_id bigint NOT NULL,
    active boolean NOT NULL,
    phone_number character varying(20) NOT NULL,
    email character varying(40) NOT NULL,
    username character varying(30) NOT NULL,
    password character varying(30) NOT NULL,
    last_update timestamp without time zone NOT NULL
);
    DROP TABLE public.employee;
       public         heap    postgres    false            �            1259    21068 
   ingredient    TABLE     �   CREATE TABLE public.ingredient (
    last_update timestamp without time zone NOT NULL,
    ing_id bigint NOT NULL,
    ing_name character varying(50) NOT NULL
);
    DROP TABLE public.ingredient;
       public         heap    postgres    false            �            1259    21073    ingredient_manager    TABLE     $  CREATE TABLE public.ingredient_manager (
    last_update timestamp without time zone NOT NULL,
    ing_id bigint NOT NULL,
    cafe_id bigint NOT NULL,
    inv_description character varying(200) NOT NULL,
    ing_measure character varying(50) NOT NULL,
    ing_price numeric(5,2) NOT NULL
);
 &   DROP TABLE public.ingredient_manager;
       public         heap    postgres    false            �            1259    21078    inventory_level    TABLE     �   CREATE TABLE public.inventory_level (
    last_update timestamp without time zone NOT NULL,
    ing_id bigint NOT NULL,
    cafe_id bigint NOT NULL,
    qty_in_stock integer NOT NULL
);
 #   DROP TABLE public.inventory_level;
       public         heap    postgres    false            �            1259    21056    item    TABLE       CREATE TABLE public.item (
    last_update timestamp without time zone NOT NULL,
    item_id bigint NOT NULL,
    recipe_id bigint NOT NULL,
    item_name character varying(50) NOT NULL,
    item_size character varying(50) NOT NULL,
    item_price numeric(5,2) NOT NULL
);
    DROP TABLE public.item;
       public         heap    postgres    false            �            1259    21026    orders    TABLE     �  CREATE TABLE public.orders (
    order_id bigint NOT NULL,
    item_id bigint NOT NULL,
    customer_id bigint NOT NULL,
    cafe_id bigint NOT NULL,
    payment_id bigint NOT NULL,
    delivery boolean NOT NULL,
    delivery_address_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    item_quantity integer NOT NULL,
    customer_modifications character varying(200) NOT NULL,
    delivery_notes character varying(200) NOT NULL
);
    DROP TABLE public.orders;
       public         heap    postgres    false            �            1259    21031    payment    TABLE       CREATE TABLE public.payment (
    payment_id bigint NOT NULL,
    customer_id bigint NOT NULL,
    emp_id bigint NOT NULL,
    payment_date timestamp without time zone NOT NULL,
    amount numeric(6,2) NOT NULL,
    payment_type character varying(15) NOT NULL
);
    DROP TABLE public.payment;
       public         heap    postgres    false            �            1259    21063    recipe    TABLE     �   CREATE TABLE public.recipe (
    recipe_id bigint NOT NULL,
    ing_id bigint NOT NULL,
    qty integer NOT NULL,
    last_update timestamp without time zone NOT NULL
);
    DROP TABLE public.recipe;
       public         heap    postgres    false            g          0    21041    address 
   TABLE DATA           �   COPY public.address (address_id, street_address, street_address_second_line, city, postal_code, country, last_update) FROM stdin;
    public          postgres    false    218   M       h          0    21046    cafe 
   TABLE DATA           ^   COPY public.cafe (cafe_id, address_id, manager_emp_id, phone_number, last_update) FROM stdin;
    public          postgres    false    219   ��       f          0    21036    customer 
   TABLE DATA           |   COPY public.customer (customer_id, address_id, first_name, last_name, phone_number, email, active, last_update) FROM stdin;
    public          postgres    false    217   ��       i          0    21051    employee 
   TABLE DATA           �   COPY public.employee (emp_id, cafe_id, first_name, last_name, "position", hourly_rate, address_id, active, phone_number, email, username, password, last_update) FROM stdin;
    public          postgres    false    220   �&      l          0    21068 
   ingredient 
   TABLE DATA           C   COPY public.ingredient (last_update, ing_id, ing_name) FROM stdin;
    public          postgres    false    223   �,      m          0    21073    ingredient_manager 
   TABLE DATA           s   COPY public.ingredient_manager (last_update, ing_id, cafe_id, inv_description, ing_measure, ing_price) FROM stdin;
    public          postgres    false    224   W-      n          0    21078    inventory_level 
   TABLE DATA           U   COPY public.inventory_level (last_update, ing_id, cafe_id, qty_in_stock) FROM stdin;
    public          postgres    false    225   �.      j          0    21056    item 
   TABLE DATA           a   COPY public.item (last_update, item_id, recipe_id, item_name, item_size, item_price) FROM stdin;
    public          postgres    false    221   L/      d          0    21026    orders 
   TABLE DATA           �   COPY public.orders (order_id, item_id, customer_id, cafe_id, payment_id, delivery, delivery_address_id, created_at, item_quantity, customer_modifications, delivery_notes) FROM stdin;
    public          postgres    false    215   �/      e          0    21031    payment 
   TABLE DATA           f   COPY public.payment (payment_id, customer_id, emp_id, payment_date, amount, payment_type) FROM stdin;
    public          postgres    false    216   mW      k          0    21063    recipe 
   TABLE DATA           E   COPY public.recipe (recipe_id, ing_id, qty, last_update) FROM stdin;
    public          postgres    false    222   q      �           2606    21045    address pk_address 
   CONSTRAINT     X   ALTER TABLE ONLY public.address
    ADD CONSTRAINT pk_address PRIMARY KEY (address_id);
 <   ALTER TABLE ONLY public.address DROP CONSTRAINT pk_address;
       public            postgres    false    218            �           2606    21050    cafe pk_cafe 
   CONSTRAINT     \   ALTER TABLE ONLY public.cafe
    ADD CONSTRAINT pk_cafe PRIMARY KEY (cafe_id, last_update);
 6   ALTER TABLE ONLY public.cafe DROP CONSTRAINT pk_cafe;
       public            postgres    false    219    219            �           2606    21040    customer pk_customer 
   CONSTRAINT     h   ALTER TABLE ONLY public.customer
    ADD CONSTRAINT pk_customer PRIMARY KEY (customer_id, last_update);
 >   ALTER TABLE ONLY public.customer DROP CONSTRAINT pk_customer;
       public            postgres    false    217    217            �           2606    21055    employee pk_employee 
   CONSTRAINT     c   ALTER TABLE ONLY public.employee
    ADD CONSTRAINT pk_employee PRIMARY KEY (emp_id, last_update);
 >   ALTER TABLE ONLY public.employee DROP CONSTRAINT pk_employee;
       public            postgres    false    220    220            �           2606    21072    ingredient pk_ingredient 
   CONSTRAINT     g   ALTER TABLE ONLY public.ingredient
    ADD CONSTRAINT pk_ingredient PRIMARY KEY (last_update, ing_id);
 B   ALTER TABLE ONLY public.ingredient DROP CONSTRAINT pk_ingredient;
       public            postgres    false    223    223            �           2606    21077 (   ingredient_manager pk_ingredient_manager 
   CONSTRAINT     �   ALTER TABLE ONLY public.ingredient_manager
    ADD CONSTRAINT pk_ingredient_manager PRIMARY KEY (last_update, ing_id, cafe_id, inv_description);
 R   ALTER TABLE ONLY public.ingredient_manager DROP CONSTRAINT pk_ingredient_manager;
       public            postgres    false    224    224    224    224            �           2606    21082 "   inventory_level pk_inventory_level 
   CONSTRAINT     z   ALTER TABLE ONLY public.inventory_level
    ADD CONSTRAINT pk_inventory_level PRIMARY KEY (last_update, ing_id, cafe_id);
 L   ALTER TABLE ONLY public.inventory_level DROP CONSTRAINT pk_inventory_level;
       public            postgres    false    225    225    225            �           2606    21060    item pk_item 
   CONSTRAINT     \   ALTER TABLE ONLY public.item
    ADD CONSTRAINT pk_item PRIMARY KEY (last_update, item_id);
 6   ALTER TABLE ONLY public.item DROP CONSTRAINT pk_item;
       public            postgres    false    221    221            �           2606    21030    orders pk_orders 
   CONSTRAINT     ]   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT pk_orders PRIMARY KEY (order_id, item_id);
 :   ALTER TABLE ONLY public.orders DROP CONSTRAINT pk_orders;
       public            postgres    false    215    215            �           2606    21035    payment pk_payment 
   CONSTRAINT     X   ALTER TABLE ONLY public.payment
    ADD CONSTRAINT pk_payment PRIMARY KEY (payment_id);
 <   ALTER TABLE ONLY public.payment DROP CONSTRAINT pk_payment;
       public            postgres    false    216            �           2606    21067    recipe pk_recipe 
   CONSTRAINT     j   ALTER TABLE ONLY public.recipe
    ADD CONSTRAINT pk_recipe PRIMARY KEY (recipe_id, ing_id, last_update);
 :   ALTER TABLE ONLY public.recipe DROP CONSTRAINT pk_recipe;
       public            postgres    false    222    222    222            �           2606    21062    item uc_item_recipe_id 
   CONSTRAINT     V   ALTER TABLE ONLY public.item
    ADD CONSTRAINT uc_item_recipe_id UNIQUE (recipe_id);
 @   ALTER TABLE ONLY public.item DROP CONSTRAINT uc_item_recipe_id;
       public            postgres    false    221            �           2606    21098    cafe unq_cafe_id 
   CONSTRAINT     N   ALTER TABLE ONLY public.cafe
    ADD CONSTRAINT unq_cafe_id UNIQUE (cafe_id);
 :   ALTER TABLE ONLY public.cafe DROP CONSTRAINT unq_cafe_id;
       public            postgres    false    219            �           2606    21091    customer unq_customer_id 
   CONSTRAINT     Z   ALTER TABLE ONLY public.customer
    ADD CONSTRAINT unq_customer_id UNIQUE (customer_id);
 B   ALTER TABLE ONLY public.customer DROP CONSTRAINT unq_customer_id;
       public            postgres    false    217            �           2606    21122    employee unq_emp_id 
   CONSTRAINT     P   ALTER TABLE ONLY public.employee
    ADD CONSTRAINT unq_emp_id UNIQUE (emp_id);
 =   ALTER TABLE ONLY public.employee DROP CONSTRAINT unq_emp_id;
       public            postgres    false    220            �           2606    21084    item unq_item_id 
   CONSTRAINT     N   ALTER TABLE ONLY public.item
    ADD CONSTRAINT unq_item_id UNIQUE (item_id);
 :   ALTER TABLE ONLY public.item DROP CONSTRAINT unq_item_id;
       public            postgres    false    221            �           2606    21133    cafe fk_cafe_address_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.cafe
    ADD CONSTRAINT fk_cafe_address_id FOREIGN KEY (address_id) REFERENCES public.address(address_id);
 A   ALTER TABLE ONLY public.cafe DROP CONSTRAINT fk_cafe_address_id;
       public          postgres    false    219    4783    218            �           2606    21718    cafe fk_cafe_manager_emp_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.cafe
    ADD CONSTRAINT fk_cafe_manager_emp_id FOREIGN KEY (manager_emp_id) REFERENCES public.employee(emp_id);
 E   ALTER TABLE ONLY public.cafe DROP CONSTRAINT fk_cafe_manager_emp_id;
       public          postgres    false    4791    219    220            �           2606    21128    customer fk_customer_address_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.customer
    ADD CONSTRAINT fk_customer_address_id FOREIGN KEY (address_id) REFERENCES public.address(address_id);
 I   ALTER TABLE ONLY public.customer DROP CONSTRAINT fk_customer_address_id;
       public          postgres    false    218    217    4783            �           2606    21148    employee fk_employee_address_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.employee
    ADD CONSTRAINT fk_employee_address_id FOREIGN KEY (address_id) REFERENCES public.address(address_id);
 I   ALTER TABLE ONLY public.employee DROP CONSTRAINT fk_employee_address_id;
       public          postgres    false    218    220    4783            �           2606    21143    employee fk_employee_cafe_id    FK CONSTRAINT        ALTER TABLE ONLY public.employee
    ADD CONSTRAINT fk_employee_cafe_id FOREIGN KEY (cafe_id) REFERENCES public.cafe(cafe_id);
 F   ALTER TABLE ONLY public.employee DROP CONSTRAINT fk_employee_cafe_id;
       public          postgres    false    219    4787    220            �           2606    21734 0   ingredient_manager fk_ingredient_manager_cafe_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.ingredient_manager
    ADD CONSTRAINT fk_ingredient_manager_cafe_id FOREIGN KEY (cafe_id) REFERENCES public.cafe(cafe_id);
 Z   ALTER TABLE ONLY public.ingredient_manager DROP CONSTRAINT fk_ingredient_manager_cafe_id;
       public          postgres    false    224    4787    219            �           2606    21182 *   inventory_level fk_inventory_level_cafe_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventory_level
    ADD CONSTRAINT fk_inventory_level_cafe_id FOREIGN KEY (cafe_id) REFERENCES public.cafe(cafe_id);
 T   ALTER TABLE ONLY public.inventory_level DROP CONSTRAINT fk_inventory_level_cafe_id;
       public          postgres    false    4787    219    225            �           2606    21099    orders fk_orders_cafe_id    FK CONSTRAINT     {   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_orders_cafe_id FOREIGN KEY (cafe_id) REFERENCES public.cafe(cafe_id);
 B   ALTER TABLE ONLY public.orders DROP CONSTRAINT fk_orders_cafe_id;
       public          postgres    false    219    4787    215            �           2606    21092    orders fk_orders_customer_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_orders_customer_id FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id);
 F   ALTER TABLE ONLY public.orders DROP CONSTRAINT fk_orders_customer_id;
       public          postgres    false    4781    217    215            �           2606    21109 $   orders fk_orders_delivery_address_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_orders_delivery_address_id FOREIGN KEY (delivery_address_id) REFERENCES public.address(address_id);
 N   ALTER TABLE ONLY public.orders DROP CONSTRAINT fk_orders_delivery_address_id;
       public          postgres    false    218    215    4783            �           2606    21085    orders fk_orders_item_id    FK CONSTRAINT     {   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_orders_item_id FOREIGN KEY (item_id) REFERENCES public.item(item_id);
 B   ALTER TABLE ONLY public.orders DROP CONSTRAINT fk_orders_item_id;
       public          postgres    false    4797    221    215            �           2606    21104    orders fk_orders_payment_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_orders_payment_id FOREIGN KEY (payment_id) REFERENCES public.payment(payment_id);
 E   ALTER TABLE ONLY public.orders DROP CONSTRAINT fk_orders_payment_id;
       public          postgres    false    216    4777    215            �           2606    21114    payment fk_payment_customer_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.payment
    ADD CONSTRAINT fk_payment_customer_id FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id);
 H   ALTER TABLE ONLY public.payment DROP CONSTRAINT fk_payment_customer_id;
       public          postgres    false    217    216    4781            �           2606    21123    payment fk_payment_emp_id    FK CONSTRAINT     ~   ALTER TABLE ONLY public.payment
    ADD CONSTRAINT fk_payment_emp_id FOREIGN KEY (emp_id) REFERENCES public.employee(emp_id);
 C   ALTER TABLE ONLY public.payment DROP CONSTRAINT fk_payment_emp_id;
       public          postgres    false    216    4791    220            �           2606    21153    recipe fk_recipe_recipe_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.recipe
    ADD CONSTRAINT fk_recipe_recipe_id FOREIGN KEY (recipe_id) REFERENCES public.item(recipe_id);
 D   ALTER TABLE ONLY public.recipe DROP CONSTRAINT fk_recipe_recipe_id;
       public          postgres    false    221    222    4795            g      x���Y�[ǒ$���0�^[�ܗy��+�W�H�d36/`��p�*J�_?t3q�l�nI8uN.r��u��=��7��W��_�3��^�s���OV�����+%��L�Ϥ^K�?����~c���!�߽<n������է�/����n�[)������6�3)�]�}>��>�7[�~���W+i��z�����/oҟtQ~f�]�����>��ۧ��������x^�ڝ���>�^��oO���_>ˮ������������o�����v��n�ne��Rz�����is�ޢ���R���W?����/��M����������xD^H�2�'�U0񳨂\�cs�����?m�[> -�؇0^ʸ�ک���-�����?�#b��Z͠��7�S�U�ʯ_=���|�w�+*��*�>Gʕ5�3g|\�����b-g'T�#j�Cx����|I[����.��?SQ*��U�u e>�A�ϔ�z���n�y=����O��+�N�]:��*Nϥt�/�Tk���=�o��s݉�dJ�RR��Ѭ~؜�O���ݢ�;g�Nj���*��n>�mCӒ�/h�W\�Ϭra�3^a��X���?�J,�-���kecH�������U8�2��I�!���h>�κϰ�����_�[�Ui���
N���{������:�ʬ��)�LZ�z���Tٕ�3�t߮�qzJ�[I)>��������7N�=��#���z���������9�:-b���U<|&�u����oN������������,W�b1u00�7�S��J��<>m�<���mU�V��χGL˕��#_���f@aWqU��T+��g�Ҁ���x���=t^M�0Τ��)o��������u?�zz���68�XOo����i�|n�q��NIi�ƍŴ+�r�#�X�vW�Z:���2x�W����f���i�������З/�\����Z��a}z�_i'�̧���e�z��Ü�e��!\�Q����^���7�/7��vO�5%�W�W�dp���e�q֥���7w�������|���o�!��v�zF� �����p^�|�{��?�i<(b[~���6���v���w����s�o��9X��{�gp����?J���������a{�{|<V�=?B���# Y�V���xjd�K���	%��<��\y���n{z*O��"� LJ]m�.��	v���t�w��>����C��Y��2vv��>���<=��)۞k���[�U��p���S�6��k,VTb�Ly��������ֹ�/x���������0ҋ�r��_����8Z�?����.�7f-mLt:^۟��Xh!>��a�ݯۼ�M�Wk�K2*=z+WB�h��`���q���r�����j%lLw;���|(F����=�fx>�Ʊ4郰[���C~�+�=':\��spb������k�~[�>Ε	!v���;9|��k��O<�χ��MN���/���Ha����#oP�$�ϕ֫��0Zfh]p�C �����Hu�EX!B	b��v�n�5A��?vt%b�$���uV�A9�p�d�o�麨�$�����!���}�m�(v�WKD�ݱ"W���~�=�oO��6���mq�%3��hz�?n��gw������2��5F�<\�+X���}9���~ui������:Ccە�qs�/�kqw�]rҍ_���t{���J�*���{���1������;��󕹷�Ba�fVo4^R�h���ٟ7�s����X7�����O\��5L5|�����6u��G����V���s��r����]��})�
F�n�6���!�_T"Y�t�6�������F銣^� -���]������Q�uy+�D�5IP�w��v^>�6�;�:��2�/��0��������v[1Q�Eą/�O�����9�}{9��`G�a����iE�����ϛpf�!
��c��6hxh������¥"�����ɢ�0��_����8��9��j��x����Y,�[�9���o�6ě�F ��44�j+�!�9c��kS�@�rQR"�/w�5\��ݳ���*�?�	�����BL*.Q����a�$��hes4_�v��	���n/<��"/�4�la9���p��X�γ�nhX�@�X�#"�n����W��81>0�#��{���nV��7B9?��`ap���i+h�Eǩ	��l 0<x�,�D��n������x*�������a�&�g"� �y��g�Fw~r��W�߰�U��Ϗ8g�=��j��~ǟ��Z��]�}ƕ��P#ੰ����п�
�`vO�%cy�"�jO����zFg��.��v�������+	 ���m	�����	���k�4�����C�[O���s:��L'�@��v��~����, �~}d��a0LW�Q<�o��*��_`v���fEf��dx����q�&e�
���c�� �}�y޸ǚl�O+�m��ʱQ���0_���7�i�/�2^�a�����ʒ
��F���ɒ�M2)�,x6e��������n��uؗ ��w����W ��oq��������R���o�5�l�;����:b���1f�J���6�a"�݁am����D�8ź��;��/N���CYR���.��8��U w���1-��x������J�a��l� ^8�<�}��Ca���*�S��e���lu�i�?�[ ��C�����`���c���-�p;臆G�|�/ʉ�3փQK	�dﻼ�q����	�0����sĵy>=!4讽�Eƿg�e��|au7����%Q��
�~z��yOΫ��nK�	��i`ř����#rS�l ��P�,X��
�S'y���s�hB�8>��a���tH6��"�kw�Gb|�fDc�է�0���	pu�N���#���\����qK>�|ᰩPS>N|"͵E0l�0$ᔧrgW��;1C�%�4����I����[.Vĥ�F,89�%���Uy������p����GwN2��4�=h��$|�E���"H Ob���q���PQ� 
}��ɜ��U�YT\Ҟ� '�G2t9&�5G+h��+�|�� �?]�;^��; t�?#�c�֓7pX����)KȐ��x-��[���ҝϧ�ݖՉf�<�]9c>�P��V�H��{~��;���z���4�������!G;��>Ǝ�E�vZ�(�ERT��K��nR˕��X�rjW։�������Xh�=�m��4�k��,� �˵�|����/W��j		��q�$�#]��o���Y�h�?�e �j&L��|��N���댹RH1y�o��^ ��:D8�ch�|���!��#����E��&�D9;LN9��=p��ပĖ�̍N�.�aZ��D �
Nt�&K��p��'���
*�Fɾ�(x|.�]�#���S�O||>�`֫��Ϯ"� R��I�mK�=\��0ˏ�#>��/^�˺r�6�bo����w%5K+���Ù	�+��X�V�?
0��¡S�х^���؁#����D���O���&��a�8�%��F �}*�oܻ5������	�c�Ⱂp!~z� V�5>��m�`�n�Pd�Wު�Ô�Ξ�2���
xC�d�<WS xS���5���]58��GOO\�T/�9GXòg]ca'f�I��\��V ��;@h�.�7~��v0�Ws�4�9��s����@� ��ƃ6'���}���V
��p�q���.���/�C�� ����Lrb��Di��3|���M��n\DN�S���;�A���t<%�$�G08����z����)��	x&|E���sv�!�)Y�	��-�ʯ�A&K��S��2���7���ֽ6j�Y�b*�T���8췥tJ�����	�I����0���y��J�05�N�ʑ��t[Vw����	RO`�_����ϻө$��5��1�1v_d�q�    �im�+:>?Ug�Ě� \��g�
Ϙ�{�lmI:�fr�'&ۑc5y0������L�d��{6���#V"��>=l*v�_J��f�&(�!���M#Ћ�7�x���aJ%~���Z�"Nk�/9�� �y�����1+���+�7>&,T�@Y�;�71F2��� �pNd�y�d�C�Y�6���J�%�P A�;��<��؂�Pj��ωdu�p��11��0�2E�k&����`A���@�8�㰜Lf�	���K3����U�	�h���
��}F�|�z�a���q�l�Wd;s����UX%,�Ѐ���*�2�C����+������r���ll� }���=��R�	q�$�g�	�[��Hf�O5���Ig�G��@���t#�B�2$EÝ�T9��a~t�����w��F��j���
!�gֿ��X�JܓR�wa��������˭�����10sHZh��nR���/����ej%��g!,�QXV~�?��,\�b4Q�=��qq���:,F�����>�+�X4X_a�q�*�z�p��zcGɁ����i���Ղ1J�)MT�	y1bK
큛���e�A�/�Ⱥ��bӣ� ��
_��_���=�4��%� 3�z�j`�D��&�S���l��?����h8�}_}x�ߝ��uH�D�"��85����{(�0�*Y9^ю�u��d�f}��\��H9^��{(�27���	rM��t���x�����k3F�
��*)|�<bEZ��,_I)f�%$\�	��/��M��������>\5�3l��h�H�j�0_�����ER�c1x-ֿ�S"���a���}χ�rR�"�n��}���+����%34Ɗ�,�8�+`���� t.r�NN�6y�"�ZBo�?���)�0f/)A&�1q�����Q$�_`$�!�����n�O�c��Y�諄B����Y�aA�OO	F��!I�:�`ĸ��`�5��Uq�pm�^�I9ڏS�L�	ܚJjl6���,�g�EB����	E�*K�6ť9��'���1a�$���G�߶�O���$>��1[@�����.��/`cS�`z��L��|'B�u={1'��X�)��b�uI]�&QM�
/�]��<n`P6�?X�E2���z� �EԡqNm�Jr�|�`�j͵G
C���[%�Xfʷ�h�v�Y��P��߼l�t
H`Z���3>��uW��Ii	 0��efR�f���	�2���>%z?�>lSƤ� �O+�����:_o����WZE��B�YY
��B$�4���쏡w��Qc޸R䲸���]���wi1��_Z�Xw�%u�I=@Y�T��!){;JNλ����A58�0b��5~Z����Vzi"���7���x���{��N����R=���t�͔��l�+�ٗS`���;��t�o�'/���ªۂ���$RV,��-sŵ�r��ֆ1�V��^����B� �K��6\qh�+"p����7����>���Ŝ�����,�v�<�|�W�Ґ�βK� Sc���� �d�t�?2X�~�D�0�R��
�v���2�
u��i	?��UA�;2�n-Ͻ֮U�rq���B��fDh����X�a���Kn�)���:Q�>-�1?�z�E�S�L��9��2�}�3N�*6r�6�����?p��k��BeX`u9?�)�����jk�Y��
�]����QE���p�P�y5C��= I_��ι�����FNnag�w"a��7�;���G��GuD1�X���Q�:Լu�-N^$u~ޫ��|wCV��RjYE��e���%e�"�t{���%�rٺ��,D�Ŋ�\Z�����ZIX���Kp������q��Q��-���q�
!9�غ��a�8���l��9�H=w���\��+8�)�����|h`��C�:h� ��^ښ���?/�[Dz�J� �]�i�l�f������Pch���8&����_1�Y�oM�0�H��fŬ�X����}m P�E����IUY�T!��{��M���2�nv\��F��+��dG��$��fxjd��y��ub%S����5�JWQ�����u�8Z��[o�u&�#��A�֜3yle�1�� kx_��M�(�-���
M���8(vDƒ��J�o�+7@��od���7$[a�?n���]�*� `ḷL���(��De�Zw"����Gո��fN�Y�>�:c�j,m�+U�0�N����#�6(�{��`��פ���}l�\�k7�>�WTS���q�׵}b̨��P����q��K\epkfU���OR�S|�K]`���0�Fm�.16���0�1to_�wm�m�rZ�WĊ�\][؄���^I�{���&#\ɳLvK�x�q��L	*�d\6KT�J��mq�4���¬_}��7�/��S���ޱ嬚��w���t�.��
o��B��c�k�K�L�����c�H���_���>4�I��g	K���!�d�b������@W�)����6V�kr��'�g�q�]�6�բ���D�¤.	�$ju�������4mRD���Q�/�D`NTK�1s�B��������]��� �ڋ"�war�;��%^�I��&���1T3�E�e� v�6��%��p^h� k�d�Sg��,^�����e2&?�}�Q�I��C�:"���`cd�i�����/ksg37�	���N;/�Hޯټ쏭Q��DW���!l���:��>Trj��p��L���GI�������Re��uĠc��E������y�Ȫd̫��>F�[�'�/�T��H���_R�cO�j���r�\���I��Cc���!� w�����/��B�0j��$��X�����ws�t�b�M��`D2�%��s8��b����uN�*%������x���V{���s��ȂB��[\Q6s���Ը>�G������cВq�-L�aܵ�>%D���@ ���)'GwjZ���A��Q��%҂�Y{v.k�G�R;n���8q���d����f��+�?���ﶉ2}}l��c$m���9|��,�m��^F���⪉ZH�gn��ԧ�HZ�u�C�K�u�ږҍ$q6f����J�c��V̮��H�"R��i��|
�/zJh�kx
|�n�KQ|Q���T!!k��q���#�����awN��A�qM��*�6K����ߚ�Y�u�R�g� Ғ�.�p��ɝJ�v7X��a-MnCX�}�m�e?�-�D�0r��ԉk���86�}6\x��*k���q��v����d��f_Do�l=��d�l�9vǦ� C(��ը1�։S������4�b���}��K���y�᷿PA�1eB+6\��u��S����="��(v���_�7�Y�)!�g�=�" @lw����i:(.u]&����+HiF��j7��b�=�+�l!"�1Ц�"�3|yf�Wy��r*9���J`�R���R���s�E���u�/,c�0�
j��&���V�8.� ��#�w7�6��%��*sp¿!/��d�o>�R��)i��lA5���LO&gk�X�ɥXZn� �d�(�j�Z�z�P���&fؽ#"�:*�)�K�Z�&u���<VH�`�;���E�Ɉkֿ��MRČ*
�w�\�h��7���	s�a����"�e�3��5Mi5*>n��楪Ǌ�ʑ��"�?%�ݭ��|HJ?�O[��g�q�(�Vj�����*� \���ՠ��IeD�xޟ���-��q��:l�t�V���$�QvE������s"�qM�d:;Ö>.�c�\	)���p`r+�R�㏀Ab�*��؛���)��dU
K��E�}|7�I��\�\��'G��gL�����GRkƆ���s+�"���mB�0V��=b)�x�vY-M�Ze�)��T�3tz8.��tK&�UE���c������O�[�����Y�f�O1_wx_�%���#g��*�A2�Nj�jh\aŸՓ�k"�ww�?�_m(n���    ��8"�րu>y�O��a�uRz]!/&в
MzD*�e�Q�B�a���"(�i1my^%لJE��d%P3��U[RE���Pd�����쪻�0pմ��TT��mh�4�ǵJV��L�@@�A{6���h˔Q����ܩ�j$�c$#���b5��F��>�����jD���>2�f]3x��i� �N�w-{���F�����\������cm�5�酄�����T}� grnT�3��ޫHw4�</v��'��� �R k�Z>:�)���mN�@�>{�&��2���QPv�~
�K��o��<%��U��Oe�t*̅jS/��W?%���;2���_o��~�fӄt�0c��
s����:�ʵ���֌pT^��<"�e�Wɞ�����h��b���$W҆��}3	�?�WS�������M�_�|u���؍�tE�_��W����i���3�ia3Ws��:�8�=���8���݂҇{^�%'�ɬr� (;�㞵� ���,�l����$%�@�f��E� ��VYk�ns��l�����E���J-�K9�'�z�V=����zP�S�<�
�U�M>��ZGr�M�ΕB�0vj�p" ��āZ�@@��8������-�\�~%Z7E9g*�T� ���uOQ�Ԙ�I��Tb��,�L���)$1�!�c.�x��r�<5b ��~�ӞĶ\��F������ �j��ᾥ�H�����_�|�y3�,3���m2粜\�.X����,��6��K�<�~�Q����)bY�ʆ� ��� �9Ӭ�f�*WE���>��Ʒ��t�Kfw�W)g'�;>�s��|틭�%p>�Bv;���5+nX��h�2{�	/�x�_;n�����~��5�0:�z���U�-c��3iK��A�-Sņ��Iw�O�r���j�Ҥ�����[T�}��l_R�bb:F�jM����:��)+y,��g�n_B��'
��
V3����G�?U/�c��69c��pu�����3G�ɾ�
D:>������Z�e��*y-�wc#�:�Ѣ �Hq{ы�{���L��W[:������1|�L^���d���I��45��9r�A�*��GA�#�T��`Ø��TҼ57V� �qڽ�w�V�� ߪk�������o����)^Sl�R�~�6L/����T�����6\E��2����,0�v:�0Ԣo*�a-�q���)���©�/2�WO)0S2؛��uLQB��u�Ҁ=�����'��ܲRpE�KB�.�fZ��x��L+Ôr�����"�C�m�����r#�|d��vR+��n��:����!u�'��zD�V�h�ϟM�rI�Z�Yy�hftMńPzR_#5N��.���p�kL@�1L�3ê,>���W1^�Z3&2�K�<;�o�p�5�}�O�çx
ouݴ�;J��O�RM��%��O�'���.�a�:\��L`1���G�N �Ƴ'���"�N�q6fʨԗuw�� =g���>�(��Hެ�o����O�� �+ȱ�w����N��(-4�`����Q�$ˋ��%L}+0!�:i��P��ˁ(���W`��*��&�I��o���Ҹ�g8ɡ�qIK��8 ����F�PR��8�����EJqX8p�b�n�ڸ�F�ΥX�I�9�(�BR=)�O���]
��DI��Pv���H��73�q�<��D���ճ���z��W��|
��#�]��g�6�@�hjJ)U6j�4{
�Vak�Ox9#'2�&*��o�Ĝx�^�2D3f0�2�U���M��V|�ʌ��	��Y��,��e\�ŅH%'W����;��3����V�*�[�r�m�,�Qg�p�"c��b����:���K��G��� �Յ����M�`��#g���s9fV�X;ɔ�}2�� HW�w@7����!ŧq_�Yq�ƪ7�N����^-�X	Y3(�\r\&�������A��:@G��{'��"��/����MV� |�d�e#	���&٘IL�_Y/����S�����r�7�e�J��J���q�S��6��ϻ�u����)dl'G'� �?n7w��,UH��e���#��Y�qE[=%�lh:��0P,=q�U�N`?ǍE�E&��š�c�Y�i��P{2�D/�����yڒ���vab��w�U�ϋ 8[}���ʌ>Ĕʩ:�"	�"�q�y 2�qc�a����["���)*b̒�#�:'��HE�$�r5=Ri������(��3�߆>2����s.��rk�oɸ2���6j�u=���GJ���-�.݀ʻ�\���_�(ׯ�O^*;��=L��>~�d���9ܢ!)��Vv&���^$ɐ��>�I7��wOIvj��'�
����Đ-�zJL�g=Alnq��y=�Q6<��~��1�9� RG�������o�v�o�up8�o� ��Y!4�4�Y�=b���x�f|��}�dX�	l�L1{�nw�s"��2�ײ7"���r3 ��	i���7�s�Zw����������g&�R+K�ʢB|���t�h?5�O�=ǌ��Naǽԃ�g'���\�o�7� ;iX��d?�bPN�N����29lkZI��~b�����͛���J �X������pQ�`j׈�;��ƺQ��%mKe�N#vx�^SȚ���i؏Qm�X?Z�2z�!�C�h&g��������}w���Bԍ�f}X�c��pI*d���`�Lk+�r"��(^
��@>l�1%^&c �%�o�-:BtK�Z�q��I;6Q~�=Q�"�VK���cS�+s�K+o�]E$ M��px����Y�Bs�L��*(z1�wv�1a)��v��L��[:tg=��c�q��sj���u����I��bⷥ�w4�5�kR@pv��aX�S�����s�	N��eڀ�ǝ%�9�-��5j�|`B��lk�QX	��:�&�Y�.��`8 -�T�8�a�kӍ��T��c/kYԡk ���s;�B���S�v�[�|2cD�~" ��1���^�մ0-c�^�5ɤ����Dԩ�0kB��ތ{�Δ l"�i[�@�:(�C�f��L�30�]����u�� �f�{)��x�rq7�˰�x�gțH��o���N%Rf��i3jl�)�O��P��J�y�r����g�F�GY[%l��fS��?m���x~2G�!�zKA����慳��"���-�J���~!x��k�W{+kӘo<�����߂���'Bf��\��V+|�u��Arz.nS$.����Z�-mށ�]S%2MV52��DJ�I��y�o���-�����2�M@l�i$'�����04�;+]'5o�`9�Q���>�o���?���g㌿H-}�2��切���*rPGM3Or7���7��e29����s���76v��t5���ꋶ���2�d3�q7u1���6�t`�*�>���9Ljp��3�̥��$ ]�I'��HZ����e�= f�F�ԐԐKOM��˞� �:&�YNefFH�Z��d.��@�Y4��A�,˩�z��DŨA�#�j��"뎖_�=�����QQ!��An��iߎ_.���<� �~&�*v�Ɛ��l�������0�ޘ�Qh�]-/ץQvzh*J���1 "t2��~�a�r���g�Ė8�8�þ�zҏ�Oi�Sn�*�VV�)�ש �1ؠu�d+~�g�jR���Iq-َ�D�O&%/��?Pl*5'�诺�0`DҬ�2C�J�vi]'���u-j�� �RV��*��!�^IVF�N�K����qCB�:G�E�ɯ��|�ʲ!:W�9YTU�F<:y�"��5�eLm.tO���9���rV�K�ΰ���sU?�0��1�\�N��z
��G����'�����Ey�9�^=��T՞yŤ�j)s�,9��Y%RT��}�x�V8M��_�-S� ��"�H?;�t�������r��~^FX��ZV�ƶ����_�۽G<v1���#�-[�����p�����C��j��U��ʠܰņ��p���1D��¾xJ@���d $���WY��.ֆ_    =)|�gS��'Y���oğ�C���y1.�[�Fey
���c.�il�?²�md㏼y>мv��T�(ʂ'���ʍ$Q�j���䭞9v�H�9%�|j�)��r��z<GY�_(}�]�7��e<�'Cl�ș�H1����u��7HӵQ�c����H�&�K�I���G�rT�f��2�K�Wg�d� �8$)	nWDPGNX��0�q�8g�RfL��O�� ��:�r�g�7>�g*eWi1K��Qr�?��ڥX����>%�b���nڝ��<&}1��#v�Y"E6��ϲ�Px[T��l����T�d.��\)Yo�Ȯ����ב]z�r>��@m	���5�໳T=������Rکz�uD�Գ.	����?�%���~\�f�7��/j�zǌ�WI>tQ��71R��7�j%	>��W�Mt�����,\�1�C�ھ;%v�=Wp�I���~rsq��U�oU����6LJ�I��qn�rR��J��|Y\KӢoX�T\�o�S��Sb�F�����kTT�V�_�O���(��k���Ü(�l9T��E�}i��*V	Um��j,!¹-*��А ��Z=�k�j$�Ah[��I�%AϿ�`$��$;����}<�����#�'s���A��_.	3,oI��h�$�H�).����aŅ���O0\Q��i�3���i�L���1���+��F<�T& ��z��z�ě��H���POI>�uh4&;���X����9L���I �����2�]�W��±q�\�"p�o�)"(��v��6K���i�8�4���6m%E�ҋ�Pԍkty�9�"ȗH��q�c�,�C��#MV����J�P��	Ʒ��8܁E���-EUD /i���Ԓ�wL�ST�iC�QӅL~mIJ�8��\K�CX��׈���c���
i��A$����x9��*�����		'x�[I� ���i�r�d9�ˈ��PX�3~��\�wp�	�f���61�@я����P%3n5����2F��\g�a���TlLI4��9evE6FT����jj"N^Lg�˷�J�$*Z�v6��&�ɤi��K�Ӵ�4�R���:�	���+�Gh�n��Ͷ-�p��X���޶A�B�	�cb���I�R^�X&y����IT��R�eE�[[@ʬz�$�h���uq!U��O�m�����Fa�B<��BU�$��������$�K�����h`����"L�$�����<��M��O/���v>��2�R�;?m�1�_F��$C1p�9�\+[�$��>��D��ϲY˦�7X��GVOZ� ��!�g~�[�=Y[�ϴu<8~��{R��W��f\�&X@�Mn�9�gd)�Yfί�0��[(�������6��Ւ�b܌�A�T����Ա����X!/��[d$���?Z>�%3(�)�u�p����D����K)2���vqXǱ6.��8�������٭����m`B'�A���R�_�pCB���՚������'��°+$Ϧɨ������]�����Gz�b7)�~Ν���s�b��/]���*
s]����"�;�ܘe����EJI\�͑�z롑�4�C�oFe4�[y4j3&hPJ�/��RM���؄���f �d�_�5C%ٞ�1�'������CU�\R6:��7���~ݞ���
���ՓbX
�<� <g��@�@�bOl�x��%�4T�˙�o��C�"�D=��w�q�D�+����O�g}�|�� ձQ>��f".[�x�179y�$��83������ �\�v�X鑺�6<%�j���j�1i{Jhpc�j�G�-�nN�7u�yM�&�{qV5��͑�[��@�^����e�&4�0魢H%VH,#r8g�8�]-�IJ��j�U7d3PkO�B�L��Hj��-c]M��6 v�:�2�sK�������Y�>V�(���X��K-������V�)�C�z���}�t%�9���u���%�L�ބ+�E��ܰ�li�
���Pu��+J'�o����ۉ���ʆ��Q��O�'�XW�N��p:>��k��MS��!ǌ�d�ھ;2LʩL�Ţ��LF�PFN��0Jھ��TeRZt�k�Z�t��l�F��I��§��y̘�t�j�/��Cr^�����{*DqV�ק]��m�4�]�$��KS�i�����Q����+-W��x�<���'��z:�ύ��D�iK+Ű55,��8$��%��������n-5A��_wwOGJ���@�"�!���%���~��Ť���Rs��걢������Իk�xʍ�S���Xj#8�b�g12�>�(�Xť�6�L�i�}�&��Z�M���2���p���XEqV�rAT�,1�m�Q�$�.�����9���#��*��v�JI	�"M�&�Ȁ�t��]H�zj;0%�;�$x��^NB��J�����\�+�_�,�['.���8-�:j��vY9�e�<�P�ҕ)�R��|l#����r�yg;�0��\,`�챦��m�3lHj�S��[[z�$}�(܀CW���(K���_ .4�	�B����c��4_'VΥ��^���� j�+|��M��/���g��J�=�.#�hn�EkL�՜^"�P�VDg=z�#�l��(ѐ��W�L�~����渳�qA�*���o��j ��	�`^��S3��uA�3��8�����"O�&��B�H��x��g� U/��c���G�ZI<�8���1��4��ˤ�����d+o�";O5I<���Ir�ɬ�,]@z��ĩ-���z�&��Y�g�[7i��`�g8Ϩ��o�0L�j��<LȊl�Qdy�MS�-���|E1�Y�v<���nW�?��$},����\�UP�ŉ������UR������Ɣ0� D��I�+9�4��w�n3K��V��]V�<_��S��&1�D�(�5,��yBx�HV8�galyR���$�vHǬ�jWpÑi�5�`��mx��k�����2<��[a�'��׼JS�vǚ��CI�b��ƘI1ӱ�M(����ޕ9��]��+��l��,G/HX�ً-SQ���pf� ew!R���I,&}f�S+cH�ۨ'=����KE�5���CƋ�\U��6��/3G3Ia�c�]H_��D���	l6�׆V��H?º�v�0�4G�WN�w�:,���t%To��@�� ݘ����-�Ͽ�^t���4��{�gY>)$��XoR���%��8܎�X���S�*�)k�0iy���&Eի�ہx�w/SC{��46_b㺎A�63ϸɬ&�P3xY��S�]�[��v��
߳������'�Lb{�(�މ�V�F�@��*��:]6�M�R�l/�羐6 4��E��f�G�� �g;�C�~�K�K#�Q����*�p��?��*,�ң$s~�<����t�3�r��T9�0���(֋ �p\���NB��&���i�pe���?�q�j�8҆1��X~ u-r��b]&���h[?��,�;������`�(
ΕR���-f�ޢ��� pX�{���)L# ��J�%EC��p%S)ov�yI�DL-�Y�V�����Y3�1�ԿV��"����E����R#rq���u����V�p��_�(�Y��C����o5�Nu��G�,�����9�ȩl��>̆1�dN<���U���R��:L�FY�'��Ǽ�$��oÃP�d� V�Z�4�p3��X����T���?��}���<���2E�"3~����N����2;̀x�tm�(�9q ���	Q{�3Tq>U ��`T％�|�΋�,��ZO��2��N.3n=��A����J�*���q�F
_�v�:r�}��Dހ}-�4�~�9�������<9m��))�u�3iʏ�O�g6�I��kb���)�&U�ο�~6��ɏ���?7�(���9�/3C�U�4��A�}M����n����)�M�r�=��H����T��� -�PB���]����Z�������Rv���Сhĥ�S݀N9�rp�Ai�#�o�r��ј�F~�쉢��}��'#r���
�_�ԄT���1|K�9ݔ?AKl#S�I����    ��+�h ;#O��aHY�y�=�m�D�*K�	T)E�8Sa�����O�CU�s�稗���:���+��%}��N���a�#e2��Đ^�K�	�6�Ǉ$�|��f��m����!nT^�A��;Z����%�8��*R�s�Z�XX�#��&�Eɭ^�Z[3�H���U�ʳ�WNW�ͺ���ȍ�ԕw����m�3�8Z[�`��Me�NHca��i}� �<�,g�`o����&ua���kM�AN��X�^hQe.���v������ @TV�N�r��mcB��D�Tst�Y��B'iM�\ƮgF5��e-��ǐ�����!�J�ڵ�q���8K�W	��d�a�8��-�c��"��SMf�j=A36�@|��+�D��թI�Z��Ǜ�%�n��=��o/E,(�`[~�%��ћ9N�� s�fs���y�08]�a8�a�,δ��������w���s��PH��T S����55�@�	'���>���ԗ��?����{5Q���F�??n��9\?K�8��ʆ�(�j���b%*��H�N1�a~�l�����O�3Uae<����*5ƨ#��o��M��덆!����������P8�~�/ř�Jڤ��'3$E��|�Ύ6<�i�Iz@��)C��~��Y/k&�� �kN�b�p���`���J�&�6b6[s8���*?��PR���׋�Oխ�Z��E�W����T���?(�)�8D��H�S�K �d�w�v��^� Iv��9l���,D���4G��eS�s^\��n=,�b��4,#�de�ֹ��S���g����Y�RV����)|�dmr�8yO};@{EzV��b��b[���!d����+U;޲ƨTu肍S�4��آ�C�W�%\X�00�x�$o-y@����GZΜ=�n�Ʉa[�����i��~J����}�.b��^*����Q��"Saa�(O�^g�?ljk��[�wa���A}��ptՐiЬq31��U�mW���xz!鄒S'px��&��1f�bO��!�a�n������������zm9�E�(G�8<f���Y�%?9[�Y/&��7�69	+�	��J�ZF��k㪌��~�����#���?I�>����zv
��-��]��r�
����@ZU!bS���<�"�2DmI�W�e�9�/��H󩖓j&���z�c\���(���`=�P��/&ԥ�J�{�NY<�����Śo��C ���P r��>K�<K-����	O{���l��5Y'�	)��}�d�T��D�TSp�܅��&���)l��~�y:�)�)�߿̘|���l�����&Ϙn�8���	w��L��Vvƌq�� :s�L�����r���z�X�$���/�ZW�G#�-*C�͠' 9J67===`	+�~�ۅ�+�j��9��Exx��v8�W{���ҵ���f��y��<7��5.~��;f p�}A�}��TJT�;?f��i�R"��$�.K��$OG��ęӧ����|M9��@?�WE?�FlN�
@������y�}��ה����p�Y�f����&��[�$R3���ID�g�ʢl���zܷJ
$�����RHi����oYG)n�	��: W0��u���M��5�8�j�S���}��.V`�C-A��b,?���_�&�"�S�--Ybmt��Őv�Xd(� <F4U&FNv��8�+��C��oMU�^5^�������t���ɵ#��s�խ��^P�{��is���-���Z�hc�@i���B.FՈ�_��)�̫���|Ί�RT7�����z����X����͕��G�oc=�^�j�A>�nd�QJ�/0D����&6yu�kt�w��|8N`�*3C[Մ�jI��U����~|�6a��:��֯���Ϝ���)�=�@ >�C��&��t�Q+��SE�,M�*xv���7��ڟh�5;H�0�߇�g�!�7��͂�UﳼIv�<T#�Y�}dJ>7�|(�Bm@�����b�*��~-L~qMx��jo�s�M���}����X=�����na�b����2~	�~�,tO�1��-'���@����Tc%	�ZK�Yi�Hj���h���&�� �ef�K�W�R޾4��Y����J��ۗ�`Z-(Dz������L�B�]���9��*W�M�!6����d2��1��� �:�)�~��7�`��P��o����vͫR���փ;8����\���0����I�<`a&��xRyi�r@#"_sϰ �f��G���.[<$˿Ҵ��U7΀6�i��M��W6^�Y�&3('���J���//m�Ҷin��&X�VC]&I_���T}eBx
��(T��
;�uHe2f�UG����Ϥ��ϽZ�ncB
Ar������P�K�M������㭶���ִ6"���� �Ov��&��Y�<-,�-�BxR�TԤ��;��*ìr��O#�J��C�/pB[��2}���U�\���|U"φZ�tO	,lxeg�6���fg��0җ�8�=\(��Y"�p�jc�ep)�s����[g:�b/�q��?��դ|�)&��=i��p�Yaҭ�/�tfW��eS�	�d5,�
1S�U�VՒ8T[����|
�z��y~���"&M�mlM{cf�d":#�}s5"�oy�C'���,Jf����.ۦdꗩ�aʠ.$>Հ6�eRP)����%�l��a$8�-��^ov�KW�ޥ�h�YpJbK+l�7e2m�G�"<�7M��2}\��_&�Q}�BMN1�sAf�R�*�ì.&�a'�v�%�{/�������(���W���.�u�k Qe�S�]c�A��?�iɻ�Z�)���u�)nvuP�����2o�u��Zt��8?E����������X��h��o5^���x� ��g�C���"�mT�)� S�N��xN�=��ϯ\���V��=�-P�y����yoJ`^B��[�'���Bp�5,1QR�nX	�)���>b��E���F��~pZ؄��/�)�H�_��L��X��q\�
ix���L��V��\X$sm�2|GvP0����j�k�&H7����t�����w��f�G������@�\�/6\[8��_�3B�'p����/c�~n�S�8T���nRǈ�y�5��T�����Y\�J��Գ�;�����@ muE���rV`_ ���=�eb1����p��8
�KAB`U/)��mR�%�S�jpƙ"�_�Sw������yS�$��&=��GZDTAS��i���9����E��{j��%��N֨������$|�ʨ
��ҏ�/�E�8X&_XJo��	7WU�Y\5��0��r�dj�&�	��x�HLJ���z�G�Q��KD�q';{�7.��n�\���ϡJ�l��$�C���ߞ CU� l/�'�G ���Қ�ѹuT\I�(%n��f�>�H؊������8�ź[f�쭇Z*W}ݚ��!2zr�A9���N��j�m��L�������%������p/&�j�$ڈP�����Bѹ1�b6B�R�L���V���wGsn;�9`��(�e�K!!�\I���K�U�D�IRK�0d���|hxݚ�.���[����|����96տ>�6�ΔT�*�3p�f#��1��2ǚ�6
�ޗ�4���a�f��ln��Ы�3����גU�z+�	m�t�9�9 ,T=\�~f��z��W_�e�T��V1�#d��SHv�"�`Qq�p�8�[�J�v��&X��?Y*��-)���<��!f����{8�"��ǵ����[9�HC86.��SOJn׌T�[�O��$�Z9�93O�T��{5�|QQl��m�iJ�25��}[��L��x�q?_�ܜsy��վ�n�܎�42��q��+�Z�ض����K���h����6��\}��Ms����B����%I3Q�P�5�J�fg�C�H�~{~>w�<Y�7Vv�0��rfT,A�&˞����rXZOw��\��=	�!����������k����[�-�1�.��doG�^0�'�39��#(�L�eã��IX�ŖT J  u�����J�;����\y$ �ڈQ��`��|��r��S�G
瞉���A����7�S���&l�L	�$P����ϙ��Y�:s5��8NErp�1��������TyL6N�;�A_9�o] ���F� ƍM�P�V!	��/U	ʌ9�4�N�������Q�e�ϒ�+G�t>��b	�<��c��g�HP��f�`ܓ�x�?��:��kL '��7M��Sib/k䄥D�6�v�ci\��}�*���v2�����'�LE���ź$��<���\]B��Mũ
�XexTed�8Y�I`�h͊W�>��^�IS��-3�s��V����D�7�z�n�x�,�,�r�'��/O���̱b��2���Af���NV�����?���k��'Q�փ9T��b�My(����x-��:<��ɪ�S�ғhz����f�>���k��yd����e��+�N�'"@*���Ua&�G�������GA�DQ�'ZQ���-��&�f�a���Rޔ�Ld�m�X��C�$ժB�x�墣�̪���"��H�7� �{9I�s^_JP��k^n�I� l7�'�\��.;�ߴ�,�Iu�߉E��4��[���1���6ul�Y�3*f��4�]t����0m�� ӯ¬��o��B��lM=F�1�8�b��-Z��!�8!-�����)��5�M�#�;�8��c/��N��/#4�*�����}�vPb����&�'@�R|"wFe΄e+����s��$]9q�*�3�zO��E���L�W�#���U2�9/S��8�#4�O&��}-�>���4�ea;�1����N9�ij�����=��ҫ���&X��)��f��p!�z��U�|�W��/,b�>��b��*6���{٪	Vv�|�7�w��|eKO�qm���n<�-��ln<�LCPl�R*�I�3�ͲB6ӱ6�鈜���� �옊ː�2t��s�,�������Bq�e���4��](�̤��s�c"�l�Zi�c݊���ŭ�2��c��J{B��<튫u� �c5I`f������E�}�D�'&B��𰃙��E/�c&nD�2������!ES�!a�b^3��XN36)����Ks��rKg���@�(�P��P#��H��l[îWcv*)�{QuZ�T~#K z�"M�;�"�V���a����Y4���WP��s��F
��(�LT?�CQsaІ�qd�W��A�?H:d�C!/g�ʬ����&k3��G\Q�a�%�Sұ�N��U�|1[L��j�d�I�<�*���/~�4�~d�� ��hjn�
3L��D�TÌb|T�Ko_�S@p��5�5,�IvCQ)j��p�g�X(�b�{؞��8�j�	�F����:��'��H�ׄ��N��K��g��S��Q%.�.t���t��]�s�<��*Q�a34���6X�V����"����(��J�o�nWd9�����kJ�p^j!�d㭬�M��*=Vf�tuΛ��J�U1Z�י�rr�$�|�sd/&�7������$�I>���~5�G���*��9j�����^��jr�7PfPY�;�0�v%[<��t7���l3f�H��&�mS�	��q�k�ۉ����&DJn��8������-�|c��k�f;{�b����ZѻA�����mk�۲5d���j�Y2
��Iꗁa�H������:�r��P�(f�e����?�fiHiCYK�b�<T����q��6��Y�I̽l�͹ǃ<���ﶭ:M*u]�_��l�[���a�f���Z���h�$2-���zx����A�v�	H%8C>$r�}�Sq���Ś���2)(�������T�F�h�B�?n�*:_��|)P����m�^b��B�=s��p	��)Eަ��9"�7�flj�N:�V��_���~�Y��gN�v��.sz�n�S�-%�&��")ĝ�x��@}����T0�]&v�6{=�����`�lZS:�z�L|���N?$i���ۦ��B}�cic����5�쏳42?��0�OY#�ǅ��capI�A�|����"6�G1�N"E����_�����9�����z�a�璴��54X�Z�Λ�etoa�������?�^�f      h   ^   x�mʹ�0����س|Wt-�.� ��.9ˌ윘-�z�^���d�:S�v|.����y|![U9����R���6 �����1��O$M      f      x���ۚ�Fr-|��S�n_�?�ЕyII��ͦ��܁]`7̪B�䴞~���:e��=��+"V����rX例�4M�~�P��Lc��ƶ�j�Lۛu����������ߞ��i��6�j��'�ύ�Y�?���o~i���(՟��ô�x���_�����l�j����i�_g�1��1�ϱʶ���f��F<��ø[O���ض5Aw1�ݰz�67����z�_��ô[���f=��c��M����k~њ�u�v��zP���A�2�m|ԭ���U����7��g�2�-o�k��i����mmh}�1�X�#���f��6�w�i�z�Yx[��m~j�/:�YA9���0n����a�t�����ȋ���~�z����w��V�������'yyǨ�Q���r|T���7]�uk:T�q���/�q}�?�_�H���#i�/N��UΪ��׋a��M����6O*z�y�3��'\��˃H���/^�)���~���/���Q��D�֚N-q���ܓ��؟-���}Ӎr^����q��.����\��H[����ìܷ����/�|4�����aX>��a����1<,t����~{7��`�G���/���rQ��y��p�6_��:ߴ��7ַj5-�������M�l�OM�OO�ʵ�Ӱ��s�N�]��5޻.��a1������S�O��YN�N��i���u�~���M0�����w�r܎��'�x$Mֶ�<�|�>=�a]��bδ�ik|�v�`UG/�K�-_Ф��k�牃���7����i�16zX���w;X=l��˰������Z�I:ߨ�Q���z|�%/������iM�����ys�?���F>���:y\��U�{|�_ah�*1��6޶.4��~�������۰��<>���|]r �Sީ�^\��ﾪLy�L�Z��w7�=�f~t�C5�^����<lF�?�����m��L���aS31�+���c��A������7��ɚ:�Z��m�������?k�Iɭ��>L0��cX��B�F���;ůu#wx�������ԖV�G�_h��#n�z�n��Va�jX<��7;���ۋ�M7�;D�կ���=~�2\��{�V#�Z�:��e��Ǔ����33aF=��T��x?�y[\�8�&�Ω�p��oo�ˋ�ŭ�Ѻt�A!����ݠ~������6M����~�k��֮2-.҃�6�QX�
q�~b�\ʋĲ�/;К��
7)�*X�)�����7�0��i�Z%(�n7���v����]���	�@�_ש�Գ��x�Z���WX\��z��P�$��E���{�`��s�=�E0ŧ��3:п���p��ǅ��QF<]���j�,N�����l���wl;������aws���O�rY,�F֨��e������������-n�|��ų�*��+�U�Uo	v�/�o�v�bc�k�����
��O�,��&tٲ^O_��޼�D#�(�'>�N%��W����_�q_�����y���i�]$�	�<m�ƛ�ޏ���L�ai&l v �ݎ��nBX�����+7� x�ͷi��=����h^9�nz^T��b3�|q�7J��l�����74�!*�����UѪw���:�~��u��qI��q�Ï;������66����#V���_���-���up�5<�"`�)��F�>>m`����Yg��H��&|�����=���ϳ?'�B�`lG��M��2��[�!�-B-��������"7�6�v�����B�#L�����C�x�|�u�m[�����%4��z3�8\����� �d7w�~[ƍx���>�S����=�7|�FP1�_]��0F���_q�����0->��n�ñ<�< w\t��E-��U'`ĻX��m�zѯ�:�<:Z��h���6�q,g*�N4� ��Υ�Ukԇ�v�h�o'�
��;�mc�bMwP ��J��@��=������&������%Sg6"�4 ��"d���~�{�o鯀C{B��t�x�մ� ~K$@�+N����?���bRLk���u��۸뇛-ri�`=�������r񂸇A�_�FeTU;e�.�+��F��fɈ��p��w�,�F`���9a���6g��?)˵�m�iF����/�S"�s "����%�ET�Y!/�N[�R�{������d�ϧ'��5��dL�uܤ��Ǔ��b�s��p4Ӻ�5_��mـ���ką��W���= G��g�n�>#+����F
h����H�/X}�P���,�Bg������հ��Z�cY���������o�~udΧ�����<��k���%��s|sɳ$F6���]�67��f�?�X.�C`%�.��.����g،�"�5���1?J�$�� ���:�W�����l��|����ɰD��pêD��lR�%��3�.���{"�w�����܃u���7fџ�K��p���9E�E�q��q�����뙣�Jy����[���]��J- ����l�o�̂ߤ�,��?�a�2�s_|���t;���%���� ��.�F{m l�Gܚ�:^Ђ�l>WxO ��	��S��[�9 �i��}��p����XMS�X-���P//�ߨ>�qG��5�8\\ꔼ�Y��G���u2x�8\�̈́o����3���(�@�śӒ�Y��#%�
��>=M�q}���74�b{�0ץ.�y%�$���b��2�'|��Q�v)�"i��>3����r��o�MRBlr]X�^�N���o�{��6�G~� ,<,B��E��d��0��!Z�w$ D�X�����f�7�?x�s ��⫉E�J��h��ŉ7�Hf~���W������H�X.�ś�ҫ�e/W@��	g�P�p5HI�k70��7[
�r@��J��!��$]�(�!VO��$aU��$�79퇵jݨw�x�9�����J�¶u��b�R<�sW�6�r�a2��7����a��(�luD�3D���/w��ڲP�v��0m�K=����C�R��f�H �}êo������V:v�����R~�Y=�d�#�� ����p���a=�jh�����3a?�l��������[���C=��Rs���Y�Q@������?��<# �hlsV�kD��8_��t����F���������
3!�(k�����M���i�\���%x���ҵ�K�b �,\�t��S����FPI����F2�ǻ�l���L��H%m�s%9P����5��$��Ck�+>H
��k�H�|������$?�W�J���a�? d�[��ϛ��Z����@N&��C������
b��z�y���630��_M�V!_�N��)���Noi�������8���фQ����+�[�<`Y
e@ɰ<��z1�O����H�A5�G**'ӵR�D[־R��\�>��_v�o��hc= 3�q]��4���7~������/Eؿ�ϟ��n]�[<�����n���k�0��P���tդ�Ȱ���������<�P���9?�f���@�`6�;3��8o�����滶��M��
 �jҙ�n�ŷr_a(ظ���Ǎ�����C��	����y��^,p�Y�.�*�Y��~�; P�t6x��X�V�a�u�a�O �?{��'����)n)a�����; ����%�jr�t�V���{H�ޛ�G�M�O��w�b�̍���$/�9A�j��/��ᆀU���g*����]�# ��O�b������ӊ~w���DLl,���F�p����4|=#iW�=����m�'|�_��q�]�ڝ���J�b����&:�a%������O��\ ��B�g�s���#]�O��0�f�f�nw�W�(t�׬y�mw}��t�'M�_-k�����S�F�i��:�g�Nb����$k�
��;m    k�{�C���I3�-�$�=���&=v`�R�gS��bd~��1�7� � U������3����E �ON;�3|~�\8��#\���#�dlpQ��FP��N����5�C@n�-!<vnN:ǧ�K�1g���Ȃr��0��bώ%n/©V0֮o#�����X�J�7ش��4f6�}��<��tN	��s��ô귳q Ժ�:�\���~��njS��@� ĩb��_2�;��4?�5��N�����H�2D@d��K�
��n���\��i1N�^iE�HX�H/����}W�k�����UlZ����*u�M��Y�˯kq��hi�O�[�,I��LT?JRy���f����d|��H���Ӕߌ�ñQ�f1��%��(�c?cо��7� B�� _GVK�U3�GP{"3\��I�<V��驇MgށAh'4��4�"}ѝ>v�Fz#��5p1�D�sx|���oaF��u���:$׻�L�̗��/ԛ~���Lhx�0�s;�!����_\�F�;�����>�_{��|m�D2^Z\W����Y���}T8!0$&�����N����0r���h��;���t�T��tj6cOBeX
,�i�����i� w���ݮ���Gv?	�N����YO�!_O��B���g�Z��h�3&� ��o���I�Z*_:�$�K�a_m�a�,�(����d�Z��X/��tt_�g�����Ro%U�_�:����"
k$�w� ���I!%_d8�����N�%�b�T��4�����`���_ ��o`�u1��Z� q�W�.'@TD���^m�!�i#n�n�mv�!'�͏�9�9��Gf�y��b��Ä\l�yLyC���U��XWs��ؙJ�G@4�]�{�Cr���on�u�e�S�%� ��y��d7�x�?�M�~�ߠRB�~�4���H�;���x5���H>R�h����o�0�~Ƞ�����cHZ����Lg����Kc�0Wwo�<����*�%'�ա�^���WaM"���M�q5JhN�*r��t�o�����}/�'~P��q��1�K��&����˯��D��Z��~Y������|�"����Y�>����(3B�X�O�E�l9"��A�����ɕ3t��Ѫ�~�2�}z�m-^ G`���9�ab��v\b������o��~ (�3f:��%�V�`�8m��ީ֗�\1�*�A��/#R���&�
�(M��TRy�p|��b�� �����F���z�eU�eU �.���̸C�A�} 24�.G�<m�M@�m#	�q���M;���$ �5\L�~B4�`��p����D;���Ne�Pn�1����T�� J'�$��<=;햒�d�11�I��H�~$)	��?�@^��f:�)F�����4�7OkLIX���+��N�MvR����˨�J�R�9D�9��~K�u��>���C�� ��Ψ_gO�t�&�6����5 �N�#�IU�Z@�yy_�c�bR�%SS;��Yx/�3��bD���N�p��֦��h3���N[(��/�%,�cW���m؟����ԕ��X�A�����ٍ�pa�:0�NZ6����l\XrN��t+�2-�RA��B�/�:�bW������nK�~��
�@���B^�z�l
~�~!��L G0X����z~U	���3��t1���[��R鰽)����Y��:��ÌJ/X���r{�Uh�]M ś��h��t�WL��?C���2q\GvE��
73��
�D:b9q4F
y@�/6,%�`��!Y�}���Ȋ���
��Ɵgm`b.�"4��@�]��Jg��2� ���ɺs��^���c��輑��G?����헵JB*���g �T�/�ps9z�]>��ph��;�
�e� y�gO����a�x��� \'�k�J�
���,1,`���0wRXN�	��G4�a�$fȕ~�A��N뮥�[��3}'�6���Ь��+��Dm�����8�g�z��=�O�Q6 �@_!Z?�ň[�g���T�K�5ē�xQ�if����P���B:�q1�q���M��4��a�������c��:�W>k��:�9_����V��q��!�kr�)�̲�W�H�:Ԉ֍d���m��)Ϛ��K��ߘ��p�a���+���6�����%���G��Z��5���w�"})��t6�W G�!e����١=���KY���Uqy��y�?����Ű��m�D,��x�~ ]�(���qiؼ��T�>f�����`-��DD���ti/�I�o�H�e0gR Q0bD�:.fJNA$Q�.�:3��a�컑>��N��1�~Q5 o3')�Z|��g?�F�����t�y�E���!�L�2^!�I��)P2�j��#]/�N�nK��w�w��
���4����bζ��:9H�Y'�r#����4Ӕ�X����l�I�	рi�/_�Ի���)g�����x�k=���m)��ó:�	�r
>�KR8#_�"�o���TH�+�d6��,z�f-Gr��ہ�k��+�F^���yJG��>n�'�X�8�y5 	��T�|�B��R���,#���Z8>����\ ��nA�2�Ukdv���l4[��AF�X0�d�,�i�T�s�j�K^ؙ%����W���ød�&Z|Lkq��H����I����ـD�5���K��U{���9�a���?�N�� ����²�� �r�7<�D�&4b\��z͕��{���0�҂����-�ԈsA�B�F�}����o�Da4�4�p,��ُW�4X��t���_��l�S�gۀ�`�Q}�
�$D)PI۹>��tG�@ec���~'�H�)������O(�H�H�~M��;R�`���62'�'��2�u鸜4�p�L�&�כ�˗��Ƕ�-��8��|9�1�R��� �1-^u��0���'�Y��7�ʣJ���j�u�C��8,����[DN۱:��ɔ��l1GW<����z?�]���F�t���rx��!Mڜ�(�Z�F:M�X���� ��|���W%6"Ym���C��)H�|ʰk�i��g6R}pH*C.D�.*!4�����
K�V=ǧ�ß"��D�g�;̥���bR�z;����<=q�l7H�#�ZN�'b�k\��IeƚF�������F��N��]l�D����u��Q��r˩����c�`4�5���-�O�]���6����ؘ�2e@߱��<	wv��:��4*�K4�b"��cӓ�l��G���2�Q���e%�1L��L���x#�9!��O�|�+�I�}��0�tI��th�=�6Y$pW����Q��P���?L�gV���Xd���c��L���6t-ų�����I�;�ʻ�/�U ?ñt,����`�dH3�y�e�4�#��&>���ڎ�F��Ry�:[B�y8���8��}ի?���#�	�9
����e�cKf�ݸ�/�B�Y'щ�I�DfV��#$�3G�B�ggU�۬�K�p� ���S�L�����άe>���;��}�۝�����EI�ق&~�o[p�&v�Z�cGoV�V��0�<؋cEy&6����lPF|�$f�~`���HM��x�o�wH�>� �h��!1��ͣe�ʐ�:Ai�1���e�A�;{�*h�#�S'��S��������̧uQ����z�c��k=�1�/&5p'��JAl�A���d���L��a��k���'��D�	n��M�F(H�mˮHK� ��aYM#�3k�����G�~5��~̟�0���!��tB
�Ug�H�.�I�TI*~�?�f��i��s*tE��j�F�I��s�^o�q��O ��y]����1_�c�x2��v���o;W2�6��3�gE��iܷ=N��ھEp�-�?��(g�ɗ5}Q�ADN9"_�I9^��    �N���k����Lͫ�b�̄'N#�/l@�N��E0��8�A��Y��L�sx�m�J&6A�S�c��DV- 2�څj\řZ����#s8��_,!F�(�2nN�T�blv�%��v	�i�~�~�#50���sx}O3<#_���_Ë�9Q�!#i�����\@c��W����Ƽߓ��ڍa�&Z�O�BRq���Ĭu���ݳ���JK�Y{�m�_ٍ�s* y�,�9�"8&��p�_��Ry�y�����Z�8�(S���M���p��?q���S�GC��2j[�����I���+ �Y���C��2x2DάV�%�H�f"bÁ��;�49:ŎR I7���S���4����>#��_�a5O����fL 9�/D�Rx%?�":�23P���D����k�?��Ǌ_���x�G%�J����l��ǆ������1O��(sg�}�#��eJ=
��D�OK����H��ГT����B�P�J<�Yr�Vpj�f��2�􋩌g�Y�	 ;�![�GjyF��y;{h9)���%@�{�%Ә��H<�ZI�N["g�������9a�ۉ�5��.<�?;�� �+)y�%v���6BV�cT�K�	ezP�]uN�=��!���=h~�.�"<z��J��3���'k<�ȳ%�x��J��3��~j����v\*9�	s/��>w�䠠rh�1`#%`n| PW�ҁ�&�0�b���������4zNA9�Y���Z U�$���<՛��K��9R�Dx��L^酳
Ʌ�~Z�ӀĆs�ߎ��
냤�J������S!_��a�SϧY���Lj�pt>+�O�Yn,��� ��q��+^�#ގ�-�!גJd�'s����1����ʷ&M�8�˶�Pb�ɘ{���$AV~�+
8ٰ�?���p���O�,Д�C���M�������E!�ۂ���&���H@��f�x��s֧J�jV)���*����wSU|�HvD$��ܹ�Ꮃ��4e��
��jI-�ݗqX.`�s�.JV$C��"^�O#��_C�l:΅m��~����qx��@>�)Y��"Q��q<@̦��Z���fAFn�5�c�8�z"�r3��I���q�,	n��x/�A��w���c�i|@ĕ>�����@����.D�H�f}��O���,��#����U8�BL�$�62�/ce���SZ���ƴpV��9����a=�i��@Ѧ��L �5`�ߪ���;j���U��7��&7u����W~f�ƒ���u�\�"hq#���is��#5=�d��-Y,�}�$�-�zgE���#0'E�S�ki�%�D�3]��f����%Z��d��P���뺐�i�R�v��Q N֤��D;�z�W�e�:5�ض��1�g �l9��o��mV���=��e�!Y Ѹ��qQ�p�i��Z&|fo�S�/uG�9E�%�? �\�D@L|�:�'��u��-�h��i��~e8)��d�`�7؎U��[Ԋ���.7S5 "P9��*��_Pvґ��Xvi���pA�dWN�L:D$Ek5���`Q��HzO fΪ'Z���aXK��׵�$�|�7e��R�k7Y�)��mC�ơn�JFo��k�U���q��J�^���q����+x�ʲ��DB�X�/���Z��B��/���b\�H��EީF�q35;�uSO�i�q_}9���aX>"+�ƍ�e?�H������2��s�Ͱ��v����A(+��1NX	s�GT��T�yj���#v3cW�4.z�y�sM�=5�2�����D�V���#��M�m�! �7��4�0��(�iy4��� =[�8���~��CF>U.�qi��?^����`j�7[��jx�V�
Ld}�>]S92?���I�����g�������5
%�H�ІA/My�B�J�
�<���eGJϮV�6�t
Q���u=[Q���l�<��@;*qꔅF�.�5aad��IIQ�� �$��(}��嗅]鸈��qI���?��T /1��zZ�99� N��mJ�+��GS��3�o�E�7�O�-���eh���I?o�	)A������i*�M�$�a}�R&r�`.o&/��9�
(v��>$���O뜥��Aكp�t��b%�����/VZRb���37��hꤊ̌>��0sh�������)rB]OHح�<�Y��vuΕ2�n�/䥗� Bq
\X )4î�A�ֻ�8h�a�:;n�51��đ4�@���1N�D�~m�u�|��y�٣�.�t��wF�_�M�V�2ؠ~�KVG�(�y��,�4;��N*0�L�h��,�1�ڙ� �}G�o d-�5y�#�%z�3�"��e���j
[���_k4Ҭ�uw�<w5ǐ&-{�Z��q-J�DK��Ԛ�6\jb)��[��+�4�aB�?��#d$q�{:�$��)u�I�t������dl�c�������[�N݊�^)��_��pFQ^��W7K�<����9�I�0�4�.�ls���߿d-�wi�ӈJ���Hm���U��0�bDDl�Ę�#9ؚ��n�E������If2�"b�����y)���.��	K���v�7�%��K':�@����Y��v̹9�V
���RW�g�����0��V�FX�kj�Pf�����IC� �\��d	��C���� a_�a��9Ð�[�	Ϙ�'��)�b U�VF�OȗɄD��H���d��a ��^�ڕ�V$�'E>@� F���r-�	 ELzǱ�L�� 
11.�z=��92땪�m�?���LBH��+tU#���L`c\d2�I����-3Td�F}Cd 4j,*'�\ԃ�4�����+��?.��t=M+eKՓ��U�E���$����>����6��lDX��.n~Hd�q+���.Ӏ���kI�~z�ICя��ё���)�:W��d&<�[��O���-,���:�8��8,˨Q#��	�#�V/��(�R9��FN$#��P�9�B.[�ᾤ�ç�)F͕
��m�8�pǱ�+c]i�8+Q��v�����z���A��3ۮH����F8��Ƈ_�:/�����X�����V|Cr����k�o��H`�a��V)1��	�,Ys�a1ƶ���L�@J���.1��4�f�Z}԰%B�>஌��կ�N�`mH5?�a��
����t�qS)���a��F�)��� ��Ȕ-1`��ߤ�X'*��p7�1�R<�<��±�4V@���!H�Z_)�	d�Z2��']&�������=�1�qO�+�rX�
�	�4�����#x/���������!7~C�x �8ٮ�Hv�O�3��$�L�̝5y�Ը������!����6�o���q0)@��C�g�$�]����9�s���-���eܢt���Ķ�9{O�7k����3���j�,���J!h��R�w��\f9�x JѤK�GtQ�:1]�t� ��ܫ?d���gٍ�%d�̲�M��pNS��(�S}xb�5�RIh}�W�tz�'�0gN7H�Jv�[Fհ�����D:,�	��v�_���B�����9��0�L�������F�l��gM�*X�.�ЉnF_���#/>pB���n������(�!=�َi�":��=����F�ª�8��5ճτU����Dn����k�A�@A���g\M����,���?�9ß��o���������11���ڿ�\��0�78��^o���R#���,��7*RЕ2��W��վ녌�>��=�k�!RB&�aW��@u'l�����_x*~eɖ���LmI�XN�UP�\K��R���O��jBh����p!Z��c6�!2�u\�� ��Dq�� r��$k2s��&��f؈����Υk�+��J��r� m躦Y��3�ȁ�)�DEƾ8d��LR���'���~T�r(ζ	�87u�� �W�H��/c���e5��J�������V��)mбgzht�w�C����E8l�>���f��_�w�r�Rb$�E��B2�9�"P�H���0���s?�    늤V6��)	�B�_��A0�֩����w��!G�!T����ׇ�ۂe��9�ּ�ÞS-rM�JY��pr��K<M���Fy?}�t��c�4ťQ���'Z�1�L�=�R^��,�'�K���h�_:	=Ւz2Ŝ�{��k�%���ۇ��Nl8��l�A��l֥�✿T۶����ȡl���[��;�{_�p�>���Or�����B�ќ�p�س�ר��Ad��9���ˋր[����7�ᖚ��x�	�㚱R�'E\���TT4�C������׽��I�Z�-��v���:��D[di|��;�����~�B x��޷�����mHq/i�JdU}~F��<x��9E����yf`�;Y�au��gK��m�dl �@�������;\�h�(KF�UG�jfs��'4���3?X>�_儑v�� ��x2^���T5�6�5d���J�HA f`/��76>�T_��YRI �2W����E�Ly�4k�/܁�"b�n�W#%��u���ɏ�V�F=�0�%�\h��#�qQ-��\7ˉ@3��|���8-��P{��#�Ȉ�itY�%�@�d'
�{�K�C��'�oM�?�+^k}�`Z$�7"��#]_��Q�>�s������%-��z�V��/ׯ#}5s��
�����M��,Q�!Y�G��0ٱ��6�8����^��8�Zq�\w&�P/qE��jE�wT\�}XK=�_#�8��w�+p��+[py�����ɫ��e�-PIAe�k[O\^E�]��W!/����!r\�8��zG��ˡ��5��D���+Su���^`1r��m^��Wo��F�x��Ѭ-�O}!H#�d���H�gMծ�3��"��2y��������<[Fm�`N�ӭk����'�|:0�Xr�mdI��r����"Y@�+z��t�ზ���6+��Cz�@fGo�4;��d�Q�
T��`)��9���mC:���ȩ�.����sh�sĒ^~	�H��/��|���^�Z�����lѯ�!����,nl�E~����y��l��X�b2�0��n:�+:�p(��ɝϯ�IaK���	�a�?������æ<�![�I;��/�2�!1�~��&���~W��D�=����˝eW�Y)�/e!���\mq�x���Q��8�V'Z҂��� ���k^�"�4h��4��}硛��~}�[�*6%$��bd����,Ɯ{1�*�gLTL��wC���FJ}�$��8;	�2�[w�y�S��ױ:��hE������E�\��tZO��g��(��tq �	� ΰ$�B���;�7�t�mU����[  ;�@o*�)JߒŪY4R��!�R�hJ�D���?6��|���\�Bg��2M���*���a���#9J`d�o��Uo����v�6Ա�_���w2���F��1l�2R \�A��G$[���WgW��ɞ�����IwO��6~�V�]��,-!V�/)�$��N�����a�%���|Ɣ��!�0��S�"�G�q�@곕?gbFJo�Mv\��%c�~ ���(���6mb���vf?�s]�쇍�|�)=o.�d	�&v�w��[/%��?ՉB6QF�ZH eg}Vn<����!"�In�8���y�:E4;�bf���'�dq���Ep�ҨH��4��)'�3׬Zy+p�@ �#2��"_Zѱ�m��C��dƟ*y��5P���Uj���Ĝ4Q��&3a3/�����DA��b(?�K�.��Z����Ք:V�7;x���6E��ꑇ�Xp2���.��y���O��8Y�
��$�a����i>U,�a��qq�l{P��I�,����}K���4O�;a���O+@�a*���JO";��7���)���
�����Xv�����,�E���(�	���)W��ɞS�ϳ�Y"����D�)�O���_��$��By�=W��g�'���#��s��{�+A�]n��f���պ�	خO7��B}�W,�%�DlzH��\EH��a�����_��lC޸H�v�qd6Zؠ��u-��@S pv�ڗr�+.R)��,��sT�+ʫ��19�ױ�)��=+w��L߆c��Y���a��\/"�
ގ��O��9�u��ܵ��H��]����޸+Q2���Zcj�^G��zkf��������W�[�޵�n9U5���9ڗBA���x�(��m�U�ܙ�[�e��^�7?�$���F�����)y�`O�+@0l�<�O���S�x��9 =;$/F6v���-�/R���fLq��uȰ�����= s���u����F�Y��\�O�Bp��'���n��4p#�(��~w��uY�+M�e�9xI�Ӷ�!���`���X��r���7&e�D�.4�jxdO:g���o�6�Fk�ŉ��ք�|>������.�4��b穋�:�ꈶY�����Zwj����J-|v�H@��E���0�`��Jxz����.���5 �M#3B�;L�]����]�a��&!��|��=$����3j���D�"�,z�73��pt�U��hձ�̙���
I]S��؉�?�@eZ��I��ؚ��,��\a"�1�4��ߩ��kt�Aq_�T~�ۘ{��d��A�&q�O��D/�� s�������E]��=,�'VF��$s��7�#-l��������&m3IqP�zV: tL�G`��.hV�ʠQ]��_4@d��7�R�<�l�n����@4�I�7�ע�"32���̾Ў�A�Jk�3�8�ʞwY*�@�qğ2���I,��~mk)��Q]�V�uH��ݱ#)B���AB��l���H���1��8�c���L"�]��L;.+�3ܴ��e���V�
��藲;9��eu��oj�u�zܓ��o�iO�jS�y;�O{�R�G�:�4EW���5�{��.�vD�\�GP���j�5j;Sl�;*OT+(����;ᰋP�x�瀴�������_�:8�z �����/XI_���C�.PO��W*;)�|$0Q�_�$>W����H�Gzv�����5�'P6�;l�e�l3��Z���ܪ���ċ��+Jg�'C>?�%O������	���FWq[�)ףUD�� ��$��a�����x`ǫz�u�k=.�������]��ei�(��Z\F2�T�J�xY~J�V.fN�����ÜͺkC�=�<�Y�^9H+�� '�6f�'[(��[�i��nA��8���%c͕CdF꓀��>�za�7�[)it�t��l��4&�0�kYn��$��_��&�._��z���U_�.r��<2�Y�r��\��l�H;	��XTҫ�	Z���c�>���xb1����C(0��e�ì�[�:���dR!���"="P0H49�^�G�xB_�r`P��B�1scs�������+m#�� E��bZ#����3�,����3"�qUa��Ð��Y$��&��ZM�Amnɻ�����o�7.��T�Q3=��
�5�0_!��s6��9�z���r�+�t�Ӎv&����a�q'(rOJ?V9'�SaO;@�����}��7��M����º�(f�`�����߶�灜������<Z��~ 1������Ô;��o�$Q��+�5[v�l���أp��x�e�;��W���>�k��lK酦�JVY�t�3w������O�8�R2��`��M�U��h(�Vif�8�F����ՐJx�A!Íp�K�J�������*����A�Y;�2qǽpA��xi��A�*�cD\.=�ww_� �F\�c�G(6'�4W���G����������9�/˿E��x��6H�,���oXD����}��uwC�ś��&�+���� B��a�һ'�����m˝!m���Ŕ�@2|�lC��8�2Wy=r�y��2�e�!U�P���c$M��d.���m���*�D���6���KZZ/��K0'pՌ&+T���J#"�:B&�3Pzm���3�9��N�q���y���ѓ��RՂ�|�A5�~�    e��-�9�!�,dO��K�Vm�8T�=�4E��ô��Nf4��*hjp����:&݅�FI#��ĭ"��"�O�WӿT۶�ip��e���K٭�	��mRsg������fM'>.���lH��:�Q�I�4�F)���1��t$�V�ڬi�òW�^	�"#	�fx/xp���g�IY��#y����PQ���L�,�iJ�0����L  ������ܽ�Ʀ	V�4s����,�g��=��eu�a����<�'|�Fs? ~�]���⩜`�k��<��U��p��U_��%�s\,A���iW`�j�����~zZ����u>��`�<���i9�6B��?�޳��'�1V�9%��A�#�U�,5�J` :����F��Y ���H��cRXv צ���tu�!L��9l5{�$7�{/�m��9բ�(��f��b�� @L��L�n���	FS�Q�1��H7p �By�9�8C��g�d�+*S9Y��rmՎ�`��j��A�R{�.�< �����:+�⢃�[�tʩӤ��3ɉp�S`��cZD(Zv��˳��;���~_�p�6]q�pi�~Y}$�YL3iE�ګ)�3g0���ͨ� �8�;^6Toڼ.�5�Z��j\>�O��3[�,nX�/��K�����8����0L}�1\��-UP2�����������bſ6�Q�%����c���2�#2db�xN �-)����	����kXO��=�vUI=�L����[4?�}�N˪��R�����Q]VZ�WYLS� m��Я&�
f����oPU�N�9޼��|��I4���j��2i#)��%��zE2]�T"��������N�[�����F���k�ꀺV��:�4���9�z8!�c����p=)A�H	$WV7KJW^>rAXV��Ϟ�pJ�8�׹��>2]��J.���B?�;�W�p(��<��D�RU�l���Ŝ|����a5���6M���@��qO%��6���2Ty����};�iRP p�����T��MR%��/�����>��Q��r���������"��$���L���&�tL��S�W\�NR�ɜ�Ɍy3}gݬt��U�v'�ߕ�*�ө{ʪ�|�q9��y�S�	o`�"XА�:�4W:�KJ�A��p�E����������}/���r0�L����hG�����ee.�(�U�$��?l�* dY��J\����hxljn&��p(�&#��M�������q,VsKF��JH�̈́�޻���'٢��l�w���䕗�*g�Q�KM<�aOe�~#���Y7iR��q�Z{!Yy�S�
X�#�Ml�$�9A"&6ٜ�ܞ�Re��
{���,�D�V���Z5���`�IX��Z��@�0�7��K�ӆ��3,��EN���˗�$�eF���{���� �Ҕ{G.�������Sӻ�sT�6\��6���:�C�dܹF�z�zjz�#h��5q���~�Js*�_��6I5��rc-���|"�C�߳C��R���8����Ү���p��*E��Ӱ�{ �t�!�iՙ�C'�+�&	��|}p�����a�K{#��y���ej��ॏ�+t� �}�[�
��VA=��{�U�����k�<��Z��,<��?_9� �6��f�=W�bx�]��c�i�W�|�N>��{}h������%�Ӗ�.�˴����N
e)�!� ;c㐕�p�΁���$���8gR���j���$�R�q�q{Ǽ�жT���:�U��AG�����]6�%�E��!�!���X��&���A��E�_hE��jKRl=��ΞoR:�������~�!���m8:��08����L��`S�,��z��KA��hd��"�6� 7��Ш�A�Z�A�3��]�ف&v����V(*������]kѕ�K�x� �>�j	���Tzq�g���j�J�k�#�|�ޜLW�x�49����;�fO
T�9�� ��9�l��'t8[�j��2��>�0��օ=�3 �'C��8�D��&Up��"��\��v����#j�q�@���J�6�<���?!��.U����*\�J]NȝM��1�-�]2x_筟R�Ԉ��\�p}�Mu�55_�\�����	D����*�����Á�F��[w�}�eX�F���u)#a�03t�4Q����������є8!W�R	�"�#�&Ec�^2fQ�P��b����r�t^reX'm��y'g��Lg���M�-�đ�lA�HQ��S��=L���D�զ�{�y�K��kO�;��\�.�n�����:U�z#mxĐ�L�t��a$�f���,���B�5P+<"�%�6x�J$p}�ϝ��[�e��ᎄ������r���>qgg!�����v#�D�ɢ�����{QMq��뢚tꄼ�i�d:;�W�/+��8g�2������(�)���s�-�?{!��-P���
f�˙o^K�cf��`�m2�E�i�z�DW�b�D f�=�k���������p
��I��[�wԳe���?s3�^��w�����R��,�pYr-{k)�|Ma0f5�\�����$�.s惄y'���U��יb�$=i�A0U����"���e�B��Lv��}����j	��<�oC`�}`��x��=}7�̚���a<�i�˖�!\T�8����h����B^���ʣID�T�&(Ft?��)K\Jβ������I:�3��.W�q�)��2{�	)D�����~��/[W|~��r���Q�pe��{�t��-^VF� �
��.�� ��3e��^�����r)n�$� �^֧!��Lvf���z�L�z��%����*E���R!�U7�aqh�aM!y��d����A���ݫ��Si�jJ�<K�X�mt�y$_>Pqq�gi�$\���Ȁ�@Q��0A&_�ɎUx4*�s9���Z==n�$D������E�.�l��6�Q�{��Ui��� h9hI���鰪�j0�y9��| G^�㼘�Ll-���P�x�8�Tt�EM�Nv4�M�&e��H��q�i���=��[�n��O�:��jK�b*��rް�x�Ǖz#�딹&I^s��Q$��
���sx9hJ�m)*Lt�M (ґ�� �H��J����d����y��ہ��;d��R��f�IѰ�J\=$H��f�gڮ���N�5S+s�D���R�)����E�Ёk�nZ獵�L��,MV;�7wM�T"�j?`�>,5/|��@@�9��J���à%�s���8�����{�z̐���������n")�S`h�=���;��P��u�k���K�an�]�����hR�~�{�ʚ��~�F�W6��trP��o��r��Q���U��_����Ȱ�4d���h%p~�z�-�R�]���ȕ�cq����w���Q�:qY��*�MSۜPI���Y�~3�H�e�VKY�T;:)>����&��%�ga�m�/������n�g��2�8��7�����8�����zXPh��.�
l�,��:�;��"���7����|eX:���m��k	���j��@E
��,��F����(ids���ϓ���@--H��z]7��Eb�ھ�x�� F ܗ)��{k�ֲ�p��^����E�3#��wb(�iZ�}�˵�s?M�U�����_����}����U�ԢM��Z�vԩ���}=��P�>7���rK.[��+���\�C�E�����?��rM� �]��t93�dT�ޑ�~��Gn��\��Z�:r<|5Q���dUR�o���s�Q}|�0	y1��0L�	-3��1�Ky�&�8	�I��c8�F�e�dN���e�F�e ��]�,�Ä<�3�V���[qO��-���~��:�^ΕXφS��I�� ��~}����][5�����d\P^nN����oۃ@6�4r��;�������N��:�9�y/���6�J\$���V�R����َ(�*fR�P`?�Z<����˗��rJ.��l�F;�y    �`�'�.C��͟�	�B���k 4��S�Ju�Yۓ�[ ތ.B,�/L+��t��Q��Ye�So��P�:���c�<�4Q�A����#)�+\~�W6�@�Z�(�w�l�ȣ���L�0@�.ץ�<Q�-S����*}ܱ�r����ZN����٬�k�v�D黧��`�6"=�i�Va�!�j��#�(����V&c�WZ�)�;�3PAn�A�@Y;�1\���\#�k��Z٤��������ȸصC��⇧���jN�ă9x�HB�	�%۩,�m�E�0��=W���CPޖA���){G�<���P��E�:�T��#�1ń^S��4�;ج�L��)�:���m���DƁ�i��G6��)޶�z��PIoN'�.�<P�8���oz7,r �I�ظ�[g�㛹CV����ū�T�}�Z��~�v�w��~�5�vۥʵ�$�������޷4[��"U!r��&��lk&8�ߧQ��JB��0�GA:2ˣz't�1PɁ��4�R��GϿ�o0�tR)L�D�I\�+�����Su���?eS0��%�r[�V]/j!w6�,"�1+�1�z�X��L(�,�1	�_��Q?�o�+an��G:i���!�u��lV��T/ˁ�6�3����������	;��zٴl[jU#K��%��RE�ȗ�����v\�.G�pkT��?S�k���j��u<B���H���r`�ZN���qO+?�ZT.��پ���>P�1�h�\L#��:YIp�ϰ+^�&k)��ņeL+�t�ڲ�*��Wם��t_ �C��H����y�qPAg/8�v�W�θ�B�2��z.s�8�ߪ��&p{92����d����� �Ht(�E�����}M���bxrW��H�������]�E���!��ĸ��ӡ��Y��󝄩D����2�v�>R@�3����I���.+!t��88D�7����z�Ta���1ۯځ	yy`"�������4k���+6#�͵Vnw�b{8�C~�O���R\���!a>�p���u�D�#�I`\�S�f�ϓ[�_p����,v�RGJ���%���g*�M���)�p繄�T���ALr�ّ�2�(9��>��zb��fƁ���C}(8!�t�0v^��&�o
f&ܲ���i����~�}�ü$�.ܝ��%&S��E�	(���7��g�&��C� ���)�~��fI���� �������4��Of�Jor�ݥ�wii��J�!� ���,��~/��Ĺ�	�(�'�7^G�����u���
��q0.�{^t�q�w;�l�~�Lf�]�m;k�Gוt� t(w�s�hp?��0�M�L��M�b�W?�)��}�@���x/���Y���äA��U�<�ֲ�C�m�^#ݘVS�(Fb?�+��72΂�i��� {�Ye�=W��y��%!o�zDUH ��˙��\(?8�*|��촁�����P�1,3�B E(�d&�Br�Ѹg�X�I@��n����Wh9���3�S����Ȕn���6�p�t��O[^m�v+}�������LVÿ/�|�`M��"H�zټD� �=��rS��e��	�1�+��Ƈ�i!�w𽚽��d.�h����);pq�Q|RL>��R��p�m��-\���eVX%4F���r<L{�DѲ��B���'^�  :���O3i	f����:l�>+לiF$q��aR�<FYF�:j�6��<q

W��R-?ΑX�
� d���!����ۋ����4a �R'Jf�ݰ�x��d�o��#`��e��\`<I��d��AO�H��o������%٠5`o:s��U@M���k(C$���V�'.q��@x�P�����J'�)0"�ؔ"��DZ��3��k�y6�r�F��vx�����P�B�;y�#�A�ϊ��q�Vs�%= �"���׹���H��b�JS%MΕ{"�ذ������A9��x�S���5��˽�����g]BO�)T<��g#PIځ�}Ǧ��X��&�[��c��4aZ�]_I�c�������)���VF���C�Rp��Nvծ_�Rg��v{|����5�_���U	S�%�?W�Y�'�O���n��O܂���H� r���.����Yo���|&�=�'��	8�j��J	�6ksq����<�����}���[��S�����w���J�B�C���g��cު��LQUJ�>H�`��G��]4�f��$z(Qk����UЬ�����=��)b'�=s�A���i����=�/��,�U��]�Uy,��{��R�w7�y#�e��).�nH�]����č�ؒsķ�O��Mڒ�Evu�b�MQZ/2�?P/OKB����E��se��SV��}X �&�����̜�ނpn�#=�/���F�n�Oo�D²S�m'-�� ����#E>�|�γ�[�����JB�z�9m���*�g����|d��<*�7�Ⱦ�Ss�Ӈ~�|����5j�QJ18`E��vr{�!��oʣ��Y� �8��l�懚��:�()JG��GJ��"�"��V��u�D�(�R@hD��2���￰e���7 ��d]JZ�[0V-75�Y��_�H�����m��pĢh�5R�<S�O<���L!��	L/��=>l�w$��(��uE�T�G�t�յ��Wf�n ��l,i�yIr�FV'���u]��q��	�����P��HCnd�,�]��%n�<>B4M>�o_�i�邤"�H�icpV�튦B���/	K�F����&��œ��S��)������S�+�U�}K
pz��I�*H�����3������'�&��g'��7��kU�(�Lʿ���$��&���ܖV2�ǌt���yͬ`誄;�Z�"|�6P= �u9��H���u�����JKP�aR\#&���O�G��O���#�ƃ��f%�k�C�O����ߜ����BG�_�Rs�d7mpLk�Vް>��?���m�����QF���׆�B ^�R�Vp��ȜěD.'r&�0u�YMμk����ɋ-�j)%1&����ǟ������i7���P:�R�,J�h�g�T.�� �"�����ZLKe�~-p?_��mEH��O�V����n�6,&�M`�y����y�?����87���L�є�	ܱLVu�)��IWn%`5W��	�,��%\�灉��=�&GK��+��s5g:�l�E��6��6Ț$u�Az�#ꃼ �5��/{Y�r�z���$}���m^�^��Z����ZG�����ca��-\Pd]�t���`��pHς�P�_:iB�s��!�V�4����I�rER�� [�H ���Gr�)�j!I�%�5�3�h��&�lʹÔ�r��K�}���9A��D�K���ϻ��
 �ʮE��u��I��WϳϹ��;Uր
�;�\���6��f
16��~��:�"j$�~F��ױN�R��.a�#�i�μ���J \ˮ��N�y��I��S2�;��#I)!L�&8Wn�~n�I���6I)�B��C������屦��qy���Y�+>0Q�w�(W����a�IT��?�T�]]��� e���m&[�>b��X3h�BPWRA��#�&�C�fy i܏+��xK�	�%k�%B��O���B�]c5%<U��9O�hؤ���_��8���[2�8��X!NI�����y��|�"�X	�{��s��2q�o�n_z�����M���;v�md_�p�%R�1[�C_�ZO�hC�D���*ճ�b��~֙m<�~�� �+��N=TʯR��h�9n^$X��\�)�M��G.k�n��!���a �.mK��=H�$�I�PcW�;�s��8`u�٤��dd����$/�	���9Uȩe�g��]s���x?텬XH���F�2$��U)e���H�M-�_ᭀb��ܥ�~dGyt�Hk�K.��9��"�'6�E��QT��z`�b���cL3@.?V#�����i���pE5��MV5��b���剬)U��_�u7�    �Rwl;B��l���t���N>��:|�;�n+i�ưFf�HW���~s%��������=��n\�?��:Қ-Y�eV�v�g-֦V�.��^�~� �}��S��t������hOD}s���n ��_�l�'�Ov�r��f�)��ꍒ���Lڹ��<���8x�s�0NȲ��"�$F��	F�R�7��'�!6��Bl�pQ2	��Y��|���єZ.Qv�u�a�F��Q;xJ!�Z��`�^��N�K���60nJ]�DU�.եڣ)x��G)��{�3�Ǝ�P�n��"m)��.�K���1�YO���6��nq��@ڱev���e��&���)��a1m!n���Τ�\r����/��e���5�g�U�M*K$mǺ��Q� ��֕��=h������i���GYF�s�
�͎��粐C~�Z6�N$N�bT��%0]�6��6|�7Y��?���SN�n.�^����Z��g������T@,�+ϝ! G��j�Ϊc�" ���κ,/�xp4m�3��D���ʾ�Z_�I��d���(��;Yޫ՞����?f�W�����\�$��]3k���Ab4[,p3�9�x�K�x��5C�s��Rd����d͎�m#E{��r��j��I�����%V��o��Y�rd�f��b�BZ�Js4�A`q�����,�S������/G��Z��aw�5[�o���s'xUFy)�B�S�F�(^��\��:vܡ���$C]O�Yj�Ҡ��`���uZ� �Y��h�+�3o�K\��M��-��-؎����)��K7����j�Y�	 W+�:K1�����.c#��S_�(��y��&
T���ɢ�LY��z����"Pt��l�Ý}G�^(��8� @���L�A�/�U�H����E�GC� �-����)�2��W�?,��Z=�!,Yu[�B�T�aq��Vy�`�$�k]�U5e5�s���������O�l7,[���:�������V���m��[����]�m��Y�8�?�BrI��O�g:�,��?&�!��Dt��h��u�E�Ӑ͡Y@ ��ER���d����5�I�T:�W&�j��j���|��i�fz m��UC�u�Hm9��Ɲ�U����]�M�&�NJf8X��].�g� �6�����U�e��딨�xs�Yualf� xn)�/]xC�ϑ��4�������@���-����P��es]k,�ARm����+�W� �l��|��#��K�$ks1�R���p�����W#h��wOp.I�-�pIxO໳4����lM"���גҁ7&��
]�
��m�F湺��D�6����K��o�nZ�F�?)D��B���k��%丕�>��"��u����E�HD$L?����`t(�T�m|dM�Wx"kV�`H"�u��9���HS�~�N9	���[�m��������ja^��!�^��"c�;})�X�=O���5���ѫ�
 �m��u��-e��L��d;%�4/۽���d*	l&s�%]7�&&Q
�1?% u��C��Vfxs��e��v\QX�#Z�#?�L�C�=kԤO�� F� ���'��"��0�>)�\�|��<�w>EH ]:�����4-����mhٺ9yTQ�,z+w���w����lC�˕dwk��T��$�p6, ����0mj� #�Y�i������� �� L˝z?�u�4�^q��Cq�5ź��S��N����$�N���aZ?q}X��7���^�4���<�rw0���U��=���f��y�����%�2Q��4޶�K��zم��ׄ�Q8�qI�=�����zl2 ]ҙsm�]�Xp-I�� %�FQ���+҉ ��6`.�ލ��QIRi�Y}�P����Ӝ]~y���L��
Mî�/�ʴ�����v$��"�@k-�9�i����[�F8
x�̛i�nu0�ăB7�/+ϿOk�#Yw�M��¾�kU�5�̱��H��/K�Z����uผ����A0'����5���[����6���~���F���\k�5�J�yI��&k�T%�mI
  ��S*-�:�Vx]x*I�O`��~���@苤]}��e9��I$� �j+��T��Pu���+�|��6�%~��Ȼ9�ƿ��aY�C�[���ˈ�"9���e��o����!��/:H�̠�:�*+s�>X�S�I�����͓{��c��~��Re��>�8��:��(��/�SO�-�a�!	�jZoX'��x��� 5��i{z�˩J��q"�POeę�ߺB�p ��Hmӧ:�nM�����k����6��������e�]����J35�ȓ1�q��ۑjigҰ!�HN�����?$.>�O�b��:�}6��=X8"������	0c���|��<�::�/X(8v�2�Z{���T��ц��F�3���mz]O�,ٽ/ƗеᲭ}�N��	g�ޟ�A�z����|�0&��p(MI���XK�}u��N����S�t	��=��o��`q���ӱ3��}�fI?���@�	�,���@j����%�uC,��AȺOt�\�>��XQƈ-Tg۹e*�.�N�V�t���*կY����!fmy���WU��W��H�����wef;�t�>� M��%I�Gr,	`�}'�w���W�=@�����Xi�����3��o+�u�����-m��7(;!f���Z�>�F��e�2Nԥ�m2��`ke�~��_�W�L^��9�h ����4z �K�����gR�<�t!j��ӣ����Rd;�O�J�g�E���,[-+9�^�t�O�24=Ha�m�3����������Z��$���yܶc]��n��2�;e� Y�5ێO��*Du�k�U��
���e)���w� �JTջ�{<^"P�?��e���Ryn��C�5&rb*7��r���0���=khz��D�>r��^ҦuuA�@f�t'X_����&�����"�T�t�e���'��8=f���>��M=�%[���2m~f����zq������	S��c��ŭ��V�@�8��chm�{
���n�:���d���@�W�~w}{��I�Ui��c������g4?ppD�_�ǧ#<��uF6 �j+��ܺ�wf��L�2�~'�C�a�����8����P{�h�[�P@82�ߝ�/o�t!L��6蠄1+���a`\m�w?xB���awb��f��턐Bu��_��q�#Ǳ�^�G!���L=+*���X_jjʞ�ǯ�yD��:�����2'ʨ1�zz�l����4d�7p{��v����ֆ_��C�⡷X��y��eA`Ȁ��h;	IG���>�Y���?ml8��:��*�W�����1c,w�j%��/݃\��;� ߨ�������ݓ*ӧGV���ك�x��\���2��b8�N�|��ah��g���y֮K���eY �΅��&%t�!c#�n���^�l�ƈn�Ao���!��|�7���}e�Hú�9�GA�ׇ�'_��j��IF�\~f����\��V�!^����]��i颣��*�����o�w�Y�9� ��h�eS��#F�E�-��I^�+fQ���j?�B|q��w#B�ɂ0� ��3K���a���d�So���1q���Q����QS�{V#a&,}c3M����`-���	�6�����"x�Ɛ�呮q1�e�~�َ�5n�u��nFm�e'`��c�O&�	JaM�m��C�6%F�&g�U�pL����&�]3�r��A����YO�X�k���sX
���A�P/���	Q0>�yW��PP�ƌ�T�|�F�me+����޻0�tY�&t���&6�:�?X�����$�������{�& ���ͤ������i�CRzˡp?A�1uE��]9��g���j桝�/��&JXYh=�־��it��&"n���"c=	��a٬/�4T��� ����괯:��tlU�4�V�[M��i,Y����B�j��>�ت�/��-�2��VPt*���^��2=r�g���ita7��s"�2��7;��^)��>�wD��!6]7�    �s��^���V�\�S]y��&(�hkhJ0z?oH��E�l&N���v�3�����GsY������!}f�n���ѵ>�.L�ltO���HA^S�����4�)�.�4ܭ��a����cdR����jW���
��c$f����lX�]?ں;����д����T��B!�u�		��X�p_����:�����3���8`+IsR�qDjI���>�Rq�"s0�h�全�L/S����~1
!�T�(�<̞Wnu�����&��z�;]���Z�Pҵ�Tb�/�&f��<�B2��!O חU� ��k=�'�����m�FV���m���Ė�����,�����F�+e]N�OY5	=- V�B>�o�'T�a`���w��;�Qu�� ��n\�H��|FEV�ӛ�ҐnP=���.��>�lnlT�ڈS�IXn^!��$t��ۨ�n$Y�� �o�J�2)�i�	�F$�䏲�	��,��m4]������9>}t+a،�h���vyBf�TׇqQ�/.S~v*�+[_0=�� �y�ou�dv��s�)-f/�o�>!$`2B����ǚ�;e�$(�%���v�����=tP���fT�p"�I�f�rޛ^��WN��x�*�����Jǔ�-���4�mÚ�)�������L)�0���j^�۫Zpmn�b��NA �ɖ��z��	�&�t�
�n���&��C.�����_%(�#o٩
�a�ς�g��>�SWI([ߎ�����+w'h[���F
��W��u
Y�i�x�ӋV��������)��9Mp�Yk3��,x�k�;�@�@=�b.,(&�u����h�x���eR�����b��Ab�� �xc�=��@��J�EG������ÇJ@�U�A0KW���6���#3�*�S�������W��-�:=��%�EM�X��#NX:!�$Bצ�|]�B���y�u-�}�6ň5
Z/�����꒚Hn�$/�K˹�=�}�\��!�l�*eĮܚXm�-��WIWζGK[���^f���Q(�\�� ����e���]�$t���R���8/�xW�&%RY?^8حφ��]}��/G��T�tD��ݼA�����{�sQ�O���h] t��h�� ���!��P�A
s�$���Jαr/���6{'�W�ӫ{���9�me���?�w_NV�����b�Ȭ�7H}l-
Zr�� \N8 ��s8U�Y�ď5�maom��
 Y9�25����pWu�Y�q��@VzX_���䯩 �j&M��t�Ze�f$�"��%��y�8M5��q�,Q�n����C?��bzU3#ae�������3*4:#�	�V�N�{,Bc@��&v��-�j����7��ʫ_O&Xe2P敠: ����~}�7�:�֥>ѷ ��SL�����-��U��E-|(E�->��y�k�t�['�?��p���Y{@�KGn�Yc�B�fqx[6?Q����rYaLL�B`G%,K���nL���l0q�FZ��7�?�iXY�{]u�N��
�->O87Bƨi�5�/Gj�Z�قa�-��'�") ���c>z����#��^,/Xg�KF������<,@DCǽ1�t���p���1d}@/��Ɗb�����Պz�UT��,���%�i���_�"�7��=�̙}P6�[^������XJ4Ko�@�Է:Puf��l3�kUO*��=.;N9V���Ur� V��{v�;�ȟ��P���7��,���Q{�g�c��@#�U��p�7�mY\)���eՐ9B��UHN����y`��]/ٴ�%!��j9���Ɩ�ιp9��l�u٤�����^N}��q����20]�#ޒCG�y�w��ҕ͹"Z�uU�� ��i���AӴ�$x -~S9"�-䯫��Y�����@�	H�N���x����j�5V rbǟR����FƻεhNZ��*_��|�B��ŝ�A�H�(Ѕ��Bp�Ҿd���Cˌ���ѭU7<. �y7�g��<��;7g��,�Ş.�4t�O����ʽ�J�W�!����33��H�f�>�2��+�[�j|�1YD7���R��ɀ�k`2̿�~5��Bl2߭.a���y�m�=�A����x���UG�A^г�A�mV�����̸x�֏�Ż��lۣ0��`�ZLk��n�h�Lr�FNCb����U6�6�$�'A��D�L��M�r�l�p�>~����*�S~^�E+��m�
���\O�P�0<Ե|T%2�F���,�Q���������Wwp�T�cOӹ��%��
E�3�v s�AGb7�w ��UQ��fmȾ���Y�Y�^:��_!F|��T)���P'�O
�{�|ܦ�^����J*�q3k�:�:j.��}�e_���2�Ε���**����o��'2,R}l�5!	E�[�8�*3R7��$�V���Y�9��o:|l�0���f<���4XM+_W�� ���5���E� �sE����)��7��֛�[v��b�E���U�(;O~�B����Rmmœ�!PZ��6�߱(�{
MJ�m�
ԴD�.�R;�q �x�)�f���/1�TY���O�޼O���f�9�9)Y��+����ޜ���F�m��0���i��ɓ��2��52q�u�ݾ��|�&xN*���l'h�!�-숍bWXr�F/`D��7.����Ί�/{*4�]��st���ך,D���a�����lHU��܀�U�0�|^xdD����I��	�?��w��3��|�%o�J��[ov����/W�8���l҇=cT�������E��䑿�"ĸ�$PL7��g��jtJ��L�t�i�(=��/l�T��>��?&�7T�u��:x�=��n8v3��RS}����R������,����K+��3 >N)�d����
�E��QU���m|�l��Q���RKK��[\���x����6L�B�?�מJ��`j���\�Mt������7��fP.�����=B8Q�D�ɪ!�"=�u�3���U�td���	�����T�����y�� ���R2�-�|_�����g+4��*���l��1�6���}�+��U��?���¶Bk"?m֘�8<l����`(A?�?���4��-���d��t{�ˮ"�6�H�e,+Xܠ���"�;�H(FUKѫ�o (�E�L�g5E4��<(0�oю(�j����J��pn���r4)��[V��Ǟ����.`{o��|r"Ol���f�~��S�m	�!��@/�?�5�a�\6
3͊�yଊ{�_{]�xp���N�̮}Ĕ�#�/($�g��뼨���������+����Y2,U�1�#0p�"��ޯ���#�X��Խ�,��J�:{痢��:B�������G�7:𰀣���Z]^�*�������M��u��̀6�T��ͪr�fn�a"��Ѩ�o�<ސ�͢� �%n��n.EW��Đ٤�w�IF�'4$�4q��+\'��c	���^<�X�<�&�BG`t�t�����#�u,�DU�W�G_�Rzb���o�;�yX��^T�?�8Xb�Aw��F�������]`'`A}�f]?:w<F"�-���W��a�<�d�4y��h�$��D���Z]1�ҡ{�E�rF���0O���z�0}M�C�J�����x�v��)��x6|DF<z��V3����w�V��B*���X7Ϸ\Wo��Dh<�E"���rH���H5��{b�$���n���uk���Tƣ,/�gcؖ�������?�]��|�C��y$z=sg�e �7t���7�P�	��X�L�fJ$n�_�?��4[+&I�%O���X-S	�����s���zog^#T��Ґ�������w
D�q1t�?h����b�uu⼥r����U�Էݕ�\P@e��6Б��7v�)�Mh4���@�@� -\�S�Zzg�2ؚ}��k���ރG��2N����Ҙ-'6��>�}^���פ؃�:��,���l8uEe��ު�W!��B�J|��y���#�Y��&�?��trUb�q�m������k�m�c�- �   u�'��ǃ�����t�QAC����>w+6i��;�ӢRP�{fW�o䒚X̟�w�cߺ&���u�����$�w�F��tQ�B������՚�C"z�3?Z�����E��q6<��6c_�핈���������U����l��z���BX�҉*f)�}��7��       i   �  x�u��r�H��姘h�j/�i�1�f�1Qe[m!y@��~�� K3�/��O���PB�̞bK�.���&����"�J��?�:�	t���ya�'�n��&�����A��T��3�ͧ�8��7߅���w�02��6�,Yf�)+�4и��7Z|�zGԖ�����*J&�9���ڷ�DN8i"�����\R��Η��P��sa֝#�Ԥ�8��f�a-LA�Q��^�B�F�B�po(��/�2o���$�����d���<I$�@��g3W����1��}��{Ge��jm�0dr��b�SWS�%�s�d>_r�d�1��JB)�UJ\[��Q����2��L*i�!��؈ᤫεD�2i��U``�0ŋ���_o�2�����Vs�f{,?jA��%n��5�e��I�Q4�U��l.�Zqi4L�T7[��E�*�̽��$r�iq�Q�
���ٻA�7������~_QF����Z��Rj�����!t;(d�`G�/e����b�W��|�W�mr�������zm�z.��i��ࠢ�	_�3	U�H��	����!�*��3c��q��~���Ah1�h�7c��>Qh/�q*�"���E]6�(.�dd��s?������;p���-J��0����̢γ��2�+�1�%Y�֜�7m^?�e���i��l�EB�0�Y�\����z��5��(r��qٛ��zZK��Y�m���k�c����1�V2z���җ3�-���Ҭ#�O=�e���;��/���Q1��Z3���;�Jϡ��{l(��u6�2���s=�e`�{GZ�ڮLCoQ�Ҡ��Oz!
˰�Rh�$%������~�%h/��6�,��c%6��	Ӽ���J��e�dƱr�����VwB�zZ��%	��Fq�W�"�o)t�?��ޯ�2r؄�b\����7�,�_��*�S�!?��+!�R��),e�k��-#��(�,6K�������P0���0~I��&g8�w��o8��jh�%����|�̾�*�q��W*[����0�=&s�`nR��*U��ijt�J�Z�#���t%$�����-��ي���͌ �����av���l�������M]aN��e�I�?|0���Lt�Vz:d8�Mw���J.�E�W=܇�/s�S#a+2h̵�X,d�I��x���6�
��|)��}˥�.��lSƴФ��`����m��vi��3���18�=��NDO 6���	.R���#�Maa����os�m�^��x�_�E�#��s�Ht��QE)���{��KX1m��d����܋zwe�@]w�E	x4`�#tSˡg�
X����(�����}hNy0��_���w:��)����a+z��t�b��9�-���6����c����N�<�		.�M�?,�����\�=]ĕ����cpI͆CE�����)�www�/�"{�      l   �   x�}�A� ��5�b.P�V�Y�L)�D:c(�_SC�����L�(������b��i���La]0��;HSaF$������n���&�鹿qv���b��\p��ջ��+�򦏭�^9%�F�는����4�c�8�pa�!����O��q�      m   <  x���Mn�0�5�b.dƞ��Y�1槨Ďܿ��6H&�0b�y�?TH��RCYޑ�Je��u1̾ڶi�,�;P���r�>2U�(�D.S�.��� �k�m�7%{�1�B���Q��Ʈ�(Lл/�׌u�*tz���~�i�o����n���_�pM�.�<MMC?��O�/�^��a�P����>�î��>��j��鲠�w@9AH`A@<��9�A�!h�t-���C�R�As h#�`D�X� �9�H!6Á`XH�D�XH ��C )bC :��Y�y���b      n   �   x��ӻ� ��T��y_`T����&p 6�Qx�,���;����y��D���/�C�[�.�0��6�N���+N`�A����vB������N�IX	a'��s�#�8E��aV�F�	u<�}���t� L�J���g)�"��j      j   �   x���A� ��5�b.��<�JQI��wR7.J���o^2Z�AH-TJ�Z�R2E�_��z��acdSg�?���<ڲyfZ������u��vS��D�\ɡV��[~��3b؊	0ۊ��õB�C�v�\H�9Od�?/��J�SJ      d      x��}ˎ,G��:��l����v��A-�!���8ݍfj0���s�_Q�ʈ,ޫ��@T�?��q�����[j����-��8	?���//N^�u�&����O��$���~�I�]�~v����ֻ�f�+�w�E��v�����5��o���__����_�����������~��o�~����߾���^~����Ϸ�}���������1P)���=�o*:?���0<ơ������߮?�������'?(�}�j�B{jӖ�/8����_��T^n��#��������~���jS{������ן/�������/ş%����Ѣ�M�.��y)�V�6��mY>�Qp�����'lQwg���m�NfHHƻ��ӟ%����?�1G����+�U{j����xy�6HY�m<��1_s�B�*�8��m~�}0�" ?G��ŗW�cC���=-oG
x��֟}�>���6F����
q�o΃:���H���,v[�[{�:�9I�W^E�$3�-\��[�6��]��a��I�Q�����U�_�r���m�NDȹ�����:�m�ӫ�o�ˡ��|:���h[#�m�+�(��?n�m�4�m���e����!���߾���˯�~��|���e�ݿ�W;E��W;8�����!�&������^�%Yr�lO�� ������\���x}����NO)ق=�����y��U��	��(R�F=u�J�ڤ�MI�w�u򂡵j�%8u1���T���8������A���D��Z�H���FT��d<c��o�@&�Jp��*�y�l*��s���:W�Y��c�񉊵�6�D�Zj���m�vm.��2����*=O��LH�v�ۄ3'��Ƿ��=�����޵�/��M(8R��	}0c
I��r�s�B�I;L���W_�QX���[0��p�A�x�3	�T$MlڏW�w��&ۖ?�C�p�<mg��'%M-��F�)�i;�{M�}�άz���d%aK
_OA����-�5��d�B���ҙ����
Ϸ���ag�A�m���7d�ᥭ����4���3崋�)�6ɴ�]�a0��v+e)�B�ۗ�R-E�E<Êz[B��B�lS�j��+�(�}?C\����Q��|����+Kp��i�b��O?��	��(5b[�:��J��w��s_K%f�M�L-%4�n��O$����j��Dl}���v�XD� ���p��+ᶍS�S���v�J���˦��Mq��|�>��J��}�8Ҩ�q���<UU�o{��*�ip�jкF����flb�<d��q*jh���ݶ2�~�=�0d���;��i:�搋��qțb��e�����=o���;\�]
��������� �qPˌ`���(7�.$~���9��$��}��i�B��㹙�:�#�d�%���Ng/°��o��.Ү˫�m���^��~��j7�pSg�v��ש�����A̷��馳�TM�AY7��~c�iJNyٌ��D �L K_�I�Ѥ�]I����$Z�;)����ԆJ�=���kOۂ��`�m!}��َ�xJF����>"�D7�tAy�{ϸ�<�pר[R�ڱ2�	=��BH�����Ncc[�,��4B /�&��(�~!��&�f��v�+Ծ�~-6�p �)��9���0�#ߐ.����T�V���鼼.�N��N��������UvDM�-��6��~A����!Cd��HY�
�*#�����H�8���ߣi�"Q-"ʺ3�����ir��F�A<}�E�^���o�f2��Ƙ3XnxO���#p����v=D�p������n��C��B}��Mj��G]���x,t-����p*���'E�YV$'M��3&�y�s)5���\�8��A��`���{u;DQ�a߸�)�k ����o� ���;`��,!`�PR��e��"̨�i]�C5��Iq��b���� �}���-4m�Oġ�,����/��<�g��#3����φ�͐jM���?V�|�)פZap�9���~�ʔW��d4#���ā���on�a(�a�1�ħt��&::���	l#i�"Fj`!��J\�pU+Q���P)�^��M�\�h_���0��2e�?�n�r	�Q�h�&�k�(�Ql�qN3P���>M�� �U���>�.�nۜv:��thssCY~.O6���h��9������~���	�gb8	���Kk���v��p���!��9}��D-Z���V��<݋J6¬]g��#BW w?z��?����UHQ������w@�R�З�	!2l������1$	���r}�~T�W>��	df��D	�und.��M�%���kJ�藩M�����x��y�V��):�LT����m*�i[�+`�l5�'�����w<�����^{D� �e���Q�����9��D�=��.VSQ�� ������)����2=Վm{��5�^�A`��AtW��� ~�&~�7`�ۋP�nՄ�<�3 #;'T��D_[!���r�7�6v�q��Xl#x5�q	g`pr����n����x�����0��C\���;�ٙ��-$u�~�dG�O֥��,��#�v�M�B�����=���.2p�c%���g�Ɇ�V�/��4y����\(#�?0�.-�^ �oU`+��BM$c�J'�¶���η�M�'�V�7b�t��!�W��6�R������m$M���p��)0؅^�,��	޾$t{	�s{�k.t��\��FWg��#�{3�������a�I�
�}����s��BU� �K��Q*A �b�&8;�#���?˳Gr�W*�gc-!<e��BЈ�U�Ժt�	�	��,��=��:l��f@��N]�>0��hx8H�R����̦nvƘ&.+t@�O�%�7<C��D:�G����FE��/�+���З��`���fID�U�.~&_Þ �CQ��@�Y������3�9��C=`x����$�w@�K�ਖ]Z��p�l��I70.�2�Ŧ���$x��}���_ζ�.N[�݂n��$�$�	TB�.���6���@�
�Ҋ��T}~�N�dO��Xx�Cc�(�G����i9oh��!B�$��oߌ=u[���	p�p� To����D��0��������<pϤd�LU☥�gpx��ʤ	OBM�
��aOX�����1Ծ?�i��9���-�&�^V�����+�#������in;ܲt�SiL<�)B���iՎvȮR�K��I���4&<T�?�O�����H�]��O"lO���Zh��-6-���� ��_���%����6Q�D#�7#����A�C<I��I�u>!10���B�DĔ�ɾ��y���Nu3Ο� ����8-1~�z�="�y�W���.�B;<�1onƮ��t�����"��ba��;��b����Ke������xf�52��V[����Ֆ�q�v�@��Is{&9��(az�?<�pH�g�_(t�ߨ�Xғ)�����-W�����_���_���fJ�ҕ:M��I�12��N�j�R3I��I�4�G"lT���N�S:뙽Pw��;-��p8�5Nt�q=�{V�@�G��
�	ԗ�N?N�b��3����t �L^�@Z�W'������F^C:���{�0�������>ȅ����V������w~ئ.'�1��$��ct��	<���j����nU'�-����TC(+(�t��t�|�H��L�$��E$j���k�7+�B$w)WV*�9I�Y���ڃ�;u���}�K��H�m���dD�E��箝}+�1E;"
d��Q�f�}��ۗ�I����Pr�<�M��N4Aa�K)��}�0ġ�<���s
 x�=����X�}P*��D|g�#�K����y�����d�C�@z 0'�?�tf�<^8��[&�СC�(���Of�3y?��s=H��s�z�����8#�(��i<    � ��@�,C�=@�ׇZ��O�8�0���d�8\/Ƒ�W�=��#����R8�~�t6*@�B�N��nK�ǡ���E��40�v2��0w���i�OK ��iE����-�����c��D/9Sh6����B��0mדI��3��B��gr�z��.V? w鿪��C%Ep���Q�
�|� ��M�8J3��Y>�bY@V��@%�e���8���ڕ�%)��p\�k�Ʋd�Hs�+`�	c�;u���J�`�
��u3#����,���[�[v���K�`)�%���s@��m??Ӄ-F����XS?I��[��H]� ��nY^�!���|�/^e��R�vU�V���#C&��Ȱ��C��U �'��F��e��I>.I��&�x�!0%�H��ġ��.+Z")嫬�4����٦T�ߥ�*?Qg���Ȉ%2����$H�q�n~�j�������-�di"n @����H� vBv#�U��.�CMH�XN���P@���n�<I�1�J�9#R��LpW�EI����t1֮�'M�,})��3����3��h l�.q_B��ұ A�e��	�Ǹ�X������լ�c)p���@�:}3bB���~�TXq��GQ�d(Ji8(���fʰ�.<z�ax��>h�0�ǹӬ�0��Y�Q�����C�OH[��02���`���wM=IH&�a��h�Uu⭐o6��9!g1)���P/��Wτo�z��fH����f����d�Ay��Q�3�HN^��e*�w��S�Yўz%ފ)l]h���r��H�h�q�ҍ:
�o�A�PC���q�H�1޲m�
�����`$���S�^nX�7'd�$)�!0`�4��B��GM 	;�b��P5<�`0��}�����(i.5QF�٣>Bs��b���DK�;�X0(,�-�=���J�pi� o���
�q���f����Aq�I~�Թ�R�����8途F�Y_c�����~��do��;�&OĜ	����;��5b��t��i?�QT���-u-����`!��YeYȬ�_��O��6bE������}^�Ac��#�M��K5��
�O=[�D�Ǖl��F ��~�6�U)B�"����?얏�qB�UHVH)��l��_D�����F�o�<�3	a�n���щ0���
��3!��8��޺�ټ�����`��Uw�J�-�t��6h"1�a�JDèJ긑�i�as��}����2Q���i��O�`+U~�R冎c�>���3;D�1���6R�\w�`����� w:X�� T��L�n���j��V*�Ի�Г�W�h� ������}J��"])@T[�0��M4B���_�������NyE�q��@p��]�����ۑ�ʢ�h:nU[b��wIQ,hc9ҏ�+�6��	��j�i+*�g��'/VV`�P��"�K��|�����B�7V������_� ���zodYX^ ��lj��L�U�݉Zz�3�h�e�
��ɢ�3 #�s��'��Z�d ư��9�O�
+ �$ $lX5�u�W��@a�L�	Dj�R��$���'�PV9���#H3�H6�	�a� @�N����@<bG�YCyg^9k��,C"�)f��ԒL}`H�~�U',��L�X�\�����*]h�=�L�����l�V}�X$��B��(�#K|��H:r��U�'tކf��	�%A[�R���^���eK�ȸ<O&�b=dt�2ΜX�D�t���v}<g��]m��)2J_�X�#�'4�����'-��3�я4f�2��UO�ު�5�j|<��o���Ћ��(�eL.�����fcO�ETo�w�Vk�b���P���.0���'gƀH����;A�a�՚���Zt�*�yVX�iÄ�C؜Ǆ#�Q��S�'K�x��G���-�y��/�D�)`���l�`1�C�v��B*J��C��K�Ye%��ϖ/u4u�%��F0Mm5f���-�8Q�-.i�Y%�F���P����;F\N��[��z��v�����dw=a���n�r��`����a����!�F�"0����^ ��|��@�TA`j�.&E�+Ɉv~�>��}�WF��W�DQ��/��U��=�\<�G1��Y��|AW�w���S�Q�o<��u�΅�X�!��;!޵
��֪D|j �z�QwN��;'���feu�Z!'9�u�z�C�e稝l�l�@�?T]��K� �IX�������?��	�]o�d�\;��HZɨea��n@&,���FZ��-�W{Ϛ��ψx�S�!'t�@#�v�7?p�t��X՗g8��a�����ŅVE3Qʹ'���s�f��~ܴ�l ��zM�t �֥F��C܊$��״W��NH4�Jj�>����Yݽ�%S!�^�Yo��^�b�~Gx�ұe���<��E�����
�f��ar209��.�D�:þ����K��]��W�Q8�����?��Мf.�X]��2�=e�]�K���o���es����GzN���Aw筎�DH$wn鵄2�­��9��2G��y��X�Eq[��W�I^Y��vz�X�Ы=u8~#ٞ$��B����A��`X���t%���Tv����>3��*���B�� ,�G/�����I�K(��0R�c�IY���ұ+�`�/*F�HPȿ��"Ac�b�C�"�a�s��9�:2ʹ��#fk0�hR�����7��3�WJ}�>IQ)��F��Z���^��q����p��g�ZYj�r��	�/�}�>��9V(Y/�V�^ބ�f*��	��?�Ar�à��3����m�+ʂ�'��vk��f�N}B��+�w��"�EK�F�~�E���a��d,�aU���2̀�ˡ|���0�9��Ҳ�{kB�zv�;�W���li�0��x�D4��>o�V�RYse#P��QN-��xBx~#�?���|��p��.�'�Yh͸QYU�od���_��Yz�dv"��;a��[&�i2����sz��{�l�C�ޑ���	jT�5g 2:^����G��=l�v�g�2m$o=�����@��;3�Cw�H�z�3-\�V_hzֿ���4(���;�8]+��1��*�+����U�aC�W�3�L`�We�A��<#fٵS
�`/R�͂=�]B��]��5�=N�3	SV���Xy�q���45YAV�V�w���G�د��ґ�PYͨ<�+>��X}y�UIP��bD2w\^���˕N��N&[I5шl��V֭�K̞���\Q&�)9��.�:<����9N@g����.$\���9k�HL��������*X���w��̀H�;���T6F�4�<B%�7���ٺ�2���n��V޲k��xT�����R~eQD�\�fL4����������D��j�E:�}K/�����x�R�*�Na�B�6[.n��38kUOrV7"�ڊ�S+��b?}P������������՗ɚ�J=3$Ϝ(�-jM�ح��ό�8YA�n4�N�Go��M�M#�@�]�ռ2�jĈʮ���x��a��Q�6u��ǽ�� 3�	:*00��������b8v�R�s#?�V�Z����3s��	�)�k&�PkE��4(y��"��'y����<5��\� a�5�S�8�j=����>�Zo8f~ ��Y�=�O5�ȱl4L�����		���M��U�w�Γ��kIɄR�߆á��"ڃ+IM��hׅ����4y�ɍ�Ѽ�S�uV/��ɲ-�<�L����:�M�I��DHtn�u������l�OX�5}�YJp�Zf_82��=�&�+#+'o��i�ki�L�	�)%sU&���A0���3gW�����O2���I4# ^&��~!�;pL��Ӈ�r����w�j߱h|�'�&����S���S�U�2N�Ryu!W'�o�������Q� ���^`XtA�m��P��9;xC`�F�ʾf��rD�u\6�F$���V��b
����c���ѓ*Yi�.T�#pah#pFK�^����� }˼�`�~�j��?���p�?d���C�.F� `  ��6���g�-$g٩����1�YT7o[NM�Vн˘C�q���d+`��!=;�:�J�gT�xf�%=�y=�Adz�kv��� Yѽ&5X=9��@����'`�*��ʭ�8��@�'���wc`q��P���U�<��Q��j�1�Qe䩊fàT�)�ܭd����+���摢",�	���~��Q]1w4�b�ޤ����yw�mn�.�%u�Y�ae�<L/������O�.>�6jd�����L1z�\��LȈ�!>��;���z��?�򠐽���ʙ�9a���Oݼ�/ݼ5�g��ɠ�k?B��ll�f�kY��[���Ӵ��>��a�]c��Y����ed��ac��+�X�aW��v���E���/�bA[~�s���fsx=�o�g�΃
��y�Ze������C֬2��]�,������P��a�`�(d.��������r禼�F?)�!X�b"gby�îi/l����a6����y�s�������RY�1+�+��q���a'�T�y��;����.4,����+Z�,��Y��5!jE}�n�Y�ɶ��y'X�K�YȺ �z�b���؄ȮыaG���Q�$5}���)�H�2;(�Q�6@�l��w=R�P���+-&X?���?1n]�y��p�:�U�����'�����D]��~�ɮ��A`��`�O���)3�d+;?YK1ךF��1ϊp��]�WS�3Z���L��ދp6
e�R2:��яr݂�����vk�0&����Dl��M�5%�<�����?5���W���R�AGJ�����>l5
�1�:�f�O����e���h��VeA9� >..2$o��S+Au]/ݞ).�Za�e"�>f$�U���,O�W�\~�V��J�݊�m�VO�i��@T�\F�o�-G������nLٌ�b��_�o��{rczL�;-歋V��vr�2��F���y��%h׉���E��ٺ1x��E��5�v���l����2��K�'�^��)�{�ݘ �!QvQcҬg��}$��q�X:ޏKmX�����,��t��հ���d3�P��ٝ,W�v��r��/�2��ݪafP�΄�L��z�,�VUnKF1��4���P��	v���#����D~�>x��սcc�==�l���!��'�ł����k����Gg�06���[#�E�Y���l�I�2,��4�.\�k��X"��X��<������<�k����������$�i���q�ՙ�܍��d�~��t.}����T�48���Z�P#�+n)M+_?Z6��n��O�=���2݇�v�~��u����j�*�~Z���<=v+�;+��wz<����A�.^3/���ڹvW����t�YR�?��P�\�s����Ȝ��K�J셛���:�����H�_�>����E�����ҧ��<jvG��ʽ-On,����"�z�򍓎|�*�\��'z����?��>�k����'Ɛͽ.����}�����&�p�d�띆3]��:��B?����&������P-I��#	:��V����n}�D���5�Y�u������s���&�:���U���m� ��F��B��j�a.v�"�r�]�x�|�si5�'�
Ѱ\o�cL\h1�8�k��]�ՙ�p��z���P�<�YS�統��Ғu�|�nK����r^���������m!u�ﬀ���ڳ��e�K�xu���w���k����M�c��2�J(Β���MB�'�<��,�rp!����0Ļ�p3�F�E׳[,�B��W�y�M����9Ni���2e��&OkF��3#}��.m�L^0ʹ�Z�����yﳴ�2h�����O?�?N��      e      x�u\ۊm��}^�+�*ؖ���I:�@�i�����l�Y��o���CC�̯���UR��)����WK_)�j��������_�UJ~�yΕ.�J�s99�����_��������_��e������g�{�W�r~Ľ��$?W?s����䯜���~o{M�'�Ũ��>R��]��skQ�ql|���g���L���q����R�����:���~)!���L	�����T�8}o��9ϵ9�z
i�� �WRi��_���yٌϯ�Bz�e��v�!����`�6��r��~���X�
ư�++����;�T����|��H��$�UEiqq�z,�n�����b>'~3�}��O|~�/�#�?m��?�y�q�S��5*�e��gI��a�^��5F*o3���{9��-�Y/�8j�d�b;9�7S}\L��)4�"@	$f�)
�4V�M�ܞ����*GSgS��M�*�Za�!���U䰅�i��>)JS[$�9#��n�%ИO�'��%�].��pwv���Έ�+E��G��O���"�#���Tg$gY���QO��1rR�qxdK�Y�b�M���
Z��f�	���
��AoD�<���*3��6��bV۠�^5�6������������~�xjY"���\	�N��y�Ys���I�wxH���������o�jR�H��j��,������ׯ�Q���f�$ň,��8'vCd�.d��c��~Ѿ$��*c�qP�i�`�A���w	nl��E��ӓY5�9Ώ��_��"�an����9�'�+�#�M-�GB6����c,�IN[9�2��E��H=u�s��U��Es}8?�̜�w��kGTS#��g���T=+~u3à��R�#��:�+\�S<[�p	�<4*2k���O�߬%�4g��HF������z5�9AF��Q�N�0��eͼ�� �p��,4!g6��m��2�/O	���ۅ]�R����.!f�X�yQr�t�U� ۥvt۬qP=Ն�w6���o�II[tU^;�XȂ�[L�ybD�����
:��fyͳ<&�>۔�����o���8��gi�Үy�n�����bW�)�ѥ��5+���Q�b��)�<*�`U�z������^?2H;
k���Y��B��\����Uܨ��REi���6�xJ�j=9�Jy�_g]���-}���A��&+�Ƞ�&�A�*�>|������/?8�g���Y��_�"s��Τ������Lvr`,Rb�{Lg}F�T[�!H�s�>z�I�u�h)*���Zqm��]F�{&)��>�h"e�z���Z�p	.j�l��֒�j��"�3{8Z���rt���Y#\�����W�
�:�H��p�����8.�H�W����
��)8�v�e]R�v�d=���m��X��]��1�-���95*�i3j~���t���ڮ|Ƀ{`��j��qa�X�"f��qβ(��bMK�Q�?K[�X9�0qr��겂>1dE�B�F�Rg[G؜�/�K9���jx�e|b���ֆ	l�����Sk��M����| ��W�P�,���ݍHOɲ�]\�,_02Eb�ށ�����-��rn��S@�{����R��v��XB���|� �!�^���Y�?�x)
hdEaT��YH�qGZ��l�a������	*���$E��/��A��OȬ�����`��A͗��O�+騯{4A�q�.R�=��;�qٵ�);/=����.l������/y��D('Y��<CSd�,� ��r���
�ę(��������#$�hxio�k�\�"�dE���+�����HhsfB���S����	��1ǒ
aA�٧]!Ƿ�0�K����G���N^Mb�3F
?#���A�d���@����_h�qXh̴�'��c�j��n-�F��m��wb��e~ 2��i "�"Sm������ɏ+����#锃�rP:=����،�Ĕ��\?hx)_|̬iX�	Q.���Ƞś�Vc �jp�y�Q
����:���\RJpy��Ϭ&�F2�ܯv�+�]H��6�V@\6�0Vɤ���ptq�V*����,��[bv�4�Ի��\��u�j+֬y��Y��Ѯ"�݇F(rSuAݒ�N{|�Tq��CGZI
�Z�x�7i�.r�za�
�Š���#	e�QV��e[)PP}���Lĭ��DG*Pm9kP���ն�t�IڍZŭ(�PVyD��I��*`�sc��$\D�������Ah�<�`�j]y�����Ġ4Z�Q�#�4�)����Rǡ�`�^���>�LaC���a�F��h��l�����*�^�����#c�����C:��8�Ғ�16����,�Vka.��z�.zB9,�ހ����v�3��0y����MY�/Ϻ1����ZN�qiX8��|�7�9�g��>2J-Ȏ9�s� u�����0�̓O�b�H��v����2�#GP���-�;�r��P\!��E;ꀁ�w��l9.��	hi�.�Jkt5�E c^�3e�p ���`p����$T�50ܞ�e�_S��Ni0�J�2l���&�.��/�B�6#B��%�k���Y�ivny9Wvl�X���O���B��=+�N�欈z�X9TȆ��Hh+YB�Y�TTP~h6�ّ��o7�Y�p|��S�5��\H$#{��ur�س8M�rQ�U5��h��l�vC��=e�4u$�L��:S\��%���E�Ѧ֦D�@`N�rD�A�t�9�%6�q5�R��C`aj������%EN�IUN���y��à����~E����5�Md,mDs:�G�P:;�+�� �YQ@��Z���2) ��/}])�"���>qK t�$[o�O��p�*cJ
>3�N �z��'z����%K�z�cꪏ�&�z�-P]v�8)r�C6r9��Y�x����H�W���1��+�InxeQ�3���BdU(�0���A��k߇Ó��ٜg��q�D_��>f)�'7�Tgp��Q��#W }����O�Kޢ��C���$L^�� .�}����$�R��10+��~p	Y9No.1%E�������A��Xy�Pb6\]H��-h�,���^`��B=�%�u1.I�3��G`�
���-G�����*��� �\�ݺ���kg�KY;v(�6C�C�+K�L�o5������I��Ū%�^�@��v5��He3߅�@��=����Tt�a��V��Y��<���J�xK�.(E�C\��G�H���r��"IhwS�w�����1����
�Q,��������=+Ge�͎y���Z;3��YAuV֛�p�->XW����o���w`�d�jʳ;ҽ�1����C�ٯ���:���.*x�F���
]�r!61�,���քr.X����i0�K�V^��K�S�z��]�ֵs���[�y�"�誋MZ-�=Ȉ�@�!ic�4!�q�e���8g	�r;U��;wuN�H6sY��|��^������=N��Sz.��!Oq��	�������%��b���,���HU�.���*B���Ns.M�n�H[_�O=���f�]&��Gq�EpAS�J�*�K{���d�V"����I.�&���N���:�pQ���L�Q�����a����^$�9���B+�f7e-��n�Y7t�ʐͬ�@�u��ڂ���B��v�*+Qk΂X}T-�5��yU�n�V�D|�r��8��@�(�g��D9��J���g@�Y��֓���_?�u,�r��2�[���W3e��%aX�2Aťev�Y�X�D�����f��ӟZ�i��a����Y��"�a�:��EV+���V���u�*�T
X�g][m����:9
%ye�/~Z��)k2��#L�֒c̧G�s�t��E�j���1k�ॵ��Q8K����3n��Z�_��2i���v�����Dkײ��⠺k�g����e+v�8M��>G_�;%][GR�BK+�<�]�XuB�]�7۠�x�qV����j�ԜB��d��{ ��F	�Ŋ _��f`)[�BdE��l�z`.:D�.�&9qq;�`p��ѽe��D �	  a�Z\��`R��s{#/c(�N��}3e#Y'�6��}��Ƹ���6?�y�Y�e�VA@��V��o�ʨ`֢�r�r|ɚ�kt(�I�}4�Հd=���H׺��LT��J$�����a�^�K�/E'�n<�2��c���$��XV�<s�K6!*D����I��=j]	D��x�N���-���W��Y�]ܱ#��G�m|��il�����V��Q�y��I �>���(�/���S�^]�q�{1�� 5�f}��}�T��tTX����Ѱ���;-�����T#	��5�PDcޒ�vi���7�P"ˁ�ߌ�v��|$B9!+w��V�>�#�}�d�-K �A�ʰB(�\���e{.���/rV?JM�"��u����k��SS�^���'�z f)��޽@z�:6��ّ�-=�Hx��]��{r�a|��Ƕ9)���a�cp.��E}%�g�
�Ѱ������j�p(� ����KWK �-��\TYY��풻�z̰�9L�����Mp�	:�����0�;u�>`�m�<�9Y�2���O��X*r� �a�@�f����%�V^��0Cs��(�Bm̓1l/w��w�@�Pl!w�֓��X�cý�wk�ݥ�|��[�B�(J.�0$�������S�Ex���a��E ��7���v[��&��|[�F$moCH$�G2n.����"(�6������~-jR*���/�
0,�
c/!��WP���D�f���L��E�IPd|��\�)�-a�-B_����1�����W~G\})����<�t�!�h���r�>cxJ+���S��̾[��~	����V�fN�PV�"�1͠�������q ���M��+}��'��R}R��[�iA���ÆSHH�6��1_3ݙ����w-���T#l���.�1�����oN�nD����_��0r�L~<����T1؁QN��7���J`6�'���:�/�]���p�K�K�.k7�9�+�˖o��q݃1ҝ.h ���h��"=�շ��a�)zt&���O�Ofص����W��R,��K��k��#�uU;X�$�-�M��C�&\ԪoD��n:��{%����zҷ����w]�%�|H)��V=�:4Ƕ@�Ea��+$�}��U	��>�(o��4�yZ�]m�L��=��	0���Fo诺�_�W�aeUJjL�L҂��b[9bs4)�4Bz�-��*�ˑ��Y_�H+��S��q�e�+х������GtU�g���Z���W*��U�߀��֖�ztYeN� �]_�D��Bm�@�����.��F��;qY�l�,?����6z'�M4Y��މ��3�.)d�6�����eoRF[�>o�,�<���{A�.��V�ga�T����|����쫩ќ��h8��e�dXu&��cgDݵ�*p�D��&jɯ5�[�:Ϝ@�Rt)=����L�"�����5��>�V�F7a��e�������Z�.�����J��'!#,mk����3�#�ԍA@e��g�acMH*h���MVÔ�R�!�'Ԫ�k�<�r�}��V�ϣb?c��J=D�|ܣR�3��1�H$�WGmϹ,k==�tq3,f��q��Ҭ��	X��&6J.�Ч�����n��:u�0�a�}|�������ܶ��ʂ�W��{��&0ae���hc��~�	��2�����c����wT�ݘ`iO6]q=����K	>Sz~��⋄��p��R߈�|�����G����/�\yB"ی���{���O)/+Nӳ��/�MV���X@n�ws�>A�Ze���ص۲�kvC{���j�U��Q��d���/��F�[�%���A{�U��A��yϧ�.��y(q)��s��Ö�/Zc�|X��� ��!�2
��'x��.4���w�ʕdYn�.=�ϼ.B\(��,�r�<�4auW�2Nt�����0ON�)��#GVY N8u˱)�|ս>��� �"�0`^*[D��-��Q�h���
�dG�i�x���	 i	���'N�ϓ�MVY�[�� ��udF஻��O����R1k�>9,��%M��k�d�K[_s.Ϻ��{Vy�R��
��3���N�Y���F��=i �C?�q�*�����wF#��nu�R�-�����-	cV##oY�(I8�j���&����Ǹ9E?����cPG\�����%�$][���C�u�#m��x9̡�8��kbw6�3����c[8��'2�o��i؉��RG�y$��E�\b�y��uw��.��Y�+�!u��,�y���J��
�X[*�AΥWy�2�&i���.��]F����ю��J��}K1)�ܢ6{P�Ti-o|�����k(yR�)s.�eB��)������N �3k-}��M�j�ڦ����� 㯂��?�����%ƚ      k   P   x�u��� D��RE0+hb-鿎X�{~�Y���E�"s�[�OBt�9"RD;�"H���^a
x�L�B���~��1�     