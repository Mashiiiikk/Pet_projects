create table order_item as
	select order_id, product_category, quantity, unit_price, discount, revenue
	from ecommerce_sales 
	
