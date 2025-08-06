/************************************************Aug 02,2025 and Aug 03,2025*******************************************/

-- Create a database named imt_aug25
create database imt_aug25

-- Create a table named employee within imt_aug25 with fields empname,empid and salary with datatypes int,varchar and int respectively,primarykey is empid
create table imt_aug25.employee(empid int,empname varchar(10),salary int,primary key(empid))

-- Describe the table employee
desc imt_aug25.employee

-- Insert values to the employee table
insert into imt_aug25.employee values(101,'Raj',2000);
insert into imt_aug25.employee values(102,'Sam',5000);

-- Add a column named location to the table employee
alter table imt_aug25.employee add(location varchar(10))

-- Set location of all rows to Hyderabad
update imt_aug25.employee set location='Hyderabad'

-- Set location to Delhi For Raj
update imt_aug25.employee set location='Delhi' where empname='Raj'

-- Change the empid to varchar datatype 
alter table imt_aug25.employee modify empid varchar(10)

--To check whether datatype has changed
desc imt_aug25.employee

-- Rename column name empid to emp_id
alter table imt_aug25.employee rename column empid to emp_id

-- Rename tablename employee to empl
rename table imt_aug25.employee to imt_aug25.empl

-- Delete the row where empname is Raj
delete from imt_aug25.empl where empname='Raj'

-- Delete the column name location
alter table imt_aug25.empl drop column location

-- Truncate Table
truncate table imt_aug25.empl

-- Drop Table
drop table imt_aug25.empl

-- Display columns date,customerid and invoice no from  online_retail
select rpt_dt,customerid,invoiceno from imt_aug25.online_retail

-- Display all columns in customer_xref
select *from imt_aug25.customer_xref

-- Display all columns in stock_xref
select *from imt_aug25.stock_xref

-- Display all columns in online_retail
select *from imt_aug25.online_retail

-- Display first 5 rows from online_retail
select *from imt_aug25.online_retail limit 5

-- Display all columns with customerid to be renamed as customer_id and stockcode as inventory_code in online_retail
select customerid as customer_id,invoiceno as invoice_no from imt_aug25.online_retail

-- Display all columns with description to be renamed as product in stock_xref
select stockcode ,description as product from imt_aug25.stock_xref 

-- List the unique customer ids from online_retail
select distinct customerid from imt_aug25.online_retail

-- Count the number of unique customer ids from online_retail
select count(distinct customerid) as distinct_customer_ids from imt_aug25.online_retail

-- List the number of rows,count of customerids which are not null, number of unique customer ids from online_retail
select count(*) as nrows,count(customerid),count(distinct customerid) as distinct_customer_ids 
from imt_aug25.online_retail

-- List the unique countries in customer_xref
select distinct country from imt_aug25.customer_xref

-- List the unique countries in customer_xref in ascending order
select distinct country from imt_aug25.customer_xref  order by country 

-- List the unique countries in customer_xref in descending order
select distinct country from imt_aug25.customer_xref  order by country desc

-- List the number of unique countries in customer_xref
select count(distinct country) as cnt from imt_aug25.customer_xref

-- List the customer ids where country is United Kingdom in customer_xref
select customerid,country from imt_aug25.customer_xref where country='United Kingdom'

-- Select the customerids from countries United Kingdom and Spain in customer_xref
select customerid,country from imt_aug25.customer_xref where country in ('United Kingdom','Spain')

-- Select all the columns with rpt_dt between '2010-12-01' and '2011-02-28' in online_retail
select *from imt_aug25.online_retail where rpt_dt between '2010-12-01' and '2011-02-28'

-- Find the average price in online_retail
select avg(price) from imt_aug25.online_retail

-- List the rows in online_retail where price is greater than the average price in online_retail
select a.* from imt_aug25.online_retail a
	where a.price>(select avg(price) from imt_aug25.online_retail)

-- Select description from stock_xref where description starts with red
select *from imt_aug25.stock_xref where description like 'red%'

-- Select description from stock_xref where description ends with red
select *from imt_aug25.stock_xref where description like '%red'

-- select description from stock_xref where description contains red
select *from imt_aug25.stock_xref where description like '%red%'

-- Check for nulls in customerid column in online_retail
select * from imt_aug25.online_retail where customerid is null

-- Replace the nulls in customerid as 9999
select *,
coalesce(customerid,9999) as new_customer_id  
from 
imt_aug25.online_retail 
where 
customerid is null


-- Create a table Total quantity purchased by each customer
create table imt_aug25.customer_qty as
select 
customerid,
sum(quantity) as total_qty
from imt_aug25.online_retail 
group by customerid

-- Find the customers whose sum of quantity is greater than 100
select 
customerid,
sum(quantity) as total_qty
from imt_aug25.online_retail 
group by customerid
having total_qty>100

-- Profile customers based on volume
select *,
case when total_qty>=1000 then 'high'
when total_qty>=500 and total_qty<1000 then 'medium'
else 'low' end as volume
from 
imt_aug25.customer_qty


-- Round the price in online_retail with a new column named rounded_price
select *,round(price,1) as rounded_price from imt_aug25.online_retail 


-- Convert description to lower case from stock_xref
select *,lower(description) from imt_aug25.stock_xref 

