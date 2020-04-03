-- write your queries underneath each number:
 
-- 1. the total number of rows in the database
SELECT count(*) FROM percent_asian;
-- 2. show the first 15 rows, but only display 3 columns (your choice)
SELECT sub_borough_area, "2000", "2018" FROM percent_asian LIMIT 15;
-- 3. do the same as above, but chose a column to sort on, and sort in descending order
SELECT sub_borough_area, "2000", "2018" FROM (SELECT * FROM percent_asian LIMIT 15) AS first_15 ORDER BY sub_borough_area DESC;
-- 4. add a new column without a default value
ALTER TABLE percent_asian ADD COLUMN delta numeric;
-- 5. set the value of that new column
UPDATE percent_asian SET delta = ("2018" - "2000");
-- 6. show only the unique (non duplicates) of a column of your choice
SELECT DISTINCT sub_borough_area FROM percent_asian;
-- 7.group rows together by a column value (your choice) and use an aggregate function to calculate something about that group 
SELECT sub_borough_area, avg("2000") FROM percent_asian GROUP BY sub_borough_area;
-- 8. now, using the same grouping query or creating another one, find a way to filter the query results based on the values for the groups
SELECT sub_borough_area, avg("2000") FROM percent_asian GROUP BY sub_borough_area HAVING avg("2000") > .1; 
-- 9. Which sub-borough has the highest percentage of asians in 2018?
SELECT sub_borough_area, "2000", "2018", delta FROM percent_asian WHERE "2018" = (SELECT max("2018") FROM percent_asian);
-- 10. Which sub-borough has the lowest percentage of asians in 2018?
SELECT sub_borough_area, "2000", "2018", delta FROM percent_asian WHERE "2018" = (SELECT min("2018") FROM percent_asian);
-- 11. What was the average change in percentage of asians between 2000 and 2018 in all of the sub-boroughs?
SELECT avg(delta) FROM percent_asian;
-- 12. Which sub-borough had the highest growth in percentage asian population from 2000 to 2018?
SELECT sub_borough_area, "2000", "2018", delta FROM percent_asian WHERE delta = (SELECT max(delta) FROM percent_asian);
