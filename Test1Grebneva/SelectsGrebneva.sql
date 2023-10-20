SELECT t.tid, t.show_time, f.film_name
FROM ticket t
JOIN film f ON t.film_id = f.fid WHERE t.customer_id = 5
ORDER BY t.show_time;

SELECT f.film_name, COUNT(t.tid) AS total_tickets
FROM ticket t
JOIN film f ON t.film_id = f.fid
GROUP BY f.film_name
LIMIT 3;