-- write your table creation sql here!

DROP TABLE IF EXISTS percent_asian;

CREATE TABLE percent_asian (
    sub_borough_area varchar(255) PRIMARY KEY,
    "2000" numeric NOT NULL,
    "2005" numeric NOT NULL,
    "2006" numeric NOT NULL,
    "2007" numeric NOT NULL,
    "2008" numeric NOT NULL,
    "2009" numeric NOT NULL,
    "2010" numeric NOT NULL,
    "2011" numeric NOT NULL,
    "2012" numeric NOT NULL,
    "2013" numeric NOT NULL,
    "2014" numeric NOT NULL,
    "2015" numeric NOT NULL,
    "2016" numeric NOT NULL,
    "2017" numeric NOT NULL,
    "2018" numeric NOT NULL
);
