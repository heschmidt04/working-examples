-- sql-practice-programs-book-using-northwind.sql

-- INTRODUCTORY PROBLEMS -- 

select SupplierID, CompanyName, ContactTitle FROM Suppliers;

select OrderID, CustomerID, ShipCountry FROM Orders WHERE ShipCountry in ('Belgium','France');
select OrderID, CustomerID, ShipCountry FROM Orders WHERE ShipCountry in ('Brazil','Mexico','Argentina','Venzuela') ; 

select SupplierID, CompanyName, ContactTitle FROM Suppliers WHERE ContactTitle !='Marketing Manager';

select * FROM products WHERE ProductName like '%queso%';


select EmployeeID, LastName, FirstName, CONCAT(FirstName, ' ',LastName) as FullName, Title, cast(BirthDate as date) FROM employees order by BirthDate;
;

select OrderID, ProductID, UnitPrice, Quantity, round(Quantity * UnitPrice,2) as TotalPrice  FROM OrderDetails limit 10;

-- +---------+-----------+-----------+----------+------------+
-- | OrderID | ProductID | UnitPrice | Quantity | TotalPrice |
-- +---------+-----------+-----------+----------+------------+
-- |   10248 |        11 |   14.0000 |       12 |     168.00 |
-- |   10248 |        42 |    9.8000 |       10 |      98.00 |
-- |   10248 |        72 |   34.8000 |        5 |     174.00 |
-- |   10249 |        14 |   18.6000 |        9 |     167.40 |
-- |   10249 |        51 |   42.4000 |       40 |    1696.00 |
-- |   10250 |        41 |    7.7000 |       10 |      77.00 |
-- |   10250 |        51 |   42.4000 |       35 |    1484.00 |
-- |   10250 |        65 |   16.8000 |       15 |     252.00 |
-- |   10251 |        22 |   16.8000 |        6 |     100.80 |
-- |   10251 |        57 |   15.6000 |       15 |     234.00 |
-- +---------+-----------+-----------+----------+------------+
-- 10 rows in set (0.00 sec)


 select count(CustomerID) as TotalCustomers FROM Customers;
-- +----------------+
-- | TotalCustomers |
-- +----------------+
-- |             93 |
-- +----------------+
-- 1 row in set (0.00 sec)

select min(date(OrderDate)), max(date(OrderDate)) FROM Orders;

select date(OrderDate), count(date(OrderDate)) FROM Orders group by 1 having count(date(OrderDate)) > 3;
-- +-----------------+------------------------+
-- | date(OrderDate) | count(date(OrderDate)) |
-- +-----------------+------------------------+
-- | 1998-02-26      |                      6 |
-- | 1998-03-03      |                      4 |
-- | 1998-03-06      |                      4 |
-- | 1998-03-11      |                      4 |
-- | 1998-03-16      |                      4 |
-- | 1998-03-19      |                      4 |
-- | 1998-03-24      |                      4 |
-- | 1998-03-27      |                      4 |
-- | 1998-04-01      |                      4 |
-- | 1998-04-06      |                      4 |
-- | 1998-04-09      |                      4 |
-- | 1998-04-14      |                      4 |
-- | 1998-04-17      |                      4 |
-- | 1998-04-22      |                      4 |
-- | 1998-04-27      |                      4 |
-- | 1998-04-30      |                      4 |
-- | 1998-05-05      |                      4 |
-- | 1998-05-06      |                      4 |
-- +-----------------+------------------------+
-- 18 rows in set (0.00 sec)


select distinct(Country) FROM customers order by Country;
-- +-------------+
-- | Country     |
-- +-------------+
-- | NULL        |
-- | Argentina   |
-- | Austria     |
-- | Belgium     |
-- | Brazil      |
-- | Canada      |
-- | Denmark     |
-- | Finland     |
-- | France      |
-- | Germany     |
-- | Ireland     |
-- | Italy       |
-- | Mexico      |
-- | Norway      |
-- | Poland      |
-- | Portugal    |
-- | Spain       |
-- | Sweden      |
-- | Switzerland |
-- | UK          |
-- | USA         |
-- | Venezuela   |
-- +-------------+
-- 22 rows in set (0.01 sec)

select distinct(Country) as country, count(Country) FROM customers group by country order by Country;
-- +-------------+----------------+
-- | country     | count(Country) |
-- +-------------+----------------+
-- | NULL        |              0 |
-- | Argentina   |              3 |
-- | Austria     |              2 |
-- | Belgium     |              2 |
-- | Brazil      |              9 |
-- | Canada      |              3 |
-- | Denmark     |              2 |
-- | Finland     |              2 |
-- | France      |             11 |
-- | Germany     |             11 |
-- | Ireland     |              1 |
-- | Italy       |              3 |
-- | Mexico      |              5 |
-- | Norway      |              1 |
-- | Poland      |              1 |
-- | Portugal    |              2 |
-- | Spain       |              5 |
-- | Sweden      |              2 |
-- | Switzerland |              2 |
-- | UK          |              7 |
-- | USA         |             13 |
-- | Venezuela   |              4 |
-- +-------------+----------------+
-- 22 rows in set (0.00 sec)

select distinct(ContactTitle) FROM customers;
-- --------------------------------+
--  ContactTitle                   |
-- --------------------------------+
--  Sales Representative           |
--  Owner                          |
--  Order Administrator            |
--  Marketing Manager              |
--  Accounting Manager             |
--  Sales Agent                    |
--  Sales Associate                |
--  Sales Manager                  |
--  Marketing Assistant            |
--  Assistant Sales Agent          |
--  Assistant Sales Representative |
--  IT                             |
--  Owner/Marketing Assistant      |
-- --------------------------------+
-- 3 rows in set (0.01 sec)



select distinct(ContactTitle) as Title, count(ContactTitle) FROM customers group by Title order by count(ContactTitle) desc;
-- +--------------------------------+---------------------+
-- | Title                          | count(ContactTitle) |
-- +--------------------------------+---------------------+
-- | Sales Representative           |                  17 |
-- | Owner                          |                  17 |
-- | Marketing Manager              |                  12 |
-- | Sales Manager                  |                  11 |
-- | Accounting Manager             |                  10 |
-- | Sales Associate                |                   7 |
-- | Marketing Assistant            |                   6 |
-- | Sales Agent                    |                   5 |
-- | Order Administrator            |                   2 |
-- | Assistant Sales Agent          |                   2 |
-- | IT                             |                   2 |
-- | Assistant Sales Representative |                   1 |
-- | Owner/Marketing Assistant      |                   1 |
-- +--------------------------------+---------------------+
-- 13 rows in set (0.00 sec)-- 






'''
“We’d like to show, for each product, the associated Supplier. 
Show the ProductID, ProductName, and the CompanyName of the Supplier. 
Sort by ProductID.  

Tables: Suppliers and Products 
    
    This question will introduce what may be a new concept, the Join clause in SQL. 
    The Join clause is used to join two or more relational database tables together in a logical way.   
    Here’s a data model of the relationship between Products and Supplier”

Excerpt FROM
SQL Practice Problems: 57 beginning, intermediate, and advanced challenges for you to solve using a "learn-by-doing" approach
Sylvia Moestl Vasilik
This material may be protected by copyright.

mysql> desc Suppliers
    -> ;
+--------------+-------------+------+-----+---------+----------------+
| Field        | Type        | Null | Key | Default | Extra          |
+--------------+-------------+------+-----+---------+----------------+
| SupplierID   | int         | NO   | PRI | NULL    | auto_increment |
| CompanyName  | varchar(40) | NO   | MUL | NULL    |                |
| ContactName  | varchar(30) | YES  |     | NULL    |                |
| ContactTitle | varchar(30) | YES  |     | NULL    |                |
| Address      | varchar(60) | YES  |     | NULL    |                |
| City         | varchar(15) | YES  |     | NULL    |                |
| Region       | varchar(15) | YES  |     | NULL    |                |
| PostalCode   | varchar(10) | YES  | MUL | NULL    |                |
| Country      | varchar(15) | YES  |     | NULL    |                |
| Phone        | varchar(24) | YES  |     | NULL    |                |
| Fax          | varchar(24) | YES  |     | NULL    |                |
| HomePage     | mediumtext  | YES  |     | NULL    |                |
+--------------+-------------+------+-----+---------+----------------+
12 rows in set (0.00 sec)

mysql> desc Products;
+-----------------+---------------+------+-----+---------+----------------+
| Field           | Type          | Null | Key | Default | Extra          |
+-----------------+---------------+------+-----+---------+----------------+
| ProductID       | int           | NO   | PRI | NULL    | auto_increment |
| ProductName     | varchar(40)   | NO   | MUL | NULL    |                |
| SupplierID      | int           | YES  | MUL | NULL    |                |
| CategoryID      | int           | YES  | MUL | NULL    |                |
| QuantityPerUnit | varchar(20)   | YES  |     | NULL    |                |
| UnitPrice       | decimal(10,4) | YES  |     | 0.0000  |                |
| UnitsInStock    | smallint      | YES  |     | 0       |                |
| UnitsOnOrder    | smallint      | YES  |     | 0       |                |
| ReorderLevel    | smallint      | YES  |     | 0       |                |
| Discontinued    | bit(1)        | NO   |     | b'0'    |                |
+-----------------+---------------+------+-----+---------+----------------+
10 rows in set (0.00 sec)

'''

SELECT 
		p.ProductID
		, p.ProductName 
		, s.CompanyName 
FROM Suppliers s
JOIN Products p ON p.SupplierID = s.SupplierID
ORDER BY p.ProductID; 

-- +-----------+----------------------------------+----------------------------------------+
-- | ProductID | ProductName                      | CompanyName                            |
-- +-----------+----------------------------------+----------------------------------------+
-- |         1 | Chai                             | Exotic Liquids                         |
-- |         2 | Chang                            | Exotic Liquids                         |
-- |         3 | Aniseed Syrup                    | Exotic Liquids                         |
-- |         4 | Chef Anton's Cajun Seasoning     | New Orleans Cajun Delights             |
-- |         5 | Chef Anton's Gumbo Mix           | New Orleans Cajun Delights             |
-- |         6 | Grandma's Boysenberry Spread     | Grandma Kelly's Homestead              |
-- |         7 | Uncle Bob's Organic Dried Pears  | Grandma Kelly's Homestead              |
-- |         8 | Northwoods Cranberry Sauce       | Grandma Kelly's Homestead              |
-- |         9 | Mishi Kobe Niku                  | Tokyo Traders                          |
-- |        10 | Ikura                            | Tokyo Traders                          |


-- similar 
SELECT p.ProductID, p.ProductName, c.CategoryName FROM Products p JOIN Categories c ON p.CategoryID = c.CategoryID;
-- +-----------+----------------------------------+----------------+
-- | ProductID | ProductName                      | CategoryName   |
-- +-----------+----------------------------------+----------------+
-- |         1 | Chai                             | Beverages      |
-- |         2 | Chang                            | Beverages      |
-- |        24 | Guaran Fantstica                 | Beverages      |
-- |        34 | Sasquatch Ale                    | Beverages      |
-- |        35 | Steeleye Stout                   | Beverages      |
-- |        38 | Cte de Blaye                     | Beverages      |
-- |        39 | Chartreuse verte                 | Beverages      |


'''
“We’d like to show a list of 
	the Orders that were made, 
	including the Shipper that was used. 

Show the OrderID, OrderDate (date only), and CompanyName of the Shipper, and sort by OrderID.  
    In order to not show all the orders (there’s more than 800), show only those rows with an OrderID of less than 10300.”

Excerpt FROM
SQL Practice Problems: 57 beginning, intermediate, and advanced challenges for you to solve using a "learn-by-doing" approach
Sylvia Moestl Vasilik
This material may be protected by copyright.

mysql> desc Orders;
+----------------+---------------+------+-----+---------+----------------+
| Field          | Type          | Null | Key | Default | Extra          |
+----------------+---------------+------+-----+---------+----------------+
| OrderID        | int           | NO   | PRI | NULL    | auto_increment |
| CustomerID     | varchar(5)    | YES  | MUL | NULL    |                |
| EmployeeID     | int           | YES  | MUL | NULL    |                |
| OrderDate      | datetime      | YES  | MUL | NULL    |                |
| RequiredDate   | datetime      | YES  |     | NULL    |                |
| ShippedDate    | datetime      | YES  | MUL | NULL    |                |
| ShipVia        | int           | YES  | MUL | NULL    |                |
| Freight        | decimal(10,4) | YES  |     | 0.0000  |                |
| ShipName       | varchar(40)   | YES  |     | NULL    |                |
| ShipAddress    | varchar(60)   | YES  |     | NULL    |                |
| ShipCity       | varchar(15)   | YES  |     | NULL    |                |
| ShipRegion     | varchar(15)   | YES  |     | NULL    |                |
| ShipPostalCode | varchar(10)   | YES  | MUL | NULL    |                |
| ShipCountry    | varchar(15)   | YES  |     | NULL    |                |
+----------------+---------------+------+-----+---------+----------------+
14 rows in set (0.01 sec)

mysql> desc Shippers;
+-------------+-------------+------+-----+---------+----------------+
| Field       | Type        | Null | Key | Default | Extra          |
+-------------+-------------+------+-----+---------+----------------+
| ShipperID   | int         | NO   | PRI | NULL    | auto_increment |
| CompanyName | varchar(40) | NO   |     | NULL    |                |
| Phone       | varchar(24) | YES  |     | NULL    |                |
+-------------+-------------+------+-----+---------+----------------+
3 rows in set (0.00 sec)

mysql> select distinct(ShipVia) FROM Orders;
+---------+
| ShipVia |
+---------+
|       1 |
|       2 |
|       3 |
+---------+
3 rows in set (0.01 sec)

mysql> select * FROM Shippers;
+-----------+------------------+----------------+
| ShipperID | CompanyName      | Phone          |
+-----------+------------------+----------------+
|         1 | Speedy Express   | (503) 555-9831 |
|         2 | United Package   | (503) 555-3199 |
|         3 | Federal Shipping | (503) 555-9931 |
+-----------+------------------+----------------+
3 rows in set (0.00 sec)

'''

SELECT 
	o.OrderID
	, date(o.OrderDate) as order_date
	, s.CompanyName 
FROM Orders o
JOIN Shippers s ON s.ShipperID = o.ShipVia
-- WHERE o.OrderId < 10300 
ORDER BY o.OrderID

-- mysql> SELECT  o.OrderID 
-- 		, date(o.OrderDate) as order_date 
-- 		, s.CompanyName  
-- 	FROM Orders o 
-- 	JOIN Shippers s ON s.ShipperID = o.ShipVia 
-- 	WHERE o.OrderId < 10300 
-- 	ORDER BY o.OrderID
--     -> ;
-- +---------+------------+------------------+
-- | OrderID | order_date | CompanyName      |
-- +---------+------------+------------------+
-- |   10248 | 1996-07-04 | Federal Shipping |
-- |   10249 | 1996-07-05 | Speedy Express   |
-- |   10250 | 1996-07-08 | United Package   |
-- |   10251 | 1996-07-08 | Speedy Express   |
-- |   10252 | 1996-07-09 | United Package   |
-- |   10253 | 1996-07-10 | United Package   |
-- |   10254 | 1996-07-11 | United Package   |
-- |   10255 | 1996-07-12 | Federal Shipping |
-- |   10256 | 1996-07-15 | United Package   |
-- 52 rows 

-- INTERMEDIATE PROBLEMS -- 

'''
“ Categories, and the total products in each category  
    
    For this problem, we’d like to see the total number of products in each category. 
    Sort the results by the total number of products, in descending order.”

Excerpt FROM
SQL Practice Problems: 57 beginning, intermediate, and advanced challenges for you to solve using a "learn-by-doing" approach
Sylvia Moestl Vasilik
This material may be protected by copyright.

mysql> desc Products;
+-----------------+---------------+------+-----+---------+----------------+
| Field           | Type          | Null | Key | Default | Extra          |
+-----------------+---------------+------+-----+---------+----------------+
| ProductID       | int           | NO   | PRI | NULL    | auto_increment |
| ProductName     | varchar(40)   | NO   | MUL | NULL    |                |
| SupplierID      | int           | YES  | MUL | NULL    |                |
| CategoryID      | int           | YES  | MUL | NULL    |                |
| QuantityPerUnit | varchar(20)   | YES  |     | NULL    |                |
| UnitPrice       | decimal(10,4) | YES  |     | 0.0000  |                |
| UnitsInStock    | smallint      | YES  |     | 0       |                |
| UnitsOnOrder    | smallint      | YES  |     | 0       |                |
| ReorderLevel    | smallint      | YES  |     | 0       |                |
| Discontinued    | bit(1)        | NO   |     | b'0'    |                |
+-----------------+---------------+------+-----+---------+----------------+
10 rows in set (0.00 sec)

mysql> desc Categories;
+--------------+-------------+------+-----+---------+----------------+
| Field        | Type        | Null | Key | Default | Extra          |
+--------------+-------------+------+-----+---------+----------------+
| CategoryID   | int         | NO   | PRI | NULL    | auto_increment |
| CategoryName | varchar(15) | NO   | MUL | NULL    |                |
| Description  | mediumtext  | YES  |     | NULL    |                |
| Picture      | longblob    | YES  |     | NULL    |                |
+--------------+-------------+------+-----+---------+----------------+
4 rows in set (0.01 sec)

'''

