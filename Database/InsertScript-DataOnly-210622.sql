--
-- PostgreSQL database dump
--

-- Dumped from database version 13.1
-- Dumped by pg_dump version 13.1

-- Started on 2022-06-21 14:21:19

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

--
-- TOC entry 3961 (class 0 OID 31056)
-- Dependencies: 209
-- Data for Name: city; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.city (id, name, description, zoom_level, image_url_location, geom) FROM stdin;
1	Sokobanja	Ovo je opis za Sokobanju.	10	http://replaceurl.com	0101000020110F00000000000045924241000000C0BAA35441
\.


--
-- TOC entry 3969 (class 0 OID 31110)
-- Dependencies: 217
-- Data for Name: language; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.language (id, name, image_url) FROM stdin;
1	Srpski	http://replaceurl.com
2	English	http://replaceurl.com
\.


--
-- TOC entry 3971 (class 0 OID 31121)
-- Dependencies: 219
-- Data for Name: city_translation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.city_translation (id, language_id, city_id, text) FROM stdin;
1	2	1	This is a description for Sokobanja.
\.


--
-- TOC entry 3967 (class 0 OID 31099)
-- Dependencies: 215
-- Data for Name: legend_attribute; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.legend_attribute (id, name, image_url, description) FROM stdin;
\.


--
-- TOC entry 3975 (class 0 OID 31158)
-- Dependencies: 223
-- Data for Name: legend_attribute_translation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.legend_attribute_translation (id, language_id, legend_attribute_id, text) FROM stdin;
\.


--
-- TOC entry 3963 (class 0 OID 31067)
-- Dependencies: 211
-- Data for Name: location_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.location_type (id, name, description) FROM stdin;
1	Gradske ustanove	City locations
2	Izletišta	Picnic areas
3	Izvorišta	Water springs
4	Kulturni sadržaji	Cultural content
5	Kupališta	Baths
6	Parkovi	Parks
7	Prirodne atrakcije	Natural attractions
8	Sadržaji za decu	Children facilities
9	Sportski sadržaji	Sports facilities
10	Termalna izvorišta	Thermal springs
11	Turističke pogodnosti	Tourist sides
12	Vidikovci	Lookouts
13	Znamenitosti	Sights
\.


