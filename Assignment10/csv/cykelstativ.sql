drop table if exists cykelstativ;
create table cykelstativ (
	id INT, 
	FID VARCHAR(100), 
	vejkode INT, 
	vejnavn VARCHAR(100), 
	bydel INT, 
	antal_pladser INT, 
	wkb_geometry GEOMETRY NOT NULL SRID 4326,
	primary key(id)
);
INSERT INTO cykelstativ ( id,FID,vejkode,vejnavn,bydel,antal_pladser,wkb_geometry ) VALUES (6451,"cykelstativ.1",0004,"Abel Cathrines Gade",Vesterbro-Kongens Enghave,7,ST_GeomFromText("POINT (12.559765094396205 55.671281288337156)", 4326));
INSERT INTO cykelstativ ( id,FID,vejkode,vejnavn,bydel,antal_pladser,wkb_geometry ) VALUES (6450,"cykelstativ.2",0004,"Abel Cathrines Gade",Vesterbro-Kongens Enghave,7,ST_GeomFromText("POINT (12.559911715631072 55.671311648403005)", 4326));
INSERT INTO cykelstativ ( id,FID,vejkode,vejnavn,bydel,antal_pladser,wkb_geometry ) VALUES (7174,"cykelstativ.3",0020,"Absalonsgade",Vesterbro-Kongens Enghave,20,ST_GeomFromText("POINT (12.553729150874053 55.67233687625963)", 4326));
INSERT INTO cykelstativ ( id,FID,vejkode,vejnavn,bydel,antal_pladser,wkb_geometry ) VALUES (7175,"cykelstativ.4",0020,"Absalonsgade",Vesterbro-Kongens Enghave,20,ST_GeomFromText("POINT (12.553772322550753 55.672175756939694)", 4326));
INSERT INTO cykelstativ ( id,FID,vejkode,vejnavn,bydel,antal_pladser,wkb_geometry ) VALUES (7176,"cykelstativ.5",0020,"Absalonsgade",Vesterbro-Kongens Enghave,15,ST_GeomFromText("POINT (12.55391825093139 55.671839758044044)", 4326));
INSERT INTO cykelstativ ( id,FID,vejkode,vejnavn,bydel,antal_pladser,wkb_geometry ) VALUES (4569,"cykelstativ.6",0020,"Absalonsgade",Vesterbro-Kongens Enghave,10,ST_GeomFromText("POINT (12.555278555914011 55.669617214862484)", 4326));
INSERT INTO cykelstativ ( id,FID,vejkode,vejnavn,bydel,antal_pladser,wkb_geometry ) VALUES (6877,"cykelstativ.7",0020,"Absalonsgade",Vesterbro-Kongens Enghave,13,ST_GeomFromText("POINT (12.555074048179748 55.66992953173916)", 4326));
INSERT INTO cykelstativ ( id,FID,vejkode,vejnavn,bydel,antal_pladser,wkb_geometry ) VALUES (6020,"cykelstativ.8",0020,"Absalonsgade",Vesterbro-Kongens Enghave,5,ST_GeomFromText("POINT (12.555136731626709 55.66983953885693)", 4326));
INSERT INTO cykelstativ ( id,FID,vejkode,vejnavn,bydel,antal_pladser,wkb_geometry ) VALUES (6588,"cykelstativ.9",0024,"Adelgade",Indre By,10,ST_GeomFromText("POINT (12.582566024715506 55.68280377040692)", 4326));
INSERT INTO cykelstativ ( id,FID,vejkode,vejnavn,bydel,antal_pladser,wkb_geometry ) VALUES (6553,"cykelstativ.10",0024,"Adelgade",Indre By,10,ST_GeomFromText("POINT (12.586172879085677 55.686744897436654)", 4326));
INSERT INTO cykelstativ ( id,FID,vejkode,vejnavn,bydel,antal_pladser,wkb_geometry ) VALUES (441,"cykelstativ.11",0024,"Adelgade",Indre By,15,ST_GeomFromText("POINT (12.585921060053952 55.6866887473272)", 4326));
INSERT INTO cykelstativ ( id,FID,vejkode,vejnavn,bydel,antal_pladser,wkb_geometry ) VALUES (4912,"cykelstativ.12",0024,"Adelgade",Indre By,64,ST_GeomFromText("POINT (12.583549173586498 55.68412461057369)", 4326));
INSERT INTO cykelstativ ( id,FID,vejkode,vejnavn,bydel,antal_pladser,wkb_geometry ) VALUES (6593,"cykelstativ.13",0024,"Adelgade",Indre By,48,ST_GeomFromText("POINT (12.583328242383601 55.683857180433264)", 4326));
INSERT INTO cykelstativ ( id,FID,vejkode,vejnavn,bydel,antal_pladser,wkb_geometry ) VALUES (6552,"cykelstativ.14",0024,"Adelgade",Indre By,20,ST_GeomFromText("POINT (12.585306828595327 55.686178925646935)", 4326));
INSERT INTO cykelstativ ( id,FID,vejkode,vejnavn,bydel,antal_pladser,wkb_geometry ) VALUES (6550,"cykelstativ.15",0024,"Adelgade",Indre By,4,ST_GeomFromText("POINT (12.585007618206603 55.68597951569903)", 4326));
INSERT INTO cykelstativ ( id,FID,vejkode,vejnavn,bydel,antal_pladser,wkb_geometry ) VALUES (6551,"cykelstativ.16",0024,"Adelgade",Indre By,20,ST_GeomFromText("POINT (12.58521673085281 55.68608459454703)", 4326));
INSERT INTO cykelstativ ( id,FID,vejkode,vejnavn,bydel,antal_pladser,wkb_geometry ) VALUES (6592,"cykelstativ.17",0024,"Adelgade",Indre By,24,ST_GeomFromText("POINT (12.58319262293334 55.6836945551401)", 4326));
INSERT INTO cykelstativ ( id,FID,vejkode,vejnavn,bydel,antal_pladser,wkb_geometry ) VALUES (4909,"cykelstativ.18",0024,"Adelgade",Indre By,64,ST_GeomFromText("POINT (12.584216110876472 55.68492334583523)", 4326));
INSERT INTO cykelstativ ( id,FID,vejkode,vejnavn,bydel,antal_pladser,wkb_geometry ) VALUES (4910,"cykelstativ.19",0024,"Adelgade",Indre By,64,ST_GeomFromText("POINT (12.584094814987731 55.684768606031874)", 4326));
INSERT INTO cykelstativ ( id,FID,vejkode,vejnavn,bydel,antal_pladser,wkb_geometry ) VALUES (4911,"cykelstativ.20",0024,"Adelgade",Indre By,64,ST_GeomFromText("POINT (12.583679587510968 55.684304693447004)", 4326));
INSERT INTO cykelstativ ( id,FID,vejkode,vejnavn,bydel,antal_pladser,wkb_geometry ) VALUES (6591,"cykelstativ.21",0024,"Adelgade",Indre By,15,ST_GeomFromText("POINT (12.583110954452101 55.683138477439186)", 4326));
INSERT INTO cykelstativ ( id,FID,vejkode,vejnavn,bydel,antal_pladser,wkb_geometry ) VALUES (439,"cykelstativ.22",0024,"Adelgade",Indre By,15,ST_GeomFromText("POINT (12.585833683884216 55.68658899497632)", 4326));
INSERT INTO cykelstativ ( id,FID,vejkode,vejnavn,bydel,antal_pladser,wkb_geometry ) VALUES (6590,"cykelstativ.23",0024,"Adelgade",Indre By,35,ST_GeomFromText("POINT (12.582672420220886 55.68292920424883)", 4326));
INSERT INTO cykelstativ ( id,FID,vejkode,vejnavn,bydel,antal_pladser,wkb_geometry ) VALUES (6589,"cykelstativ.24",0024,"Adelgade",Indre By,12,ST_GeomFromText("POINT (12.582371169588642 55.68238282883574)", 4326));
INSERT INTO cykelstativ ( id,FID,vejkode,vejnavn,bydel,antal_pladser,wkb_geometry ) VALUES (105,"cykelstativ.25",0028,"Admiralgade",Indre By,15,ST_GeomFromText("POINT (12.582620708802706 55.67708846850353)", 4326));
INSERT INTO cykelstativ ( id,FID,vejkode,vejnavn,bydel,antal_pladser,wkb_geometry ) VALUES (6871,"cykelstativ.26",0028,"Admiralgade",Indre By,12,ST_GeomFromText("POINT (12.582844179960048 55.677011762568036)", 4326));
INSERT INTO cykelstativ ( id,FID,vejkode,vejnavn,bydel,antal_pladser,wkb_geometry ) VALUES (106,"cykelstativ.27",0028,"Admiralgade",Indre By,25,ST_GeomFromText("POINT (12.582544869690533 55.67716478119325)", 4326));
INSERT INTO cykelstativ ( id,FID,vejkode,vejnavn,bydel,antal_pladser,wkb_geometry ) VALUES (3425,"cykelstativ.29",0044,"Aggersborggade",Østerbro,1,ST_GeomFromText("POINT (12.587322213320522 55.69863567428662)", 4326));
INSERT INTO cykelstativ ( id,FID,vejkode,vejnavn,bydel,antal_pladser,wkb_geometry ) VALUES (3424,"cykelstativ.30",0044,"Aggersborggade",Østerbro,1,ST_GeomFromText("POINT (12.587331331356241 55.69862296273084)", 4326));
INSERT INTO cykelstativ ( id,FID,vejkode,vejnavn,bydel,antal_pladser,wkb_geometry ) VALUES (3423,"cykelstativ.31",0044,"Aggersborggade",Østerbro,1,ST_GeomFromText("POINT (12.587345778807165 55.6986042880999)", 4326));
INSERT INTO cykelstativ ( id,FID,vejkode,vejnavn,bydel,antal_pladser,wkb_geometry ) VALUES (3422,"cykelstativ.32",0044,"Aggersborggade",Østerbro,1,ST_GeomFromText("POINT (12.58735350279062 55.69859244699312)", 4326));
INSERT INTO cykelstativ ( id,FID,vejkode,vejnavn,bydel,antal_pladser,wkb_geometry ) VALUES (3421,"cykelstativ.33",0044,"Aggersborggade",Østerbro,1,ST_GeomFromText("POINT (12.587361080031735 55.6985789516999)", 4326));
INSERT INTO cykelstativ ( id,FID,vejkode,vejnavn,bydel,antal_pladser,wkb_geometry ) VALUES (3420,"cykelstativ.34",0044,"Aggersborggade",Østerbro,1,ST_GeomFromText("POINT (12.587371738862096 55.698567025549295)", 4326));
INSERT INTO cykelstativ ( id,FID,vejkode,vejnavn,bydel,antal_pladser,wkb_geometry ) VALUES (3419,"cykelstativ.35",0044,"Aggersborggade",Østerbro,1,ST_GeomFromText("POINT (12.58741069895482 55.6985057205994)", 4326));
INSERT INTO cykelstativ ( id,FID,vejkode,vejnavn,bydel,antal_pladser,wkb_geometry ) VALUES (3418,"cykelstativ.36",0044,"Aggersborggade",Østerbro,1,ST_GeomFromText("POINT (12.587451333244289 55.698440130106064)", 4326));
INSERT INTO cykelstativ ( id,FID,vejkode,vejnavn,bydel,antal_pladser,wkb_geometry ) VALUES (3417,"cykelstativ.37",0044,"Aggersborggade",Østerbro,1,ST_GeomFromText("POINT (12.587493308225204 55.69838913880856)", 4326));
INSERT INTO cykelstativ ( id,FID,vejkode,vejnavn,bydel,antal_pladser,wkb_geometry ) VALUES (3416,"cykelstativ.38",0044,"Aggersborggade",Østerbro,1,ST_GeomFromText("POINT (12.587520575621033 55.698347358928295)", 4326));
INSERT INTO cykelstativ ( id,FID,vejkode,vejnavn,bydel,antal_pladser,wkb_geometry ) VALUES (3415,"cykelstativ.39",0044,"Aggersborggade",Østerbro,1,ST_GeomFromText("POINT (12.587538551558346 55.69832051675173)", 4326));
INSERT INTO cykelstativ ( id,FID,vejkode,vejnavn,bydel,antal_pladser,wkb_geometry ) VALUES (3414,"cykelstativ.40",0044,"Aggersborggade",Østerbro,1,ST_GeomFromText("POINT (12.587557741455063 55.69829419984608)", 4326));
INSERT INTO cykelstativ ( id,FID,vejkode,vejnavn,bydel,antal_pladser,wkb_geometry ) VALUES (3413,"cykelstativ.41",0044,"Aggersborggade",Østerbro,1,ST_GeomFromText("POINT (12.58756718632602 55.69828563709671)", 4326));
INSERT INTO cykelstativ ( id,FID,vejkode,vejnavn,bydel,antal_pladser,wkb_geometry ) VALUES (3108,"cykelstativ.42",0044,"Aggersborggade",Østerbro,31,ST_GeomFromText("POINT (12.587015068960035 55.6993536029363)", 4326));
INSERT INTO cykelstativ ( id,FID,vejkode,vejnavn,bydel,antal_pladser,wkb_geometry ) VALUES (3113,"cykelstativ.43",0044,"Aggersborggade",Østerbro,6,ST_GeomFromText("POINT (12.587100859162502 55.69893993453466)", 4326));
INSERT INTO cykelstativ ( id,FID,vejkode,vejnavn,bydel,antal_pladser,wkb_geometry ) VALUES (3112,"cykelstativ.44",0044,"Aggersborggade",Østerbro,9,ST_GeomFromText("POINT (12.587027868185858 55.69903087143314)", 4326));
INSERT INTO cykelstativ ( id,FID,vejkode,vejnavn,bydel,antal_pladser,wkb_geometry ) VALUES (3111,"cykelstativ.45",0044,"Aggersborggade",Østerbro,14,ST_GeomFromText("POINT (12.586970531949428 55.699115224936435)", 4326));
INSERT INTO cykelstativ ( id,FID,vejkode,vejnavn,bydel,antal_pladser,wkb_geometry ) VALUES (3110,"cykelstativ.46",0044,"Aggersborggade",Østerbro,8,ST_GeomFromText("POINT (12.586907239307791 55.699193628704634)", 4326));
INSERT INTO cykelstativ ( id,FID,vejkode,vejnavn,bydel,antal_pladser,wkb_geometry ) VALUES (3109,"cykelstativ.47",0044,"Aggersborggade",Østerbro,6,ST_GeomFromText("POINT (12.586859321261892 55.69926239583622)", 4326));
INSERT INTO cykelstativ ( id,FID,vejkode,vejnavn,bydel,antal_pladser,wkb_geometry ) VALUES (3107,"cykelstativ.48",0044,"Aggersborggade",Østerbro,10,ST_GeomFromText("POINT (12.587062486039162 55.69929013847712)", 4326));
INSERT INTO cykelstativ ( id,FID,vejkode,vejnavn,bydel,antal_pladser,wkb_geometry ) VALUES (7075,"cykelstativ.49",0044,"Aggersborggade",Østerbro,4,ST_GeomFromText("POINT (12.587606376189223 55.69853090919096)", 4326));
INSERT INTO cykelstativ ( id,FID,vejkode,vejnavn,bydel,antal_pladser,wkb_geometry ) VALUES (7074,"cykelstativ.50",0044,"Aggersborggade",Østerbro,22,ST_GeomFromText("POINT (12.587663433337244 55.69845467033348)", 4326));