-- select CategoryID, count(CategoryID) FROM Products group by CategoryID order by count(CategoryID) desc;
-- +------------+-------------------+
-- | CategoryID | count(CategoryID) |
-- +------------+-------------------+
-- |          3 |                13 |
-- |          1 |                12 |
-- |          2 |                12 |
-- |          8 |                12 |
-- |          4 |                10 |
-- |          5 |                 7 |
-- |          6 |                 6 |
-- |          7 |                 5 |
-- +------------+-------------------+
-- 8 rows in set (0.00 sec)


-- NOPE 

-- SELECT 
-- 	p.ProductName
-- 	, count(p.ProductID)
-- FROM Products p 
-- JOIN Categories c ON c.CategoryID  = p.CategoryID
-- GROUP BY p.ProductName 
-- order by count(p.ProductID) desc;

SELECT 
	c.CategoryName
	, count(c.CategoryID)
FROM Products p 
JOIN Categories c ON c.CategoryID  = p.CategoryID
GROUP BY c.CategoryName 
order by count(p.CategoryID) desc;

-- mysql> SELECT
--     -> c.CategoryName
--     -> , count(c.CategoryID)
--     -> FROM Products p
--     -> JOIN Categories c ON c.CategoryID  = p.CategoryID
--     -> GROUP BY c.CategoryName
--     -> order by count(p.CategoryID) desc;
-- +----------------+---------------------+
-- | CategoryName   | count(c.CategoryID) |
-- +----------------+---------------------+
-- | Confections    |                  13 |
-- | Beverages      |                  12 |
-- | Condiments     |                  12 |
-- | Seafood        |                  12 |
-- | Dairy Products |                  10 |
-- | Grains/Cereals |                   7 |
-- | Meat/Poultry   |                   6 |
-- | Produce        |                   5 |
-- +----------------+---------------------+
-- 8 rows in set (0.00 sec)


'''
“In the Customers table, show the total number of customers per Country and City.”

mysql> desc Customers;
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| CustomerID   | varchar(5)  | NO   | PRI | NULL    |       |
| CompanyName  | varchar(40) | NO   | MUL | NULL    |       |
| ContactName  | varchar(30) | YES  |     | NULL    |       |
| ContactTitle | varchar(30) | YES  |     | NULL    |       |
| Address      | varchar(60) | YES  |     | NULL    |       |
| City         | varchar(15) | YES  | MUL | NULL    |       |
| Region       | varchar(15) | YES  | MUL | NULL    |       |
| PostalCode   | varchar(10) | YES  | MUL | NULL    |       |
| Country      | varchar(15) | YES  |     | NULL    |       |
| Phone        | varchar(24) | YES  |     | NULL    |       |
| Fax          | varchar(24) | YES  |     | NULL    |       |
+--------------+-------------+------+-----+---------+-------+
11 rows in set (0.00 sec)


Excerpt FROM
SQL Practice Problems: 57 beginning, intermediate, and advanced challenges for you to solve using a "learn-by-doing" approach
Sylvia Moestl Vasilik
This material may be protected by copyright.
'''

SELECT 
	c.Country
	, c.City
	, count(CustomerID)
FROM Customers c
GROUP BY 
	c.Country
	, c.City
ORDER BY  count(CustomerID) desc;

-- SELECT  c.Country , c.City , count(CustomerID) FROM Customers c GROUP BY  c.Country , c.City ORDER BY  count(CustomerID) desc;
-- +-------------+-----------------+-------------------+
-- | Country     | City            | count(CustomerID) |
-- +-------------+-----------------+-------------------+
-- | UK          | London          |                 6 |
-- | Mexico      | Mxico D.F.      |                 5 |
-- | Brazil      | Sao Paulo       |                 4 |
-- | Brazil      | Rio de Janeiro  |                 3 |
-- | Spain       | Madrid          |                 3 |
-- | Argentina   | Buenos Aires    |                 3 |
-- | NULL        | NULL            |                 2 |
-- | France      | Paris           |                 2 |
-- | USA         | Portland        |                 2 |

'''
“Products that need reordering  
    What products do we have in our inventory that should be reordered? 
    For now, just use the fields 
    	UnitsInStock 
    	and 
    	ReorderLevel, 

    WHERE UnitsInStock is less than the ReorderLevel, 
    ignoring the fields UnitsOnOrder and Discontinued.   
    Order the results by ProductID.”

mysql> desc Products;
+-----------------+---------------+------+-----+---------+----------------+
| Field           | Type          | Null | Key | Default | Extra          |
+-----------------+---------------+------+-----+---------+----------------+
| ProductID       | int           | NO   | PRI | NULL    | auto_increment |
| ProductName     | varchar(40)   | NO   | MUL | NULL    |                |
| SupplierID      | int           | YES  | MUL | NULL    |                |
| CategoryID      | int           | YES  | MUL | NULL    |                |
| QuantityPerUnit | varchar(20)   | YES  |     | NULL    |                |
| UnitPrice       | decimal(10,4) | YES  |     | 0.0000  |                |
| UnitsInStock    | smallint      | YES  |     | 0       |                |
| UnitsOnOrder    | smallint      | YES  |     | 0       |                |
| ReorderLevel    | smallint      | YES  |     | 0       |                |
| Discontinued    | bit(1)        | NO   |     | b'0'    |                |
+-----------------+---------------+------+-----+---------+----------------+
10 rows in set (0.00 sec)

Excerpt FROM
SQL Practice Problems: 57 beginning, intermediate, and advanced challenges for you to solve using a "learn-by-doing" approach
Sylvia Moestl Vasilik
This material may be protected by copyright.
'''

SELECT
	p.ProductID
	, p.ProductName
	, p.UnitsInStock
	, p.ReorderLevel
FROM Products p
WHERE UnitsInStock < ReorderLevel;
-- +-----------+---------------------------+--------------+--------------+
-- | ProductID | ProductName               | UnitsInStock | ReorderLevel |
-- +-----------+---------------------------+--------------+--------------+
-- |         2 | Chang                     |           17 |           25 |
-- |         3 | Aniseed Syrup             |           13 |           25 |
-- |        11 | Queso Cabrales            |           22 |           30 |
-- |        21 | Sir Rodney's Scones       |            3 |            5 |
-- |        30 | Nord-Ost Matjeshering     |           10 |           15 |
-- |        31 | Gorgonzola Telino         |            0 |           20 |
-- |        32 | Mascarpone Fabioli        |            9 |           25 |
-- |        37 | Gravad lax                |           11 |           25 |
-- |        43 | Ipoh Coffee               |           17 |           25 |
-- |        45 | Rogede sild               |            5 |           15 |
-- |        48 | Chocolade                 |           15 |           25 |
-- |        49 | Maxilaku                  |           10 |           15 |
-- |        56 | Gnocchi di nonna Alice    |           21 |           30 |
-- |        64 | Wimmers gute Semmelkndel  |           22 |           30 |
-- |        66 | Louisiana Hot Spiced Okra |            4 |           20 |
-- |        68 | Scottish Longbreads       |            6 |           15 |
-- |        70 | Outback Lager             |           15 |           30 |
-- |        74 | Longlife Tofu             |            4 |            5 |
-- +-----------+---------------------------+--------------+--------------+
-- 18 rows in set (0.00 sec)

'''
“ Products that need reordering, continued  
    Now we need to incorporate these fields
    	—	UnitsInStock, 
    		UnitsOnOrder, 
    		ReorderLevel, 
    		Discontinued
    	—into our calculation. 

    We’ll define “products that need reordering” with the following:  
    
     UnitsInStock plus UnitsOnOrder are less than or equal to ReorderLevel  
     The Discontinued flag is false (0).”

Excerpt FROM
SQL Practice Problems: 57 beginning, intermediate, and advanced challenges for you to solve using a "learn-by-doing" approach
Sylvia Moestl Vasilik
This material may be protected by copyright.
'''

SELECT 
	p.ProductID
	, p.ProductName
	, p.UnitsInStock
	, p.UnitsOnOrder
	, p.ReorderLevel 
	, CAST(p.Discontinued AS UNSIGNED)
FROM Products p 
WHERE p.UnitsInStock + p.UnitsOnOrder <=  p.ReorderLevel  
AND p.Discontinued = 0 ; 

-- +-----------+-----------------------+--------------+--------------+--------------+----------------------------------+
-- | ProductID | ProductName           | UnitsInStock | UnitsOnOrder | ReorderLevel | CAST(p.Discontinued AS UNSIGNED) |
-- +-----------+-----------------------+--------------+--------------+--------------+----------------------------------+
-- |        30 | Nord-Ost Matjeshering |           10 |            0 |           15 |                                0 |
-- |        70 | Outback Lager         |           15 |           10 |           30 |                                0 |
-- +-----------+-----------------------+--------------+--------------+--------------+----------------------------------+
-- 2 rows in set (0.01 sec)

-- 
-- mysql> desc Products;
-- +-----------------+---------------+------+-----+---------+----------------+
-- | Field           | Type          | Null | Key | Default | Extra          |
-- +-----------------+---------------+------+-----+---------+----------------+
-- | ProductID       | int           | NO   | PRI | NULL    | auto_increment |
-- | ProductName     | varchar(40)   | NO   | MUL | NULL    |                |
-- | SupplierID      | int           | YES  | MUL | NULL    |                |
-- | CategoryID      | int           | YES  | MUL | NULL    |                |
-- | QuantityPerUnit | varchar(20)   | YES  |     | NULL    |                |
-- | UnitPrice       | decimal(10,4) | YES  |     | 0.0000  |                |
-- | UnitsInStock    | smallint      | YES  |     | 0       |                |
-- | UnitsOnOrder    | smallint      | YES  |     | 0       |                |
-- | ReorderLevel    | smallint      | YES  |     | 0       |                |
-- | Discontinued    | bit(1)        | NO   |     | b'0'    |                |
-- +-----------------+---------------+------+-----+---------+----------------+
-- 10 rows in set (0.00 sec)


'''
Customer list by region  
    A salesperson for Northwind is going on a business trip to visit customers, 
    and would like to see a list of all customers, 
    sorted by region, alphabetically.   

    However, 
    he wants the customers with no region (null in the Region field) to be at the end, 
    instead of at the top, 
    WHERE you’d normally find the null values. 

    Within the same region, companies should be sorted by CustomerID

    mysql> desc Customers;
			+--------------+-------------+------+-----+---------+-------+
			| Field        | Type        | Null | Key | Default | Extra |
			+--------------+-------------+------+-----+---------+-------+
			| CustomerID   | varchar(5)  | NO   | PRI | NULL    |       |
			| CompanyName  | varchar(40) | NO   | MUL | NULL    |       |
			| ContactName  | varchar(30) | YES  |     | NULL    |       |
			| ContactTitle | varchar(30) | YES  |     | NULL    |       |
			| Address      | varchar(60) | YES  |     | NULL    |       |
			| City         | varchar(15) | YES  | MUL | NULL    |       |
			| Region       | varchar(15) | YES  | MUL | NULL    |       |
			| PostalCode   | varchar(10) | YES  | MUL | NULL    |       |
			| Country      | varchar(15) | YES  |     | NULL    |       |
			| Phone        | varchar(24) | YES  |     | NULL    |       |
			| Fax          | varchar(24) | YES  |     | NULL    |       |
			+--------------+-------------+------+-----+---------+-------+
			11 rows in set (0.01 sec)


Hint  
    You won’t be able to sort directly on the Region field here. 
    You’ll need to sort on the Region field, and also on a computed field that you create, 
    which will give you a secondary sort for WHEN Region is null  

    First, without ordering, create a computed field that has a value 
    	which will sort the way you want. 
    In this case, you can create a field with the Case statement, which allows you do to if/then logic. 

    You want a field that is 1 when Region is null.  

    Take a look at the Examples section in the SQL Server documentation for Case 
    (https://msdn.microsoft.com/en-us/library/ms181765.aspx#examples).   

    Note that when filtering for null values, 	
    	you can't use FieldName = Null. 
    You must use -> FieldName is null

    mysql> select distinct(Region) FROM Customers order by Region;
			+---------------+
			| Region        |
			+---------------+
			| NULL          |
			| AK            |
			| BC            |
			| CA            |
			| Co. Cork      |
			| DF            |
			| ID            |
			| Isle of Wight |
			| Lara          |
			| MT            |
			| NM            |
			| Nueva Esparta |
			| OR            |
			| Qubec         |
			| RJ            |
			| SP            |
			| Tchira        |
			| WA            |
			| WY            |
			+---------------+
			19 rows in set (0.00 sec)

''' 

SELECT 
	c.CustomerID
	, c.CompanyName 
	, c.City
	, c.Region
	, (CASE 
		WHEN Region is NULL 
		THEN 1 
		ELSE 0 
	  END) as region_indicator
FROM Customers c 
HAVING region_indicator = 0 
ORDER BY c.Region 
		, c.CustomerID
; 

-- +------------+-----------------------------------+-----------------+---------------+------------------+
-- | CustomerID | CompanyName                       | City            | Region        | region_indicator |
-- +------------+-----------------------------------+-----------------+---------------+------------------+
-- | OLDWO      | Old World Delicatessen            | Anchorage       | AK            |                0 |
-- | BOTTM      | Bottom-Dollar Markets             | Tsawassen       | BC            |                0 |
-- | LAUGB      | Laughing Bacchus Wine Cellars     | Vancouver       | BC            |                0 |
-- | LETSS      | Let's Stop N Shop                 | San Francisco   | CA            |                0 |
-- | HUNGO      | Hungry Owl All-Night Grocers      | Cork            | Co. Cork      |                0 |
-- | GROSR      | GROSELLA-Restaurante              | Caracas         | DF            |                0 |
-- | SAVEA      | Save-a-lot Markets                | Boise           | ID            |                0 |
-- | ISLAT      | Island Trading                    | Cowes           | Isle of Wight |                0 |
-- | LILAS      | LILA-Supermercado                 | Barquisimeto    | Lara          |                0 |
-- | THECR      | The Cracker Box                   | Butte           | MT            |                0 |
-- | RATTC      | Rattlesnake Canyon Grocery        | Albuquerque     | NM            |                0 |
-- | LINOD      | LINO-Delicateses                  | I. de Margarita | Nueva Esparta |                0 |
-- | GREAL      | Great Lakes Food Market           | Eugene          | OR            |                0 |
-- | HUNGC      | Hungry Coyote Import Store        | Elgin           | OR            |                0 |
-- | LONEP      | Lonesome Pine Restaurant          | Portland        | OR            |                0 |
-- | THEBI      | The Big Cheese                    | Portland        | OR            |                0 |
-- | MEREP      | Mre Paillarde                     | Montral         | Qubec         |                0 |
-- | HANAR      | Hanari Carnes                     | Rio de Janeiro  | RJ            |                0 |
-- | QUEDE      | Que Delcia                        | Rio de Janeiro  | RJ            |                0 |
-- | RICAR      | Ricardo Adocicados                | Rio de Janeiro  | RJ            |                0 |
-- | COMMI      | Comrcio Mineiro                   | Sao Paulo       | SP            |                0 |
-- | FAMIA      | Familia Arquibaldo                | Sao Paulo       | SP            |                0 |
-- | GOURL      | Gourmet Lanchonetes               | Campinas        | SP            |                0 |
-- | QUEEN      | Queen Cozinha                     | Sao Paulo       | SP            |                0 |
-- | TRADH      | Tradio Hipermercados              | Sao Paulo       | SP            |                0 |
-- | WELLI      | Wellington Importadora            | Resende         | SP            |                0 |
-- | HILAA      | HILARION-Abastos                  | San Cristbal    | Tchira        |                0 |
-- | LAZYK      | Lazy K Kountry Store              | Walla Walla     | WA            |                0 |
-- | TRAIH      | Trail's Head Gourmet Provisioners | Kirkland        | WA            |                0 |
-- | WHITC      | White Clover Markets              | Seattle         | WA            |                0 |
-- | SPLIR      | Split Rail Beer & Ale             | Lander          | WY            |                0 |
-- +------------+-----------------------------------+-----------------+---------------+------------------+
-- 31 rows in set (0.00 sec)


