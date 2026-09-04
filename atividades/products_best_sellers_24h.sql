CREATE OR REPLACE VIEW products_best_sellers_24h AS
SELECT 
	p.id,
	p.name,
	SUM(oi.quantity) AS quantity
FROM products AS p INNER JOIN order_items AS oi ON p.id = oi.product_id
INNER JOIN orders AS o ON o.id = oi.order_id
WHERE o.status = 'paid' AND o.paid_at >= DATE_SUB(NOW(), INTERVAL 1 DAY)
GROUP BY p.id, p.name HAVING SUM(oi.quantity) > 25
ORDER BY quantity DESC;