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
