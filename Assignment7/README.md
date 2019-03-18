## Assignment 7

### Exercise 1

#### First Normal Form (1NF)

`customerNumber` can act as a primary-key and the merging of the contact firstname and lastname will still maintain atomicity and the data reliably extracted. 

This query is in compliance with 1NF

#### Second Normal Form (2NF)

The query is in compliance with 1NF. However all the information on the employee or sales representative are not dependent on our primary-key(customerNumber). They should be in another table to be in compliance with 2NF.

This query is NOT in compliance with 2NF

#### Third Normal Form (3NF)

This query is not in compliance with 2NF. There are also issues with columns that are "non-transitively" dependant on primary-key. The customers city(custCity) and country(custCountry)
should have their own seperate tables before this can be in compliance with 3NF, as well as the issues mentioned previously with the table not being in compliance with 2NF.

This query is NOT in compliance with 3NF

### Exercise 2

It could be possible to use the `contactPhone` as the primary key, however it is not best practise as we can not have a customer who shares the same number. This key might also be prone to changes in the future which could result in performance issues as all foreign-keys will need to be updated and if an external system is using this primary-key as a reference it could break.

The table should still be in compliance with 1NF, however this doesn't fix the issues with the 2NF and 3NF.

### Exercise 3

#### Safe Update Statement 

`UPDATE `CustomerOverview` SET `repPhone` = '87654321' WHERE `contactPhone` = XXXXXXX AND`repPhone` = 12345678;`

#### Update of RepEmail

`UPDATE `CustomerOverview` SET `repEmail` = 'blahblah' WHERE `repEmail` = 'wrong';`

This update will not work without turning off safe_mode on SQL, as we do not use a primary-key.

### Exercise 4


![alt text](https://github.com/grimetone/Databases/blob/master/Assignment7/img/btree.jpg)