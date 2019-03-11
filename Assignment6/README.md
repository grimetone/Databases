## Assignment 6

### Excercise 1

#### Query
`
use classicmodels;
SELECT customers.customerName,
customers.contactLastName,
customers.customerNumber,
customers.city
FROM customers
LEFT JOIN employees
ON customers.salesRepEmployeeNumber = employees.employeeNumber
LEFT JOIN offices
ON employees.officeCode = offices.officeCode
WHERE customers.city = offices.city;`

#### Graphical Action Plan

![alt text](https://github.com/grimetone/Databases/blob/master/Assignment6/images/q1Execution.png)

#### Issue

This query performs a full table scan for the adresses, with no usable indexes

### Exercise 2

#### Changes

CHanges were made to the schema rather than the query where indexes 'offices_city' && 'offices_code' on the offices city and officeCode columns were added, so that searches would be performed faster. 
The following query was used to add the indexes: 

`
CREATE INDEX offices_city ON offices (city);
CREATE INDEX offices_code ON offices (officeCode);`


#### Graphical Action Plan

![alt text](https://github.com/grimetone/Databases/blob/master/Assignment6/images/q2Execution.png)

### Exercise 3

#### Grouping

`
SELECT 
    offices.city, MAX(amount) AS maxSale, COUNT(checkNumber) AS salesQnty
FROM
    offices
    INNER JOIN
    employees USING (officeCode)
    INNER JOIN
    customers 
    ON customers.salesRepEmployeeNumber = employees.employeeNumber
    INNER JOIN
    payments USING (customerNumber)
    GROUP BY city;`

![alt text](https://github.com/grimetone/Databases/blob/master/Assignment6/images/q3ExecutionGrouping.png)

#### Windowing

`
SELECT 
    offices.city,
    MAX(amount) OVER (PARTITION BY city) maxSale,
    COUNT(checkNumber) OVER (PARTITION BY city) salesQnty
FROM
    offices
    INNER JOIN
    employees USING (officeCode)
    INNER JOIN
    customers 
    ON customers.salesRepEmployeeNumber = employees.employeeNumber
    INNER JOIN
    payments USING (customerNumber);`

#### Explanation 

They are similar however have small differences.
Window functions are handled after aggregation or filtering takes place. They don't reduce the number of rows returned by a query. 

### Exercise 4

### Exercise 5