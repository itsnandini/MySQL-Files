SELECT DISTINCT CITY FROM STATION
WHERE NOT RIGHT(CITY,1) IN ('a','i','e','o','u');