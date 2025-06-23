create database spotify;

use spotify;

-- 1. ¿Cuántas estadísticas hay de cada artista?
select count(ae.artista_id) as "conteo estadísticas", 
	a.nombre
from sp_artista_estadisticas ae
inner join sp_artista a
on ae.artista_id = a.artista_id
group by a.nombre;


-- 2. ¿Hay artistas repetidos?
select nombre, count(*) from sp_artista group by nombre having count(*) > 1; 


-- 3. ¿Quién tiene más seguidores en la fecha máxima?
select a.nombre,
format(ae.seguidores,'es-ES') as "seguidores_max",
    fecha
from sp_artista_estadisticas ae
inner join sp_artista a
on ae.artista_id = a.artista_id
group by a.nombre, ae.seguidores
having fecha = max(fecha)
order by ae.seguidores desc limit 1;


-- 4. ¿Cuántos artistas tienen menos de 60 de popularidad?
select count(distinct artista_id) from sp_artista_estadisticas where popularidad < 60;


-- 5. ¿Cuántos artistas tienen más de 30000 de seguidores?
select count(distinct artista_id) from sp_artista_estadisticas where seguidores > 30000;


-- 6. ¿Qué artista fue mas popular el 24-04-2020?
select a.nombre,
	ae.popularidad,
    fecha
from sp_artista_estadisticas ae
inner join sp_artista a
on ae.artista_id = a.artista_id
where fecha = "04-24-2020"
group by a.nombre, ae.seguidores
order by popularidad desc limit 1;


-- 7. ¿Qué artista es más popular los últimos 5 días?
select a.nombre,
	   ae.popularidad,
       ae.fecha
from sp_artista_estadisticas ae
inner join sp_artista a
	on ae.artista_id = a.artista_id
where STR_TO_DATE(ae.fecha, '%m-%d-%Y') >= DATE_SUB(STR_TO_DATE('05-30-2020', '%m-%d-%Y'), interval 5 day)
order by ae.popularidad desc
limit 1;


-- 8. ¿Qué artista tuvo más seguidores y popularidad por día?
select 
    fecha,
    artista_id,
    nombre,
    popularidad,
    seguidores
from 
    (
        select 
            fecha,
            ae.artista_id,
            a.nombre,
            ae.popularidad,
            ae.seguidores,
            row_number() over(partition by fecha order by ae.popularidad desc, ae.seguidores desc) as rn
        from 
            sp_artista_estadisticas ae
        inner join 
            sp_artista a
        on 
            ae.artista_id = a.artista_id
    ) as subquery
where 
    rn = 1
order by 
    fecha;

-- 9. ¿5 artistas artístas que han crecido más los últimos días?
select 
    a.nombre, 
    avg(popularidad) as "popularidad promedio",
    MAX(ae.seguidores) - MIN(ae.seguidores) as crecimiento,
    MIN(ae.fecha) as fecha_inicial,
    MAX(ae.fecha) as fecha_final
from sp_artista_estadisticas ae
inner join sp_artista a
    on ae.artista_id = a.artista_id
group by a.nombre
order by crecimiento desc
limit 5;



-- similar, pero con los que tienen menor crecimiento
select 
    a.nombre, 
    avg(popularidad) as "popularidad promedio",
    MAX(ae.seguidores) - MIN(ae.seguidores) as crecimiento,
    MIN(ae.fecha) as fecha_inicial,
    MAX(ae.fecha) as fecha_final
from sp_artista_estadisticas ae
inner join sp_artista a
    on ae.artista_id = a.artista_id
group by a.nombre
order by crecimiento asc
limit 5;




WITH crecimiento AS (
    SELECT
        i.artista_id,
        i.seguidores_inicio,
        f.seguidores_final,
        f.seguidores_final - i.seguidores_inicio AS crecimiento_seguidores
    FROM inicio i
    JOIN final f ON i.artista_id = f.artista_id
)
SELECT
    c.artista_id,
    a.nombre,
    c.crecimiento_seguidores
FROM crecimiento c
LEFT JOIN sp_artista a ON c.artista_id = a.artista_id
ORDER BY c.crecimiento_seguidores ASC
LIMIT 5;

-- 10. ¿Quién tuvo más popularidad entre el '04-24-2020' y el '04-22-2020'?
select nombre, popularidad
from sp_artista ar
    inner join sp_artista_estadisticas est
        on ar.artista_id = est.artista_id
-- where fecha between '2020-04-22' and '2020-04-24' fecha con formarto correcto yyyy-mm-dd
where fecha between '04-22-2020' and '04-24-2020' -- Formato importado mm-dd-yyyy
group by nombre, popularidad
Order by popularidad desc limit 1;


-- 11. Artistas menos populares
select nombre, max(popularidad) as popularidad
from sp_artista ar
    inner join sp_artista_estadisticas est
        on ar.artista_id = est.artista_id
where popularidad <= 50
group by nombre
order by popularidad asc;

