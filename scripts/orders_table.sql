create table orders as
	select distinct order_id, customer_id, to_date(order_date, 'mm/dd/yyyy') as date, 
		region, payment_method, delivery_days
	from ecommerce_sales 
	
