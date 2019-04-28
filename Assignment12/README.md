## Assignment 12

### Exercise 1

#### Queries
`
LOAD CSV WITH HEADERS FROM "file:///some2016UKgeotweets.csv" AS row 
    FIELDTERMINATOR ";"
create (tweet:Tweet {
	username: row.'User Name',
    nickname: row.'Nickname',
    residence: row.'Place (as appears on Bio)',
    latitude:  row.'Latitude',
    longitude: row.'Longitude',
    body: row.'Tweet content',
    mentions: extract( m in 
                filter(m in split(row.'Tweet content'," ") where m starts with "@" and size(m) > 1) 
                | right(m,size(m)-1))
    })`
`

### Exercise 2

#### Queries
`MATCH (t:Tweet)
UNWIND t.mentions as user
with distinct user
create (a:Tweeters{user:user})`


`MATCH (a:Tweet),(b:Tweeters)
WHERE b.user in a.mentions
CREATE (tweeted)-[r:usermentions]->(a)`

#### Results 
`Added 22913 labels, created 22913 nodes, set 22913 properties, completed after 2623 ms.`


### Exercise 3

#### Query
`
MATCH (a:Tweet),(b:Tweet)
where a.username = b.username and a <> b
WITH a, b, distance(point({latitude: a.latitude, longitude: a.longitude}), point({latitude: b.latitude, longitude: b.longitude})) as distance
ORDER BY distance DESC
  LIMIT 10
return DISTINCT a.username, distance
`

#### Results

Queries are taking around an hour, making it hard to fix and I only get a few results each time.

╒════════════╤══════════╕

│"a.username"│"distance"│

╞════════════╪══════════╡

│"ZPR"       │null      │

├────────────┼──────────┤

│"Beep!Beep!"│null      │

└────────────┴──────────┘

`
Started streaming 2 records after 3572767 ms and completed after 3572767 ms.
`