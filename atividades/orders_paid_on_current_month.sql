CREATE OR REPLACE VIEW orders_paid_on_current_month AS 
SELECT id, paid_at, total FROM orders WHERE status = 'paid'
AND paid_at >= DATE_FORMAT(CURRENT_DATE(), '%Y-%m-01')
  AND paid_at < DATE_FORMAT(DATE_ADD(CURRENT_DATE(), INTERVAL 1 MONTH), '%Y-%m-01');
