-- Single-line comments start with two dashes.

/* Multi-line
comment.
*/

use airbnb_nyc;			-- Statements end with a semicolon

select 'string value';	-- String literals are delimited with a single quotation.
select "another string value"; -- Double quotes work as well
/*
SELECT 1 + 1;		-- Keywords are sometimes capatilized to make them stand out, but it's not necessary.
					-- By default, most of SQL is case insensitive.
                    -- It can be made case-sensitive through configuration.
                    
select 1.1 + 2.2;		-- SQL has operators like '+'.
*/
insert into listing values		-- For the most part, whitespace doesn't matter.
(204,							-- Statements can be broken up.
'Skylit Midtown Castle', 2845,
'Jennifer', 'Manhattan', 'Midtown',
40.75362,						-- Numeric literals are numbers witout quotes.
-73.98377,						
'Entire home/apt', 225, 1, 45,
'2019-05-21', 0.38, 2, 355);  	-- Date literals are strings that get convereted to
								-- Parentheses group things.
use airbnb_nyc;

select							-- the 'select' keyword
	name,						-- one or more colmn expressions, seperated by commas
    host_name
from listing;					-- 'from' keyword, then table name, then semicolon

select * from listing; 			-- '*' is shorthand for "all columns".
								-- Any SQL statement can be formatted in one line
                                -- Here, it makes the statement much more readable.

use airbnb_nyc;   
                             
select
	name,
    neighbourhood,
    host_name
from listing
where host_name = 'Andrea'; -- 'where' keyword, then a boolean expression

use airbnb_nyc;   
                             
select
	name,
    neighbourhood,
    host_name
from listing
where host_name = 'Andrea'
	and availability_365 = 0; -- 'and' : both conditions must be true

select
	name,
    neighbourhood,
    host_name
from listing
where host_name = 'Andrea'
	or availability_365 = 0; -- 'or' : either condition may be true

-- varchar, char, text
select * from listing where neighbourhood = 'Astoria';
select * from listing where neighbourhood = 'astoria';
select * from listing where neighbourhood < 'M';
select * from listing where neighbourhood <= 'M';
select * from listing where neighbourhood > 'M';
select * from listing where neighbourhood >= 'M';

-- numbers
select * from listing where price = 100.0;
select * from listing where price < 100.0;
select * from listing where price <= 100.0;
select * from listing where price > 100.0;
select * from listing where price >= 100.0;

-- dates and times
select * from listing where last_review = '2019-02-15';
select * from listing where last_review < '2019-02-15';
select * from listing where last_review <= '2019-02-15';
select * from listing where last_review > '2019-02-15';
select * from listing where last_review >= '2019-02-15';

select *
from listing
where ((neighbourhood_group = 'Manhattan' and price < 100)
	or neighbourhood = "City Island")
    and availability_365 > 0;
    
select *
from listing
where neighbourhood_group = "Manhattan"
and reviews_per_month is null;

select *
from listing
where neighbourhood_group = "Manhattan"
and reviews_per_month is not null;

select *
from listing
where neighbourhood = "Williamsburg"
and (reviews_per_month is null 
	or reviews_per_month = 0);
    
select
	name,
    host_name
from listing
where name like "%clean%";

select
	name,
    host_name
from listing
where name like "%clean";

select * from listing where name like "%spacious%";

select
	name,
    host_name
from listing
where host_name like "_o__";

select *
from listing
where neighbourhood in ('Bayside', 'Eltingville', 'Jackson Heights', 'Van Nest');

select *
from listing
where neighbourhood_group not in ("Manhattan", "Bronx", "Brooklyn");

select *
from listing
where reviews_per_month in (5,6,7,8);

select *
from listing
where reviews_per_month between 5 and 8;

select *
from listing
where last_review between "2018-10-01" and "2019-02-01";

select *
from listing
where price between 155.0 and 225.0;




	
    
    
