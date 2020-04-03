-- write your COPY statement to import a csv here

\COPY percent_asian FROM 'sub-borougharea-percentasian.csv' DELIMITER ',' CSV HEADER;

-- or 

-- COPY percent_asian(sub_borough_area,"2000","2005","2006","2007","2008","2009","2010","2011","2012","2013","2014","2015","2016","2017","2018") FROM 'sub-bor
-- ougharea-percentasian.csv' DELIMITER ',' CSV HEADER;