## Assignment 8

Use the following command to create a slave for my master MySQL host
`CHANGE MASTER TO MASTER_HOST='68.183.190.219',GET_MASTER_PUBLIC_KEY=1,MASTER_USER='slave', MASTER_PASSWORD='password', MASTER_LOG_FILE='mysql-bin.000004', MASTER_LOG_POS=  155;`


As we can see here, the slave works and is connected to my master host:
![alt text](https://github.com/grimetone/Databases/blob/master/Assignment8/img/slave_works.png)


Here we can see the results of a query to select the employee from myslave MySQL server which had previously been inserted into my master MySQL server.
I'm not sure how to check the length of time it took, however it was under a minute. 
![alt text](https://github.com/grimetone/Databases/blob/master/Assignment8/img/slave_functions.png)