'''
High freight charges  
    Some of the countries we ship to have very high freight charges. 
    We'd like to investigate some more shipping options for our customers, 
    to be able to offer them lower freight charges. 

Return the three ship countries 
	   with the highest average freight overall, (aka cost)
	   in descending order by average freight. (aka cost)


We'll be using the Orders table, and using the Freight and ShipCountry fields.

-- mysql> desc Orders;
-- +----------------+---------------+------+-----+---------+----------------+
-- | Field          | Type          | Null | Key | Default | Extra          |
-- +----------------+---------------+------+-----+---------+----------------+
-- | OrderID        | int           | NO   | PRI | NULL    | auto_increment |
-- | CustomerID     | varchar(5)    | YES  | MUL | NULL    |                |
-- | EmployeeID     | int           | YES  | MUL | NULL    |                |
-- | OrderDate      | datetime      | YES  | MUL | NULL    |                |
-- | RequiredDate   | datetime      | YES  |     | NULL    |                |
-- | ShippedDate    | datetime      | YES  | MUL | NULL    |                |
-- | ShipVia        | int           | YES  | MUL | NULL    |                |
-- | Freight        | decimal(10,4) | YES  |     | 0.0000  |                |
-- | ShipName       | varchar(40)   | YES  |     | NULL    |                |
-- | ShipAddress    | varchar(60)   | YES  |     | NULL    |                |
-- | ShipCity       | varchar(15)   | YES  |     | NULL    |                |
-- | ShipRegion     | varchar(15)   | YES  |     | NULL    |                |
-- | ShipPostalCode | varchar(10)   | YES  | MUL | NULL    |                |
-- | ShipCountry    | varchar(15)   | YES  |     | NULL    |                |
-- +----------------+---------------+------+-----+---------+----------------+
-- 14 rows in set (0.00 sec)

Hint  
    You'll want to group by ShipCountry, 
    and use the Avg function. 
    Don't worry about showing only the top 3 rows 
    until you have the grouping and average freight set up.



'''

SELECT 
	ShipCountry
	, avg(Freight) as avg_freight_charges
FROM Orders o 
GROUP BY ShipCountry 
ORDER BY avg_freight_charges DESC
LIMIT 3
;

-- mysql> SELECT  ShipCountry , avg(Freight) as avg_freight_charges FROM Orders o  GROUP BY ShipCountry  ORDER BY avg_freight_charges DESC limit 3;
-- +-------------+---------------------+
-- | ShipCountry | avg_freight_charges |
-- +-------------+---------------------+
-- | Austria     |        184.78750000 |
-- | Ireland     |        145.01263158 |
-- | USA         |        112.87942623 |
-- +-------------+---------------------+
-- 3 rows in set (0.00 sec)

-- mysql> SELECT  ShipCountry , date(OrderDate), avg(Freight) as avg_freight_charges 
-- FROM Orders o  
-- GROUP BY ShipCountry, date(OrderDate)  
-- ORDER BY avg_freight_charges DESC limit 3;
-- +-------------+-----------------+---------------------+
-- | ShipCountry | date(OrderDate) | avg_freight_charges |
-- +-------------+-----------------+---------------------+
-- | Germany     | 1997-05-19      |       1007.64000000 |
-- | Brazil      | 1996-12-04      |        890.78000000 |
-- | Austria     | 1997-04-22      |        789.95000000 |
-- +-------------+-----------------+---------------------+
-- 3 rows in set (0.00 sec)


'''
High freight charges -- 2015 (they made them all 2015 but the data set I have is 1997) 
    We're continuing on the question above on high freight charges. 
    Now, instead of using all the orders we have, we only want to see orders FROM the year 1997.

    -- select date(OrderDate), date_format(OrderDate, '%Y') FROM Orders;

'''

SELECT
ShipCountry
, date_format(OrderDate, '%Y') as year
, avg(Freight) as avg_freight_charges
FROM Orders o
WHERE date_format(OrderDate, '%Y') = 1997
GROUP BY ShipCountry, year
ORDER BY avg_freight_charges DESC
;
-- +-------------+------+---------------------+
-- | ShipCountry | year | avg_freight_charges |
-- +-------------+------+---------------------+
-- | Austria     | 1997 |        178.36428571 |
-- | Switzerland | 1997 |        117.17750000 |
-- | Sweden      | 1997 |        105.16000000 |
-- | Canada      | 1997 |         99.28000000 |
-- | Ireland     | 1997 |         98.07700000 |
-- | Germany     | 1997 |         97.38359375 |
-- | USA         | 1997 |         96.98950000 |
-- | Denmark     | 1997 |         94.62272727 |
-- | Venezuela   | 1997 |         71.04450000 |
-- | Belgium     | 1997 |         65.78285714 |
-- | France      | 1997 |         63.27589744 |


-- Their answer is because they made values change to 2015 = yyyy and for France = 113.991 
-- 
-- 	ShipCountry		AverageFreight  
--     --------------- ---------------------  
--     Austria			178.3642  
--     Switzerland		117.1775  
--     France		 	113.991

-- This didn't seem to fail like the book expected it to 
-- Both queries use a WHERE, temp and file sort. 
SELECT 
	ShipCountry 
	,avg(Freight) as AverageFreight 
FROM Orders
WHERE  
	date_format(OrderDate, '%m/%d/%Y') between '1/1/1997' and '12/31/1997'  
Group By ShipCountry  
Order By AverageFreight desc;


'''
High freight charges - last year  
    We're continuing to work on high freight charges. 
    We now want to get the three ship countries with the highest average freight charges. 
    But instead of filtering for a particular year, 
    we want to use the last 12 months of order data, using as the end date the last OrderDate in Orders.”

    Hint 
    First, get the last OrderDate in Orders. 
    Write a simple select statement to get the highest value in the OrderDate field using the Max aggregate function.

    mysql> select max(OrderDate) FROM Orders;
	+---------------------+
	| max(OrderDate)      |
	+---------------------+
	| 1998-05-06 00:00:00 |
	+---------------------+
	1 row in set (0.00 sec)

	SELECT DATE_ADD("1998-05-06", INTERVAL -1 YEAR); -- use this in the where clause 

'''

SELECT
	ShipCountry
	,avg(Freight) as AverageFreight
FROM Orders
WHERE
	OrderDate between (SELECT DATE_ADD("1998-05-06", INTERVAL -1 YEAR)) and (SELECT max(date(OrderDate)) FROM Orders)
Group By ShipCountry
Order By AverageFreight desc;
-- +-------------+----------------+
-- | ShipCountry | AverageFreight |
-- +-------------+----------------+
-- | Ireland     |   200.21000000 |
-- | Austria     |   186.45960000 |
-- | USA         |   117.97045977 |
-- | Germany     |   105.84525000 |
-- | Sweden      |   100.11692308 |
-- | Canada      |    85.67833333 |


'''
Inventory list   
    We're doing inventory, and need to show information like the below, for all orders. 
    Sort by OrderID and Product ID.
    -- “EmployeeID	LastName	 OrderID  ProductName  Quantity
    -----------  ----------- ------------ -----------  ---------
    5 	Buchanan 10248 Queso Cabrales 12


				mysql> desc Orders;
				+----------------+---------------+------+-----+---------+----------------+
				| Field          | Type          | Null | Key | Default | Extra          |
				+----------------+---------------+------+-----+---------+----------------+
				| OrderID        | int           | NO   | PRI | NULL    | auto_increment |
				| CustomerID     | varchar(5)    | YES  | MUL | NULL    |                |
				| EmployeeID     | int           | YES  | MUL | NULL    |                |
				| OrderDate      | datetime      | YES  | MUL | NULL    |                |
				| RequiredDate   | datetime      | YES  |     | NULL    |                |
				| ShippedDate    | datetime      | YES  | MUL | NULL    |                |
				| ShipVia        | int           | YES  | MUL | NULL    |                |
				| Freight        | decimal(10,4) | YES  |     | 0.0000  |                |
				| ShipName       | varchar(40)   | YES  |     | NULL    |                |
				| ShipAddress    | varchar(60)   | YES  |     | NULL    |                |
				| ShipCity       | varchar(15)   | YES  |     | NULL    |                |
				| ShipRegion     | varchar(15)   | YES  |     | NULL    |                |
				| ShipPostalCode | varchar(10)   | YES  | MUL | NULL    |                |
				| ShipCountry    | varchar(15)   | YES  |     | NULL    |                |
				+----------------+---------------+------+-----+---------+----------------+

				mysql> desc Products;
				+-----------------+---------------+------+-----+---------+----------------+
				| Field           | Type          | Null | Key | Default | Extra          |
				+-----------------+---------------+------+-----+---------+----------------+
				| ProductID       | int           | NO   | PRI | NULL    | auto_increment |
				| ProductName     | varchar(40)   | NO   | MUL | NULL    |                |
				| SupplierID      | int           | YES  | MUL | NULL    |                |
				| CategoryID      | int           | YES  | MUL | NULL    |                |
				| QuantityPerUnit | varchar(20)   | YES  |     | NULL    |                |
				| UnitPrice       | decimal(10,4) | YES  |     | 0.0000  |                |
				| UnitsInStock    | smallint      | YES  |     | 0       |                |
				| UnitsOnOrder    | smallint      | YES  |     | 0       |                |
				| ReorderLevel    | smallint      | YES  |     | 0       |                |
				| Discontinued    | bit(1)        | NO   |     | b'0'    |                |
				+-----------------+---------------+------+-----+---------+----------------+

				mysql> desc OrderDetails
				    -> ;
				+-----------+---------------+------+-----+---------+-------+
				| Field     | Type          | Null | Key | Default | Extra |
				+-----------+---------------+------+-----+---------+-------+
				| OrderID   | int           | NO   | PRI | NULL    |       |
				| ProductID | int           | NO   | PRI | NULL    |       |
				| UnitPrice | decimal(10,4) | NO   |     | 0.0000  |       |
				| Quantity  | smallint      | NO   |     | 1       |       |
				| Discount  | double(8,0)   | NO   |     | 0       |       |
				+-----------+---------------+------+-----+---------+-------+
				5 rows in set (0.00 sec)

	Hint  
    You'll need to do a join between 4 tables, displaying only those fields that are necessary.
    Orders o 
    OrderDetails od 
    Employees e 
    Products p 

'''

SELECT
	  o.EmployeeID
	, e.LastName
	, o.OrderID
	, p.ProductName
	, od.Quantity
FROM Orders o 
JOIN employees e ON e.EmployeeID = o.EmployeeID 
JOIN OrderDetails od ON od.OrderID = o.OrderID
JOIN Products p ON p.ProductID = od.ProductID
ORDER BY o.OrderID
		, p.ProductID
; 

-- +------------+-----------+---------+----------------------------------+----------+
-- | EmployeeID | LastName  | OrderID | ProductName                      | Quantity |
-- +------------+-----------+---------+----------------------------------+----------+
-- |          5 | Buchanan  |   10248 | Queso Cabrales                   |       12 |
-- |          5 | Buchanan  |   10248 | Singaporean Hokkien Fried Mee    |       10 |
-- |          5 | Buchanan  |   10248 | Mozzarella di Giovanni           |        5 |
-- |          6 | Suyama    |   10249 | Tofu                             |        9 |
-- |          6 | Suyama    |   10249 | Manjimup Dried Apples            |       40 |
-- |          4 | Peacock   |   10250 | Jack's New England Clam Chowder  |       10 |
-- |          4 | Peacock   |   10250 | Manjimup Dried Apples            |       35 |
-- |          4 | Peacock   |   10250 | Louisiana Fiery Hot Pepper Sauce |       15 |
-- |          3 | Leverling |   10251 | Gustaf's Knckebrd                |        6 |
-- |          3 | Leverling |   10251 | Ravioli Angelo                   |       15 |
-- +------------+-----------+---------+----------------------------------+----------+
-- 10 rows in set (0.01 sec)


'''
Customers with no orders  
    There are some customers who have never actually placed an order. 
    Show these customers.

        mysql> desc Customers;
		+--------------+-------------+------+-----+---------+-------+
		| Field        | Type        | Null | Key | Default | Extra |
		+--------------+-------------+------+-----+---------+-------+
		| CustomerID   | varchar(5)  | NO   | PRI | NULL    |       |
		| CompanyName  | varchar(40) | NO   | MUL | NULL    |       |
		| ContactName  | varchar(30) | YES  |     | NULL    |       |
		| ContactTitle | varchar(30) | YES  |     | NULL    |       |
		| Address      | varchar(60) | YES  |     | NULL    |       |
		| City         | varchar(15) | YES  | MUL | NULL    |       |
		| Region       | varchar(15) | YES  | MUL | NULL    |       |
		| PostalCode   | varchar(10) | YES  | MUL | NULL    |       |
		| Country      | varchar(15) | YES  |     | NULL    |       |
		| Phone        | varchar(24) | YES  |     | NULL    |       |
		| Fax          | varchar(24) | YES  |     | NULL    |       |
		+--------------+-------------+------+-----+---------+-------+
		11 rows in set (0.01 sec)

		mysql> desc Orders;
		+----------------+---------------+------+-----+---------+----------------+
		| Field          | Type          | Null | Key | Default | Extra          |
		+----------------+---------------+------+-----+---------+----------------+
		| OrderID        | int           | NO   | PRI | NULL    | auto_increment |
		| CustomerID     | varchar(5)    | YES  | MUL | NULL    |                |
		| EmployeeID     | int           | YES  | MUL | NULL    |                |
		| OrderDate      | datetime      | YES  | MUL | NULL    |                |
		| RequiredDate   | datetime      | YES  |     | NULL    |                |
		| ShippedDate    | datetime      | YES  | MUL | NULL    |                |
		| ShipVia        | int           | YES  | MUL | NULL    |                |
		| Freight        | decimal(10,4) | YES  |     | 0.0000  |                |
		| ShipName       | varchar(40)   | YES  |     | NULL    |                |
		| ShipAddress    | varchar(60)   | YES  |     | NULL    |                |
		| ShipCity       | varchar(15)   | YES  |     | NULL    |                |
		| ShipRegion     | varchar(15)   | YES  |     | NULL    |                |
		| ShipPostalCode | varchar(10)   | YES  | MUL | NULL    |                |
		| ShipCountry    | varchar(15)   | YES  |     | NULL    |                |
		+----------------+---------------+------+-----+---------+----------------+
		14 rows in set (0.01 sec)

Excerpt FROM
SQL Practice Problems: 57 beginning, intermediate, and advanced challenges for you to solve using a "learn-by-doing" approach
Sylvia Moestl Vasilik
This material may be protected by copyright.

'''

SELECT 
	c.CustomerID as customers_customer_id 
	, o.CustomerID as orders_customer_id
FROM Customers c
LEFT JOIN Orders o ON o.CustomerID = c.CustomerID
WHERE o.CustomerID IS NULL ; 

-- Never placed an Order 
-- +-----------------------+--------------------+
-- | customers_customer_id | orders_customer_id |
-- +-----------------------+--------------------+
-- | Val2                  | NULL               |
-- | VALON                 | NULL               |
-- | FISSA                 | NULL               |
-- | PARIS                 | NULL               |
-- +-----------------------+--------------------+
-- 4 rows in set (0.00 sec)


'''
Customers with no orders for EmployeeID 4  
    One employee (Margaret Peacock, EmployeeID 4) has placed the most orders. 
    However, there are some customers who've never placed an order with her. 
    Show only those customers who have never placed an order with her.

    mysql> select EmployeeID, LastName, FirstName FROM Employees limit 5;
			+------------+-----------+-----------+
			| EmployeeID | LastName  | FirstName |
			+------------+-----------+-----------+
			|          1 | Davolio   | Nancy     |
			|          2 | Fuller    | Andrew    |
			|          3 | Leverling | Janet     |
			|          4 | Peacock   | Margaret  |
			|          5 | Buchanan  | Steven    |
			+------------+-----------+-----------+
			5 rows in set (0.01 sec)
	select * FROM Orders where EmployeeID = 4; -- 156 

'''

 	
SELECT 
	c.CustomerID as customers_customer_id 
	, o.CustomerID as orders_customer_id
	-- , o.EmployeeID -- this comes back as NULL because nothing to join it with to make it make sense 
FROM Customers c
LEFT JOIN Orders o ON o.CustomerID = c.CustomerID
WHERE o.CustomerID IS NULL ;
-- and Orders.EmployeeID = 4 ; 


mysql> SELECT * FROM Customers where CustomerID in ( 'VALON' ,'FISSA' ,'PARIS', 'Val2' );
+------------+--------------------------------------+----------------+--------------------+-------------------------+--------+--------+------------+---------+-----------------+-----------------+
| CustomerID | CompanyName                          | ContactName    | ContactTitle       | Address                 | City   | Region | PostalCode | Country | Phone           | Fax             |
+------------+--------------------------------------+----------------+--------------------+-------------------------+--------+--------+------------+---------+-----------------+-----------------+
| FISSA      | FISSA Fabrica Inter. Salchichas S.A. | Diego Roel     | Accounting Manager | C/ Moralzarzal, 86      | Madrid | NULL   | 28034      | Spain   | (91) 555 94 44  | (91) 555 55 93  |
| PARIS      | Paris spcialits                      | Marie Bertrand | Owner              | 265, boulevard Charonne | Paris  | NULL   | 75012      | France  | (1) 42.34.22.66 | (1) 42.34.22.77 |
| VALON      | IT                                   | Valon Hoti     | IT                 | NULL                    | NULL   | NULL   | NULL       | NULL    | NULL            | NULL            |
+------------+--------------------------------------+----------------+--------------------+-------------------------+--------+--------+------------+---------+-----------------+-----------------+
3 rows in set (0.00 sec)

