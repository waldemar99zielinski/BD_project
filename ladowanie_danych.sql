--delete
delete from stopnie;
delete from adresy;
delete from komendy_policji;
delete from policjanci;
delete from rodzaje_zdarzenia;
commit;
--stopnie policji


insert into stopnie values (101, 'Posterunkowy', 1500);
insert into stopnie values (102, 'Starszy posterunkowy', 2000);
insert into stopnie values (103, 'Przodownik', 2500);
insert into stopnie values (104, 'Starszy przodownik', 3000);
insert into stopnie values (105, 'Podkomisarz', 5000);
insert into stopnie values (106, 'Aspirant', 7500);
insert into stopnie values (107, 'Komisarz', 10000);
insert into stopnie values (108, 'Nadkomisarz', 12000);
insert into stopnie values (109, 'Inspektor', 15000);
insert into stopnie values (110, 'Generalny inspektor', 20000);
commit;
--zdarzenia rodzaje_zdarzenia


insert into rodzaje_zdarzenia values (1, 'interwencja');
insert into rodzaje_zdarzenia values (2, 'przestepstwo');
commit;
--adresy


insert into adresy values (1001, 'Jagielonska', 'Warszawa', 51);
insert into adresy values (1002, 'Nowolipie', 'Warszawa', 2);
insert into adresy values (1003, 'Rydygiera', 'Warszawa', 3);
insert into adresy values (1004, 'Lutomierska ', 'Lodz', 108);
insert into adresy values (1005, 'Sienkiewicza  ', 'Lodz', 28);
insert into adresy values (1006, 'Mogilska', 'Krakow', 109);
insert into adresy values (1007, 'Zgody', 'Krakow', 10);
insert into adresy values (1008, 'Bia³a ', 'Gdansk', 1);
insert into adresy values (1009, 'Grabiszyñska   ', 'Wroclaw', 255);
commit;
--komendy

insert into komendy_policji values (101, 'Komenda Rejonowa Policji VI Praga Pó³noc', 1001, null);
insert into komendy_policji values (102, 'Komenda Sto³eczna Policji', 1002, null);
insert into komendy_policji values (103, 'Komenda Policji Warszawa ¯oliborz', 1003, null);
insert into komendy_policji values (104, 'Komenda Miejska Policji', 1004, null);
insert into komendy_policji values (105, 'VIII Komenda Policji KMP ', 1005, null);
insert into komendy_policji values (106, 'Komisariat Policji IV', 1006, null);
insert into komendy_policji values (107, 'Komisariat Policji III', 1007, null);
insert into komendy_policji values (108, 'Komenda Policji Gdañsku Przymorze', 1008, null);
insert into komendy_policji values (109, 'Komisariat Policji Wroc³aw-O³bin', 1009, null);

--policjanci


--komenda id 101
insert into policjanci values (101, 'Jakub', 'Sliwinski',110 ,0, null, 101);
insert into policjanci values (102, 'Karol', 'Kosinski', 108,0,101 ,101 );
insert into policjanci values (103, 'Dawid', 'Paluch', 106,0,101 , 101);
insert into policjanci values (104, 'Maksymilian', 'Orzechowski',101 ,0, 103, 101);
insert into policjanci values (105, 'Jesica', 'Sobczak', 101,0, 103, 101);

update komendy_policji set id_komendanta = 101
where id_komendy = 101;

--komenda id 102
insert into policjanci values (106, 'Matylda', 'Kucharska', 108,0, 101, 102);
insert into policjanci values (107, 'Zuzanna', 'Pawlowska', 107,0, 106, 102);
insert into policjanci values (108, 'Piotr', 'Jablonski', 107,0, 106, 102);
insert into policjanci values (109, 'Kacper', 'Zych', 105,0, 107, 102);
insert into policjanci values (110, 'Natasza', 'Bak', 101,0, 108, 102);
insert into policjanci values (111, 'Julia', 'Milewska', 102,0, 108, 102);
update komendy_policji set id_komendanta = 106
where id_komendy = 102;
--komenda id 103
insert into policjanci values (112, 'Damian', 'Dobrowolski', 107,0, 101, 103);
insert into policjanci values (113, 'Wiktoria', 'Wozniak', 103,0, 112, 103);
insert into policjanci values (114, 'Zuzanna', 'Wieczorek', 102,0, 112, 103);
insert into policjanci values (115, 'Bartek', 'Pawlik', 102,0, 112, 103);
update komendy_policji set id_komendanta = 112
where id_komendy = 103;
--komenda id 104 
insert into policjanci values (116, 'Mateusz', 'Wesolowski', 107,0, 101, 104);
insert into policjanci values (117, 'Kacper', 'Kaminski', 102,0, 116, 104);
insert into policjanci values (118, 'Nikola', 'Maciejewska', 101,0, 116, 104);
insert into policjanci values (119, 'Rafal', 'Wasilewski', 101,0, 117, 104);
update komendy_policji set id_komendanta = 116
where id_komendy = 104;
insert into policjanci values (121, 'Aleksandra', 'Wasilewska', 106,0, 101, 105);
insert into policjanci values (122, 'Daria', 'Marciniak', 101,0, 121, 105);
update komendy_policji set id_komendanta = 121
where id_komendy = 105;

