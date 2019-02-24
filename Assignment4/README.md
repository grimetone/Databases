## Assignment 4

### Exercise 1 - User Privileges

`
USE classicmodels;

-- Stop MySQL bugging, we flush users && perms

drop user Inventory;
drop user IT;
drop user Bookkeeping;
drop user Sales;
drop user Human_Resources;
flush privileges;

-- Create our users

CREATE USER Inventory IDENTIFIED BY 'Password';
CREATE USER IT IDENTIFIED BY 'IT';
CREATE USER Bookkeeping IDENTIFIED BY 'Bookkeeping';
CREATE USER Sales IDENTIFIED BY 'Sales';
CREATE USER Human_Resources IDENTIFIED BY 'Human_Resources';

-- Grant permissions to Inventory

GRANT SELECT ON classicmodels . products TO 'Inventory';
GRANT DELETE ON classicmodels . products TO 'Inventory';
GRANT INSERT ON classicmodels . products TO 'Inventory';
GRANT UPDATE ON classicmodels . products TO 'Inventory';
GRANT SELECT ON classicmodels . productlines TO 'Inventory';
GRANT DELETE ON classicmodels . productlines TO 'Inventory';
GRANT INSERT ON classicmodels . productlines TO 'Inventory';
GRANT UPDATE ON classicmodels . productlines TO 'Inventory';

-- Grant permissions to IT

GRANT SELECT ON classicmodels . * TO 'IT';
GRANT DELETE ON classicmodels . * TO 'IT';
GRANT INSERT ON classicmodels . * TO 'IT';
GRANT UPDATE ON classicmodels . * TO 'IT';
GRANT GRANT OPTION ON classicmodels . * TO 'IT';
GRANT DROP ON classicmodels . * TO 'IT';
GRANT CREATE ON classicmodels . * TO 'IT';

-- Grant permissions to Sales

GRANT SELECT ON classicmodels . products TO 'Sales';
GRANT UPDATE ON classicmodels . products TO 'Sales';
GRANT SELECT ON classicmodels . customers TO 'Sales';
GRANT SELECT ON classicmodels . orders TO 'Sales';
GRANT UPDATE ON classicmodels . orders TO 'Sales';
GRANT DELETE ON classicmodels . orders TO 'Sales';
GRANT INSERT ON classicmodels . orders TO 'Sales';
GRANT SELECT ON classicmodels . orderdetails TO 'Sales';
GRANT UPDATE ON classicmodels . orderdetails TO 'Sales';
GRANT DELETE ON classicmodels . orderdetails TO 'Sales';
GRANT INSERT ON classicmodels . orderdetails TO 'Sales';

-- Grant permissions to Human Resources

GRANT SELECT ON classicmodels . offices TO 'Human_Resources';
GRANT SELECT ON classicmodels . employees TO 'Human_Resources';
GRANT DELETE ON classicmodels . employees TO 'Human_Resources';
GRANT UPDATE ON classicmodels . employees TO 'Human_Resources';
GRANT INSERT ON classicmodels . employees TO 'Human_Resources';

-- Grant permissions to Bookkeeping

GRANT SELECT ON classicmodels . orders TO 'Bookkeeping';
GRANT SELECT ON classicmodels . orderdetails TO 'Bookkeeping';
GRANT SELECT ON classicmodels . customers TO 'Bookkeeping';
GRANT SELECT ON classicmodels . payments TO 'Bookkeeping';`

#### IT
IT users has been granted every permission to every table, however this is risky and IT should in the least be split into senior IT roles whom have the ability to remove and add tables/databases and less senior roles without these permissions.

#### Inventory
Inventory users have the ability to select, delete, update and insert in both Products and Productlines tables. 

#### Sales 
Sales users have been granted the ability to select from products, as they need to check that there is inventory in stock, however they do not need the update function as there is an Inventory user who can update the inventory. They also have the ability to look up from the customers table and insert, delete, update and select from both the order and orderdetails tables to be able to fulfill their role.  

#### Bookkeeping
Bookkeeping users are there to act as a form of validation that a payment has been made and has only been granted the permissions to lookup within necessary tables to fulfil this function. 

#### Human Resources
Human resources users are there to handle employees within the organization. They have the ability to update, select, delete and insert employees and the ability to lookup the offices table. 

### Exercise 2 - Logging

See log.log file.

### Exercise 3 - Backup and Recovery

The backup files can be found in the 'backup' directory.
The backup files were generated using the MySQL Workbench client, selecting data-export and then choosing which tables should be exported (in this case all of them). 