--
-- TOC entry 3965 (class 0 OID 31078)
-- Dependencies: 213
-- Data for Name: location; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.location (id, name, description, web_address, email, facebook, instagram, address, phone_number, mobile_phone_number, image_url_location, location_type_id, city_id, priority, availability, geom, image_position) FROM stdin;
2	Škola "Branislav Nušić"	\N	\N	\N	\N	\N	\N	\N	\N	http://replaceurl.com	1	1	5	t	0101000020110F0000000000003A9342410000000090A35441	\N
3	Bolnica "Stari zavod"	\N	\N	\N	\N	\N	\N	\N	\N	http://replaceurl.com	1	1	5	t	0101000020110F00000000008009944241000000C0BCA35441	\N
4	Gradska opština	\N	\N	\N	\N	\N	\N	\N	\N	http://replaceurl.com	1	1	5	t	0101000020110F0000000000007D94424100000040CDA35441	\N
5	Pošta	\N	\N	\N	\N	\N	\N	\N	\N	http://replaceurl.com	1	1	5	t	0101000020110F0000000000801093424100000040D5A35441	\N
6	Policija	\N	\N	\N	\N	\N	\N	\N	\N	http://replaceurl.com	1	1	5	t	0101000020110F00000000000079944241000000C0E8A35441	\N
7	Dom zdravlja	\N	\N	\N	\N	\N	\N	\N	\N	http://replaceurl.com	1	1	5	t	0101000020110F000000000000B39242410000004093A35441	\N
8	Specijalna bolnica "Novi zavod"	\N	\N	\N	\N	\N	\N	\N	\N	http://replaceurl.com	1	1	5	t	0101000020110F000000000080A892424100000040EDA25441	\N
9	Specijalna bolnica "Ozren"	\N	\N	\N	\N	\N	\N	\N	\N	http://replaceurl.com	1	1	5	t	0101000020110F000000000000558E424100000000A6A05441	\N
13	Vlasina	\N	\N	\N	\N	\N	\N	\N	\N	http://replaceurl.com	2	1	2	t	0101000020110F000000000080B395424100000000C79C5441	\N
14	Kalinovica	\N	\N	\N	\N	\N	\N	\N	\N	http://replaceurl.com	2	1	2	t	0101000020110F0000000000807893424100000080899F5441	\N
15	Očno	\N	\N	\N	\N	\N	\N	\N	\N	http://replaceurl.com	2	1	2	t	0101000020110F0000000000804D9442410000008016A05441	\N
16	Gradska česma 1	\N	\N	\N	\N	\N	\N	\N	\N	http://replaceurl.com	3	1	5	t	0101000020110F0000000000006C93424100000000A0A35441	\N
17	Gradska česma 2	\N	\N	\N	\N	\N	\N	\N	\N	http://replaceurl.com	3	1	5	t	0101000020110F000000000000C693424100000080C0A35441	\N
18	Izvor Lepterija	\N	\N	\N	\N	\N	\N	\N	\N	http://replaceurl.com	3	1	5	t	0101000020110F0000000000001A974241000000804EA25441	\N
19	Česma Banjica	\N	\N	\N	\N	\N	\N	\N	\N	http://replaceurl.com	3	1	5	t	0101000020110F00000000000080954241000000006DA35441	\N
20	Didićeva česma	\N	\N	\N	\N	\N	\N	\N	\N	http://replaceurl.com	3	1	5	t	0101000020110F000000000080B8944241000000C087A35441	\N
21	Trebička česma	\N	\N	\N	\N	\N	\N	\N	\N	http://replaceurl.com	3	1	5	t	0101000020110F0000000000002085424100000080B7A55441	\N
22	Hajduk Veljkova česma	\N	\N	\N	\N	\N	\N	\N	\N	http://replaceurl.com	3	1	5	t	0101000020110F000000000080A99342410000004005A35441	\N
23	Barudžija	\N	\N	\N	\N	\N	\N	\N	\N	http://replaceurl.com	3	1	5	t	0101000020110F00000000008011934241000000C084A15441	\N
25	Zavičajni muzej	\N	\N	\N	\N	\N	\N	\N	\N	http://replaceurl.com	4	1	3	t	0101000020110F0000000000003E93424100000080C1A35441	\N
26	Galerija slika	\N	\N	\N	\N	\N	\N	\N	\N	http://replaceurl.com	4	1	3	t	0101000020110F00000000008056934241000000C0C5A35441	\N
27	Gradska biblioteka	\N	\N	\N	\N	\N	\N	\N	\N	http://replaceurl.com	4	1	5	t	0101000020110F0000000000801E93424100000040C5A35441	\N
28	Bioskop	\N	\N	\N	\N	\N	\N	\N	\N	http://replaceurl.com	4	1	5	t	0101000020110F0000000000003492424100000000FBA35441	\N
29	Letnja pozornica	\N	\N	\N	\N	\N	\N	\N	\N	http://replaceurl.com	4	1	2	t	0101000020110F000000000080A9934241000000802DA35441	\N
30	Bovansko jezero	\N	\N	\N	\N	\N	\N	\N	\N	http://replaceurl.com	5	1	2	t	0101000020110F0000000000801E7B4241000000C00BA55441	\N
31	Crvena plaža	\N	\N	\N	\N	\N	\N	\N	\N	http://replaceurl.com	5	1	3	t	0101000020110F000000000000DB7042410000008040A35441	\N
32	Plaža Župan	\N	\N	\N	\N	\N	\N	\N	\N	http://replaceurl.com	5	1	2	t	0101000020110F000000000000E49542410000008053A35441	\N
33	Plaža Džentlmen	\N	\N	\N	\N	\N	\N	\N	\N	http://replaceurl.com	5	1	5	t	0101000020110F000000000000D795424100000040F0A25441	\N
34	Plaža Šest kace	\N	\N	\N	\N	\N	\N	\N	\N	http://replaceurl.com	5	1	5	t	0101000020110F000000000080669542410000004025A35441	\N
37	Park Banjica	\N	\N	\N	\N	\N	\N	\N	\N	http://replaceurl.com	6	1	2	t	0101000020110F0000000000804D95424100000080D5A35441	\N
39	Park Čuka	\N	\N	\N	\N	\N	\N	\N	\N	http://replaceurl.com	6	1	3	t	0101000020110F000000000080EA91424100000080DAA25441	\N
40	Hajduk Veljkova pećina	\N	\N	\N	\N	\N	\N	\N	\N	http://replaceurl.com	7	1	2	t	0101000020110F000000000080A2974241000000C02AA25441	\N
41	Izvor reke Moravice	\N	\N	\N	\N	\N	\N	\N	\N	http://replaceurl.com	7	1	2	t	0101000020110F0000000000008BAD4241000000009BA15441	\N
42	Sesalačka pećina	\N	\N	\N	\N	\N	\N	\N	\N	http://replaceurl.com	7	1	2	t	0101000020110F000000000000A4AC424100000080E5AB5441	\N
43	Vrmaško jezero	\N	\N	\N	\N	\N	\N	\N	\N	http://replaceurl.com	7	1	3	t	0101000020110F000000000000868942410000000059B25441	\N
44	Dečije igralište gradski park	\N	\N	\N	\N	\N	\N	\N	\N	http://replaceurl.com	8	1	5	t	0101000020110F0000000000008593424100000000DDA35441	\N
45	Dečije igralište Palilula	\N	\N	\N	\N	\N	\N	\N	\N	http://replaceurl.com	8	1	5	t	0101000020110F000000000080BE914241000000C0A5A35441	\N
46	Dečije igralište Borići	\N	\N	\N	\N	\N	\N	\N	\N	http://replaceurl.com	8	1	5	t	0101000020110F0000000000806993424100000080FEA25441	\N
47	Dečije igralište Podina	\N	\N	\N	\N	\N	\N	\N	\N	http://replaceurl.com	8	1	5	t	0101000020110F0000000000007B9042410000004074A35441	\N
48	Sportska hala srednje škole	\N	\N	\N	\N	\N	\N	\N	\N	http://replaceurl.com	9	1	5	t	0101000020110F0000000000803C934241000000C07FA35441	\N
49	Školski košarkaški teren	\N	\N	\N	\N	\N	\N	\N	\N	http://replaceurl.com	9	1	5	t	0101000020110F0000000000806C934241000000008DA35441	\N
50	Školski fudbalski teren	\N	\N	\N	\N	\N	\N	\N	\N	http://replaceurl.com	9	1	5	t	0101000020110F00000000008066934241000000C097A35441	\N
51	Košarkaški tereni hotela Banjica	\N	\N	\N	\N	\N	\N	\N	\N	http://replaceurl.com	9	1	5	t	0101000020110F0000000000004F9542410000004065A35441	\N
52	Teretana na otvorenom	\N	\N	\N	\N	\N	\N	\N	\N	http://replaceurl.com	9	1	5	t	0101000020110F0000000000805895424100000040B3A35441	\N
53	Fudbalko igralište - mini pitch	\N	\N	\N	\N	\N	\N	\N	\N	http://replaceurl.com	9	1	5	t	0101000020110F0000000000803E95424100000000F1A35441	\N
54	Sportski tereni hotela Zdravljak	\N	\N	\N	\N	\N	\N	\N	\N	http://replaceurl.com	9	1	5	t	0101000020110F0000000000000A934241000000C04AA45441	\N
55	Fudbalski teren bolnice Novi Zavod	\N	\N	\N	\N	\N	\N	\N	\N	http://replaceurl.com	9	1	5	t	0101000020110F000000000080A1924241000000C009A35441	\N
56	Sportski tereni "Podina"	\N	\N	\N	\N	\N	\N	\N	\N	http://replaceurl.com	9	1	3	t	0101000020110F0000000000008B904241000000C0BCA35441	\N
57	Teren za odbojku	\N	\N	\N	\N	\N	\N	\N	\N	http://replaceurl.com	9	1	5	t	0101000020110F00000000000095904241000000C076A35441	\N
58	Gradski stadion "Bata Nole"	\N	\N	\N	\N	\N	\N	\N	\N	http://replaceurl.com	9	1	5	t	0101000020110F00000000008014904241000000408EA35441	\N
59	Limun banja	\N	\N	\N	\N	\N	\N	\N	\N	http://replaceurl.com	10	1	2	t	0101000020110F0000000000802A944241000000801DA45441	\N
60	Banja Jošanica	\N	\N	\N	\N	\N	\N	\N	\N	http://replaceurl.com	10	1	3	t	0101000020110F0000000000007A7E42410000008003AF5441	\N
61	Turističko-informativni centar	\N	\N	\N	\N	\N	\N	\N	\N	http://replaceurl.com	11	1	5	t	0101000020110F0000000000804793424100000000C8A35441	\N
62	Gradska pijaca	\N	\N	\N	\N	\N	\N	\N	\N	http://replaceurl.com	11	1	5	t	0101000020110F00000000008000944241000000C009A45441	\N
63	Autobuska stanica	\N	\N	\N	\N	\N	\N	\N	\N	http://replaceurl.com	11	1	5	t	0101000020110F000000000080C59242410000004023A45441	\N
64	Popovica	\N	\N	\N	\N	\N	\N	\N	\N	http://replaceurl.com	12	1	2	t	0101000020110F000000000000AD97424100000080C2A25441	\N
65	Vidikovac	\N	\N	\N	\N	\N	\N	\N	\N	http://replaceurl.com	12	1	2	t	0101000020110F00000000008053954241000000803DA35441	\N
66	Golemi kamen	\N	\N	\N	\N	\N	\N	\N	\N	http://replaceurl.com	12	1	3	t	0101000020110F000000000080CE96424100000080F5A15441	\N
67	Rtanj - Šiljak	\N	\N	\N	\N	\N	\N	\N	\N	http://replaceurl.com	12	1	2	t	0101000020110F0000000000000C9842410000000093B75441	\N
68	Paraglajding	\N	\N	\N	\N	\N	\N	\N	\N	http://replaceurl.com	12	1	2	t	0101000020110F000000000080C7944241000000C0CAA15441	\N
69	Klupica	\N	\N	\N	\N	\N	\N	\N	\N	http://replaceurl.com	12	1	3	t	0101000020110F000000000000019342410000004000A25441	\N
70	Oštra čuka	\N	\N	\N	\N	\N	\N	\N	\N	http://replaceurl.com	12	1	5	t	0101000020110F000000000080DD984241000000808F9C5441	\N
74	Hram Presvete Bogorodice	\N	\N	\N	\N	\N	\N	\N	\N	http://replaceurl.com	13	1	2	t	0101000020110F000000000080A6964241000000409FA25441	\N
75	Latin grad	\N	\N	\N	\N	\N	\N	\N	\N	http://replaceurl.com	13	1	3	t	0101000020110F00000000000072874241000000006FAE5441	\N
76	Manastir Sv. Arhangel Jermenčić	\N	\N	\N	\N	\N	\N	\N	\N	http://replaceurl.com	13	1	3	t	0101000020110F000000000080AB8A4241000000C0EA9F5441	\N
24	Milošev konak	Milošev konak je jedna od atrakcija koja karakteriše Sokobaju i okolinu. Konak je izgradio knez Miloš Obrenović u prvoj polovini 19. veka. Zbog svoje lokacije i izgleda, ova građevina je u istoriji prošla kroz mnoge faze i imala razne funkcije. Ovo zdanje se najpre koristilo za potrebe administracije, ali je uvek bilo lepog izgleda i karakterističnog stila. Konak postoji i danas, mada kao mesto za ugostiteljske ubjekte i kafiće koje je, uprkos novoj nameni, uspelo da sačuva duh starih vremena. Zbog svoje povesti, konak je zakonom zaštićen kao objekat od istorijskog značaja.	\N	\N	\N	\N	\N	\N	\N	./images/Sokobanja/4/Milosev_konak/Milosev_konak.jpg	4	1	1	t	0101000020110F000000000080B093424100000000A7A35441	45%
11	Vodopad Ripaljka	Naziv "Ripaljka" je dobila po narodnom izrazu za skakanje-ripanje, voda ripa. Vodopad je zaštićen 1948. godine kao prirodno blago, a sastoji se od većeg broja kaskada ukupne dužine 40 metara. Glavni vodopad - Velika Ripaljka, visok je između 11 i 14 metara, u zavisnosti od količine vode. Najveci je kada se tope snegovi, a najmanji u septembru i oktobru. Vodopad nastaja na reci Gradašnici čije se ime pominje još u turskim spisima.	\N	\N	\N	\N	\N	\N	\N	./images/Sokobanja/2/Vodopad_Ripaljka/Vodopad_Ripaljka.jpg	2	1	1	t	0101000020110F0000000000006F8F4241000000C0EDA05441	45%
36	Gradski park	Nastao je zahvaljujući termalnoj vodi koja izbija u zavidnoj meri, sa temperaturom od 46 stepeni celzijusa. Parterni deo parka ispred kupatila, sa cvetnim lejama i ružičnjacima, najstariji je uređeni parkovski prostor. Za početak gradnje uzima se 1880. godina. Nastajao je u etapama, a već početkom 20. veka park je imao gust masiv visokog zelenila. U dolazećim godinama park neznatno menja izgled, unose se nove vrste drveća, žbunja i cveća i sagrađana je fontana u središtu severnog kružnog platoa. Najbrojnija su stabla krunolisne i sitnolisne lipe, zatim jablana, bresta, divljeg kestena, bagrema, jasena, javora, kanadske topole i drugih. Od četinara u parku su zastupljena stabla smrče, crnog bora, jele i tuje. Danas Centralni banjski park zahvata površinu od 2,17 ha, lepo je uređen, prostran i ukrašen.	\N	\N	\N	\N	\N	\N	\N	./images/Sokobanja/6/Gradski_park/Gradski_park.jpg	6	1	1	t	0101000020110F000000000080C793424100000000D9A35441	25%
12	Izletište Ozren	U krugu Specijalne bolnice "Ozren" nalazi se i malo veštačko jezero koje je dom velikog broja potočnih i kalifornijskih pastrmki. Ova lokacija je prelepa za jednodnevni porodični izlet obzirom što pored svoje izvanredne lepote poseduje i nekoliko sportskih terena za fudbal, košarku i odbojku.	\N	\N	\N	\N	\N	\N	\N	./images/Sokobanja/2/Izletiste_Ozren/Izletiste_Ozren.jpg	2	1	1	t	0101000020110F0000000000001F8F4241000000808FA05441	25%
38	Park Borići	Kralj Petar Karađorđević je u Sokobanju dolazio na kraći odmor. U njegovu čast pokloniše mu livadu poznatu kao „Kraljeva livada“. Ta livada je počela da se pošumljava 1953 godine borovom šumom. Kako su ti borovi bili mali, gusto zasađeni, mesto prozvaše „Borići“. Danas je to lepa šuma u kojoj je zasađen crni bor, američki jasen, gorski javor, kanadska topola i ima još po nekog listopadnog drveća. Sve se to zajedno stopilo sa Vrelom i čini jednu celinu sa klupama, stolovima, igralištima za decu, mestima za kampovanje, pravi raj za uživanje i uvek je pun posetioca.	\N	\N	\N	\N	\N	\N	\N	./images/Sokobanja/6/Park_Borici/Park_Borici.jpg	6	1	1	t	0101000020110F0000000000006A934241000000801DA35441	5%
1	Škola "Mitropolit Mihailo"	Turisti znaju da je Sokobanja jedna od najstarijih, najlepših i najposećenijih banja u Srbiji, ali ne znaju da se u ovoj banji nalazi jedna od najstarijih osnovnih škola u ovom kraju. U Sokobanji je razvoj školstva počeo u 19. veku. Simbol tog perioda je beogradski mitropolit Mihailo Jovanović i od 2003. godine osnovna škola u Sokobanji nosi njegovo ime. Pre toga, od 1978. pa do 2003. godine škola se zvala "Dimitrije Dragović".	\N	\N	\N	\N	\N	\N	\N	./images/Sokobanja/1/Skola_Mitropolit_Mihailo/Skola_Mitropolit_Mihailo.jpg	1	1	1	t	0101000020110F0000000000007F93424100000000B1A35441	5%
35	Akva park "Podina"	Akva park "Podina" je od centra Sokobanje udaljen 1,5 km i izgradjen je u okviru sportsko-rekreativnog kompleksa Podina. Ovaj zabavni vodeni kompleks može da primi oko 2000 posetilaca. Kompleks sadrži poluolimpijski bazen sa sportskom opremom, kupalište za odrasle i decu i bazen sa 3 tobogana. Akva park pruža mogućnost celodnevne zabave i rekreacije za sve starosne kategorije posetilaca. U toku leta organizuju se raznovrsni kulturno-zabavni i sportsko-rekreativni sadržaji, kako bi se upotpunio i obogatio boravak posetilaca.	\N	\N	\N	\N	\N	\N	\N	./images/Sokobanja/5/Akva_Park_Podina/Akva_Park_Podina.jpg	5	1	1	t	0101000020110F000000000000AA904241000000C0FBA35441	45%
10	Lepterija	„Lepterija“ je najpoznatije i najposećenije izletište u Sokobanji. Udaljena je 2 km od centra Sokobanje. Do izletišta se može stići asfaltnim putem, ili živopisnom šumskom stazom kanjonom reke Moravice. Izletište karakteriše jedinstven prirodni ambijent sačinjen od žubora planinske reke skrivene gustom šumom i liticama planine Ozren.	\N	\N	\N	\N	\N	\N	\N	./images/Sokobanja/2/Lepterija/Lepterija.jpg	2	1	1	t	0101000020110F000000000080F19642410000008096A25441	35%
72	Tursko kupatilo "Amam"	Čuveno tursko kupatilo, danas kupatilo Park, takozvani Amam, je izgrađeno još za vreme Turaka u XV veku, na temeljima koji potiču iz vremena vladavine Rimljana na ovim prostorima. Ono je čak tri puta renovirano, ima muzejsku vrednost i nalazi se pod zaštitom države. Smešteno je u centru Sokobanje a prvi put ga je obnovio knez Miloš Obrenović koji je često boravio ovde tako da kao uspomenu na to vreme imamo i posebnu kadu koja je bila sagrađena samo za njega, i dan danas je u funkciji i ima muzejsku vrednost.	\N	\N	\N	\N	\N	\N	\N	./images/Sokobanja/13/Tursko_kupatilo_amam/Tursko_kupatilo_amam.jpg	13	1	1	t	0101000020110F000000000080BB93424100000000BBA35441	35%
73	Sokograd	Srednjevekovni grad Sokograd udaljen je svega 2 km od Sokobanje. Kada je grad tačno nastao ne može se precizno utvrditi, po nekim istraživanjima nastao je u doba cara Justinijana kao tvrđava za odbranu od Avarskih i Slovenskih upada na Balkansko poluostrvo. Nastanak imena Sokograda koji se još naziva i Sokolac vezuje se za zanimanje njegovih gospodara. Po legendi oni su se bavili dresiranjem sokolova. Čak se i porez tada plaćao u dresiranim sokolovima i zvao se "sokolarina". Sokolovi se i sada mogu videti kako lete iznad ovog srednjevekovnog grada.	\N	\N	\N	\N	\N	\N	\N	./images/Sokobanja/13/Sokograd/Sokograd.jpg	13	1	1	t	0101000020110F00000000008001984241000000C051A25441	55%
71	Crkva Svetog Preobraženja	Crkva Svetog Preobraženja Gospodnjeg potiče iz perioda pre oslobođenja od turske vlasti i ima poseban kulturni značaj. Pominje se u "Spomenici Timočke eparhije 1834-1934" kao crkva koja je imala i sveštenika. Podignuta 1835. godine, najpre je izgrađene od kamena uzetog sa razrušenih ostataka takozvanog "Svrljiškog grada". Crkva Svetog Preobraženja Gospodnjeg kakvu sada poznajemo, sazidana je i osvećena 1892. godine po nalogu Mitropolita Srbije jla, rođenog Sokobanjca. Smeštena u samom centru Sokobanje ova crkva je podignuta u srpsko-vizantijskom stilu od strane italijanskih majstora sa glavnim arhitektom Svetozarom Ivackovićem. Autor ikonostasa nije poznat ali se zna da je on završen krajem XIX i početkom XX veka. U porti crkve postoji i bista mitropolita Mihaila koji je kao veliki dobrotvor ovog kraja sagradio pored crkve i osnovnu školu u Sokobanji, 1894. godine, kao i prvo ekološko društvo već naredne 1895. godine.	\N	\N	\N	\N	\N	\N	\N	./images/Sokobanja/13/Crkva_Svetog_Preobrazenja/Crkva_Svetog_Preobrazenja.jpg	13	1	1	t	0101000020110F0000000000008B934241000000809FA35441	55%
\.