--komenda id 106
insert into policjanci values (123, 'Jan', 'Kowalski', 108,0, 101, 106);
insert into policjanci values (124, 'Pawel', 'Wojcik', 107,0, 123, 106);
insert into policjanci values (125, 'Zuzanna', 'Debska', 106,0, 123, 106);
insert into policjanci values (126, 'Piotr', 'Wasilewski', 104,0, 123, 106);
insert into policjanci values (127, 'Hanna', 'Kaczmarek', 101,0, 126, 106);
insert into policjanci values (128, 'Maciej', 'Michalski', 101,0, 126, 106);
insert into policjanci values (129, 'Adrian', 'Zajac', 101,0, 126, 106);
insert into policjanci values (130, 'Mateusz', 'Lukasik', 101,0, 126, 106);
update komendy_policji set id_komendanta = 123
where id_komendy = 106;
--komenda id 107
insert into policjanci values (131, 'Agnieszka', 'Jankowska', 109,0, 101, 107);
insert into policjanci values (132, 'Sebastian', 'Maciejewski', 107,0, 132, 107);
insert into policjanci values (133, 'Szymon', 'Tomaszewski', 107,0, 132, 107);
insert into policjanci values (134, 'Kamil', 'Domanski', 105,0, 133, 107);
insert into policjanci values (135, 'Wiktoria', 'Nawrocka', 102,0, 133, 107);
insert into policjanci values (136, 'Witold', 'Malinowski', 101,0, 133, 107);
insert into policjanci values (137, 'Oliwia', 'Blaszczyk', 101,0, 133, 107);
update komendy_policji set id_komendanta = 131
where id_komendy = 107;
insert into policjanci values (138, 'Kornel', 'Wilk', 108,0, 101, 108);
insert into policjanci values (139, 'Jan', 'Nowak', 106,0, 138, 108);
insert into policjanci values (140, 'Agata', 'Pawlak', 105,0, 139, 108);
insert into policjanci values (141, 'Maciej', 'Szulc', 104,0, 140, 108);
insert into policjanci values (142, 'Laura', 'Jaworska', 103,0, 140, 108);
insert into policjanci values (143, 'Joanna', 'Socha', 102,0, 140, 108);
update komendy_policji set id_komendanta = 138
where id_komendy = 108;
insert into policjanci values (144, 'Michalina', 'Cieslak', 106,0, 101, 109);
insert into policjanci values (145, 'Mateusz', 'Pawlowski', 104,0, 144, 109);
insert into policjanci values (146, 'Jan', 'Urban', 102,0, 144, 109);
insert into policjanci values (147, 'Maciej', 'Kowalski', 101,0,144 , 109);
insert into policjanci values (148, 'Wiktoria', 'Jakubowska', 101,0, 144, 109);
insert into policjanci values (149, 'Anna', 'Dziedzic', 101,0, 144, 109);
update komendy_policji set id_komendanta = 144
where id_komendy = 109;
commit;

