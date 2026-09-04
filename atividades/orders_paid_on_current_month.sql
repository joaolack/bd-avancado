CREATE OR REPLACE VIEW orders_paid_on_current_month AS
SELECT 
	o.id,
	o.paid_at,
	o.total
FROM orders AS o
WHERE o.status = 'paid'
AND o.paid_at >= DATE_FORMAT(CURDATE(), '%Y-%m-01') 
AND o.paid_at < DATE_FORMAT(DATE_ADD(CURDATE(), INTERVAL 1 MONTH), '%Y-%m-01');