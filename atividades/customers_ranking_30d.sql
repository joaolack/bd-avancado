	CREATE OR REPLACE VIEW customers_ranking_30d AS
	SELECT customers.id, customers.name, SUM(orders.total) AS total
	FROM customers JOIN orders ON orders.customer_id = customers.id
	WHERE orders.status = 'paid' AND orders.paid_at >= NOW() - INTERVAL 30 DAY
	GROUP BY customers.id, customers.name ORDER BY total DESC;