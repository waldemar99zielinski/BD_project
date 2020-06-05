Select p.id_policjanta, count(z.id_policjanta) as "Ilosc zdarzen"
from policjanci p
join zdarzenia_policjanci z 
on p.id_policjanta = z.id_policjanta
group by p.id_policjanta;

select  sredniaIloscZdarzenNaKomende()
from dual;
/
Select *
from zdarzenia z
left join komendy_policji k
on z.id_komendy = k.id_komendy
join adresy a
on k.id_adresu = a.id_adresu
where a.miasto like 'Warszawa' and z.id_rodzaje_zdarzenia=1;
/
--test maxIloscZdarzenNaKomende
Select max(iloscZdarzen)
from(Select k.id_komendy, count(z.id_zdarzenia) as iloscZdarzen
from komendy_policji  k
left join zdarzenia  z
on z.id_komendy = k.id_komendy 
 group by k.id_komendy);
 
select  maxIloscZdarzenNaKomende()
from dual;
/
begin
addEmployee(201, 'Janek', 'Wodkowski, 'Komisarz', 100, 'Jakub', 'Sliwinski', 101);
end;