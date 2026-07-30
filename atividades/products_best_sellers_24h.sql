CREATE OR REPLACE VIEW products_best_sellers_24h AS
	SELECT products.id, products.name, SUM(order_items.quantity) AS quantity
	FROM products JOIN order_items ON order_items.product_id = products.id
	JOIN orders ON orders.id = order_items.order_id
	WHERE orders.status = 'paid' AND orders.paid_at >= DATE_SUB(NOW(), INTERVAL 1 DAY)
	GROUP BY products.id, products.name HAVING SUM(order_items.quantity) > 25
	ORDER BY quantity DESC;