-- ANSWER to put the Filter ON THE JOIN clause 

SELECT 
	c.CustomerID as customers_customer_id 
	, o.CustomerID as orders_customer_id
	-- , o.EmployeeID -- this comes back as NULL because nothing to join it with to make it make sense 
FROM Customers c
LEFT JOIN Orders o ON o.CustomerID = c.CustomerID
				   AND o.EmployeeID = 4
WHERE o.CustomerID IS NULL ; 

-- Show only those customers who have never placed an order with Margaret Peacock employee id 4 .
-- +-----------------------+--------------------+
-- | customers_customer_id | orders_customer_id |
-- +-----------------------+--------------------+
-- | Val2                  | NULL               |
-- | VALON                 | NULL               |
-- | PERIC                 | NULL               |
-- | GROSR                 | NULL               |
-- | PRINI                 | NULL               |
-- | FISSA                 | NULL               |
-- | SANTG                 | NULL               |
-- | DUMON                 | NULL               |
-- | FRANR                 | NULL               |
-- | VINET                 | NULL               |
-- | PARIS                 | NULL               |
-- | SPECD                 | NULL               |
-- | THEBI                 | NULL               |
-- | LAZYK                 | NULL               |
-- | SEVES                 | NULL               |
-- | NORTS                 | NULL               |
-- | LAUGB                 | NULL               |
-- | CONSH                 | NULL               |
-- +-----------------------+--------------------+
-- 18 rows in set (0.01 sec)


SELECT CustomerID
FROM Customers
WHERE CustomerID not in (SELECT CustomerID FROM Orders where EmployeeID = 4)

-- +------------+
-- | CustomerID |
-- +------------+
-- | Val2       |
-- | VALON      |
-- | PERIC      |
-- | GROSR      |
-- | PRINI      |
-- | FISSA      |
-- | SANTG      |
-- | DUMON      |
-- | FRANR      |
-- | VINET      |
-- | PARIS      |
-- | SPECD      |
-- | THEBI      |
-- | LAZYK      |
-- | SEVES      |
-- | NORTS      |
-- | LAUGB      |
-- | CONSH      |
-- +------------+
-- 18 rows in set (0.00 sec)

-- ADVANCED -- 

'''
 	High-value customers  
    
    We want to send all of our high-value customers a special VIP gift. 
    We're defining high-value customers as those who've made at least 1 order -- tie into Orders 
    with a total value (not including the discount) equal to $10,000 or more. 
    We only want to consider orders made in the year 2016 (does not go to 2016 -- only 1998)


    mysql> desc Customers;
			+--------------+-------------+------+-----+---------+-------+
			| Field        | Type        | Null | Key | Default | Extra |
			+--------------+-------------+------+-----+---------+-------+
			| CustomerID   | varchar(5)  | NO   | PRI | NULL    |       |
			| CompanyName  | varchar(40) | NO   | MUL | NULL    |       |
			| ContactName  | varchar(30) | YES  |     | NULL    |       |
			| ContactTitle | varchar(30) | YES  |     | NULL    |       |
			| Address      | varchar(60) | YES  |     | NULL    |       |
			| City         | varchar(15) | YES  | MUL | NULL    |       |
			| Region       | varchar(15) | YES  | MUL | NULL    |       |
			| PostalCode   | varchar(10) | YES  | MUL | NULL    |       |
			| Country      | varchar(15) | YES  |     | NULL    |       |
			| Phone        | varchar(24) | YES  |     | NULL    |       |
			| Fax          | varchar(24) | YES  |     | NULL    |       |
			+--------------+-------------+------+-----+---------+-------+
			11 rows in set (0.01 sec)


	mysql> desc Orders;
			+----------------+---------------+------+-----+---------+----------------+
			| Field          | Type          | Null | Key | Default | Extra          |
			+----------------+---------------+------+-----+---------+----------------+
			| OrderID        | int           | NO   | PRI | NULL    | auto_increment |
			| CustomerID     | varchar(5)    | YES  | MUL | NULL    |                |
			| EmployeeID     | int           | YES  | MUL | NULL    |                |
			| OrderDate      | datetime      | YES  | MUL | NULL    |                |
			| RequiredDate   | datetime      | YES  |     | NULL    |                |
			| ShippedDate    | datetime      | YES  | MUL | NULL    |                |
			| ShipVia        | int           | YES  | MUL | NULL    |                |
			| Freight        | decimal(10,4) | YES  |     | 0.0000  |                |
			| ShipName       | varchar(40)   | YES  |     | NULL    |                |
			| ShipAddress    | varchar(60)   | YES  |     | NULL    |                |
			| ShipCity       | varchar(15)   | YES  |     | NULL    |                |
			| ShipRegion     | varchar(15)   | YES  |     | NULL    |                |
			| ShipPostalCode | varchar(10)   | YES  | MUL | NULL    |                |
			| ShipCountry    | varchar(15)   | YES  |     | NULL    |                |
			+----------------+---------------+------+-----+---------+----------------+
			14 rows in set (0.01 sec)

	mysql> desc OrderDetails;
			+-----------+---------------+------+-----+---------+-------+
			| Field     | Type          | Null | Key | Default | Extra |
			+-----------+---------------+------+-----+---------+-------+
			| OrderID   | int           | NO   | PRI | NULL    |       |
			| ProductID | int           | NO   | PRI | NULL    |       |
			| UnitPrice | decimal(10,4) | NO   |     | 0.0000  |       |
			| Quantity  | smallint      | NO   |     | 1       |       |
			| Discount  | double(8,0)   | NO   |     | 0       |       |
			+-----------+---------------+------+-----+---------+-------+
			5 rows in set (0.00 sec)

			CustomerID 
			CompanyName
			OrderID
			TotalOrderAmount



	Hint  
    First, let's get the necessary fields for all orders made in the year 2016. 
    Don't bother grouping yet, just work on the Where clause. 
    You'll need the CustomerID, CompanyName FROM Customers; 
    				OrderID FROM Orders; 
    				and Quantity and unit price FROM OrderDetails. 
    				Order by the total amount of the order, in descending order.
'''


SELECT 
	c.CustomerID 
	, c.CompanyName
	, od.OrderID
	, (od.Quantity * UnitPrice) - Discount AS TotalOrderAmount -- Discount not needed here 
FROM Customers c 
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
WHERE  date_format(o.OrderDate, '%Y') = 1997
ORDER BY TotalOrderAmount DESC 
LIMIT 20 ; 

-- mysql> SELECT  c.CustomerID  , c.CompanyName , od.OrderID , (od.Quantity * UnitPrice) - Discount AS TotalOrderAmount FROM Customers c  JOIN Orders o ON c.CustomerID = o.CustomerID JOIN OrderDetails od ON o.OrderID = od.OrderID WHERE  date_format(o.OrderDate, '%Y') = 1997 ORDER BY TotalOrderAmount DESC limit 20;
-- +------------+------------------------------+---------+------------------+
-- | CustomerID | CompanyName                  | OrderID | TotalOrderAmount |
-- +------------+------------------------------+---------+------------------+
-- | SIMOB      | Simons bistro                |   10417 |       10540.0000 |
-- | MEREP      | Mre Paillarde                |   10424 |       10329.2000 |
-- | QUICK      | QUICK-Stop                   |   10540 |        7905.0000 |
-- | ERNSH      | Ernst Handel                 |   10776 |        6360.0000 |
-- | RATTC      | Rattlesnake Canyon Grocery   |   10479 |        6324.0000 |
-- | QUICK      | QUICK-Stop                   |   10515 |        5268.0000 |
-- | QUICK      | QUICK-Stop                   |   10691 |        4951.6000 |
-- | HUNGO      | Hungry Owl All-Night Grocers |   10687 |        4850.0000 |
-- | SAVEA      | Save-a-lot Markets           |   10510 |        4456.4400 |
-- | RICSU      | Richter Supermarkt           |   10666 |        4456.4400 |
-- | TORTU      | Tortuga Restaurante          |   10518 |        3952.5000 |
-- | GREAL      | Great Lakes Food Market      |   10616 |        3952.5000 |
-- | BERGS      | Berglunds snabbkp            |   10672 |        3952.5000 |
-- | ERNSH      | Ernst Handel                 |   10633 |        3944.0000 |
-- | SAVEA      | Save-a-lot Markets           |   10711 |        3936.0000 |
-- | SAVEA      | Save-a-lot Markets           |   10607 |        3900.0000 |
-- | SAVEA      | Save-a-lot Markets           |   10678 |        3800.0000 |
-- | ERNSH      | Ernst Handel                 |   10595 |        3420.0000 |
-- | ERNSH      | Ernst Handel                 |   10514 |        3159.0000 |
-- | FOLIG      | Folies gourmandes            |   10634 |        3125.0000 |
-- +------------+------------------------------+---------+------------------+
-- 20 rows in set (0.01 sec)

SELECT 
	c.CustomerID 
	, c.CompanyName
	, od.OrderID
	, SUM(od.Quantity * UnitPrice) AS TotalOrderAmount
FROM Customers c 
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
WHERE  date_format(o.OrderDate, '%Y') = 1997
GROUP BY c.CustomerID
		, c.CompanyName
		, od.OrderID
ORDER BY TotalOrderAmount DESC 
;

-- mysql> SELECT  c.CustomerID  , c.CompanyName , od.OrderID , SUM(od.Quantity * UnitPrice) AS TotalOrderAmount FROM Customers c  JOIN Orders o ON c.CustomerID = o.CustomerID JOIN OrderDetails od ON o.OrderID = od.OrderID WHERE  date_format(o.OrderDate, '%Y') = 1997 GROUP BY c.CustomerID , c.CompanyName , od.OrderID ORDER BY TotalOrderAmount DESC limit 5;
-- +------------+----------------------------+---------+------------------+
-- | CustomerID | CompanyName                | OrderID | TotalOrderAmount |
-- +------------+----------------------------+---------+------------------+
-- | MEREP      | Mre Paillarde              |   10424 |       11493.2000 |
-- | SIMOB      | Simons bistro              |   10417 |       11283.2000 |
-- | QUICK      | QUICK-Stop                 |   10515 |       10588.5000 |
-- | RATTC      | Rattlesnake Canyon Grocery |   10479 |       10495.6000 |
-- | QUICK      | QUICK-Stop                 |   10540 |       10191.7000 |
-- +------------+----------------------------+---------+------------------+
-- 5 rows in set (0.01 sec)

SELECT 
	c.CustomerID 
	, c.CompanyName
	, od.OrderID
	, SUM(od.Quantity * UnitPrice) AS TotalOrderAmount
FROM Customers c 
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
WHERE  date_format(o.OrderDate, '%Y') = 1997
GROUP BY c.CustomerID
		, c.CompanyName
		, od.OrderID
HAVING SUM(Quantity * UnitPrice) > 10000
ORDER BY TotalOrderAmount DESC 
;
-- +------------+----------------------------+---------+------------------+
-- | CustomerID | CompanyName                | OrderID | TotalOrderAmount |
-- +------------+----------------------------+---------+------------------+
-- | MEREP      | Mre Paillarde              |   10424 |       11493.2000 |
-- | SIMOB      | Simons bistro              |   10417 |       11283.2000 |
-- | QUICK      | QUICK-Stop                 |   10515 |       10588.5000 |
-- | RATTC      | Rattlesnake Canyon Grocery |   10479 |       10495.6000 |
-- | QUICK      | QUICK-Stop                 |   10540 |       10191.7000 |
-- | QUICK      | QUICK-Stop                 |   10691 |       10164.8000 |
-- +------------+----------------------------+---------+------------------+
-- 6 rows in set (0.02 sec)
-- Error if put the math logic in an AND clause after the WHERE 
-- ERROR 1111 (HY000): Invalid use of group function -- come back to the solutions after working on the others 



'''

High-value customers - total orders  
    The manager has changed his mind. 
    Instead of requiring that customers have at least one individual order(s) totaling $10,000 or more, 
    he wants to define high-value customers as those 
    who have (all) orders totaling $15,000 or more in 2016. -- needs to be 1997 for my data to work 
    How would you change the answer to the problem above?

'''
SELECT 
	c.CustomerID 
	, c.CompanyName
	-- , od.OrderID
	, SUM(od.Quantity * UnitPrice) AS TotalOrderAmount
FROM Customers c 
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
WHERE  date_format(o.OrderDate, '%Y') = 1997
GROUP BY c.CustomerID
		, c.CompanyName
		-- , od.OrderID
HAVING SUM(Quantity * UnitPrice) > 15000
ORDER BY TotalOrderAmount DESC 
;

-- +------------+------------------------------+------------------+
-- | CustomerID | CompanyName                  | TotalOrderAmount |
-- +------------+------------------------------+------------------+
-- | QUICK      | QUICK-Stop                   |       64238.0000 |
-- | SAVEA      | Save-a-lot Markets           |       60672.6400 |
-- | ERNSH      | Ernst Handel                 |       53467.3800 |
-- | MEREP      | Mre Paillarde                |       26087.1000 |
-- | HUNGO      | Hungry Owl All-Night Grocers |       23959.0500 |
-- | RATTC      | Rattlesnake Canyon Grocery   |       19658.7000 |
-- | SIMOB      | Simons bistro                |       17482.1500 |
-- +------------+------------------------------+------------------+
-- 7 rows in set (0.01 sec)



'''
This time were are calculating the discount and without discount 

Change the above query 
to use the discount when calculating high-value customers. 

Order by the total amount which includes the discount.

'''

SELECT 
    	 OrderID  
    	,ProductID  
    	,UnitPrice  
    	,Quantity  
    	,Discount   
    	,UnitPrice * Quantity * (1 - Discount)  AS TotalWithDisccount
FROM OrderDetails; 

-- +---------+-----------+-----------+----------+----------+--------------------+
-- | OrderID | ProductID | UnitPrice | Quantity | Discount | TotalWithDisccount |
-- +---------+-----------+-----------+----------+----------+--------------------+
-- |   10248 |        11 |   14.0000 |       12 |        0 |           168.0000 |
-- |   10248 |        42 |    9.8000 |       10 |        0 |            98.0000 |
-- |   10248 |        72 |   34.8000 |        5 |        0 |           174.0000 |
-- |   10249 |        14 |   18.6000 |        9 |        0 |           167.4000 |
-- |   10249 |        51 |   42.4000 |       40 |        0 |          1696.0000 |
-- |   10250 |        41 |    7.7000 |       10 |        0 |            77.0000 |
-- |   10250 |        51 |   42.4000 |       35 |        0 |          1484.0000 |
-- |   10250 |        65 |   16.8000 |       15 |        0 |           252.0000 |
-- |   10251 |        22 |   16.8000 |        6 |        0 |           100.8000 |
-- |   10251 |        57 |   15.6000 |       15 |        0 |           234.0000 |
-- +---------+-----------+-----------+----------+----------+--------------------+
-- 10 rows in set (0.01 sec)


SELECT 
	c.CustomerID 
	, c.CompanyName
	, od.OrderID
	,  SUM(od.Quantity * UnitPrice) AS TotalOrderAmount
	,  SUM(od.Quantity * UnitPrice * (1 - Discount)) AS TotalWithDisccount
FROM Customers c 
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
WHERE  date_format(o.OrderDate, '%Y') = 1997
GROUP BY c.CustomerID
		, c.CompanyName
		, od.OrderID
HAVING SUM(od.Quantity * UnitPrice * (1 - Discount)) > 10000 -- needs to change to be the full discount too 
ORDER BY TotalWithDisccount DESC 
;


SELECT   
    	Customers.CustomerID  
    	, Customers.CompanyName  
    	, SUM(Quantity * UnitPrice)  AS TotalsWithoutDiscount 
    	, SUM(Quantity * UnitPrice * (1- Discount))   AS TotalsWithDiscount
FROM Customers  
JOIN Orders  
    ON Orders.CustomerID = Customers.CustomerID  
JOIN OrderDetails  
  	ON Orders.OrderID = OrderDetails.OrderID  
WHERE  
    	OrderDate >= '19970101'   
AND 	OrderDate < '19980101'  
GROUP BY   
    	 Customers.CustomerID  
    	, Customers.CompanyName  
