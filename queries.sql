--returns a list of departments with their names sorted by salary in ascending order
select nazwa_departamentu, imie, nazwisko, pensja
from departamenty d
join pracownicy p on d.id_kierownika = p.id
order by p.pensja desc

--returns a list of employees who earn more than the oldest employee in the company
select *
from pracownicy
where pensja >
                (
                select pensja
                from 
                    (
                    select *
                    from pracownicy
                    order by data_urodzenia asc
                    )
                where rownum = 1
                )
                
--zwraca liste uporzadkowanych alfabetycznie produktow prezentujaca srednia marze oraz liczbe produktow
--w danej grupie towarow, ktorych cena zakupu jest wieksza niz 5 zl

select tp.nazwa_pelna, count(*) ilosc_produktow, round(avg(p.cena_sprzedazy - p.cena_zakupu), 2) marza
from produkty p
join typy_produktow tp on p.typ_produktu = tp.typ_produktu
where p.cena_zakupu > 5
group by tp.nazwa_pelna
order by tp.nazwa_pelna asc