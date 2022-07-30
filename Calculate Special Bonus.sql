SELECT employee_id,
CASE
    WHEN employee_id%2 = 1 AND Name NOT LIKE 'M%' THEN salary
    ELSE salary*0
END AS bonus
FROM Employees ORDER BY employee_id;