-- 12. Media de seguidores el día 23.

select nombre, avg(seguidores) as Promedio_Seguidores
from sp_artista ar
    inner join sp_artista_estadisticas est
        on ar.artista_id = est.artista_id
where day(fecha) = 23
group by nombre
order by Promedio_Seguidores desc;


-- 13. Obtener día con más seguidores.
select 
    ae.fecha,
    SUM(ae.seguidores) as total_seguidores
from sp_artista_estadisticas ae
group by ae.fecha
order by total_seguidores desc
limit 1;


-- 14. De los 5 artístas con más seguidores cual es el más popular
with top_5_seguidores as (
    select 
        a.nombre,
        ae.artista_id,
        MAX(ae.seguidores) as max_seguidores
    from sp_artista_estadisticas ae
    inner join sp_artista a
        on ae.artista_id = a.artista_id
    group by a.nombre, ae.artista_id
    order by max_seguidores desc
    limit 5
)
select 
    top5.nombre,
    MAX(ae.popularidad) as max_popularidad
from sp_artista_estadisticas ae
inner join top_5_seguidores top5
    on ae.artista_id = top5.artista_id
group by top5.nombre
order by max_popularidad desc
limit 1;


-- 15. Obtener categoría del artista:
-- Si tiene menos de 100000 seguidores principiante
-- Si tiene entre 100000 y 500000 intermedio
-- Si tiene más de 5000000 estrella
select
    a.nombre,
    sum(ae.seguidores) as total_seguidores,
    case 
        when sum(ae.seguidores) < 100000 then 'principiante'
        when sum(ae.seguidores) between 100000 and 500000 then 'intermedio'
        when sum(ae.seguidores) > 500000 then 'estrella'
        else 'sin categoría'
    end as categoria
from 
    sp_artista a
inner join 
    sp_artista_estadisticas ae
on 
    a.artista_id = ae.artista_id
group by 
    a.artista_id, a.nombre
order by 
    total_seguidores desc;


-- 16. Suma total de seguidores de cada artista y poner formato español.
SELECT 
    a.nombre AS nombre_artista,
    FORMAT(SUM(ae.seguidores),'es-ES') AS total_seguidores
FROM 
    sp_artista_estadisticas AS ae
INNER JOIN 
     sp_artista AS a ON ae.artista_id = a.artista_id
GROUP BY 
    ae.artista_id
ORDER BY SUM(ae.seguidores) desc;
    
    
-- 17. Media de seguidores de cada artista
select
    a.nombre,
    round(avg(ae.seguidores),2) as media_seguidores
from 
    sp_artista a
inner join 
    sp_artista_estadisticas ae
on 
    a.artista_id = ae.artista_id
group by 
    a.artista_id, a.nombre
order by 
    media_seguidores desc;


-- 18. Comparar 2 artistas con más seguidores
select
    a.nombre,
    ae.seguidores as total_seguidores,
    ae.popularidad
from 
    sp_artista a
inner join 
    sp_artista_estadisticas ae
on 
    a.artista_id = ae.artista_id
group by 
    a.artista_id, a.nombre
order by 
    total_seguidores desc
limit 2;


-- 19. Diferencia de un artista con otro
SELECT 
    a1.nombre AS ArtistaA,
	FORMAT(SUM(ae1.seguidores), 'N0', 'es-ES') AS SeguidoresArtistaA,
    a2.nombre AS ArtistaB,
    FORMAT(SUM(ae2.seguidores), 'N0', 'es-ES') AS SeguidoresArtistaB,
    FORMAT(ABS(SUM(ae1.seguidores) - SUM(ae2.seguidores)), 'N0', 'es-ES') AS DiferenciaSeguidores
FROM 
    sp_artista AS a1
JOIN 
    sp_artista_estadisticas AS ae1 ON a1.artista_id = ae1.artista_id
JOIN 
    sp_artista AS a2 ON a2.nombre = "Ed Sheeran"
JOIN 
    sp_artista_estadisticas AS ae2 ON a2.artista_id = ae2.artista_id
WHERE 
    a1.nombre = 'Adele'
GROUP BY 
    a1.nombre, a2.nombre;


-- 20. ¿Qué artista está por encima de la media de todos?
SELECT 
    a.nombre AS nombre_artista,
    SUM(ae.seguidores) AS total_seguidores
FROM 
    sp_artista AS a
JOIN 
    sp_artista_estadisticas AS ae ON a.artista_id = ae.artista_id
GROUP BY 
    a.nombre
HAVING 
    SUM(ae.seguidores) > (
        SELECT 
            AVG(total_seguidores) 
        FROM (
            SELECT 
                SUM(ae.seguidores) AS total_seguidores
            FROM 
                sp_artista AS a
            JOIN 
                sp_artista_estadisticas AS ae ON a.artista_id = ae.artista_id
            GROUP BY 
                a.artista_id
        ) AS subquery
    )
ORDER BY 
    total_seguidores DESC;