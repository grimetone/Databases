## Assignment 13

### To Run

#### NEO4J

Had to change some of the env variable names to increase the memory for it to work
`
docker run  -d --name neo4j --rm --publish=7474:7474 --publish=7687:7687 --env NEO4J_AUTH=neo4j/fancy99Doorknob --env=NEO4J_CACHE_MEMORY=4G --env=NEO4J_HEAP_MEMORY=4G neo4j`

`LOAD CSV WITH HEADERS FROM "file:///social_network_nodes.csv" AS row  FIELDTERMINATOR ","
WITH row
CREATE (t:user {
    id: toInteger(row.node_id),
    name: row.name,
    job: row.job,
    birthday: row.birthday
})`

#### SQL
`
CREATE TABLE nodes
(
  id INT,
  name VARCHAR(50),
  job VARCHAR(50),
  birthday DATE,
  PRIMARY KEY(id)
);`

`CREATE TABLE edges
(
 source_id INT,
 target_id INT
);`


### Results

```
                     MySQL              Neo4j       
                average             average  
Depth one:      801.19  MS          19.05   MS     
Depth two:      1556.01 MS          33.71   MS   
Depth three:    2453.5  MS          903.43  MS     
Depth four:     3490.92 MS          5021.22 MS   
Depth five:     11074.4 MS          7232.1  MS 
```