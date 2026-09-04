CREATE OR REPLACE VIEW customers_ranking_30d AS
SELECT
	c.id,
	c.name,
	SUM(o.total) AS total
FROM customers AS c INNER JOIN orders AS o 
ON c.id = o.customer_id WHERE o.status = 'paid'
AND o.paid_at >= NOW() - INTERVAL 30 DAY
GROUP BY c.id, c.name
ORDER BY total DESC;
	