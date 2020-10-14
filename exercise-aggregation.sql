use gravel_family;

-- Solve each task by writing a query below the task description.
-- Each task describes the expected result.
-- Unfortunately, tasks must be verified manually. :(

-- Example: 
-- Count the number of customer in Toronto
-- Expected: 14
select count(*)
from customer
where city = 'Toronto';

-- How many employees have the last_name 'Soyle'?
-- Expected: 12
select count(*) from employee
where last_name = "Soyle";

-- How many projects are there in the database?
-- Expected: 1121
select count(*) from project;

-- What's the earliest project start_date?
-- Expected: 2017-09-23
select min(start_date) from project;

-- What's the latest employee start_date?
-- Expected: 2020-08-25
select
	max(start_date)
from employee;

-- Count customers per city.
-- Expected: 88 Rows
select
	city,
	count(customer_id)
from customer
group by city;

-- Count customers per postal_code.
-- Expected: 84 Rows
select
	postal_code,
    count(customer_id)
from customer
group by postal_code;


-- Count employees per last_name.
-- Expected: 3 Rows
select
	last_name,
    count(employee_id)
from employee
group by last_name;

-- Count the number of projects per city.
-- Expected: 88 Rows
select
	c.city,
    count(p.project_id) number_of_projects
from customer c
left outer join project p on p.customer_id = c.customer_id
group by city;

-- Count the number of projects per city.
-- Sort by the count descending and select the top 10 rows.
-- Expected: 10 Rows
select
	c.city,
    count(p.project_id) number_of_projects
from customer c
left outer join project p on p.customer_id = c.customer_id
group by city
order by count(p.project_id) desc
limit 10;

-- Which postal_code has the most projects?
-- Expected: M3H
select
	c.postal_code,
    count(p.project_id) number_of_projects 
from customer c
left outer join project p on p.customer_id = c.customer_id
group by c.postal_code
order by count(p.project_id) desc;


-- Count the number of projects per start_date year.
-- Expected: 4 Rows
select
	year(p.start_date),
	count(year(p.start_date))
from project p
group by year(p.start_date);


-- Count the number of employees per project in the M3H postal_code.
-- Group by project_id, sort by count descending.
-- Expected: 39 Rows
select
	c.postal_code,
    p.project_id,
    count(pe.employee_id) number_of_employees
from customer c
left outer join project p on p.customer_id = c.customer_id
inner join project_employee pe on pe.project_id = p.project_id
where c.postal_code = "M3H"
group by p.project_id
order by count(pe.employee_id) desc;
	

-- Calculate the total cost per project in the 'M3H' postal_code.
-- (Hint: sum a calculation)
-- Expected: 39 Rows
select
	c.postal_code,
    p.project_id,
    sum(pi.quantity * i.price_per_unit)
from customer c
left outer join project p on p.customer_id = c.customer_id
inner join project_item pi on pi.project_id = p.project_id
inner join item i on i.item_id = pi.item_id
where c.postal_code = "M3H"
group by p.project_id;

-- What's the most expensive project in the 'M3H' postal_code?
-- Expected: 18828.00
select
	c.postal_code,
    p.project_id,
    sum(pi.quantity * i.price_per_unit)
from customer c
left outer join project p on p.customer_id = c.customer_id
inner join project_item pi on pi.project_id = p.project_id
inner join item i on i.item_id = pi.item_id
where c.postal_code = "M3H"
group by p.project_id
order by sum(pi.quantity * i.price_per_unit) desc;

-- How many projects did each employee work on?
-- Expected: 33 Rows
select
	e.employee_id,
    count(pe.project_id)
from employee e
inner join project_employee pe on pe.employee_id = e.employee_id
group by e.employee_id;


-- How many employees worked on more than 140 projects?
-- Expected: 10 Rows
select
	e.employee_id,
    count(pe.project_id)
from employee e
inner join project_employee pe on pe.employee_id = e.employee_id
group by e.employee_id
having count(pe.project_id) > 140;

-- How many projects cost more than $20,000?
-- Expected: 55 Rows
select
	p.project_id,
    sum(pi.quantity * i.price_per_unit) total_cost
from project p
inner join project_item pi on pi.project_id = p.project_id
inner join item i on i.item_id = pi.item_id
group by p.project_id
having total_cost > 20000;

-- Across all projects, what are the total costs per item?
-- Select the item name and sum.
-- Sort by the sum desc;
-- Expected: 18 Rows
select
	i.item_id,
    sum(pi.quantity * i.price_per_unit) total_cost
from project p
inner join project_item pi on pi.project_id = p.project_id
inner join item i on i.item_id = pi.item_id
group by i.item_id
order by total_cost desc;

-- Across all projects, what are the total costs per item category?
-- Select the category name and sum.
-- Sort by the sum desc;
-- Expected: 7 Rows
select
	c.category_id,
    sum(pi.quantity * i.price_per_unit) total_cost
from project p
inner join project_item pi on pi.project_id = p.project_id
inner join item i on i.item_id = pi.item_id
inner join category c on c.category_id = i.category_id
group by c.category_id
order by total_cost desc;


-- What's the average 'Standard Labor' cost per city?
-- Expected: 88 Rows
select
	c.city,
    avg(pi.quantity * i.price_per_unit) avg_cost
from customer c
left outer join project p on p.customer_id = c.customer_id
inner join project_item pi on pi.project_id = p.project_id
inner join item i on i.item_id = pi.item_id
group by c.city;


-- Challenge: Which customer has the first project of 2019?
-- (Requires a subquery.)
-- Expected: Starkie 2019-01-01
select
	concat(c.first_name, " ", c.last_name) full_name,
	(select
		min(p.start_date)
	from project p
    where year(p.start_date) = "2019") start_date
from customer c
inner join project p on p.customer_id = c.customer_id
having start_date
order by start_date desc
limit 1;