HAVING SUM(Quantity * UnitPrice * (1- Discount)) > 10000  
ORDER BY TotalsWithDiscount DESC;
-- +------------+------------------------------+-----------------------+--------------------+
-- | CustomerID | CompanyName                  | TotalsWithoutDiscount | TotalsWithDiscount |
-- +------------+------------------------------+-----------------------+--------------------+
-- | QUICK      | QUICK-Stop                   |            64238.0000 |         64238.0000 |
-- | SAVEA      | Save-a-lot Markets           |            60672.6400 |         60672.6400 |
-- | ERNSH      | Ernst Handel                 |            53467.3800 |         53467.3800 |
-- | MEREP      | Mre Paillarde                |            26087.1000 |         26087.1000 |
-- | HUNGO      | Hungry Owl All-Night Grocers |            23959.0500 |         23959.0500 |
-- | RATTC      | Rattlesnake Canyon Grocery   |            19658.7000 |         19658.7000 |
-- | SIMOB      | Simons bistro                |            17482.1500 |         17482.1500 |
-- | BERGS      | Berglunds snabbkp            |            14533.2000 |         14533.2000 |
-- | LEHMS      | Lehmanns Marktstand          |            14433.1700 |         14433.1700 |
-- | HILAA      | HILARION-Abastos             |            14026.1800 |         14026.1800 |
-- | FOLKO      | Folk och f HB                |            13491.5000 |         13491.5000 |
-- | WARTH      | Wartian Herkku               |            13106.3000 |         13106.3000 |
-- | BONAP      | Bon app'                     |            12462.5500 |         12462.5500 |
-- | FRANK      | Frankenversand               |            12433.1100 |         12433.1100 |
-- | RICSU      | Richter Supermarkt           |            12044.8000 |         12044.8000 |
-- | FOLIG      | Folies gourmandes            |            11666.9000 |         11666.9000 |
-- | QUEEN      | Queen Cozinha                |            10937.2500 |         10937.2500 |
-- | WHITC      | White Clover Markets         |            10262.5500 |         10262.5500 |
-- +------------+------------------------------+-----------------------+--------------------+
-- 18 rows in set (0.00 sec)

SELECT   
    	Customers.CustomerID  
    	, Customers.CompanyName  
    	, SUM(Quantity * UnitPrice)  AS TotalsWithoutDiscount 
    	, SUM(Quantity * UnitPrice * (1- Discount))   AS TotalsWithDiscount
FROM Customers  
JOIN Orders  
    ON Orders.CustomerID = Customers.CustomerID  
JOIN OrderDetails  
  	ON Orders.OrderID = OrderDetails.OrderID  
WHERE  date_format(Orders.OrderDate, '%Y') = 1997
GROUP BY   
    	 Customers.CustomerID  
    	, Customers.CompanyName  
HAVING SUM(Quantity * UnitPrice * (1- Discount)) > 10000  
ORDER BY TotalsWithDiscount DESC

