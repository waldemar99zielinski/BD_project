--
create or replace procedure awansujPolicjanta
(
    p_id_policjanta number
)
as
    v_id_stopnia STOPNIE.id_stopnia%TYPE;
begin
    
    select id_stopnia into v_id_stopnia 
    from POLICJANCI 
    where id_policjanta = p_id_policjanta;
    
    if v_id_stopnia < 110
    then
        v_id_stopnia := v_id_stopnia +1;
        
        update POLICJANCI
        set id_stopnia = v_id_stopnia
        where id_policjanta = p_id_policjanta;
    elsif v_id_stopnia >= 110
    then
        dbms_output.put_line('Policjant ma najwyzszy stopien');
    else
         dbms_output.put_line('Niepoprawne id policjanta');
    end if;
exception
    when NO_DATA_FOUND then
    dbms_output.put_line('Niepoprawne id policjanta');
end awansujPolicjanta;
/
begin
awansujpolicjanta(null);
end;
/
create or replace trigger premiaPoZdarzeniu 
after
insert on ZDARZENIA_POLICJANCI
for each row
declare 
v_id_policjanta POLICJANCI.id_policjanta%TYPE;
begin
    v_id_policjanta := :new.id_policjanta;

    update POLICJANCI
    set policjanci.permia =  policjanci.permia +100
    where id_policjanta = v_id_policjanta;
    
end;
/
--wyswietla informacja dotyczace nowego zdarzenia
create or replace trigger noweZdarzenie
before insert on zdarzenia
for each row
declare 
v_rodzaj rodzaje_zdarzenia.nazwa%type;
begin
    select z.nazwa
    into v_rodzaj
    from rodzaje_zdarzenia z
    where z.id_rodzaje_zdarzenia = :new.id_rodzaje_zdarzenia;
dbms_output.put_line('Zarejestrowano nowe zdarzenie: opis: ' || :new.opis || ' data: '|| :new.data || ' komenda: '||:new.id_komendy ||' rodzaj: '||v_rodzaj);

end;
/

Create or replace function maxIloscZdarzenNaKomende
return number
as
cursor c is
    Select k.id_komendy, count(z.id_zdarzenia) as iloscZdarzen
    from komendy_policji  k
    left join zdarzenia  z
    on z.id_komendy = k.id_komendy 
    group by k.id_komendy;
   
maxZdarzen number := -1;   
begin 
for i in c
loop
    if i.iloscZdarzen > maxZdarzen then
        maxZdarzen := i.iloscZdarzen;
    end if;
end loop;
return maxZdarzen;
end;
/
select  maxIloscZdarzenNaKomende()
from dual;
/
Create or replace function sredniaIloscZdarzenNaKomende
return number
as

sredniaZdarzen number := 0;   
begin 
 select avg(iloscZdarzen) as sredniaIloscZdarzenNaKomende
 into sredniaZdarzen
    from
    (Select k.id_komendy, count(z.id_zdarzenia) as iloscZdarzen
    from komendy_policji  k
    left join zdarzenia  z
    on z.id_komendy = k.id_komendy 
    group by k.id_komendy);
return sredniaZdarzen;
end;
/
create or replace trigger noweZarobkiPolicjanta
after
update on policjanci
for each row
declare v_zarobki number(7,2);
 v_premia number(7,2);
 stareZarobki number(7,2);
 noweZarobki number(7,2);
 pragma autonomous_transaction;
begin
   select p.permia
   into v_premia
   from policjanci p
   where p.id_policjanta = :old.id_policjanta;
   
   select s.pensja
   into v_zarobki
   from stopnie s
   join policjanci p 
   on p.id_stopnia = s.id_stopnia
   where p.id_policjanta = :old.id_policjanta;
   
   stareZarobki := v_zarobki + v_premia;
   noweZarobki := v_zarobki + :new.permia;
   
    dbms_output.put_line('Zarobki policjanta: o id ' || :old.id_policjanta || ' to stare: '|| stareZarobki ||' nowe: '||noweZarobki);
   
    
end;

create or replace procedure dodajPolicjanta
(
  p_id_policjanta number,
  p_imie varchar2,
  p_nazwisko varchar2,
  p_nazwa_stopnia varchar2,
  p_premia number,
  p_imie_przelozonego varchar2,
  p_nazwisko_przelozonego varchar2,
  p_id_komendy number
)
as
    v_id_stopnia stopnie.id_stopnia%type;
    v_id_przelozonego policjanci.id_przelozonego%type;
    
begin
    select id_stopnia into v_id_stopnia
    from stopnie where nazwa like p_nazwa_stopnia;
     select id_policjanta into v_id_przelozonego
     from policjanci where imie like p_imie_przelozonego and nazwisko like  p_nazwisko_przelozonego;
     
     insert into policjanci values (p_id_policjanta,p_imie, p_nazwisko, v_id_stopnia, p_premia, v_id_przelozonego, p_id_komendy);
     
exception
    when no_data_found then
     dbms_output.put_line('Niepoprawne dane stopnia lub przelozonego.');
    
end dodajPolicjanta;