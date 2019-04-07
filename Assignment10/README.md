## Assignment10 - Spacial Data

Load the sql files within the csv folder and add the following statement to the query:
`
ALTER TABLE cykelstativ ADD SPATIAL INDEX(wkb_geometry);
ALTER TABLE gadetraer ADD SPATIAL INDEX(wkb_geometry);
ALTER TABLE parkregister ADD SPATIAL INDEX(wkb_geometry);
ALTER TABLE tungvognsnet ADD SPATIAL INDEX(wkb_geometry);
ALTER TABLE f_udsatte_byomraader ADD SPATIAL INDEX(wkb_geometry);`


### Exercise 1

`SELECT delomraade,
 count(parkregister.park_id) as count
 FROM f_udsatte_byomraader, parkregister
 where ST_Within(parkregister.wkb_geometry, f_udsatte_byomraader.wkb_geometry)
 GROUP BY f_udsatte_byomraader.id;`

`
delomraade, count

Ryparken	1

Nordvest	1

Ved Bispeengbuen	1

Sydhavnen	3

Urbanplanen mv.	1

Ved Folehaven	1
`