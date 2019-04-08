## Assignment10 - Spacial Data

Load the sql files within the csv folder and add the following statement to the query:

`
ALTER TABLE cykelstativ ADD SPATIAL INDEX(wkb_geometry);
ALTER TABLE gadetraer ADD SPATIAL INDEX(wkb_geometry);
ALTER TABLE parkregister ADD SPATIAL INDEX(wkb_geometry);
ALTER TABLE tungvognsnet ADD SPATIAL INDEX(wkb_geometry);
ALTER TABLE f_udsatte_byomraader ADD SPATIAL INDEX(wkb_geometry);`


### Exercise 1 

#### Part 1 - Parks


`SELECT delomraade,
 count(parkregister.park_id) as count
 FROM f_udsatte_byomraader, parkregister
 where ST_Within(parkregister.wkb_geometry, f_udsatte_byomraader.wkb_geometry)
 GROUP BY f_udsatte_byomraader.id;`


delomraade, count

Ryparken	1

Nordvest	1

Ved Bispeengbuen	1

Sydhavnen	3

Urbanplanen mv.	1

Ved Folehaven	1


#### Part 2 - Street Trees

`
SELECT delomraade, 
count(gadetraer.id) as count 
FROM f_udsatte_byomraader, gadetraer 
where ST_Within(gadetraer.wkb_geometry, f_udsatte_byomraader.wkb_geometry) 
GROUP BY f_udsatte_byomraader.id;`


delomraade, count

Ryparken	2

Nordvest	3

Ved Bispeengbuen	2

Indre Nørrebro	1


### Exercise 2

`
SELECT vej, 
count(cykelstativ.id) as count 
FROM cykelstativ, tungvognsnet 
where ST_Within(cykelstativ.wkb_geometry, ST_Buffer(tungvognsnet.wkb_geometry, 0.025)) 
GROUP BY tungvognsnet.id;`


vej, count

Ørestads Boulevard	19

Sydhavnsgade	3

Scandiagade	8

Vasbygade	8

Sydhavns Plads	8

P. Knudsens Gade	6

Vasbygade	8

Kalvebod Brygge	11

Kalvebod Brygge	27

Vigerslev Allé	8

Enghavevej	8

Ingerslevsgade	21

H. C. Andersens Boulevard	27

Tietgensgade	27

Strandvænget	22