--
-- TOC entry 3973 (class 0 OID 31137)
-- Dependencies: 221
-- Data for Name: location_translation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.location_translation (id, language_id, location_id, city_id, text) FROM stdin;
1	2	36	1	It was created thanks to the thermal water that erupts to an enviable extent, with a temperature of 46 degrees Celsius. The ground floor of the park in front of the bathroom, with flower beds and rose gardens, is the oldest landscaped park space. The year 1880 is taken to begin construction. It was created in stages, and already at the beginning of the 20th century, the park had a dense mass of high greenery. In the coming years, the park will slightly change its appearance, new species of trees, shrubs and flowers will be introduced, and a fountain will be built in the center of the northern circular plateau. The most numerous trees are crown-leaved and small-leaved linden, followed by apple, elm, wild chestnut, acacia, ash, maple, Canadian poplar and others. Of the conifers in the park, spruce, black pine, fir and thuja trees are represented. Today, the Central Spa Park covers an area of 2.17 ha, it is beautifully landscaped, spacious and decorated.
2	2	11	1	The name "Ripaljka" was given to the folk expression for jumping-ripping, rip water. The waterfall was protected in 1948 as a natural treasure, and consists of a number of cascades with a total length of 40 meters. The main waterfall - Velika Ripaljka, is between 11 and 14 meters high, depending on the amount of water. The biggest is when the snow melts, and the smallest in September and October. The waterfall originates on the river Gradašnica, whose name is mentioned in Turkish writings.
3	2	10	1	Lepterija is the most famous and most visited picnic area in Sokobanja. It is 2 km away from the center of Sokobanja. The picnic area can be reached by an asphalt road, or by a picturesque forest path through the canyon of the river Moravica. The resort is characterized by a unique natural environment made up of the murmur of a mountain river hidden by dense forest and cliffs of Mount Ozren.
4	2	71	1	The Church of the Holy Transfiguration originates from the period before the liberation from Turkish rule and has a special cultural significance. It is mentioned in the "Monuments of the Diocese of Timok 1834-1934" as a church that also had a priest. Built in 1835, it was first built of stone taken from the ruined remains of the so-called "Svrljig town". The Church of the Holy Transfiguration of the Lord as we now know it, was built and consecrated in 1892 by order of the Metropolitan of Serbia Mihajlo, born in Sokobanj. Located in the center of Sokobanja, this church was built in the Serbian-Byzantine style by Italian masters with the chief architect Svetozar Ivackovic. The author of the iconostasis is not known, but it is known that it was completed at the end of the 19th and the beginning of the 20th century. There is also a bust of Metropolitan Mihajlo in the churchyard, who, as a great benefactor of this region, built a primary school in Sokobanja next to the church in 1894, as well as the first ecological society in 1895.
5	2	24	1	Miloš's residence is one of the attractions that characterize Sokobanja and its surroundings. The konak was built by Prince Miloš Obrenović in the first half of the 19th century. Due to its location and appearance, this building has gone through many phases in history and had various functions. This building was first used for the needs of the administration, but it always had a beautiful appearance and characteristic style. The residence still exists today, although as a place for catering facilities and cafes which, despite the new purpose, managed to preserve the spirit of old times. Due to its history, the konak is protected by law as an object of historical significance.
6	2	38	1	King Petar Karadjordjevic came to Sokobanja for a short vacation. In his honor, they gave him a meadow known as the "King's Meadow". That meadow began to be afforested in 1953 with a pine forest. As these pines were small, densely planted, the place was called "Borići". Today, it is a beautiful forest in which black pine, American ash, mountain maple, Canadian poplar are planted, and there are some deciduous trees. All this merged with Vrelo and forms one whole with benches, tables, playgrounds for children, places for camping, a real paradise to enjoy and is always full of visitors.
7	2	72	1	The famous Turkish bath, today the park bath, the so-called Amam, was built during the time of the Turks in the 15th century, on the foundations that date back to the Roman rule in this area. It has been renovated three times, has museum value and is under state protection. It is located in the center of Sokobanja and was renovated for the first time by Prince Milos Obrenovic, who often stayed here, so as a memento of that time we have a special bathtub that was built just for him, and today it is in function and has museum value.
8	2	73	1	The medieval town of Sokograd is only 2 km away from Sokobanja. Exactly when the city was built cannot be determined precisely, according to some research, it was built during the reign of Emperor Justinian as a fortress for defense against the Avar and Slavic incursions into the Balkan Peninsula. The origin of the name Sokograd, which is also called Sokolac, is connected to the occupation of its masters. According to legend, they trained falcons. Even the tax was then paid in trained falcons and was called "falconry". Falcons can still be seen flying over this medieval city.
9	2	12	1	Within the Ozren Special Hospital, there is also a small artificial lake which is home to a large number of brown and brown trout. This location is beautiful for a one-day family trip, considering that in addition to its extraordinary beauty, it also has several sports fields for football, basketball and volleyball.
10	2	1	1	Tourists know that Sokobanja is one of the oldest, most beautiful and most visited spas in Serbia, but they do not know that this spa is one of the oldest primary schools in this area. In Sokobanja, the development of education began in the 19th century. The symbol of that period is the Metropolitan of Belgrade, Mihailo Jovanović, and since 2003, the elementary school in Sokobanja has been named after him. Before that, from 1978 to 2003, the school was called Dimitrije Dragović". 
11	2	35	1	Aqua Park "Podina" is 1.5 km away from the center of Sokobanja and was built within the sports and recreational complex Podina. This fun water complex can accommodate about 2000 visitors. The complex contains a semi-Olympic swimming pool with sports equipment, a swimming pool for adults and children and a swimming pool with 3 slides. The aqua park offers the possibility of all-day entertainment and recreation for all ages of visitors. During the summer, various cultural-entertaining and sports-recreational contents are organized, in order to complete and enrich the stay of visitors.
\.


