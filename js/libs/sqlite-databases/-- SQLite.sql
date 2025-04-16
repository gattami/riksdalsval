-- SQLite

SELECT 
    CASE 
        WHEN City IN ('Delhi', 'Mumbai', 'Bangalore', 'Hyderabad', 'Chennai', 'Kolkata') THEN 'Storstad'
        ELSE 'Mindre Stad'
    END AS City_Type,
    CASE
        WHEN ROUND(Age) BETWEEN 18 AND 22 THEN '18-22'
        WHEN ROUND(Age) BETWEEN 23 AND 30 THEN '23-30'
        ELSE '31+'
    END AS Age_Group,
    AVG(Depression) AS Average_Depression
FROM depression_survey
WHERE City NOT IN ('Harsha', 'Rashi', 'City', 'M.Com', 'M.Tech', 'ME') -- Exkludera ogiltiga städer
GROUP BY City_Type, Age_Group
ORDER BY City_Type, Age_Group;

SELECT 
    CASE 
        WHEN City IN ('Delhi', 'Mumbai', 'Bangalore', 'Hyderabad', 'Chennai', 'Kolkata') THEN 'Storstad'
        ELSE 'Mindre Stad'
    END AS City_Type,
    CASE
        WHEN ROUND(Age) BETWEEN 18 AND 22 THEN '18-22'
        WHEN ROUND(Age) BETWEEN 23 AND 30 THEN '23-30'
        ELSE '31+'
    END AS Age_Group,
    ROUND(AVG(Depression) * 100, 2) AS Average_Depression_Percent -- Omvandlat till procent
FROM depression_survey
WHERE City NOT IN ('Harsha', 'Rashi', 'City', 'M.Com', 'M.Tech', 'ME') -- Exkludera ogiltiga städer
GROUP BY City_Type, Age_Group
ORDER BY City_Type, Age_Group;



CREATE VIEW your_view_name AS
SELECT
  CASE
    WHEN City IN ('Delhi', 'Mumbai', 'Bangalore', 'Hyderabad') THEN 'Storstad'
    ELSE 'Mindre Stad'
  END AS City_Type,
  CASE
    WHEN ROUND(Age) BETWEEN 18 AND 22 THEN '18–22'
    WHEN ROUND(Age) BETWEEN 23 AND 30 THEN '23–30'
    ELSE '31+'
  END AS Age_Group,
  ROUND(AVG(Depression) * 100, 2) AS Average_Depression_Percent
FROM depression_survey
WHERE City NOT IN ('Harsha', 'Rashi', 'City', 'M.Com', 'M.Tech')
GROUP BY City_Type, Age_Group
ORDER BY City_Type, Age_Group;