insert into obywatele values (101, 'Karolina', 'Chrzanowska');
insert into obywatele values (102, 'Leon', 'Wróbel');
insert into obywatele values (103, 'Antonina', 'Michalska');
insert into obywatele values (104, 'Aleksander', 'Chojnacki');
insert into obywatele values (105, 'Mieczys³aw', 'Dabrowski');
insert into obywatele values (106, 'Micha³', 'Gorecki');
insert into obywatele values (107, 'Julia', 'Osinska');
insert into obywatele values (108, 'Lukasz', 'Pluta');
insert into obywatele values (109, 'Sebastian', 'Lewandowski');
insert into obywatele values (110, 'Mikolaj', 'Sosnowski');
insert into obywatele values (111, 'Maciej', 'Markiewicz');
insert into obywatele values (112, 'Michal', 'Cieslak');
insert into obywatele values (113, 'Zuzanna', 'Sosnowska');
insert into obywatele values (114, 'Jan', 'Augustyniak');
insert into obywatele values (115, 'Tomasz', 'Grzybowski');
insert into obywatele values (116, 'Zuzanna', 'Kowal');
insert into obywatele values (117, 'Grzegorz', 'Jab³onski');
insert into obywatele values (118, 'Jakub', 'Szymanski');
insert into obywatele values (119, 'Franciszek', 'Ostrowski');
insert into obywatele values (120, 'Karol', 'Olszewski');
insert into obywatele values (121, 'Mikolaj', 'Bednarski');
insert into obywatele values (122, 'Kacper', 'Wojciechowski');
insert into obywatele values (123, 'Piotr', 'Nowak');
insert into obywatele values (124, 'Dominik', 'Chmielewski');
insert into obywatele values (125, 'Lena', 'Kacprzak');




--kary
--grzywna
insert into kary values (1, 50, 0, 0);
insert into kary values (2, 100, 0, 0);
insert into kary values (3, 500, 0, 0);
insert into kary values (4, 1000, 0, 0);
insert into kary values (5, 5000, 0, 0);
insert into kary values (6, 10000, 0, 0);
--pozbawienie wolnosci w latach
insert into kary values (7, 0, 1, 0);
insert into kary values (8, 0, 2, 0);
insert into kary values (9, 0, 5, 0);
insert into kary values (10, 0, 10, 0);
insert into kary values (11, 0, 15, 0);
insert into kary values (12, 0, 25, 0);
--prace spoleczne w godzinach + grzywna
insert into kary values (13, 500, 0, 10);
insert into kary values (14, 1000, 0, 20);
insert into kary values (15, 2000, 0, 100);
insert into kary values (16, 5000, 0, 200);

--zdarzenia
insert into zdarzenia values (1, 'zak³ócanie ciszy nocnej', '18/03/02', 101,1,1);
insert into zdarzenia_policjanci values (104, 1);
insert into zdarzenia_policjanci values (105, 1);
insert into zdarzenia_obywatele values (101,1);
insert into zdarzenia_obywatele values (102,1);
insert into zdarzenia_obywatele values (103,1);

insert into zdarzenia values (2, 'picie alkoholu w miejscu publicznym', '18/05/12', 101,1,2);
insert into zdarzenia_policjanci values (103, 2);
insert into zdarzenia_obywatele values (104,2);
insert into zdarzenia_obywatele values (105,2);

insert into zdarzenia values (3, 'kradziez sklepowa', '18/06/02', 101,1,3);
insert into zdarzenia_policjanci values (104, 3);
insert into zdarzenia_policjanci values (105, 3);
insert into zdarzenia_policjanci values (103, 3);
insert into zdarzenia_obywatele values (106,3);

insert into zdarzenia values (4, 'pobicie w celach rabunkowych', '18/11/03', 102,2,14);
insert into zdarzenia_policjanci values (106, 4);
insert into zdarzenia_policjanci values (107, 4);
insert into zdarzenia_policjanci values (108, 4);
insert into zdarzenia_policjanci values (109, 4);
insert into zdarzenia_policjanci values (110, 4);
insert into zdarzenia_policjanci values (111, 4);
insert into zdarzenia_obywatele values (107,4);
insert into zdarzenia_obywatele values (108,4);
insert into zdarzenia_obywatele values (109,4);

insert into zdarzenia values (5, 'porwanie w celu okupu', '19/01/01', 103,2,10);
insert into zdarzenia_policjanci values (112, 5);
insert into zdarzenia_policjanci values (113, 5);
insert into zdarzenia_policjanci values (114, 5);
insert into zdarzenia_policjanci values (115, 5);
insert into zdarzenia_obywatele values (110,5);
insert into zdarzenia_obywatele values (111,5);

insert into zdarzenia_policjanci values (105,1);