--
-- TOC entry 3959 (class 0 OID 31045)
-- Dependencies: 207
-- Data for Name: municipality; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.municipality (id, name, geom) FROM stdin;
1	Sokobanja	0106000020110F0000010000000103000000010000004C020000FC1CA0562584424154AC004540B55441859FBD0B448442418C027CB340B554417D24013444854241C1E420D223B55441D5223A08028742416F12D359C7B55441D5206D42EC87424151202365DEB55441B9A65E7821884241F19C42AABCB554417D5065F2D28842410464F374F6B55441C6A7E17AC28A4241DB3ACD5032B654413A82AC49438B42416C5FFCE56BB654418CE0548CBF8B42414E4E43626AB6544147CB1FF3E68B4241E25200F558B65441BD49F199588C42416478A23358B654413C39918ECE8D4241778424CF99B65441B327ADAD118F4241BFED111E9AB65441E49049BBAA8F42419B337E9CCAB65441AF688EA3669042410C878AF2D2B654419D958F7D1F91424111223064FBB6544145CD4246C5924241514677067BB754419B8321C0B4934241A585AB4F9EB75441A4171C1AF3944241BEB7BD7AA1B754413799080DD7954241BB39C80381B75441782FFA95F595424177A2CBAA7CB75441F0CBD40C0C964241C4A16FC57CB7544173833D807C974241354C72817EB7544120F71A171498424157143E568DB75441795B5E5484994241EB3172433CB754412DFA40EC859A4241F56915A3F3B654413B0E2108229B4241C92B29A5E6B65441E1AC1B13899B42410FA6619BB1B6544137D07D5AA49B4241B6BD9DC08EB6544148E1D75EB39B4241C4A028D484B65441C3846CCD5B9C42410CFFD82A35B654415B35CE59909C4241CD8FAD5C36B654415E51167BF39C4241F71F5457E6B55441632991E34D9D4241105E8FB7C1B55441F2FBA054529D424109D75FF99AB5544104ABA11BAE9D424195836A2886B55441BE15EC980C9F4241B4DC7D2E53B5544189DBDBC4979F424127ACD4D82DB55441851CE7AD31A042414D5D2A24E1B4544113F8D03493A04241EEC1D9BBA9B4544182963650D2A042419EB6FB366DB4544183F7647913A14241FDE1078C5CB4544113286AA6B8A142419588238FE2B3544123ABCFD1DAA14241E8213E9995B35441E92597BC54A242412E04C18965B35441C0669C81A0A242413BA0100C35B354416628E174B2A24241B930922D9DB2544110A2B94859A24241377FCE7C07B254415D6190B416A3424189EEB3FCDFB05441E392A8C785A34241CB883C9DEAAF5441079D1E9C00A44241D114B32D93AF5441CF9302EF30A44241D1994DC379AF5441C0377AFB47A44241D6E08D064EAF544147C0563594A442413259600913AF54416F16028321A54241C3337567C1AE5441025E677AE4A642411009F16B4DAE5441C2492D5470A742411B29592752AE544142BBDE3FE3A74241CAB8605426AE54417F289D68E4A84241DB98628698AD54413190F0DE4CA9424112B9FDF0D5AD5441829317B818AA4241B5E59926D0AD5441739A36CDFCAA4241D2D0CCE8DFAD5441B04BCEC5DAAB4241DDC19558F4AD54419F39965746AD4241DD47AC58A2AD5441790C23450DAE424185A410D29BAD544173E69FEFC1AE42410D401212ABAD5441311A5B4B87AF4241EDFDB1F5A7AD5441C415564DF3AF42411C9203A39CAD544142E93683D4B042417256FD287EAD5441185D67E8A6B24241006C6EE28EAD544125DAA7E374B442413C7360E3C3AD5441A2E9A6D073B44241D0E7965B68AD5441415BF907A0B442412104ABDEFCAC5441FF53EBB3FEB4424131A8BF01EFAC5441072A58C32AB54241F66CFBCBC2AC54411E32E9A3E7B6424100343B8C41AC544183220DB34DB84241121E6AB9DBAB5441D7655C30F7B84241CD075CBDC8AB5441EE8ED0DE6FB94241062C19217CAB544107410465A3B94241259D2AA372AB54410C3FE446D8B94241F70A478457AB5441796918B42DBA42419260F15438AB5441954A20433BBA4241B5E44F7718AB54418B73F3A5FABA42411A538A75DEAA5441819E69DB8ABB42411111793EA7AA5441DF485FC5C1BB4241F461A41B77AA54416459EE9EC7BB42419805FE4B48AA5441127791927DBC4241EEE3F81712AA5441FA9ABE04A2BC4241410552DDB3A95441ADEC94F5A8BC4241A323298864A95441970B8D669BBC4241E7496BE7DAA85441225AB93F56BC4241DCBB6E0E58A854418D10C81596BC424158D8921E1AA8544158EDF45497BC4241E12C281FE4A75441FEF6CF5A59BC42419BEF47E8A6A75441EF144A5F24BC4241B0480CA581A754419041F24654BB424117A458D603A75441AE14625C04BB42416F63C882CBA654417067D450E6BA4241946510C8A1A65441964D290FCEBA42418F29BFC278A65441D7FFEB1B1EBB4241D01BA72B5EA654410B4882A453BB42412EB41C7944A654418E791703BDBB42419D99974F00A6544171E32B9EECBB42417CB895ECD9A554410839A7E8DBBB4241629860FABEA5544198F2F44F0ABC4241213DDF6F3BA554410FEF3D624DBD4241CFAE29AFF6A3544100B6E72867BD4241EF7457EC93A35441B5D438E594BD424162C94FD87CA35441F863C937E2BD424128680D6260A3544196B58DA809BE42416CF81C4732A35441F762339D12BE42411A721BC818A3544142EA7F74D2BD4241ED85A926D5A25441B95ACB6683BD424118C768B5EAA25441A29EA47B1DBD4241A3DE4F93F8A25441C1CD906DE2BC4241D84B2A49D4A2544114E3BF58F2BC424150481E6072A25441C04D402527BD4241A1B0E5A617A2544165618BDB15BD42415F51B66CEFA15441A2125F8CD5BC42416FAEA52EBCA1544106817E8EA4BC42418D769C7269A15441E72033EFDCBC4241FCF99E5B6DA154417777AF5AF9BC42416F43E52752A15441E29E04EF00BC424117F0FA170BA154411D5CD95D21BC42412D46EBCDC9A0544169C41B440FBC42417D2BFBF6A7A05441A46F8FDF2ABC4241E2831BF230A054414B6875B972BC424170D00D3ECC9F544120447D4D0DBD4241099F36E2A29F54411BB700337FBD4241C618CBEAA49F54414B1BD3C543BE4241A74806A9729F54416CC782AC99BF4241FA17221BBA9E544194E3A6FE05C14241CCA323BD389E5441748F5C1D9FC142412427B34C0E9E544168724E051CC242412F484A28FE9D54416A55526D78C24241743439750D9E54410F6F4AE3F7C2424139F0711AE49D544187EF29E397C342416058CABE929D5441FD5C4E2D45C342419D68D6B1539D54413B337A1FDEC2424199FE965EB49C54414F744ADE6AC24241A57C969BEA9C544140A75E23DBC14241811721FFC59C544161F447CE70C14241E04A4DA4DD9C5441084517353FC1424181D413D4BB9C54416A80B10235C14241689C0CD4829C5441487FB6D48DC0424102B2A558599C54419E41851AD3BF42411A05EF21719C5441425ED4D963BF424156523A50829C54411F122808DDBE42416BFA7FD8449C5441A333A0F688BE424161EE958A5A9C54416F89ECE881BD4241BE2D5A331E9C544144AC24960ABD4241BE2D5A331E9C5441F07CBBE2C5BC4241E1986C7B3A9C54410B22FF4E08BC42411BF0F6BEC69C544120E8197232BA4241F84BF7A0DB9D54415CD34A2BCEB9424124EFC63BD59D54415A7CB6A5FEB84241FFA0B4FB049E5441A7AE6A8B80B8424137B25B08CC9D5441178F12BB9FB8424128215A86AD9D54417D190F5874B842411B38B0A08B9D5441A8022C4FD6B7424153DC6BD58D9D54414D25CF0C37B742415702AC70949D54411EFCB3643CB74241C4797EA9C89D544119FEDF99DBB6424120C4ACC9B59D544187B96B4003B64241E5DAF7FF519D5441B6DB438E9DB54241FF6462494F9D5441A6862E9622B54241376CED0F189D5441FDBAF63DDEB442417BDF31380F9D54417C3E6391A8B342410114757F759C54419E94F1D556B242413BF2AE5D229C5441729B6AC44AB14241DAC52A02929B5441A59F394240B1424112683544829B54410EF941B86FB14241FDB4ED84559B54411DAD955C6EB14241B02A69F6F79A54414EFE41B3E2B04241AFDDD60A219A54412B7D025454B042415E56E8D287995441F6ADE43FD7AF42416D02A0D965995441A2DAF1FF9BAF42411CD6137A34995441645602DBF8AE4241B4549445BA9854410B8CA81D02AE424187160D8E4D9854414390182C6EAD424120EAA3E6A99854418F5246E13CAD4241F4850970DD98544165A6D78DFFAC4241C4E7E58A009954412E776E95FDAC4241BB60CFBA4799544144E22A061FAD4241BD5B113D8599544193062996D2AC42415A21FCD4B099544159F182C8D3AC42410421F870D9995441B5C05956B2AC42417D14D059169A544127DF0FBAACAC4241AF85A1166F9A5441BF4467E140AC424117F9F2A2D69A5441D6734D6AFAAB42413C4ACF45F99A54415A8DEC6376AB42412F02C2C40B9B54417B48E35F33AA4241391BF28A3E9B54415F5598D991A942416C9AFAFD929B5441402B827975A942411AEED29CD89B5441070ADBED15A94241D3574872D19B5441A7C0A8A6C2A84241341A87D2AE9B54411910F4C1D8A742416E4C32B4E59B5441AB9455DA3EA7424155A4ACCF129C5441EB0B61FCC4A642416CEA8AB4049C5441CD541651D0A54241AC231805DD9B5441D4B9A24D5BA54241AC148700049C54417F06C1882AA54241DEE258E57B9B544147F8E6775AA5424117D84464349B5441328D2A0739A54241DE2918F93B9A544133ADB8CD3DA54241CBE31F53F1995441E57CB97F29A54241BC4D924DCC995441E35C2BB924A542410AE0CA19789954410927A3DC06A54241C1B7B2943D9954416E22211DF3A44241089F7136C4985441BAF6A38EF2A44241A4FE34884A985441E48D84B85EA54241EF65E9CEF9975441A1E305279CA54241D4C69600E89754411BBAA82CECA54241D785BE9DBA9754418A8759EE36A64241792B5497B697544150FBDD7E50A6424195823B0292975441F83821FEA7A64241C83EA20071975441142E0F571AA742411F648FBFF69654418BF6EFEFC7A74241FC0DF4FAAE965441ABF6725F10A8424158DDBBE4AD965441D2EC790758A8424125178EFA9B9654416F4D78A380A842414F0174785E965441E233620CD3A84241C5B6160B3A9654416C75C18244A942412CABAEBD259654410898B1EA91A9424101B5C547149654417C3CE2A1D2A94241420D5DDFDF955441DCC774D976A942418E84AB60B9955441BCA5663C06AB424127780B3DEC945441C1FC8F3B78AB4241F53B2E6DC2945441449E9905F8AB424189AD592083945441BA94CAD14CAC4241CDBF977A63945441CCEF3FDF6BAC4241F9AF44F750945441CEDFF87B69AC42419A1355EB06945441BF4467E140AC4241C0DF5FFACF935441E8CEC27719AC424111316F5FA793544197E86795E3AB4241B6D0C758929354415B9DAA64AAAB4241BBBCE3BB84935441D7674CAC99AB4241096B0539729354414C32EEF388AB424156AAA9964F93544136C7318367AB4241373DF3BA319354419D46A5203AAB4241E791F12C28935441FEF5EDE713AB42414D75E285339354416C77FEA9EEAA424119670364449354413E7F5ADD9EAA42413DED026226935441C8F0B8705CAA4241B02ED9C0339354413E47CA9AD8A94241E0D7E289059354410616DCAB76A942410988F1BF039354412AF09A325BA942418F11FC820B935441E09F0D1E42A94241847D21CD22935441073AB0171DA94241AE1E3302219354416C9995EEEAA842414FB89BB40C935441F836B91027A84241E3E329773F93544199CBD27BF8A7424148C85CA5439354417F14E191C4A7424150A5284459935441DC6F1BEB5BA74241E2FAE687B393544162327F20C9A642410D19926BF1935441B65AC3551EA64241B2ACBBF02B945441A0EF06E5FCA542416E4D07B4339454411C8AD302E5A542418146561836945441566FA4A6DCA54241F30D61ED2E9454418E9491D7DDA542410D1A2AA01A94544151BF0797E8A5424193FBE0CEF39354418E9491D7DDA54241EFA2294FDE935441422476FCBFA54241E0292A37C89354410BE9FF2E89A54241E9ACC4AEB6935441A687A1782FA54241088BF8F0AD935441ED570EE69AA44241CC0665FBB4935441659ED8AC14A44241F686E984CE935441857DDEF9C7A3424109E2CDE5B6935441CC3D7BA162A342418F39C573B493544179C6043E3CA34241217F3031A3935441ED641701C6A24241C8177A94A59354410494FD897FA24241AD8F6E83899354412BFA96794EA242419CD4596B21935441218B53D072A142416273B0C92593544110893F0E39A14241B5F03DCA089354410CE4C077E9A042417A7CA39327935441349EF137C9A042412E7CF29E1E935441AE4805B9B3A0424177ED8F19E49254415E1C4C1041A04241092F7FA7ED92544163CCE81F35A0424124755C510A935441754B3299FA9F42413EF9357417935441CB675186B59F424199B8A042089354415FE07528D99F424177D31DD9EE9254413BC076B7289F4241487183899892544119D0649E279E42412566F4AC94925441CB936492B29D42418E4F9829829254410D7F954B4E9D4241D1BC01075C925441277E3B24A39C42418F1DEC034D925441D21FFE67849C4241AF82B291569254414BFAE612769C424138BDC5A272925441FBA959FE5C9C4241648AFBFE7A92544164E9B00E269C42410386C7947E9254411689DC960A9C4241C7994891819254413A639B1DEF9B4241E1CF3902A3925441FE5D3CB3F29B4241FDA42189B29254413A6F9CDB4F9C42412DB7C2CDF7925441FF59F60D519C4241A0EB90F1049354412404E06A2E9C42415007D6A51893544126F498072C9C4241F837E36B48935441EB0EC863349C4241E914678B58935441E31053085D9C42414C1AB945689354415C789AF16B9C42413C71351579935441D3E327801C9C4241D958C73F9793544175189797DF9B4241D8EE9634A0935441B5F5AC22189B42415A79F2BAAF9354414BC8D4C1C49A424115D5ADDCC3935441540ED418789A424197743A75139454416D2D733E2F9A42419107AE8485945441321C1316D2994241E26A6757D49454410796FD249B994241E4462E9AF1945441D418F2EACE9842417B7E825C24955441233DF07A82984241F9E4FB542A9554414BF7203B62984241036D27C4239554413E4C483D3798424172C29FAF0A955441023594160A984241662F313524955441D40CF12C6E984241EE0FADE25E955441745DA86594984241A3E88B86D49554419A27208976984241E1763925FA95544183EC38425C9842417529B6760B965441B12631E8289842417AA63E7D309654418E6EA3FA199842417D6BF81C2B96544103691A6C10984241EAC1DEC02296544163F6319A14984241EDBF58D5FC955441A1EB49A10E984241DEBB2A52EA955441527D4836F3974241CB529C9DDA955441535D43D2BC974241C01BD0AF06965441C72988EC7C974241F42AEBF10F9654417BE9413B66974241A974A0A7379654413F06146A3F9742412307D890359654410423E6981897424125C0B25C4B9654418F2A12FAF2964241610D595F73965441582298FEC6964241D288866786965441CC2DCE911E974241A66E19EAFD9654419E3ACA4C5E9742411C385F87379754418F286F27229742414E59E3594A975441A65755B0DB9642417E482BBC77975441C68E1A97D0964241F93234D6C19754411D2EAB0B3F9642414DD48C1A68985441F66F52822E964241F4850970DD9854415E42D36C169642412906A77E32995441BD4EABF6CE954241E3426EFA679954416859933492954241021C671C8C9954410E93374D87954241150BF44DA199544137EDBDB958954241FC1262D92B9A5441766E6F96249442415FB9EFC40E9B544167D3DDFBFB93424117D84464349B54418D9D551FDE934241B87C02EB439B54418E617F37769342417E17625C659B54415570ADD51D934241F43517FAB59B54415540D8AB16934241D3574872D19B544107E00334FB9242411A19CD18F19B5441CD0A0356D4924241D03B1F84099C5441D2F2777744924241F4E614BE3B9C5441BC87BB0623924241683C73FD5B9C5441E8CC3CACF1914241ECEA7B756D9C544195B588CA81914241B7C1953F799C5441CFE16BABF6904241DDB38AA2CA9C54418ED21F8A909042413EF50DB3C29C54419AE0E75F3E9042415E09A000A99C54411673E79FCA8F42415FCBCF68A59C5441E831BE643A8F42419EB5C9B1709C5441AB611064B68E42411494F7203E9C5441E286FD94B78E42417FC42986159C5441553D12D4028F4241F43517FAB59B5441B624EBDDA28F42414B3D1C60629B5441651034B1F18F42417667647F729B544140961F7E1B90424198104A8E669B54415001DCEE3C904241CC024A56409B54417A4360DF4C8F42418021848C139B54415732A7B0718E4241E42156BDE59A544174BCBB4A268D4241E2781A859B9A54419A38F09BC78C42417772A4FEA09A5441A30E879E388C4241BA5F0DB2CA9A544198C0C017F28B4241DE2EE0C1EA9A5441CC8CE176B08B424126CB767BF79A5441A5C6AFF86F8B4241137C66A12C9B5441DFAB809C678B42413537B4114E9B544158B63E71608B42419BBB64ED6B9B5441430FAC18D78A4241245B4A298F9B54416E89C04BAD8A424103A0DB8EB99B5441D128C2AF848A42413C18E76AD79B54414BA30007688A4241EBD40B47F59B54413F000D15418A4241753CDE73289C54415D9EDD85158A4241BB556672549C5441357DB300F3894241D4DA3CE7669C5441365017448C894241EECCC22A609C5441FA831A6F078942412219D2E4469C544132D906BD54884241B91D9397449C54414564044A8E874241ED8D297B1E9C5441A100FDE1D28642417DAA476D0E9C5441ED047F701E8642413B2600C0E59B544143893F8288854241A0775F041D9C5441B1EB632F0285424185C3A934049C54417E9AE7799B8442414CAA6DA9229C544156D4B5FB5A844241EACB17AD1F9C5441305EE76D26844241B102D589129C5441CDE2B975F58342410DDBFC77F69B54417D625737D58342412CCFF3B4EE9B544173CB0B424E8342410DDBFC77F69B5441FDC8D9B798824241DCE0E4A7CF9B5441120807A454824241A3F90A68AF9B5441CF7CAA310C8242414C1CE66DBB9B544138E41B531D81424144ACC563DC9B5441A7217D386080424127F3E19E009C5441AFD9A592977F42418CAAC79A2E9C54414D22A2B2FE7E4241F1F06F7C719C5441CD0595CF9D7E42413717059E869C544101AACBBE217E4241C8CB3462B19C544114BD6926787D42417F31095DDF9C5441A58A6272BB7C4241F8A55D853C9D544126F1D22DE27B4241A15A7FA2789D54415D8A984B0C7B424199F246EA919D54413904835AD57A424188FB0438A69D54412399C6E9B37A4241566CC31BBE9D5441E6448E12A77A4241A73AC293D89D54412659AA5CAA7A424196AA72D2F99D54417899F00DC17A4241F0876B8B0A9E5441A4AB5705147B4241A882E173359E5441EC9F683D187B42414064C9F35C9E54415DBA6D75137B4241AADBAA62D49E544149A23B9D017B42413104C47AF69E5441FB0E6B53DB7A4241B43A49235D9F544125897F86B17A4241D1A23C9AA39F54419C7FB052067B42410CAC7D2ED29F5441BD7314287D7B42410E01250F25A05441ACCCEC55517B4241C27EA02C56A05441133A0B37F37A4241FAC2B4A8BEA05441A6B4DEC2BB7A4241D542E85AD1A05441D9E0D368CD794241ABBB01D5EDA05441F0384CC12D794241C71FD0AB09A154417B0D8867D1784241621612FB22A15441AC4FFA9244784241B9938B1439A1544120F6D9332A7842417C2170614DA1544149B00AF409784241D1B5B9F17EA154414D907C2D05784241C6AFF64290A1544199D0C2DE1B78424110986942BBA15441C9E5E5F7147842415B53F639CFA154414D907C2D05784241B633751ADCA154418D203894C477424104444C6005A2544193F4964AC277424181F9C0502DA254410FBF3892B17742414D365B2C4BA25441DBCFF73D8D774241AD04B10071A25441FC3734002D774241D9456586A9A25441C7F6FEADC8764241432B3785D4A2544114FB6E7777764241856F1EACDEA254417E6A9BB147764241BD359B6CE9A2544190B90F0106764241E37E8893F3A254412C1E5442D07542414D152556FBA25441DA0736FB2F754241F69CB65C4FA354414435384FC87442415BE6EAA562A35441BCE39175547442411F8399847DA354417237A0B2CE734241F54F788BA2A35441BDBEF8A0627342410D15B89AB7A35441C62F0FBE1C73424144D35163C3A354416317D19D6E7242413D8D49DA03A454419D33E4B812724241111B1A354DA454415BA5E900957142417235D79BE5A45441E38E2A6E3B71424179C0F3881FA55441F6DD9EBDF97042417EFE93AA57A55441E672E24CD8704241D6848BE67AA554414912E4B0AF7042418C73C5378CA5544186E76DF1A4704241FD694613AAA55441F9C1569C9670424150AE3D56C7A55441BFACB0CE977042416BD8DFD9D9A55441A20F76F8927042419998AFCB17A65441FA8580B42E704241EE5C2FFC8FA654417480F7252570424124CBD5E2A4A654413A6B515826704241F54DC8C5BCA654413A6B51582670424106C5C764E2A65441DAFFED77FD6F42417238CAD74BA7544169D827F48C704241744886066AA7544131361123D47042414A99061DB8A75441D227B4A2BB7042418525CDD7D4A754413E6D4DECB7704241F1FEA6A007A85441726C6A1D817042412B74EDFB34A85441243C6BCF6C70424133A893305EA854419BF6C5B359704241D0D877417AA85441899B50A63A70424163E6375E8DA85441D4DFDCFCF26F42414327F107AAA85441046BDA446F6F42417E0F1A70E1A85441DAA74CBA2C6F42418F37B726E5A85441ECD08583556E42412D283EBD3FA95441A45E5C4F096E4241EB5CB2D2A7A9544121BD5285896D4241732626F2E2A95441333C9CFE4E6D42412B41AE5B0AAA5441FA66B34ED06C4241457ED2F532AA544179335D41256D42410BB5132B92AA544132EC380E436D42418ECD1E24E0AA54410B766A800E6D4241D6D3BFCEFCAA5441AFC41F77DA6C42414502969421AB54415B6A93E6BA6C4241B498C1E53DAB544124B389139C6C4241D1A2F1DA6BAB54410C3A9498A66C4241DBAAF18A88AB5441D8E9063FD06C42412B0172CC9EAB54416EC1C24E386D42414B83AB45C1AB544132EC380E436D42416E02CFCCD0AB5441F54CD8F5246D424108CB0F2D78AC5441BBF50742EE6C424193742C58D9AC5441FCDAD8E5E56C4241D1DF8A3222AD54415A9A6810C26C424151940DDC3EAD5441C0F94DE78F6C42417736C496A2AD54411252CC1E816C42418AF6148CAEAD5441D5122271456C42413DE0D91EBAAD54416B3435429F6B4241312FB8F104AE54417A21CD9FA46B42414DA231651FAE5441DADC1625DF6B4241BDDCCD5556AE544199271BABEE6B424188A6A7FAA0AE544135F709DDFA6B424108688FC0F8AE5441EA47D395006C4241F86436F721AF5441A82239BDB46C42413E524C8039AF5441BF054FA5F06C424118E8142C4BAF54417D5C54E9606D4241626B285180AF54410C7E2599CD6D4241B8E33B29A1AF54410E199F054E6E424124A474A1C3AF54410516602FA26E42418F261E28CCAF54419FBAA221056F4241A706A9E6D3AF5441B1ED1BFA4C6F4241D2A396F5F5AF544142B269FEAE6F4241E69EC51A43B054414C8E36237F6F42417F8C76BCA3B054411AF9E09D3B6F4241F548499BC9B05441148D1D5E246F4241395C69921AB15441EA41EFF8C46E424188BD5A504EB154418E2B3021AE6E42418494A7C499B154411517084A516E424130D78A7518B25441CAD42ADD3D6E4241FE0DF13C33B2544107AAB41D336E42417A62B75E6BB25441B689FC32216E4241B7F6F27A7EB254418AECF7ABF26C4241A319368F22B354415E2B2BD0F16B4241EF84B0D698B35441AE36736DA36B4241666F03B0A3B35441DC943F7F166B4241B8F6E792BBB35441E4E65D709B6A4241B1D98690CAB354419EE211EC686A424196D9B875DEB354411C4280E0476A42419600C2F1EBB354417E911E54136A4241FCF8D10DFFB35441540B0963DC694241E36C3BD106B4544159AFA4B46F6942413F69495F10B45441044A18871C694241853F33AC24B454414321DA1385684241348AC71D2CB454418AF128A57F684241150F51283DB45441C0F6870F7C684241E37F5B519AB45441E69C2BC7B7684241F39AD6ECC2B45441F79E4BA0C56842418790120F02B554417900D404A76842419A8D7AA21AB5544120B2D194B668424139D18F7C9DB55441B16096FCE26842417DDFD731D6B554415F44FAC32D694241B1B0BDAE0BB654417BA18393866942414715B5E72EB654419791A771246A424106E3B9123AB65441518FB6F00C6B4241553BE12960B654411C0EB2BB8B6B42412A76A05D32B654410EF2BCF2DD6B424106F7FC9903B654410BF21B62676C42418DB4D57DF8B554415F7ADA49BD6C42415EA515B3EEB554414597110C6E6D4241D58443F4B8B55441A7DCEBE8826E424109949D8BD6B55441174D01D11A6F4241F8F80E22E8B55441B219AB7EB26F4241E7535A0DF0B554413907EAC144704241E4A35E3C17B654414CF69B8F4C70424114E8F73C26B6544186DB6C3344704241326CC01844B65441E5EB4EAABC7042418C8CDCA648B654412D8CD4288470424125D643D9A5B654419703044BC96F42411A44FE1ED5B65441D6D50774316F4241E080E6F0DEB65441BE1AFAD7A06E4241293F32CD32B75441E2EFD007406F4241674A3ACD99B75441D34C489C766F4241663D256FB9B754418C4C18CAA06F42417CF807C9D6B7544106A26893767242417AAC2F2F76B75441BD8180075773424109E36CB221B75441AB6A7E1EEE744241A4F265A5EEB654411F3BC10E9A754241D15BFE312AB7544190E85AA711764241D9BB6A8B20B754416AD85ACAAD764241AE5517E7E0B6544197A03A5F017942410B0F9BCFF7B65441D157A3A1A97942413664C812C7B65441F64AACC1A07B4241D0975805F7B65441C955DBB6CA7C4241EE0BC85C9DB654414F8E36249A7D4241BCD2D2D18BB6544169B4DCEBCF7E424101D5B3829AB65441AFCA955ADB7E42410684BF7256B6544124397F0DD47F4241C8A2740CB4B55441957E3560AF814241AF2097DF75B554415450977EC18242410EDC9C433BB55441FC1CA0562584424154AC004540B55441
\.


