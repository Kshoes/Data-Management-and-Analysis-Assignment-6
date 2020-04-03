# Overview

1. Name: Percent Asian of NYC Sub-Boroughs
2. Link to Data: [CoreDataNYC](http://app.coredata.nyc/)
3. Source / Origin: CoreData is the Furman Center for Real Estate and Urban Policy's data finding tool. CoreData collects a broad array of data on demographics, neighborhood conditions, transportation, housing stock and other aspects of the New York City real estate market.
4. Motivation: Curiosity about Asian demographics in NYC

# Table Design

Primary key: Sub-Borough Area

Sub-Borough Area: varchar(255)
2000: numeric
2005-2018: numeric

null-values not allowed, duplicates allowed (all values are filled in in the csv and it's possible to have duplicate percentages)

# Import

Import succeeded without error.

# Database Information

1) postgres=# \l
                             List of databases
   Name    |  Owner   | Encoding | Collate | Ctype |   Access privileges   
-----------+----------+----------+---------+-------+-----------------------
 homework6 | postgres | UTF8     | C       | C     | 
 postgres  | postgres | UTF8     | C       | C     | 
 template0 | postgres | UTF8     | C       | C     | =c/postgres          +
           |          |          |         |       | postgres=CTc/postgres
 template1 | postgres | UTF8     | C       | C     | =c/postgres          +
           |          |          |         |       | postgres=CTc/postgres
(4 rows)


2) postgres=# \c homework6
You are now connected to database "homework6" as user "postgres".
homework6=# \dt
             List of relations
 Schema |     Name      | Type  |  Owner   
--------+---------------+-------+----------
 public | percent_asian | table | postgres
(1 row)


3) homework6=# \d percent_asian
                        Table "public.percent_asian"
      Column      |          Type          | Collation | Nullable | Default 
------------------+------------------------+-----------+----------+---------
 sub_borough_area | character varying(255) |           | not null | 
 2000             | numeric                |           | not null | 
 2005             | numeric                |           | not null | 
 2006             | numeric                |           | not null | 
 2007             | numeric                |           | not null | 
 2008             | numeric                |           | not null | 
 2009             | numeric                |           | not null | 
 2010             | numeric                |           | not null | 
 2011             | numeric                |           | not null | 
 2012             | numeric                |           | not null | 
 2013             | numeric                |           | not null | 
 2014             | numeric                |           | not null | 
 2015             | numeric                |           | not null | 
 2016             | numeric                |           | not null | 
 2017             | numeric                |           | not null | 
 2018             | numeric                |           | not null | 
Indexes:
    "percent_asian_pkey" PRIMARY KEY, btree (sub_borough_area)


# Query Results

1) homework6=# SELECT count(*) FROM percent_asian;
 count 
-------
    55
(1 row)


2) homework6=# SELECT sub_borough_area, "2000", "2018" FROM percent_asian LIMIT 15;
           sub_borough_area           |        2000         |    2018    
--------------------------------------+---------------------+------------
 Flatlands/Canarsie                   |  0.0366154098828702 |  0.0621763
 Astoria                              |   0.125366843658412 |   0.141766
 Sunnyside/Woodside                   |   0.299102684264653 |   0.400145
 Greenwich Village/Financial District |   0.145468156440984 |   0.144573
 Lower East Side/Chinatown            |   0.348445416788309 |   0.272766
 Chelsea/Clinton/Midtown              |   0.098461236410003 |   0.171294
 Stuyvesant Town/Turtle Bay           |   0.107437901297089 |   0.185281
 Upper West Side                      |  0.0556882208798015 |   0.107875
 Upper East Side                      |  0.0631245306658457 |   0.113509
 Morningside Heights/Hamilton Heights |   0.052048512734018 |  0.0825358
 Central Harlem                       | 0.00835999303330937 |  0.0441668
 East Harlem                          |  0.0273318721681335 |  0.0737816
 Washington Heights/Inwood            |  0.0204304893143217 |  0.0389133
 Mott Haven/Hunts Point               | 0.00441555255730464 | 0.00712792
 Morrisania/Belmont                   | 0.00808836503506427 | 0.00931288
(15 rows)


3) homework6=# SELECT sub_borough_area, "2000", "2018" FROM percent_asian ORDER BY sub_borough_area DESC LIMIT 15;
       sub_borough_area        |        2000         |   2018    
-------------------------------+---------------------+-----------
 Williamsburg/Greenpoint       |  0.0390786640205079 | 0.0610293
 Williamsbridge/Baychester     |  0.0188946034256787 | 0.0176437
 Washington Heights/Inwood     |  0.0204304893143217 | 0.0389133
 Upper West Side               |  0.0556882208798015 |  0.107875
 Upper East Side               |  0.0631245306658457 |  0.113509
 University Heights/Fordham    |  0.0155052655163672 | 0.0128174
 Throgs Neck/Co-op City        |   0.016962054790838 | 0.0335514
 Sunset Park                   |    0.21786614393568 |  0.290235
 Sunnyside/Woodside            |   0.299102684264653 |  0.400145
 Stuyvesant Town/Turtle Bay    |   0.107437901297089 |  0.185281
 South Shore                   |  0.0327182853629893 | 0.0602812
 South Ozone Park/Howard Beach |    0.12818650988811 |  0.271443
 South Crown Heights           | 0.00772166503946892 | 0.0196504
 Soundview/Parkchester         |  0.0389552647175151 |  0.111755
 Sheepshead Bay/Gravesend      |   0.123065798018615 |  0.198024
