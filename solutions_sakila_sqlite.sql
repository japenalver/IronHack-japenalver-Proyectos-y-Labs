Aquí tienes el laboratorio resuelto (Sakila / `sqlite-sakila.db`) con **todas las consultas SQL** pedidas.

[Descargar solutions.sql](sandbox:/mnt/data/solutions.sql)

---

-- 1) Store ID, city y country (por tienda)

SELECT s.store_id,
       ci.city,
       co.country
FROM store s
JOIN address a  ON s.address_id = a.address_id
JOIN city ci    ON a.city_id = ci.city_id
JOIN country co ON ci.country_id = co.country_id
ORDER BY s.store_id;


-- 2) Cuánto negocio (USD) generó cada tienda

SELECT st.store_id,
       ROUND(SUM(p.amount), 2) AS gross_revenue
FROM payment p
JOIN staff sf ON p.staff_id = sf.staff_id
JOIN store st ON sf.store_id = st.store_id
GROUP BY st.store_id
ORDER BY st.store_id;


-- 3) Duración media (running time) de películas por categoría

SELECT c.name AS category,
       ROUND(AVG(f.length), 2) AS avg_running_time
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN film f           ON fc.film_id = f.film_id
GROUP BY c.category_id, c.name
ORDER BY c.name;

-- 4) Categorías más largas (por media), descendente

SELECT c.name AS category,
       ROUND(AVG(f.length), 2) AS avg_running_time
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN film f           ON fc.film_id = f.film_id
GROUP BY c.category_id, c.name
ORDER BY avg_running_time DESC;

-- 5) Películas más alquiladas (frecuencia), descendente

SELECT f.title,
       COUNT(r.rental_id) AS times_rented
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f      ON i.film_id = f.film_id
GROUP BY f.film_id, f.title
ORDER BY times_rented DESC, f.title ASC;

-- 6) Top 5 géneros por ingresos (gross revenue), descendente

SELECT c.name AS genre,
       ROUND(SUM(p.amount), 2) AS gross_revenue
FROM payment p
JOIN rental r         ON p.rental_id = r.rental_id
JOIN inventory i      ON r.inventory_id = i.inventory_id
JOIN film_category fc ON i.film_id = fc.film_id
JOIN category c       ON fc.category_id = c.category_id
GROUP BY c.category_id, c.name
ORDER BY gross_revenue DESC
LIMIT 5;

-- 7) ¿Está “ACADEMY DINOSAUR” disponible en la tienda 1?

-- (Conta copias totales y copias disponibles: inventario sin alquiler activo `return_date IS NULL`)

SELECT 
  f.title,
  i.store_id,
  COUNT(i.inventory_id) AS total_copies,
  SUM(CASE WHEN r.rental_id IS NULL THEN 1 ELSE 0 END) AS available_copies
FROM film f
JOIN inventory i 
  ON f.film_id = i.film_id
LEFT JOIN rental r
  ON i.inventory_id = r.inventory_id
 AND r.return_date IS NULL
WHERE f.title = 'ACADEMY DINOSAUR'
  AND i.store_id = 1
GROUP BY f.title, i.store_id;