-- +------------+------------------------------+-----------------------+--------------------+
-- | CustomerID | CompanyName                  | TotalsWithoutDiscount | TotalsWithDiscount |
-- +------------+------------------------------+-----------------------+--------------------+
-- | QUICK      | QUICK-Stop                   |            64238.0000 |         64238.0000 |
-- | SAVEA      | Save-a-lot Markets           |            60672.6400 |         60672.6400 |
-- | ERNSH      | Ernst Handel                 |            53467.3800 |         53467.3800 |
-- | MEREP      | Mre Paillarde                |            26087.1000 |         26087.1000 |
-- | HUNGO      | Hungry Owl All-Night Grocers |            23959.0500 |         23959.0500 |
-- | RATTC      | Rattlesnake Canyon Grocery   |            19658.7000 |         19658.7000 |
-- | SIMOB      | Simons bistro                |            17482.1500 |         17482.1500 |
-- | BERGS      | Berglunds snabbkp            |            14533.2000 |         14533.2000 |
-- | LEHMS      | Lehmanns Marktstand          |            14433.1700 |         14433.1700 |
-- | HILAA      | HILARION-Abastos             |            14026.1800 |         14026.1800 |
-- | FOLKO      | Folk och f HB                |            13491.5000 |         13491.5000 |
-- | WARTH      | Wartian Herkku               |            13106.3000 |         13106.3000 |
-- | BONAP      | Bon app'                     |            12462.5500 |         12462.5500 |
-- | FRANK      | Frankenversand               |            12433.1100 |         12433.1100 |
-- | RICSU      | Richter Supermarkt           |            12044.8000 |         12044.8000 |
-- | FOLIG      | Folies gourmandes            |            11666.9000 |         11666.9000 |
-- | QUEEN      | Queen Cozinha                |            10937.2500 |         10937.2500 |
-- | WHITC      | White Clover Markets         |            10262.5500 |         10262.5500 |
-- +------------+------------------------------+-----------------------+--------------------+
-- 18 rows in set (0.01 sec


'''
35. Month-end orders  
    At the end of the month, salespeople are likely to try much harder to get orders, 
    to meet their month-end quotas. 

    Show all orders made on the last day of the month. 
    Order by EmployeeID and OrderID

    Hint  
    You can work on calculating this yourself, 
    with a combination of date functions such as DateAdd and DateDiff. 
    But feel free to shortcut the process by doing some research online.


    mysql> desc Orders;
		+----------------+---------------+------+-----+---------+----------------+
		| Field          | Type          | Null | Key | Default | Extra          |
		+----------------+---------------+------+-----+---------+----------------+
		| OrderID        | int           | NO   | PRI | NULL    | auto_increment |
		| CustomerID     | varchar(5)    | YES  | MUL | NULL    |                |
		| EmployeeID     | int           | YES  | MUL | NULL    |                |
		| OrderDate      | datetime      | YES  | MUL | NULL    |                |
		| RequiredDate   | datetime      | YES  |     | NULL    |                |
		| ShippedDate    | datetime      | YES  | MUL | NULL    |                |
		| ShipVia        | int           | YES  | MUL | NULL    |                |
		| Freight        | decimal(10,4) | YES  |     | 0.0000  |                |
		| ShipName       | varchar(40)   | YES  |     | NULL    |                |
		| ShipAddress    | varchar(60)   | YES  |     | NULL    |                |
		| ShipCity       | varchar(15)   | YES  |     | NULL    |                |
		| ShipRegion     | varchar(15)   | YES  |     | NULL    |                |
		| ShipPostalCode | varchar(10)   | YES  | MUL | NULL    |                |
		| ShipCountry    | varchar(15)   | YES  |     | NULL    |                |
		+----------------+---------------+------+-----+---------+----------------+
		14 rows in set (0.00 sec)

'''
-- select LAST_DAY(OrderDate) FROM Orders;

SELECT 
	LAST_DAY(OrderDate)
	, COUNT(LAST_DAY(OrderDate))
FROM Orders o 
GROUP BY LAST_DAY(OrderDate)


mysql> SELECT
    -> LAST_DAY(OrderDate)
    -> , COUNT(LAST_DAY(OrderDate))
    -> FROM Orders o
    -> GROUP BY LAST_DAY(OrderDate)
    -> ;
+---------------------+----------------------------+
| LAST_DAY(OrderDate) | COUNT(LAST_DAY(OrderDate)) |
+---------------------+----------------------------+
| 1996-07-31          |                         22 |
| 1996-08-31          |                         25 |
| 1996-09-30          |                         23 |
| 1996-10-31          |                         26 |
| 1996-11-30          |                         25 |
| 1996-12-31          |                         31 |
| 1997-01-31          |                         33 |
| 1997-02-28          |                         29 |
| 1997-03-31          |                         30 |
| 1997-04-30          |                         31 |
| 1997-05-31          |                         32 |
| 1997-06-30          |                         30 |
| 1997-07-31          |                         33 |
| 1997-08-31          |                         33 |
| 1997-09-30          |                         37 |
| 1997-10-31          |                         38 |
| 1997-11-30          |                         34 |
| 1997-12-31          |                         48 |
| 1998-01-31          |                         55 |
| 1998-02-28          |                         54 |
| 1998-03-31          |                         73 |
| 1998-04-30          |                         74 |
| 1998-05-31          |                         14 |
+---------------------+----------------------------+
23 rows in set (0.00 sec)

SELECT
     EmployeeID
     ,OrderID
     ,OrderDate
FROM Orders
WHERE OrderDate = LAST_DAY(OrderDate)
ORDER BY
     EmployeeID
     ,OrderID
;
--+------------+---------+---------------------+
--| EmployeeID | OrderID | OrderDate           |
--+------------+---------+---------------------+
--|          1 |   10461 | 1997-02-28 00:00:00 |
--|          1 |   10616 | 1997-07-31 00:00:00 |
--|          2 |   10583 | 1997-06-30 00:00:00 |
--|          2 |   10686 | 1997-09-30 00:00:00 |
--|          2 |   10989 | 1998-03-31 00:00:00 |
--|          2 |   11060 | 1998-04-30 00:00:00 |
--|          3 |   10432 | 1997-01-31 00:00:00 |
--|          3 |   10806 | 1997-12-31 00:00:00 |
--|          3 |   10988 | 1998-03-31 00:00:00 |
--|          3 |   11063 | 1998-04-30 00:00:00 |
--|          4 |   10343 | 1996-10-31 00:00:00 |
--|          4 |   10522 | 1997-04-30 00:00:00 |
--|          4 |   10584 | 1997-06-30 00:00:00 |
--|          4 |   10617 | 1997-07-31 00:00:00 |
--|          4 |   10725 | 1997-10-31 00:00:00 |
--|          4 |   10807 | 1997-12-31 00:00:00 |
--|          4 |   11061 | 1998-04-30 00:00:00 |
--|          4 |   11062 | 1998-04-30 00:00:00 |
--|          5 |   10269 | 1996-07-31 00:00:00 |
--|          6 |   10317 | 1996-09-30 00:00:00 |
--|          7 |   10490 | 1997-03-31 00:00:00 |
--|          8 |   10399 | 1996-12-31 00:00:00 |
--|          8 |   10460 | 1997-02-28 00:00:00 |
--|          8 |   10491 | 1997-03-31 00:00:00 |
--|          8 |   10987 | 1998-03-31 00:00:00 |
--|          9 |   10687 | 1997-09-30 00:00:00 |
--+------------+---------+---------------------+
-- 26 rows in set (0.01 sec)


'''
36. Orders with many line items  
    The Northwind mobile app developers are testing an app that customers will use to show orders. 
    In order to make sure that even the largest orders will show up correctly on the app, 
    they'd like some samples of orders that have lots of individual line items. 

    Show the 10 orders with the most line items, 
    in order of total line items.

    Hint  
    Using Orders and OrderDetails, you'll use Group by and count() functionality.

    mysql> desc OrderDetails;
		+-----------+---------------+------+-----+---------+-------+
		| Field     | Type          | Null | Key | Default | Extra |
		+-----------+---------------+------+-----+---------+-------+
		| OrderID   | int           | NO   | PRI | NULL    |       |
		| ProductID | int           | NO   | PRI | NULL    |       |
		| UnitPrice | decimal(10,4) | NO   |     | 0.0000  |       |
		| Quantity  | smallint      | NO   |     | 1       |       |
		| Discount  | double(8,0)   | NO   |     | 0       |       |
		+-----------+---------------+------+-----+---------+-------+
		5 rows in set (0.00 sec)

			mysql> select count(*) FROM OrderDetails;
			+----------+
			| count(*) |
			+----------+
			|     2155 |
			+----------+
			1 row in set (0.00 sec)

			mysql> select count(distinct(OrderID)) FROM OrderDetails;
			+--------------------------+
			| count(distinct(OrderID)) |
			+--------------------------+
			|                      830 |
			+--------------------------+
			1 row in set (0.01 sec)

			mysql> select count(distinct(OrderID)) FROM Orders;
				+--------------------------+
				| count(distinct(OrderID)) |
				+--------------------------+
				|                      830 |
				+--------------------------+
				1 row in set (0.00 sec)

				mysql> select count(*) FROM Orders;
				+----------+
				| count(*) |
				+----------+
				|      830 |
				+----------+
				1 row in set (0.00 sec)

'''

SELECT  o.OrderID , count(od.OrderID) as TotalOrderDetails 
FROM OrderDetails od 
JOIN Orders o ON o.OrderID = od.OrderID 
GROUP BY o.OrderID 
HAVING TotalOrderDetails > 5;

-- +---------+-------------------+
-- | OrderID | TotalOrderDetails |
-- +---------+-------------------+
-- |   10657 |                 6 |
-- |   10847 |                 6 |
-- |   10979 |                 6 |
-- |   11077 |                25 |
-- +---------+-------------------+
-- 4 rows in set (0.01 sec)


SELECT -- top 10
    Orders.OrderID
    , count(*)  AS TotalOrderDetails
    FROM Orders
    Join OrderDetails
    on Orders.OrderID = OrderDetails.OrderID
    Group By Orders.OrderID
    Order By count(*) desc
    LIMIT 10; -- the results FROM this book show this but they wanted > 10 so the HAVING clause above 
-- +---------+-------------------+
-- | OrderID | TotalOrderDetails |
-- +---------+-------------------+
-- |   11077 |                25 |
-- |   10979 |                 6 |
-- |   10657 |                 6 |
-- |   10847 |                 6 |
-- |   10393 |                 5 |
-- |   10294 |                 5 |
-- |   10324 |                 5 |
-- |   10273 |                 5 |
-- |   10337 |                 5 |
-- |   10360 |                 5 |
-- +---------+-------------------+
-- 10 rows in set (0.00 sec)


'''
37. Orders - random assortment  
    The Northwind mobile app developers would now like to just get a random assortment of orders for beta testing on their app. 
    Show a random set of 2% of all orders.

This is MySQL so I need to do the following 
https://phpfog.com/select-random-sample-records-mysql/#:~:text=RAND()%20returns%20a%20random,%3C%200.2%20%2C%20and%20so%20on.

'''
-- THIS IS AWESOME! 

SELECT OrderID FROM Orders WHERE RAND() < .02;
-- +---------+
-- | OrderID |
-- +---------+
-- |   10275 |
-- |   10486 |
-- |   10671 |
-- |   11001 |
-- |   11032 |
-- |   11073 |
-- |   10432 |
-- |   10807 |
-- |   10843 |
-- |   10901 |
-- |   10711 |
-- |   10249 |
-- |   10661 |
-- |   10890 |
-- |   11051 |
-- |   10380 |
-- |   10421 |
-- |   10534 |
-- |   10997 |
-- |   10687 |
-- |   10771 |
-- +---------+
-- 21 rows in set (0.00 sec)

-- on 38 out of 50 SQL queries and these are the advanced ones...  
-- getting a good idea of SQL on this... now to find more <3 

'''
“38. Orders - accidental double-entry  
    Janet Leverling, one of the salespeople, 
    has come to you with a request. 

    She thinks that she accidentally double-entered a line item on an order, 
    with a different ProductID, but the same quantity. 
    She remembers that the quantity was 60 or more. 

    Show all the OrderIDs with line items that match this, in order of OrderID.

    “Hint  
    In addition to grouping on the OrderID, we also need to group by the Quantity, 
    since we need to show the order details that have the same quantity, 
    within an order. 
    So, we need to group by both OrderID, and Quantity.”

		Excerpt FROM
		SQL Practice Problems: 57 beginning, intermediate, and advanced challenges for you to solve using a "learn-by-doing" approach
		Sylvia Moestl Vasilik
		This material may be protected by copyright.
'''
mysql> 
SELECT  
		OrderID
		, ProductID
		, Quantity
		, count(OrderId) 
FROM  OrderDetails 
WHERE Quantity > 60 
GROUP BY OrderID, ProductID, Quantity 
ORDER BY OrderID, Quantity limit 10;
-- +---------+-----------+----------+----------------+
-- | OrderID | ProductID | Quantity | count(OrderId) |
-- +---------+-----------+----------+----------------+
-- |   11021 |        26 |       63 |              1 |
-- |   10258 |         5 |       65 |              1 |
-- |   10854 |        13 |       65 |              1 |
-- |   10990 |        21 |       65 |              1 |
-- |   10795 |        16 |       65 |              1 |
-- |   10595 |        69 |       65 |              1 |
-- |   10698 |        65 |       65 |              1 |
-- |   10990 |        55 |       65 |              1 |
-- |   10402 |        63 |       65 |              1 |
-- |   10990 |        61 |       66 |              1 |
-- +---------+-----------+----------+----------------+
-- 10 rows in set (0.01 sec)


SELECT  
		OrderID
		, ProductID
		, Quantity
		, count(OrderId) 
FROM  OrderDetails 
WHERE Quantity >= 60 
GROUP BY OrderID, ProductID, Quantity 
HAVING count(OrderId) > 1 
ORDER BY OrderID, ProductID, Quantity limit 10;

-- The answer was one I had not thought would work because the count was not in the select and in the HAVING

SELECT  
		OrderID 
FROM  OrderDetails 
WHERE Quantity >= 60 
GROUP BY  OrderID
		, Quantity -- because group by on both order id and quantity this works 
HAVING count(*) > 1 
ORDER BY OrderID, Quantity;


-- +---------+
-- | OrderID |
-- +---------+
-- |   10263 |
-- |   10658 |
-- |   10990 |
-- |   11030 |
-- +---------+
-- 4 rows in set (0.00 sec)

-- Double checking 

mysql> select * FROM OrderDetails where OrderID in (10263, 10658, 10990, 11030) and Quantity >= 60 order by OrderID;
-- +---------+-----------+-----------+----------+----------+
-- | OrderID | ProductID | UnitPrice | Quantity | Discount |
-- +---------+-----------+-----------+----------+----------+
-- |   10263 |        16 |   13.9000 |       60 |        0 |
-- |   10263 |        30 |   20.7000 |       60 |        0 |
-- |   10658 |        21 |   10.0000 |       60 |        0 |
-- |   10658 |        40 |   18.4000 |       70 |        0 |
-- |   10658 |        77 |   13.0000 |       70 |        0 |
-- |   10990 |        21 |   10.0000 |       65 |        0 |
-- |   10990 |        34 |   14.0000 |       60 |        0 |
-- |   10990 |        55 |   24.0000 |       65 |        0 |
-- |   10990 |        61 |   28.5000 |       66 |        0 |
-- |   11030 |         2 |   19.0000 |      100 |        0 |
-- |   11030 |         5 |   21.3500 |       70 |        0 |
-- |   11030 |        29 |  123.7900 |       60 |        0 |
-- |   11030 |        59 |   55.0000 |      100 |        0 |
-- +---------+-----------+-----------+----------+----------+
-- 13 rows in set (0.00 sec)


'''
Orders - accidental double-entry details  
    Based on the previous question, 
    we now want to show details of the order, 
    for orders that match the above criteria.

    “Hint  
    There are many ways of doing this, including CTE (common table expression) and derived tables. 
    I suggest using a CTE and a subquery. Here's a good article on CTEs (https://technet.microsoft.com/en-us/library/ms175972.aspx).   
    This is an example of a simple CTE in Northwind. 
    It returns orders made by the oldest employee:  
    
    WITH OldestEmployee AS (  
	    Select top 1  
	    	EmployeeID  
	    FROM Employees  
	    order by BirthDate   
    )  
    Select  
    	OrderID  
    	,OrderDate  
    FROM Orders  
    where   
    	EmployeeID in (Select EmployeeID FROM OldestEmployee)

'''

-- Sub Query 
SELECT 
	OrderID
	, ProductID
	, UnitPrice
	, Quantity
	, Discount
FROM OrderDetails 
WHERE OrderID 
IN (   						-- This becomes the CTE main body and the CTE name is the subquery
	SELECT  
		OrderID 
	FROM  OrderDetails 
	WHERE Quantity >= 60 
	GROUP BY  OrderID
			, Quantity -- because group by on both order id and quantity this works 
	HAVING count(*) > 1 
	ORDER BY OrderID, Quantity
) 
AND Quantity >= 60 
ORDER BY OrderID

-- +---------+-----------+-----------+----------+----------+
-- | OrderID | ProductID | UnitPrice | Quantity | Discount |
-- +---------+-----------+-----------+----------+----------+
-- |   10263 |        16 |   13.9000 |       60 |        0 |
-- |   10263 |        30 |   20.7000 |       60 |        0 |
-- |   10658 |        21 |   10.0000 |       60 |        0 |
-- |   10658 |        40 |   18.4000 |       70 |        0 |
-- |   10658 |        77 |   13.0000 |       70 |        0 |
-- |   10990 |        21 |   10.0000 |       65 |        0 |
-- |   10990 |        34 |   14.0000 |       60 |        0 |
-- |   10990 |        55 |   24.0000 |       65 |        0 |
-- |   10990 |        61 |   28.5000 |       66 |        0 |
-- |   11030 |         2 |   19.0000 |      100 |        0 |
-- |   11030 |         5 |   21.3500 |       70 |        0 |
-- |   11030 |        29 |  123.7900 |       60 |        0 |
-- |   11030 |        59 |   55.0000 |      100 |        0 |
-- +---------+-----------+-----------+----------+----------+
-- 13 rows in set (0.00 sec)

-- Common Table Expression 
WITH double_entry AS (
	SELECT  
		OrderID 
	FROM  OrderDetails 
	WHERE Quantity >= 60 -- when I take this out FROM a prefilter point of view there are 24 records vs 13 -- interesting -- 13 is accurate FROM above 
	GROUP BY  OrderID
			, Quantity -- because group by on both order id and quantity this works 
	HAVING count(*) > 1 
	ORDER BY OrderID, Quantity
) 
SELECT 
	OrderID
	, ProductID
	, UnitPrice
	, Quantity
	, Discount
FROM OrderDetails 
WHERE OrderID in (SELECT OrderID FROM double_entry where Quantity >= 60)
AND Quantity >= 60
ORDER BY OrderID, Quantity; 

-- +---------+-----------+-----------+----------+----------+
-- | OrderID | ProductID | UnitPrice | Quantity | Discount |
-- +---------+-----------+-----------+----------+----------+
-- |   10263 |        16 |   13.9000 |       60 |        0 |
-- |   10263 |        30 |   20.7000 |       60 |        0 |
-- |   10658 |        21 |   10.0000 |       60 |        0 |
-- |   10658 |        40 |   18.4000 |       70 |        0 |
-- |   10658 |        77 |   13.0000 |       70 |        0 |
-- |   10990 |        34 |   14.0000 |       60 |        0 |
-- |   10990 |        21 |   10.0000 |       65 |        0 |
-- |   10990 |        55 |   24.0000 |       65 |        0 |
-- |   10990 |        61 |   28.5000 |       66 |        0 |
-- |   11030 |        29 |  123.7900 |       60 |        0 |
-- |   11030 |         5 |   21.3500 |       70 |        0 |
-- |   11030 |         2 |   19.0000 |      100 |        0 |
-- |   11030 |        59 |   55.0000 |      100 |        0 |
-- +---------+-----------+-----------+----------+----------+
-- 13 rows in set (0.01 sec)
-- 24 vs thirteen output 

-- +---------+-----------+-----------+----------+----------+
-- | OrderID | ProductID | UnitPrice | Quantity | Discount |
-- +---------+-----------+-----------+----------+----------+
-- |   10263 |        16 |   13.9000 |       60 |        0 |
-- |   10263 |        30 |   20.7000 |       60 |        0 |
-- |   10479 |        59 |   44.0000 |       60 |        0 |
-- |   10485 |        70 |   12.0000 |       60 |        0 |
-- |   10514 |        56 |   38.0000 |       70 |        0 |
-- |   10515 |        60 |   34.0000 |       84 |        0 |
-- |   10515 |        27 |   43.9000 |      120 |        0 |
-- |   10658 |        21 |   10.0000 |       60 |        0 |
-- |   10658 |        40 |   18.4000 |       70 |        0 |
-- |   10658 |        77 |   13.0000 |       70 |        0 |
-- |   10670 |        46 |   12.0000 |       60 |        0 |
-- |   10678 |        12 |   38.0000 |      100 |        0 |
-- |   10678 |        41 |    9.6500 |      120 |        0 |
-- |   10698 |        65 |   21.0500 |       65 |        0 |
-- |   10990 |        34 |   14.0000 |       60 |        0 |
-- |   10990 |        21 |   10.0000 |       65 |        0 |
-- |   10990 |        55 |   24.0000 |       65 |        0 |
-- |   10990 |        61 |   28.5000 |       66 |        0 |
-- |   11001 |         7 |   30.0000 |       60 |        0 |
-- |   11030 |        29 |  123.7900 |       60 |        0 |
-- |   11030 |         5 |   21.3500 |       70 |        0 |
-- |   11030 |         2 |   19.0000 |      100 |        0 |
-- |   11030 |        59 |   55.0000 |      100 |        0 |
-- |   11035 |        35 |   18.0000 |       60 |        0 |
-- +---------+-----------+-----------+----------+----------+
-- 24 rows in set (0.00 sec)



'''
40. Orders - accidental double-entry details, derived table  
    Here's another way of getting the same results as in the previous problem, using a derived table instead of a CTE. 
    However, there's a bug in this SQL. It returns 20 rows instead of 16. Correct the SQL.  
    Problem SQL:  
    SELECT   
    		 OrderDetails.OrderID  
    		 ,ProductID  
    		 ,UnitPrice  
    		 ,Quantity  
    		 ,Discount  
    FROM OrderDetails   
    JOIN (  
		     Select   
		    	 OrderID   
		     FROM OrderDetails  
		     Where Quantity >= 60  
		     Group By OrderID, Quantity  
		     Having Count(*) > 1  
    ) PotentialProblemOrders  
    ON PotentialProblemOrders.OrderID = OrderDetails.OrderID  
    Order by OrderID, ProductID
;

'''


'''
41.  Late orders  
    Some customers are complaining about their orders arriving late. 
    Which orders are late?

    OrderID	OrderDate RequiredDate ShippedDate

-- mysql> desc Orders
--     -> ;
-- +----------------+---------------+------+-----+---------+----------------+
-- | Field          | Type          | Null | Key | Default | Extra          |
-- +----------------+---------------+------+-----+---------+----------------+
-- | OrderID        | int           | NO   | PRI | NULL    | auto_increment |
-- | CustomerID     | varchar(5)    | YES  | MUL | NULL    |                |
-- | EmployeeID     | int           | YES  | MUL | NULL    |                |
-- | OrderDate      | datetime      | YES  | MUL | NULL    |                |
-- | RequiredDate   | datetime      | YES  |     | NULL    |                |
-- | ShippedDate    | datetime      | YES  | MUL | NULL    |                |
-- | ShipVia        | int           | YES  | MUL | NULL    |                |
-- | Freight        | decimal(10,4) | YES  |     | 0.0000  |                |
-- | ShipName       | varchar(40)   | YES  |     | NULL    |                |
-- | ShipAddress    | varchar(60)   | YES  |     | NULL    |                |
-- | ShipCity       | varchar(15)   | YES  |     | NULL    |                |
-- | ShipRegion     | varchar(15)   | YES  |     | NULL    |                |
-- | ShipPostalCode | varchar(10)   | YES  | MUL | NULL    |                |
-- | ShipCountry    | varchar(15)   | YES  |     | NULL    |                |
-- +----------------+---------------+------+-----+---------+----------------+
-- 14 rows in set (0.01 sec)

'''

SELECT 
	OrderID
	, OrderDate
	, RequiredDate
	, ShippedDate
FROM Orders o 
WHERE ShippedDate > RequiredDate -- if it ships after it is required, it is late 

-- +---------+---------------------+---------------------+---------------------+
-- | OrderID | OrderDate           | RequiredDate        | ShippedDate         |
-- +---------+---------------------+---------------------+---------------------+
-- |   10264 | 1996-07-24 00:00:00 | 1996-08-21 00:00:00 | 1996-08-23 00:00:00 |
-- |   10271 | 1996-08-01 00:00:00 | 1996-08-29 00:00:00 | 1996-08-30 00:00:00 |
-- |   10280 | 1996-08-14 00:00:00 | 1996-09-11 00:00:00 | 1996-09-12 00:00:00 |
-- |   10302 | 1996-09-10 00:00:00 | 1996-10-08 00:00:00 | 1996-10-09 00:00:00 |
-- |   10309 | 1996-09-19 00:00:00 | 1996-10-17 00:00:00 | 1996-10-23 00:00:00 |
-- |   10320 | 1996-10-03 00:00:00 | 1996-10-17 00:00:00 | 1996-10-18 00:00:00 |
-- |   10380 | 1996-12-12 00:00:00 | 1997-01-09 00:00:00 | 1997-01-16 00:00:00 |
-- |   10423 | 1997-01-23 00:00:00 | 1997-02-06 00:00:00 | 1997-02-24 00:00:00 |
-- |   10427 | 1997-01-27 00:00:00 | 1997-02-24 00:00:00 | 1997-03-03 00:00:00 |
-- |   10433 | 1997-02-03 00:00:00 | 1997-03-03 00:00:00 | 1997-03-04 00:00:00 |
-- |   10451 | 1997-02-19 00:00:00 | 1997-03-05 00:00:00 | 1997-03-12 00:00:00 |
-- |   10483 | 1997-03-24 00:00:00 | 1997-04-21 00:00:00 | 1997-04-25 00:00:00 |
-- |   10515 | 1997-04-23 00:00:00 | 1997-05-07 00:00:00 | 1997-05-23 00:00:00 |
-- |   10523 | 1997-05-01 00:00:00 | 1997-05-29 00:00:00 | 1997-05-30 00:00:00 |
-- |   10545 | 1997-05-22 00:00:00 | 1997-06-19 00:00:00 | 1997-06-26 00:00:00 |
-- |   10578 | 1997-06-24 00:00:00 | 1997-07-22 00:00:00 | 1997-07-25 00:00:00 |
-- |   10593 | 1997-07-09 00:00:00 | 1997-08-06 00:00:00 | 1997-08-13 00:00:00 |
-- |   10596 | 1997-07-11 00:00:00 | 1997-08-08 00:00:00 | 1997-08-12 00:00:00 |
-- |   10660 | 1997-09-08 00:00:00 | 1997-10-06 00:00:00 | 1997-10-15 00:00:00 |
-- |   10663 | 1997-09-10 00:00:00 | 1997-09-24 00:00:00 | 1997-10-03 00:00:00 |
-- |   10687 | 1997-09-30 00:00:00 | 1997-10-28 00:00:00 | 1997-10-30 00:00:00 |
-- |   10705 | 1997-10-15 00:00:00 | 1997-11-12 00:00:00 | 1997-11-18 00:00:00 |
-- |   10709 | 1997-10-17 00:00:00 | 1997-11-14 00:00:00 | 1997-11-20 00:00:00 |
-- |   10726 | 1997-11-03 00:00:00 | 1997-11-17 00:00:00 | 1997-12-05 00:00:00 |
-- |   10727 | 1997-11-03 00:00:00 | 1997-12-01 00:00:00 | 1997-12-05 00:00:00 |
-- |   10749 | 1997-11-20 00:00:00 | 1997-12-18 00:00:00 | 1997-12-19 00:00:00 |
-- |   10777 | 1997-12-15 00:00:00 | 1997-12-29 00:00:00 | 1998-01-21 00:00:00 |
-- |   10779 | 1997-12-16 00:00:00 | 1998-01-13 00:00:00 | 1998-01-14 00:00:00 |
-- |   10807 | 1997-12-31 00:00:00 | 1998-01-28 00:00:00 | 1998-01-30 00:00:00 |
-- |   10816 | 1998-01-06 00:00:00 | 1998-02-03 00:00:00 | 1998-02-04 00:00:00 |
-- |   10827 | 1998-01-12 00:00:00 | 1998-01-26 00:00:00 | 1998-02-06 00:00:00 |
-- |   10828 | 1998-01-13 00:00:00 | 1998-01-27 00:00:00 | 1998-02-04 00:00:00 |
-- |   10847 | 1998-01-22 00:00:00 | 1998-02-05 00:00:00 | 1998-02-10 00:00:00 |
-- |   10924 | 1998-03-04 00:00:00 | 1998-04-01 00:00:00 | 1998-04-08 00:00:00 |
-- |   10927 | 1998-03-05 00:00:00 | 1998-04-02 00:00:00 | 1998-04-08 00:00:00 |
-- |   10960 | 1998-03-19 00:00:00 | 1998-04-02 00:00:00 | 1998-04-08 00:00:00 |
-- |   10970 | 1998-03-24 00:00:00 | 1998-04-07 00:00:00 | 1998-04-24 00:00:00 |
-- +---------+---------------------+---------------------+---------------------+
-- 37 rows in set (0.01 sec)


'''
42.Late orders - which employees?  
    Some salespeople have more orders arriving late than others. 
    Maybe they're not following up on the order process, 
	and need more training. 

	Which salespeople have the most orders arriving late?

''' 



SELECT
	 EmployeeID
	, count(OrderID) as order_totals 
FROM Orders o
WHERE ShippedDate > RequiredDate
GROUP BY EmployeeID
ORDER BY order_totals desc;


-- | EmployeeID | order_totals |
-- +------------+--------------+
-- |          4 |           10 |
-- |          3 |            5 |
-- |          2 |            4 |
-- |          7 |            4 |
-- |          8 |            4 |
-- |          9 |            4 |
-- |          6 |            3 |
-- |          1 |            2 |
-- |          5 |            1 |
-- +------------+--------------+
-- 9 rows in set (0.01 sec)


SELECT
	 e.EmployeeID
	 , e.FirstName
	 , e.LastName
	, count(o.OrderID) as order_totals 
FROM Orders o
JOIN Employees e ON o.EmployeeID = e.EmployeeID
WHERE o.ShippedDate > o.RequiredDate
GROUP BY e.EmployeeID, e.LastName
ORDER BY order_totals desc;

--| EmployeeID | FirstName | LastName  | order_totals |
--+------------+-----------+-----------+--------------+
--|          4 | Margaret  | Peacock   |           10 |
--|          3 | Janet     | Leverling |            5 |
--|          2 | Andrew    | Fuller    |            4 |
--|          7 | Robert    | King      |            4 |
--|          8 | Laura     | Callahan  |            4 |
--|          9 | Anne      | Dodsworth |            4 |
--|          6 | Michael   | Suyama    |            3 |
--|          1 | Nancy     | Davolio   |            2 |
--|          5 | Steven    | Buchanan  |            1 |
--+------------+-----------+-----------+--------------+
--9 rows in set (0.00 sec)



'''
43. Late orders vs. total orders  
    Andrew, the VP of sales, 
    has been doing some more thinking some more about the problem of late orders. 
    He realizes that just looking at the number of orders arriving late for each salesperson is not a good idea. 
    It needs to be compared against the total number of orders per salesperson. Return results like the following:

	EmployeeID LastName AllOrders LateOrders    
    1 Davolio 123 3  
    2 Fuller 96 4  
    3 Leverling 127 5  
    4 Peacock 156 10  
    6 Suyama 67 3  
    7 King 72 4  
    8 Callahan 104 5  
    9 Dodsworth 43 5  
      
    (8 row(s) affected)  
    
    “Hint  
    You can use more than one CTE in a query. That would be a straightforward way of solving this problem.”

'''

WITH late_orders AS (
   SELECT   
    	 o.EmployeeID  
    	 , Count(*) AS Late_Orders_Total
    FROM Orders  o 
    Where   
    	 o.RequiredDate <= ShippedDate  
    Group By   
    	 o.EmployeeID  
),
all_orders AS (
	SELECT   
    	 o.EmployeeID  
    	 , Count(*) AS All_Orders_Total
    FROM Orders o 
    Group By   
    	 o.EmployeeID
)
SELECT 
	ao.EmployeeID
	, lo.Late_Orders_Total
	, ao.All_Orders_Total
FROM late_orders lo
JOIN all_orders ao ON ao.EmployeeID = lo.EmployeeID
ORDER by lo.EmployeeID; 

-- +------------+-------------------+------------------+
-- | EmployeeID | Late_Orders_Total | All_Orders_Total |
-- +------------+-------------------+------------------+
-- |          1 |                 3 |              123 |
-- |          2 |                 4 |               96 |
-- |          3 |                 5 |              127 |
-- |          4 |                10 |              156 |
-- |          5 |                 1 |               42 |
-- |          6 |                 3 |               67 |
-- |          7 |                 4 |               72 |
-- |          8 |                 5 |              104 |
-- |          9 |                 5 |               43 |
-- +------------+-------------------+------------------+
-- 9 rows in set (0.01 sec)

	-- Late orders  
    SELECT   
    	 EmployeeID  
    	 ,TotalOrders = Count(*)  
    FROM Orders 
    WHERE   
    	 RequiredDate <= ShippedDate  
    GROUP BY   
    	 EmployeeID  
      
    -- Total orders  
    SELECT   
    	 EmployeeID  
    	 ,TotalOrders = Count(*)  
    FROM Orders  
    GROUP BY   
    	 EmployeeID


-- Common table expresssion
WITH LateOrders AS (  
     SELECT   
     	EmployeeID  
     	,TotalOrders = Count(*)  
     FROM Orders   
     WHERE   RequiredDate <= ShippedDate  
     GROUP BY   
   			EmployeeID  
    )  
    , AllOrders AS (  
     SELECT   
     	EmployeeID  
     	,TotalOrders = Count(*)  
     FROM Orders   
     GROUP BY   
     		EmployeeID  
    )  
SELECT   
     Employees.EmployeeID  
     ,LastName  
     ,AllOrders = AllOrders.TotalOrders  
     ,LateOrders = LateOrders.TotalOrders  
FROM Employees  
JOIN AllOrders   
ON AllOrders.EmployeeID = Employees.EmployeeID  
LEFT JOIN LateOrders  
ON LateOrders.EmployeeID = Employees.EmployeeID”


'''
44. Late orders vs. total orders - missing employee  
    There is an employee missing in the answer FROM the problem above. 
    Fix the SQL to show all employees who have taken orders.

'''
-- I got the correct answer with exercise 43 which includes emp id 5 
-- I think if it were null then I'd have to do funny left join 
-- checking the back of the book to make sure (yep - left join needed to find NULL)

WITH late_orders AS (
   SELECT   
    	 o.EmployeeID  
    	 , Count(*) AS Late_Orders_Total
    FROM Orders  o 
    Where   
    	 o.RequiredDate <= ShippedDate  
    Group By   
    	 o.EmployeeID  
)
SELECT 
	lo.EmployeeID
	, lo.Late_Orders_Total
	-- , ao.All_Orders_Total
FROM late_orders lo
-- JOIN all_orders ao ON ao.EmployeeID = lo.EmployeeID
ORDER by lo.EmployeeID; 



-- AND this works too 

WITH all_orders AS (
	SELECT   
    	 o.EmployeeID  
    	 , Count(*) AS All_Orders_Total
    FROM Orders o 
    Group By   
    	 o.EmployeeID
)
SELECT 
	ao.EmployeeID
	-- , lo.Late_Orders_Total
	, ao.All_Orders_Total
FROM all_orders ao 
ORDER by ao.EmployeeID; 


-- Book solution 



'''
44.		 Late orders vs. total orders - missing employee  
    Answer : in my data set the emp id 5 is not showing a null for late orders as there is 1 order so it does not fall out the same as the book 

 mysql> select * from Orders where EmployeeID = 5 and  RequiredDate <= ShippedDate ;
+---------+------------+------------+---------------------+---------------------+---------------------+---------+---------+----------------+-------------+----------+------------+----------------+-------------+
| OrderID | CustomerID | EmployeeID | OrderDate           | RequiredDate        | ShippedDate         | ShipVia | Freight | ShipName       | ShipAddress | ShipCity | ShipRegion | ShipPostalCode | ShipCountry |
+---------+------------+------------+---------------------+---------------------+---------------------+---------+---------+----------------+-------------+----------+------------+----------------+-------------+
|   10320 | WARTH      |          5 | 1996-10-03 00:00:00 | 1996-10-17 00:00:00 | 1996-10-18 00:00:00 |       3 | 34.5700 | Wartian Herkku | Torikatu 38 | Oulu     | NULL       | 90110          | Finland     |
+---------+------------+------------+---------------------+---------------------+---------------------+---------+---------+----------------+-------------+----------+------------+----------------+-------------+
1 row in set (0.00 sec)
'''

WITH LateOrders as (  
	 Select   
   	 EmployeeID  
   	 ,Count(*)  as TotalOrders 
	 FROM Orders   
	 Where   
	 	RequiredDate <= ShippedDate  
	 Group By   
	 EmployeeID  
)  
, AllOrders as (  
	 Select   
    EmployeeID  
    ,Count(*) as TotalOrders 
	 FROM Orders   
	 Group By   
	 EmployeeID  
)  
Select   
	 Employees.EmployeeID  
	 ,LastName  
	 , AllOrders.TotalOrders  as AllOrders 
	 , LateOrders.TotalOrders as LateOrders 
FROM Employees  
JOIN AllOrders   
	 on AllOrders.EmployeeID = Employees.EmployeeID  
LEFT JOIN LateOrders  
	 on LateOrders.EmployeeID = Employees.EmployeeID
;

+------------+-----------+-----------+------------+
| EmployeeID | LastName  | AllOrders | LateOrders |
+------------+-----------+-----------+------------+
|          5 | Buchanan  |        42 |          1 |
|          8 | Callahan  |       104 |          5 |
|          1 | Davolio   |       123 |          3 |
|          9 | Dodsworth |        43 |          5 |
|          2 | Fuller    |        96 |          4 |
|          7 | King      |        72 |          4 |
|          3 | Leverling |       127 |          5 |
|          4 | Peacock   |       156 |         10 |
|          6 | Suyama    |        67 |          3 |
+------------+-----------+-----------+------------+
9 rows in set (0.00 sec)


'''
Well this is a pain because the next query builds on #44 
45. Late orders vs. total orders - fix null  
    Continuing on the answer for above query, 
    let us fix the results for row 5 - Buchanan. 
    He should have a 0 instead of a Null in LateOrders.

    Answer: Find a function to test if a value is null, and return a different value when it is.

'''

WITH LateOrders AS (  
     SELECT   
	     EmployeeID  
	     ,COUNT(*)  AS TotalOrders 
     FROM Orders   
     WHERE   
     	RequiredDate <= ShippedDate  
     GROUP BY   
     	EmployeeID  
    )  
    , AllOrders as (  
     SELECT   
	     EmployeeID  
	     ,COUNT(*)  AS TotalOrders 
     FROM Orders   
     GROUP BY   
     	EmployeeID  
    )  
    SELECT   
	     Employees.EmployeeID  
	     ,LastName  
	     ,AllOrders.TotalOrders  AS AllOrders 
	     ,ISNULL(LateOrders.TotalOrders) AS is_LateOrders 
	     				-- ISNULL makes the is_LateOrders a boolean, if we needed it to be a number then it looks like in MySQL this has to be a CASE statement 
    FROM Employees  
     JOIN AllOrders   
     	ON AllOrders.EmployeeID = Employees.EmployeeID  
     LEFT JOIN LateOrders  
     	ON LateOrders.EmployeeID = Employees.EmployeeID  
;

-- +------------+-----------+-----------+------------+
-- | EmployeeID | LastName  | AllOrders | LateOrders |
-- +------------+-----------+-----------+------------+
-- |          5 | Buchanan  |        42 |          0 |
-- |          8 | Callahan  |       104 |          0 |
-- |          1 | Davolio   |       123 |          0 |
-- |          9 | Dodsworth |        43 |          0 |
-- |          2 | Fuller    |        96 |          0 |
-- |          7 | King      |        72 |          0 |
-- |          3 | Leverling |       127 |          0 |
-- |          4 | Peacock   |       156 |          0 |
-- |          6 | Suyama    |        67 |          0 |
-- +------------+-----------+-----------+------------+
-- 9 rows in set (0.00 sec)



'''
46.  Late orders vs. total orders - percentage  
    Now we want to get the percentage of late orders over total orders.

    Expected Result 

    EmployeeID LastName 	AllOrders LateOrders PercentLateOrders  
    1 			Davolio 	123 		3 		0.0243902439024  
    2 			Fuller 		96 			4 		0.0416666666666  
    3 			Leverling 	127 		5 		0.0393700787401  
    4 			Peacock 	156 		10 		0.0641025641025  
    5 			Buchanan 	42 			0 		0.0000000000000  
    6 			Suyama 		67 			3 		0.0447761194029  
    7 			King 		72 			4 		0.0555555555555  
    8 			Callahan 	104 		5 		0.0480769230769  
    9 			Dodsworth 	43 			5 		0.1162790697674  
      
    (9 row(s) affected)

	Hint  
    By dividing late orders by total orders, you should be able to get the percentage of orders that are late. 
    However, there is a common problem people run into, 
    which is that an integer divided by an integer returns an integer. 
    For instance, if you run the following SQL to divide 3 by 2:  
    select 3/2  
    You’ll get 1 instead of 1.5, because it will return the closest integer.  
    Do some research online to find the answer to this issue.

    mysql> select 3/2;
		+--------+
		| 3/2    |
		+--------+
		| 1.5000 |
		+--------+
		1 row in set (0.00 sec)

'''

WITH LateOrders AS (  
     SELECT   
	     EmployeeID  
	     ,COUNT(*)  AS TotalOrders 
     FROM Orders   
     WHERE   
     	RequiredDate <= ShippedDate  
     GROUP BY   
     	EmployeeID  
    )  
    , AllOrders as (  
     SELECT   
	     EmployeeID  
	     ,COUNT(*)  AS TotalOrders 
     FROM Orders   
     GROUP BY   
     	EmployeeID  
    )  
    SELECT   
	     Employees.EmployeeID  
	     ,LastName  
	     ,AllOrders.TotalOrders  AS AllOrders 
	     ,ISNULL(LateOrders.TotalOrders) AS is_LateOrders 
	     				-- ISNULL makes the is_LateOrders a boolean, if we needed it to be a number then it looks like in MySQL this has to be a CASE statement
	     ,  (LateOrders.TotalOrders / AllOrders.TotalOrders) * 100 AS PercentLateOrders
    FROM Employees  
     JOIN AllOrders   
     	ON AllOrders.EmployeeID = Employees.EmployeeID  
     LEFT JOIN LateOrders  
     	ON LateOrders.EmployeeID = Employees.EmployeeID  
;

-- +------------+-----------+-----------+---------------+-------------------+
-- | EmployeeID | LastName  | AllOrders | is_LateOrders | PercentLateOrders |
-- +------------+-----------+-----------+---------------+-------------------+
-- |          5 | Buchanan  |        42 |             0 |            0.0238 |
-- |          8 | Callahan  |       104 |             0 |            0.0481 |
-- |          1 | Davolio   |       123 |             0 |            0.0244 |
-- |          9 | Dodsworth |        43 |             0 |            0.1163 |
-- |          2 | Fuller    |        96 |             0 |            0.0417 |
-- |          7 | King      |        72 |             0 |            0.0556 |
-- |          3 | Leverling |       127 |             0 |            0.0394 |
-- |          4 | Peacock   |       156 |             0 |            0.0641 |
-- |          6 | Suyama    |        67 |             0 |            0.0448 |
-- +------------+-----------+-----------+---------------+-------------------+
-- 9 rows in set (0.01 sec)

-- With it being calculated out of 100% then it shows up as 
-- +------------+-----------+-----------+---------------+-------------------+
-- | EmployeeID | LastName  | AllOrders | is_LateOrders | PercentLateOrders |
-- +------------+-----------+-----------+---------------+-------------------+
-- |          5 | Buchanan  |        42 |             0 |            2.3810 |
-- |          8 | Callahan  |       104 |             0 |            4.8077 |
-- |          1 | Davolio   |       123 |             0 |            2.4390 |
-- |          9 | Dodsworth |        43 |             0 |           11.6279 |
-- |          2 | Fuller    |        96 |             0 |            4.1667 |
-- |          7 | King      |        72 |             0 |            5.5556 |
-- |          3 | Leverling |       127 |             0 |            3.9370 |
-- |          4 | Peacock   |       156 |             0 |            6.4103 |
-- |          6 | Suyama    |        67 |             0 |            4.4776 |
-- +------------+-----------+-----------+---------------+-------------------+
-- 9 rows in set (0.01 sec)


'''

48. Customer grouping  
    Andrew Fuller, the VP of sales at Northwind, would like to do a sales campaign for existing customers. 

    He would like to categorize customers into groups, 
    based on how much they ordered in 2016 (1997 in my data as he modded his). 
    THEN, depending on which group the customer is in, he will target the customer with different sales materials.  

    The customer grouping (CustomerGroup) categories are 	
    	0 to 1,000 				Low 
    	1,000 to 5,000 			Medium 
    	5,000 to 10,000 		High
    	and over 10,000  		Very High 

    A good starting point for this query is the answer from the problem 
    	High-value customers - total orders. 

    We don’t want to show customers who don’t have any orders in 2016.  
    Order the results by CustomerID.
 
    You can use the above SQL in a CTE (common table expression), 
    and then build on it, using a CASE statement on the TotalOrderAmount

'''

SELECT 
	c.CustomerID 
	, c.CompanyName
	-- , od.OrderID
	, SUM(od.Quantity * UnitPrice) AS TotalOrderAmount
FROM Customers c 
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
WHERE  date_format(o.OrderDate, '%Y') = 1997
GROUP BY c.CustomerID
		, c.CompanyName
		-- , od.OrderID
HAVING SUM(Quantity * UnitPrice) > 15000
ORDER BY TotalOrderAmount DESC 
;


-- Need 
-- CustomerID 
-- CompanyName 
-- TotalOrderAmount 
-- CustomerGroup AS CASE 
-- 	, (CASE 
-- 		WHEN 
--		THEN "Low"
-- 		ELSE 
-- 	  END) as CustomerGroup 

WITH Orders1997 AS (
	SELECT 
		c.CustomerID 
		, c.CompanyName
		-- , od.OrderID
		, SUM(od.Quantity * UnitPrice) AS TotalOrderAmount
	FROM Customers c 
	JOIN Orders o ON c.CustomerID = o.CustomerID
	JOIN OrderDetails od ON o.OrderID = od.OrderID
	WHERE  date_format(o.OrderDate, '%Y') = 1997
	GROUP BY c.CustomerID
			, c.CompanyName
)
SELECT 
	CustomerID 
	, CompanyName
	, (CASE WHEN TotalOrderAmount between 0 and 1000 then 'Low'  
     WHEN TotalOrderAmount between 1001 and 5000 then 'Medium'  
     WHEN TotalOrderAmount between 5001 and 10000 then 'High'  
     WHEN TotalOrderAmount > 10000 then 'Very High'  
     END)   as CustomerGroup 
    from Orders1997 
    Order by CustomerID; 

-- +------------+------------------------------------+---------------+
-- | CustomerID | CompanyName                        | CustomerGroup |
-- +------------+------------------------------------+---------------+
-- | ALFKI      | Alfreds Futterkiste                | Medium        |
-- | ANATR      | Ana Trujillo Emparedados y helados | Low           |
-- | ANTON      | Antonio Moreno Taquera             | High          |
-- | AROUT      | Around the Horn                    | High          |
-- | BERGS      | Berglunds snabbkp                  | Very High     |
-- | BLAUS      | Blauer See Delikatessen            | Medium        |
-- | BLONP      | Blondesddsl pre et fils            | High          |
-- | BOLID      | Blido Comidas preparadas           | Medium        |
-- | BONAP      | Bon app'                           | Very High     |
-- | BOTTM      | Bottom-Dollar Markets              | High          |
-- | BSBEV      | B's Beverages                      | Medium        |
-- | CACTU      | Cactus Comidas para llevar         | Low           |
-- | CHOPS      | Chop-suey Chinese                  | High          |
-- | COMMI      | Comrcio Mineiro                    | Medium        |
-- | CONSH      | Consolidated Holdings              | Low           |
-- | DRACD      | Drachenblut Delikatessen           | Low           |
-- | DUMON      | Du monde entier                    | Low           |
-- | EASTC      | Eastern Connection                 | Medium        |
-- | ERNSH      | Ernst Handel                       | Very High     |
-- | FAMIA      | Familia Arquibaldo                 | Medium        |
-- | FOLIG      | Folies gourmandes                  | Very High     |
-- | FOLKO      | Folk och f HB                      | Very High     |
-- | FRANK      | Frankenversand                     | Very High     |
-- | FRANR      | France restauration                | Low           |
-- | FRANS      | Franchi S.p.A.                     | Low           |
-- | FURIB      | Furia Bacalhau e Frutos do Mar     | High          |
-- | GALED      | Galera del gastrnomo               | Low           |
-- | GODOS      | Godos Cocina Tpica                 | Medium        |
-- | GOURL      | Gourmet Lanchonetes                | High          |
-- | GREAL      | Great Lakes Food Market            | High          |
-- | GROSR      | GROSELLA-Restaurante               | Low           |
-- | HANAR      | Hanari Carnes                      | High          |
-- | HILAA      | HILARION-Abastos                   | Very High     |
-- | HUNGC      | Hungry Coyote Import Store         | Medium        |
-- | HUNGO      | Hungry Owl All-Night Grocers       | Very High     |
-- | ISLAT      | Island Trading                     | Medium        |
-- | KOENE      | Kniglich Essen                     | High          |
-- | LAMAI      | La maison d'Asie                   | High          |
-- | LAUGB      | Laughing Bacchus Wine Cellars      | Low           |
-- | LAZYK      | Lazy K Kountry Store               | Low           |
-- | LEHMS      | Lehmanns Marktstand                | Very High     |
-- | LETSS      | Let's Stop N Shop                  | Medium        |
-- | LILAS      | LILA-Supermercado                  | High          |
-- | LINOD      | LINO-Delicateses                   | High          |
-- | LONEP      | Lonesome Pine Restaurant           | Medium        |
-- | MAGAA      | Magazzini Alimentari Riuniti       | Medium        |
-- | MAISD      | Maison Dewey                       | High          |
-- | MEREP      | Mre Paillarde                      | Very High     |
-- | MORGK      | Morgenstern Gesundkost             | Medium        |
-- | NORTS      | North/South                        | Low           |
-- | OCEAN      | Ocano Atlntico Ltda.               | Low           |
-- | OLDWO      | Old World Delicatessen             | High          |
-- | OTTIK      | Ottilies Kseladen                  | High          |
-- | PERIC      | Pericles Comidas clsicas           | Medium        |
-- | PICCO      | Piccolo und mehr                   | High          |
-- | PRINI      | Princesa Isabel Vinhos             | Medium        |
-- | QUEDE      | Que Delcia                         | Medium        |
-- | QUEEN      | Queen Cozinha                      | Very High     |
-- | QUICK      | QUICK-Stop                         | Very High     |
-- | RANCH      | Rancho grande                      | Medium        |
-- | RATTC      | Rattlesnake Canyon Grocery         | Very High     |
-- | REGGC      | Reggiani Caseifici                 | Medium        |
-- | RICAR      | Ricardo Adocicados                 | Medium        |
-- | RICSU      | Richter Supermarkt                 | Very High     |
-- | SANTG      | Sant Gourmet                       | Low           |
-- | SAVEA      | Save-a-lot Markets                 | Very High     |
-- | SEVES      | Seven Seas Imports                 | High          |
-- | SIMOB      | Simons bistro                      | Very High     |
-- | SPECD      | Spcialits du monde                 | Low           |
-- | SPLIR      | Split Rail Beer & Ale              | Medium        |
-- | SUPRD      | Suprmes dlices                     | High          |
-- | THEBI      | The Big Cheese                     | Medium        |
-- | THECR      | The Cracker Box                    | Medium        |
-- | TOMSP      | Toms Spezialitten                  | Medium        |
-- | TORTU      | Tortuga Restaurante                | High          |
-- | TRADH      | Tradio Hipermercados               | Medium        |
-- | TRAIH      | Trail's Head Gourmet Provisioners  | Medium        |
-- | VAFFE      | Vaffeljernet                       | High          |
-- | VICTE      | Victuailles en stock               | High          |
-- | VINET      | Vins et alcools Chevalier          | Low           |
-- | WANDK      | Die Wandernde Kuh                  | High          |
-- | WARTH      | Wartian Herkku                     | Very High     |
-- | WELLI      | Wellington Importadora             | Medium        |
-- | WHITC      | White Clover Markets               | Very High     |
-- | WILMK      | Wilman Kala                        | Medium        |
-- | WOLZA      | Wolski  Zajazd                     | Medium        |
-- +------------+------------------------------------+---------------+
-- 86 rows in set (0.00 sec)


'''
49. Customer grouping - fix null  
    There's a bug with the answer for the previous question. 
    The CustomerGroup value for one of the rows is null.   
    Fix the SQL so that there are no nulls in the CustomerGroup field.

    “CustomerID CompanyName TotalOrderAmount  CustomerGroup”

Hint  
    What is the total order amount for CustomerID MAISD? 
    -- | MAISD      | Maison Dewey                       | High          |
    -- “MAISD Maison Dewey 5000.20 High”

    How does that relate to our CustomerGroup boundaries?

“Hint  
    Using “between” works well for integer values. However, the value we're working with is Money, which has decimals. Instead of something like:  
    when TotalOrderAmount between 0 and 1000 then 'Low'  
       
    You'll need to something like this:  
    WHEN 
    	TotalOrderAmount >= 0 and TotalOrderAmount < 1000 THEN 'Low'
'''

WITH Orders1997 AS (
	SELECT 
		c.CustomerID 
		, c.CompanyName
		-- , od.OrderID
		, SUM(od.Quantity * UnitPrice) AS TotalOrderAmount
	FROM Customers c 
	JOIN Orders o ON c.CustomerID = o.CustomerID
	JOIN OrderDetails od ON o.OrderID = od.OrderID
	WHERE  date_format(o.OrderDate, '%Y') = 1997
	GROUP BY c.CustomerID
			, c.CompanyName
)
SELECT 
	CustomerID 
	, CompanyName
	,TotalOrderAmount 
    , (CASE WHEN TotalOrderAmount >= 0 and TotalOrderAmount < 1000 THEN 'Low' 
     WHEN TotalOrderAmount >= 1001 and TotalOrderAmount < 5000 THEN 'Medium'  
     WHEN TotalOrderAmount >= 5001 and TotalOrderAmount < 10000 THEN 'High'  
     WHEN TotalOrderAmount >= 10000 THEN 'Very High'  
     END)   as CustomerGroup 
FROM Orders1997 
ORDER BY CustomerID; 



-- Note book between vs my date_format -- gets same results - trust and verify

WITH Orders1997 as (  
     Select   
     Customers.CustomerID  
     ,Customers.CompanyName  
     ,SUM(Quantity * UnitPrice)   AS TotalOrderAmount 
     From Customers  
     Join Orders  
     on Orders.CustomerID = Customers.CustomerID  
     Join OrderDetails  
     on Orders.OrderID = OrderDetails.OrderID  
     Where  
     OrderDate >= '19970101'   
     and OrderDate < '19980101'  
     Group by   
     Customers.CustomerID  
     ,Customers.CompanyName  
    )  
    Select   
     CustomerID  
     ,CompanyName  
     ,TotalOrderAmount  
     , CASE WHEN TotalOrderAmount >= 0 and TotalOrderAmount < 1000 then 'Low'  
    WHEN TotalOrderAmount >= 1000 and TotalOrderAmount < 5000 then 'Medium'  
    WHEN TotalOrderAmount >= 5000 and TotalOrderAmount <10000 then 'High'  
    WHEN TotalOrderAmount >= 10000 then 'Very High'  
    END   AS CustomerGroup 
    FROM Orders1997 
    ORDER BY CustomerID; 

-- +------------+------------------------------------+------------------+---------------+
-- | CustomerID | CompanyName                        | TotalOrderAmount | CustomerGroup |
-- +------------+------------------------------------+------------------+---------------+
-- | ALFKI      | Alfreds Futterkiste                |        2294.0000 | Medium        |
-- | ANATR      | Ana Trujillo Emparedados y helados |         799.7500 | Low           |
-- | ANTON      | Antonio Moreno Taquera             |        6452.1500 | High          |
-- | AROUT      | Around the Horn                    |        6589.0000 | High          |
-- | BERGS      | Berglunds snabbkp                  |       14533.2000 | Very High     |
-- | BLAUS      | Blauer See Delikatessen            |        1079.8000 | Medium        |
-- | BLONP      | Blondesddsl pre et fils            |        8371.8000 | High          |
-- | BOLID      | Blido Comidas preparadas           |        4035.8000 | Medium        |
-- | BONAP      | Bon app'                           |       12462.5500 | Very High     |
-- | BOTTM      | Bottom-Dollar Markets              |        8547.5000 | High          |
-- | BSBEV      | B's Beverages                      |        3179.5000 | Medium        |
-- | CACTU      | Cactus Comidas para llevar         |         238.0000 | Low           |
-- | CHOPS      | Chop-suey Chinese                  |        6657.7000 | High          |
-- | COMMI      | Comrcio Mineiro                    |        1128.0000 | Medium        |
-- | CONSH      | Consolidated Holdings              |         787.6000 | Low           |
-- | DRACD      | Drachenblut Delikatessen           |         420.0000 | Low           |
-- | DUMON      | Du monde entier                    |         487.0000 | Low           |
-- | EASTC      | Eastern Connection                 |        4514.3500 | Medium        |
-- | ERNSH      | Ernst Handel                       |       53467.3800 | Very High     |
-- | FAMIA      | Familia Arquibaldo                 |        3344.9000 | Medium        |
-- | FOLIG      | Folies gourmandes                  |       11666.9000 | Very High     |
-- | FOLKO      | Folk och f HB                      |       13491.5000 | Very High     |
-- | FRANK      | Frankenversand                     |       12433.1100 | Very High     |
-- | FRANR      | France restauration                |         920.1000 | Low           |
-- | FRANS      | Franchi S.p.A.                     |         249.7000 | Low           |
-- | FURIB      | Furia Bacalhau e Frutos do Mar     |        5761.5500 | High          |
-- | GALED      | Galera del gastrnomo               |         493.2000 | Low           |
-- | GODOS      | Godos Cocina Tpica                 |        3524.0500 | Medium        |
-- | GOURL      | Gourmet Lanchonetes                |        8205.2300 | High          |
-- | GREAL      | Great Lakes Food Market            |        9148.5500 | High          |
-- | GROSR      | GROSELLA-Restaurante               |         387.5000 | Low           |
-- | HANAR      | Hanari Carnes                      |        6605.3000 | High          |
-- | HILAA      | HILARION-Abastos                   |       14026.1800 | Very High     |
-- | HUNGC      | Hungry Coyote Import Store         |        2283.2000 | Medium        |
-- | HUNGO      | Hungry Owl All-Night Grocers       |       23959.0500 | Very High     |
-- | ISLAT      | Island Trading                     |        2560.5000 | Medium        |
-- | KOENE      | Kniglich Essen                     |        9879.4000 | High          |
-- | LAMAI      | La maison d'Asie                   |        7465.8000 | High          |
-- | LAUGB      | Laughing Bacchus Wine Cellars      |         335.5000 | Low           |
-- | LAZYK      | Lazy K Kountry Store               |         357.0000 | Low           |
-- | LEHMS      | Lehmanns Marktstand                |       14433.1700 | Very High     |
-- | LETSS      | Let's Stop N Shop                  |        2039.4200 | Medium        |
-- | LILAS      | LILA-Supermercado                  |        5953.6000 | High          |
-- | LINOD      | LINO-Delicateses                   |        7803.9500 | High          |
-- | LONEP      | Lonesome Pine Restaurant           |        1837.2000 | Medium        |
-- | MAGAA      | Magazzini Alimentari Riuniti       |        4995.6500 | Medium        |
-- | MAISD      | Maison Dewey                       |        5684.0000 | High          |
-- | MEREP      | Mre Paillarde                      |       26087.1000 | Very High     |
-- | MORGK      | Morgenstern Gesundkost             |        3596.4000 | Medium        |
-- | NORTS      | North/South                        |         604.0000 | Low           |
-- | OCEAN      | Ocano Atlntico Ltda.               |         429.2000 | Low           |
-- | OLDWO      | Old World Delicatessen             |        5896.0000 | High          |
-- | OTTIK      | Ottilies Kseladen                  |        8398.6000 | High          |
-- | PERIC      | Pericles Comidas clsicas           |        2065.4000 | Medium        |
-- | PICCO      | Piccolo und mehr                   |        9684.6000 | High          |
-- | PRINI      | Princesa Isabel Vinhos             |        1523.2000 | Medium        |
-- | QUEDE      | Que Delcia                         |        3660.0300 | Medium        |
-- | QUEEN      | Queen Cozinha                      |       10937.2500 | Very High     |
-- | QUICK      | QUICK-Stop                         |       64238.0000 | Very High     |
-- | RANCH      | Rancho grande                      |        1149.4000 | Medium        |
-- | RATTC      | Rattlesnake Canyon Grocery         |       19658.7000 | Very High     |
-- | REGGC      | Reggiani Caseifici                 |        3203.6000 | Medium        |
-- | RICAR      | Ricardo Adocicados                 |        4338.9000 | Medium        |
-- | RICSU      | Richter Supermarkt                 |       12044.8000 | Very High     |
-- | SANTG      | Sant Gourmet                       |         700.0000 | Low           |
-- | SAVEA      | Save-a-lot Markets                 |       60672.6400 | Very High     |
-- | SEVES      | Seven Seas Imports                 |        9597.6500 | High          |
-- | SIMOB      | Simons bistro                      |       17482.1500 | Very High     |
-- | SPECD      | Spcialits du monde                 |          52.3500 | Low           |
-- | SPLIR      | Split Rail Beer & Ale              |        2972.5000 | Medium        |
-- | SUPRD      | Suprmes dlices                     |        6403.1000 | High          |
-- | THEBI      | The Big Cheese                     |        2955.4000 | Medium        |
-- | THECR      | The Cracker Box                    |        1621.2400 | Medium        |
-- | TOMSP      | Toms Spezialitten                  |        2180.2000 | Medium        |
-- | TORTU      | Tortuga Restaurante                |        5523.3500 | High          |
-- | TRADH      | Tradio Hipermercados               |        1613.0000 | Medium        |
-- | TRAIH      | Trail's Head Gourmet Provisioners  |        1333.3000 | Medium        |
-- | VAFFE      | Vaffeljernet                       |        9710.5000 | High          |
-- | VICTE      | Victuailles en stock               |        6099.5000 | High          |
-- | VINET      | Vins et alcools Chevalier          |         379.8000 | Low           |
-- | WANDK      | Die Wandernde Kuh                  |        5217.6500 | High          |
-- | WARTH      | Wartian Herkku                     |       13106.3000 | Very High     |
-- | WELLI      | Wellington Importadora             |        4717.9000 | Medium        |
-- | WHITC      | White Clover Markets               |       10262.5500 | Very High     |
-- | WILMK      | Wilman Kala                        |        1174.3500 | Medium        |
-- | WOLZA      | Wolski  Zajazd                     |        1207.8500 | Medium        |
-- +------------+------------------------------------+------------------+---------------+
-- 86 rows in set (0.01 sec)-- 