(15 rows)


4) homework6=# ALTER TABLE percent_asian ADD COLUMN delta numeric;
ALTER TABLE


5) homework6=# UPDATE percent_asian SET delta = ("2018" - "2000");
UPDATE 55

homework6=# SELECT "2000", "2018", "delta" FROM percent_asian;
        2000         |    2018    |        delta        
---------------------+------------+---------------------
  0.0366154098828702 |  0.0621763 |  0.0255608901171298
   0.125366843658412 |   0.141766 |   0.016399156341588
   0.299102684264653 |   0.400145 |   0.101042315735347
   0.145468156440984 |   0.144573 |  -0.000895156440984
   0.348445416788309 |   0.272766 |  -0.075679416788309
   0.098461236410003 |   0.171294 |   0.072832763589997
   0.107437901297089 |   0.185281 |   0.077843098702911
  0.0556882208798015 |   0.107875 |  0.0521867791201985
  0.0631245306658457 |   0.113509 |  0.0503844693341543
   0.052048512734018 |  0.0825358 |   0.030487287265982
 0.00835999303330937 |  0.0441668 | 0.03580680696669063
  0.0273318721681335 |  0.0737816 |  0.0464497278318665
  0.0204304893143217 |  0.0389133 |  0.0184828106856783
 0.00441555255730464 | 0.00712792 | 0.00271236744269536
 0.00808836503506427 | 0.00931288 | 0.00122451496493573
  0.0122767941409165 | 0.00991686 | -0.0023599341409165
  0.0155052655163672 |  0.0128174 | -0.0026878655163672
  0.0658842860584627 |  0.0401618 | -0.0257224860584627
  0.0491048910203062 |  0.0386246 | -0.0104802910203062
  0.0389552647175151 |   0.111755 |  0.0727997352824849


6) homework6=# SELECT DISTINCT sub_borough_area FROM percent_asian;
           sub_borough_area           
--------------------------------------
 Bedford Stuyvesant
 Chelsea/Clinton/Midtown
 Brooklyn Heights/Fort Greene
 Coney Island
 Kingsbridge Heights/Mosholu
 Rego Park/Forest Hills
 South Ozone Park/Howard Beach
 Jackson Heights
 Lower East Side/Chinatown
 Williamsbridge/Baychester
 Astoria
 Pelham Parkway
 Elmhurst/Corona
 Bensonhurst
 Ozone Park/Woodhaven
 North Crown Heights/Prospect Heights
 Highbridge/South Concourse
 Flatlands/Canarsie
 University Heights/Fordham
 Bayside/Little Neck
 Flushing/Whitestone
 East Harlem
 Rockaways
 Queens Village
 Jamaica
 East Flatbush
 Soundview/Parkchester
 Upper West Side
 Middle Village/Ridgewood
 South Crown Heights
 North Shore
 Bushwick
 Brownsville/Ocean Hill
 Stuyvesant Town/Turtle Bay
 Sheepshead Bay/Gravesend
 Bay Ridge
 East New York/Starrett City
 Riverdale/Kingsbridge
 Mott Haven/Hunts Point
 Greenwich Village/Financial District
 South Shore
 Mid-Island
 Sunset Park
 Sunnyside/Woodside
 Hillcrest/Fresh Meadows
 Morrisania/Belmont
 Upper East Side
 Flatbush
 Central Harlem
 Washington Heights/Inwood
 Borough Park
 Park Slope/Carroll Gardens
 Williamsburg/Greenpoint
 Morningside Heights/Hamilton Heights
 Throgs Neck/Co-op City
(55 rows)


7) homework6=# SELECT sub_borough_area, avg("2000") FROM percent_asian GROUP BY sub_borough_area;
           sub_borough_area           |          avg           
