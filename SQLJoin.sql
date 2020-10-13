-- [type] join [table_name] on [other_table].[primary_key] = [table_name].[foreign_key]

use bowls;

select
	customer.customer_id, 	-- customer_id from customer, not login
    customer.last_name, 	-- last_name is in the customer table
    login.user_name			-- user_name is in the login table
from customer
inner join login on customer.customer_id = login.customer_id;
-- The customer table's customer_id is a foreign key in the login table.
-- the 'on' condition defines how rows relate between the tow tables.

select *
from customer
inner join login on customer.customer_id = login.customer_id
where customer.last_name like "M%"
order by login.user_name desc;

select
	customer.last_name,
    `order`.order_id,
    item.name
from customer
inner join `order` on customer.customer_id = `order`.customer_id
inner join order_item on `order`.order_id = order_item.order_id
inner join item on order_item.item_id = item.item_id
where date(order_date) = "2020-07-28"
order by last_name;


-- Without aliases
select
	customer.last_name,
    `order`.order_id,
    item.name
from customer
inner join `order` on customer.customer_id = `order`.customer_id
inner join order_item on `order`.order_id = order_item.order_id
inner join item on order_item.item_id = item.item_id
where date(order_date) = "2020-07-28"
order by last_name;

-- With aliases
-- customer aliased as c
-- `order` aliased as o
-- order_item aliased as oi
-- item aliased as i
select
	c.last_name,
    o.order_id,
    i.name
from customer c
inner join `order` o on c.customer_id = o.customer_id
inner join order_item oi on o.order_id = oi.order_id
inner join item i on oi.item_id = i.item_id
where date(o.order_date) = "2020-07-28"
order by last_name;


-- [type] join [table_name] on [other_table].[primary_key] = [table_name].[foreign_key]
select
	child.order_status_id child_id,
    child.name child_name,
    parent.order_status_id parent_id,
    parent.name parent_name
from order_status child
inner join order_status parent
	on child.parent_order_status_id = parent.order_status_id;
    
select * from order_status;

select
	i.name,
    oi.quantity,
    i.price,
    oi.quantity * i.price line_item_total
from order_item oi
inner join item i on oi.item_id = i.item_id
where oi.order_id = 205
order by oi.quantity * i.price desc;

select
	c.last_name,
    l.customer_id,
    l.user_name
from customer c -- customer is on the "left", its rows are always included
left outer join login l on c.customer_id = l.customer_id; -- login is on the "right"

select
	c.last_name,
    l.customer_id,
    l.user_name
from customer c
left outer join login l on l.customer_id = c.customer_id
where c.last_name like "M%";

select
	c.last_name,
    l.customer_id,
    l.user_name
from customer c
left outer join login l on l.customer_id = c.customer_id
where l.user_name like "%.com"; 

select
    c.last_name,
    l.customer_id,
    l.user_name
from customer c
left outer join login l 
    on l.customer_id = c.customer_id -- compound on condition
    and l.user_name like '%.com';

select
    c.last_name,
    l.customer_id,
    l.user_name
from customer c
left outer join login l 
    on l.customer_id = c.customer_id
where ifnull(l.user_name, '.com') like '%.com'; -- give null a default value

select
	c.customer_id,
    c.first_name,
    c.last_name
from customer c
left outer join login l on l.customer_id = c.customer_id
where l.customer_id is null;

select
	c.customer_id,
    c.first_name,
    c.last_name
from customer c
left outer join `order` o on c.customer_id = o.customer_id
where o.order_id is null;

select
	i.name
from item i
left outer join order_item oi on i.item_id = oi.item_id
where oi.order_item_id is null;

select
	concat(c.first_name, " ", c.last_name) customer,
    l.user_name,
    o.order_date,
    oi.order_id,
    i.name menu_item,
    os.name 'status'
from customer c
left outer join login l on c.customer_id = l.customer_id
left outer join `order` o on c.customer_id = o.customer_id
left outer join order_item oi on o.order_id = oi.order_id
left outer join item i on oi.item_id = i.item_id
left outer join order_status os on o.order_status_id = os.order_status_id;


