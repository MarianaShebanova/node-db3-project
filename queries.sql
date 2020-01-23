-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. 
-- Shows 77 records.

select  Product.ProductName, Category.CategoryName 
from Product 
join Category 
on Product.CategoryId = Category.Id;
   
-- Display the order Id and shipper CompanyName for all orders placed before 
-- August 9 2012. Shows 429 records.

SELECT o.Id, Customer.CompanyName, o.OrderDate
from `Order` as o
join Customer 
on o.CustomerId = Customer.Id
where date(OrderDate)<date('2012-08-09');

-- Display the name and quantity of the products ordered in order with Id 10251. 
-- Sort by ProductName. Shows 3 records.

SELECT OrderDetail.Quantity, Product.ProductName 
from OrderDetail  
join Product 
on OrderDetail.ProductId = Product.Id 
WHERE OrderId = 10251
order by Product.ProductName ;

-- Display the OrderID, Customer's Company Name and the employee's LastName 
-- for every order. All columns should be labeled clearly. Displays 16,789 records.

SELECT o.Id, Customer.CompanyName, Employee.LastName
from `Order` as o
join Customer 
on o.CustomerId = Customer.Id
join Employee
on o.EmployeeId = Employee.Id;