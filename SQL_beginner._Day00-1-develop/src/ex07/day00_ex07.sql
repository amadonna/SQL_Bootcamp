SELECT id, name ,
CASE WHEN
	age >= 10 and age <= 20 THEN (SELECT 'interval #1' AS interval_info)
	WHEN
	age >= 20 and age <= 24 THEN (SELECT 'interval #2' AS interval_info)
	ELSE (SELECT 'interval #3')
END AS interval_info
FROM person
ORDER BY interval_info;