--------------------------------------+------------------------
 Bedford Stuyvesant                   | 0.00839294860134032000
 Chelsea/Clinton/Midtown              | 0.09846123641000300000
 Brooklyn Heights/Fort Greene         | 0.04228276545063640000
 Coney Island                         | 0.09594620193183800000
 Kingsbridge Heights/Mosholu          | 0.06588428605846270000
 Rego Park/Forest Hills               | 0.21405900089848700000
 South Ozone Park/Howard Beach        | 0.12818650988811000000
 Jackson Heights                      | 0.13604234437843800000
 Lower East Side/Chinatown            | 0.34844541678830900000
 Williamsbridge/Baychester            | 0.01889460342567870000
 Astoria                              | 0.12536684365841200000
 Pelham Parkway                       | 0.06364621540433290000
 Elmhurst/Corona                      | 0.28187182267356500000
 Bensonhurst                          | 0.23097253431660600000
 Ozone Park/Woodhaven                 | 0.16066936836068600000
 North Crown Heights/Prospect Heights | 0.01542435244516580000
 Highbridge/South Concourse           | 0.01227679414091650000
 Flatlands/Canarsie                   | 0.03661540988287020000
 University Heights/Fordham           | 0.01550526551636720000
 Bayside/Little Neck                  | 0.26393373818791600000
 Flushing/Whitestone                  | 0.36088883417323800000
 East Harlem                          | 0.02733187216813350000
 Rockaways                            | 0.01583316157302760000
 Queens Village                       | 0.10017410959699200000
 Jamaica                              | 0.04682341444686240000
 East Flatbush                        | 0.00994747458048550000
 Soundview/Parkchester                | 0.03895526471751510000
 Upper West Side                      | 0.05568822087980150000
 Middle Village/Ridgewood             | 0.06331899928773050000
 South Crown Heights                  | 0.00772166503946892000
 North Shore                          | 0.05224803055170920000
 Bushwick                             | 0.02783530776218870000
 Brownsville/Ocean Hill               | 0.00560835687986128000
 Stuyvesant Town/Turtle Bay           | 0.10743790129708900000
 Sheepshead Bay/Gravesend             | 0.12306579801861500000
 Bay Ridge                            | 0.13589608829352100000
 East New York/Starrett City          | 0.03939887101023490000
 Riverdale/Kingsbridge                | 0.04910489102030620000
 Mott Haven/Hunts Point               | 0.00441555255730464000
 Greenwich Village/Financial District | 0.14546815644098400000
 South Shore                          | 0.03271828536298930000
 Mid-Island                           | 0.08805011819549690000
 Sunset Park                          | 0.21786614393568000000
 Sunnyside/Woodside                   | 0.29910268426465300000
 Hillcrest/Fresh Meadows              | 0.23723035128205100000
 Morrisania/Belmont                   | 0.00808836503506427000
 Upper East Side                      | 0.06312453066584570000
 Flatbush                             | 0.07961999819599440000
 Central Harlem                       | 0.00835999303330937000
 Washington Heights/Inwood            | 0.02043048931432170000
 Borough Park                         | 0.11154981456638800000
 Park Slope/Carroll Gardens           | 0.04686656245530680000
 Williamsburg/Greenpoint              | 0.03907866402050790000
 Morningside Heights/Hamilton Heights | 0.05204851273401800000
 Throgs Neck/Co-op City               | 0.01696205479083800000
(55 rows)


8) homework6=# SELECT sub_borough_area, avg("2000") FROM percent_asian GROUP BY sub_borough_area HAVING avg("2000") > .1; 
           sub_borough_area           |          avg           
--------------------------------------+------------------------
 Rego Park/Forest Hills               | 0.21405900089848700000
 South Ozone Park/Howard Beach        | 0.12818650988811000000
 Jackson Heights                      | 0.13604234437843800000
 Lower East Side/Chinatown            | 0.34844541678830900000
 Astoria                              | 0.12536684365841200000
 Elmhurst/Corona                      | 0.28187182267356500000
 Bensonhurst                          | 0.23097253431660600000
 Ozone Park/Woodhaven                 | 0.16066936836068600000
 Bayside/Little Neck                  | 0.26393373818791600000
 Flushing/Whitestone                  | 0.36088883417323800000
 Queens Village                       | 0.10017410959699200000
 Stuyvesant Town/Turtle Bay           | 0.10743790129708900000
 Sheepshead Bay/Gravesend             | 0.12306579801861500000
 Bay Ridge                            | 0.13589608829352100000
 Greenwich Village/Financial District | 0.14546815644098400000
 Sunset Park                          | 0.21786614393568000000
 Sunnyside/Woodside                   | 0.29910268426465300000
 Hillcrest/Fresh Meadows              | 0.23723035128205100000
 Borough Park                         | 0.11154981456638800000
(19 rows)


9) homework6=# SELECT sub_borough_area, "2000", "2018", delta FROM percent_asian WHERE "2018" = (SELECT max("2018") FROM percent_asian);
  sub_borough_area   |       2000        |  2018   |       delta       
---------------------+-------------------+---------+-------------------
 Flushing/Whitestone | 0.360888834173238 | 0.53482 | 0.173931165826762
(1 row)


10) homework6=# SELECT sub_borough_area, "2000", "2018", delta FROM percent_asian WHERE "2018" = (SELECT min("2018") FROM percent_asian);
    sub_borough_area    |        2000         |    2018    |        delta        
------------------------+---------------------+------------+---------------------
 Mott Haven/Hunts Point | 0.00441555255730464 | 0.00712792 | 0.00271236744269536
(1 row)


11) homework6=# SELECT avg(delta) FROM percent_asian;
          avg           
------------------------
 0.04439860097153320000
(1 row)


12) homework6=# SELECT sub_borough_area, "2000", "2018", delta FROM percent_asian WHERE delta = (SELECT max(delta) FROM percent_asian);
  sub_borough_area   |       2000        |   2018   |       delta       
---------------------+-------------------+----------+-------------------
 Bayside/Little Neck | 0.263933738187916 | 0.489269 | 0.225335261812084
(1 row)