--
-- TOC entry 3782 (class 0 OID 30335)
-- Dependencies: 202
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- TOC entry 3981 (class 0 OID 0)
-- Dependencies: 208
-- Name: city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.city_id_seq', 1, true);


--
-- TOC entry 3982 (class 0 OID 0)
-- Dependencies: 218
-- Name: city_translation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.city_translation_id_seq', 1, true);


--
-- TOC entry 3983 (class 0 OID 0)
-- Dependencies: 216
-- Name: language_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.language_id_seq', 2, true);


--
-- TOC entry 3984 (class 0 OID 0)
-- Dependencies: 214
-- Name: legend_attribute_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.legend_attribute_id_seq', 1, false);


--
-- TOC entry 3985 (class 0 OID 0)
-- Dependencies: 222
-- Name: legend_attribute_translation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.legend_attribute_translation_id_seq', 1, false);


--
-- TOC entry 3986 (class 0 OID 0)
-- Dependencies: 212
-- Name: location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.location_id_seq', 76, true);


--
-- TOC entry 3987 (class 0 OID 0)
-- Dependencies: 220
-- Name: location_translation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.location_translation_id_seq', 11, true);


--
-- TOC entry 3988 (class 0 OID 0)
-- Dependencies: 210
-- Name: location_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.location_type_id_seq', 13, true);


--
-- TOC entry 3989 (class 0 OID 0)
-- Dependencies: 206
-- Name: municipality_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.municipality_id_seq', 1, true);


-- Completed on 2022-06-21 14:21:20

--
-- PostgreSQL database dump complete
--