-- Derive month,day and year from rpt_dt in online_retail
select *,month(rpt_dt)as mnth,day(rpt_dt) as dy,year(rpt_dt) as yr from imt_aug25.online_retail

-- Find unique countries without using distinct
select country from imt_aug25.customer_xref group by country

-- Create tables-a and b with two columns id and value of integer type
create table imt_aug25.tablea(id int,value int);
insert into imt_aug25.tablea values(1,10);
insert into imt_aug25.tablea values(2,20);
insert into imt_aug25.tablea values(3,30);
insert into imt_aug25.tablea values(4,40);
insert into imt_aug25.tablea values(5,50);

create table imt_aug25.tableb(id int,value int);
insert into imt_aug25.tableb values(4,40);
insert into imt_aug25.tableb values(5,50);
insert into imt_aug25.tableb values(6,60);
insert into imt_aug25.tableb values(7,70);
insert into imt_aug25.tableb values(8,80);

-- Perform left join with the created tables
select 
a.id as a_id,a.value as a_value,b.value as b_value from
imt_aug25.tablea a
left join
imt_aug25.tableb b
on 
a.id=b.id

-- Perform right join with the created tables
select 
b.id as b_id,b.value as b_value,a.value as a_value from
imt_aug25.tablea a
right join
imt_aug25.tableb b
on 
a.id=b.id

-- Perform inner join with the created tables
select 
a.id as a_id,a.value as a_value,b.value as b_value from
imt_aug25.tablea a
inner join
imt_aug25.tableb b
on 
a.id=b.id

-- Contents Present only in Tablea but not common contents with Table B

select 
a.id as a_id,a.value as a_value,b.id as b_id
from
imt_aug25.tablea a
left join
imt_aug25.tableb b
on 
a.id=b.id
where b.id is null


-- Create a table by Joining online_retail,stock_xref and customer_xref
create table master as
select a.* ,b.country,c.description
from 
imt_aug25.online_retail a
left join
imt_aug25.customer_xref b
on
a.customerid =b.customerid 
left join 
imt_aug25.stock_xref c
on
a.stockcode=c.stockcode

-- Join online_retail,stock_xref and customer_xref using CTE
with jns as(
select a.* ,b.country,c.description
from 
imt_aug25.online_retail a
left join
imt_aug25.customer_xref b
on
a.customerid =b.customerid 
left join 
imt_aug25.stock_xref c
on
a.stockcode=c.stockcode
)
select a.*,
quantity*price as sales 
from 
jns a

-- Perform union of tablea and tableb
select *from imt_aug25.tablea 
union
select *from imt_aug25.tableb


-- Perform unionall of tablea and tableb
select *from imt_aug25.tablea a
union all
select *from imt_aug25.tableb b

-- Create a view
create view imt_aug25.viewa as 
select *from imt_aug25.tablea

-- Derive a column sales from master and create a table named master_v2
create table imt_aug25.master_v2 as
select a.*, 
a.quantity*a.price as sales 
from 
imt_aug25.master a

-- Find the most sold product based on volume
select description,
sum(quantity) as total_qty 
from imt_aug25.master_v2 
group by description 
order by total_qty desc

-- Find the most sold product based on sales
select description,
sum(sales) as total_sales 
from imt_aug25.master_v2 
group by description 
order by total_sales desc

-- Find the total volume across each country
select country,
sum(quantity) as total_qty 
from imt_aug25.master_v2
group by country 
order by total_qty desc

-- Find the total sales across each country
select country,
sum(sales) as total_sales 
from imt_aug25.master_v2 
group by country 
order by total_sales desc

-- Upload store_sales dataset
-- Insert numbers 1 to n
select *,
row_number() over ( ) as rownum
from imt_aug25.store_sales


-- row numbers by ordering stores
select *,
row_number() over (order by store ) as rownum
from imt_aug25.store_sales

-- Rank by ordering stores
select *,
rank() over ( order by store  ) as ranknum
from imt_aug25.store_sales

-- Dense rank by ordering stores
select *,
dense_rank() over ( order by store ) as desne_ranknum
from imt_aug25.store_sales

--Row,Rank and dense rank in same query
select *,
row_number() over (order by store ) as rownum,
rank() over ( order by store  ) as ranknum,
dense_rank() over ( order by store ) as dense_ranknum
from imt_aug25.store_sales

-- How to remove duplicates using analytical function
-- Inserting a duplicate row to tableb to understand the concept
insert into imt_aug25.tableb values(8,80);
select
	a.*
from
	(
	select
		*,
		row_number() over(partition by id order by value) as rnum
	from
		imt_aug25.tableb) a
where
	a.rnum = 1

-- Each store's top selling city wise
select *,
row_number () 
over (partition by store order by sales desc) as rownum
from 
imt_aug25.store_sales

-- Top selling stores in each city
select *,
row_number () 
over (partition by city order by sales desc) as rownum
from 
imt_aug25.store_sales


-- Rank by sales
select *,
row_number() 
over (order by sales desc) as rownum
from
imt_aug25.store_sales

-- Upload timing dataset and rank based on TIME
select *,
row_number() over (order by time ) as rownum,
rank() over ( order by time  ) as ranknum,
dense_rank() over ( order by time ) as dense_ranknum
from imt_aug25.timing


/************************************************End*******************************************/





























