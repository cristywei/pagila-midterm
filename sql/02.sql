/*
 * Count the number of distinct customers who have rented a movie that 'RUSSELL BACALL' has acted in.
 *
 * NOTE:
 * You cannot hard-code Russell Bacall's actor_id.
 * Your where clause must include a condition using the "first_name" and "last_name" fields of the "actor" table.
 */
SELECT COUNT(t.customer_id)
FROM (
    SELECT DISTINCT customer_id
    FROM actor
    JOIN film_actor USING (actor_id)
    JOIN film USING (film_id)
    JOIN inventory USING (film_id)
    JOIN rental USING (inventory_id)
    JOIN customer USING (customer_id)
    WHERE actor.first_name = 'RUSSELL'
        AND actor.last_name = 'BACALL'
    ) t;
