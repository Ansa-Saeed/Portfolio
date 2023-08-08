SELECT * From international_debt;
SELECT COUNT(DISTINCT country_name) as con FROM international_debt;
SELECT DISTINCT indicator_code AS distinct_debt_indicators FROM international_debt ORDER BY distinct_debt_indicators;
SELECT 
    country_name, 
    SUM(debt) AS total_debt
FROM international_debt
GROUP BY country_name
ORDER BY total_debt desc 
LIMIT 10;
SELECT 
    indicator_code AS debt_indicator,
    indicator_name,
    AVG(debt) AS average_debt
FROM international_debt
GROUP BY debt_indicator, indicator_name
ORDER BY average_debt desc
LIMIT 10;
SELECT 
    country_name, 
    indicator_name
FROM international_debt
WHERE debt = (SELECT 
                 MAX(debt)
             FROM international_debt
             WHERE indicator_code='DT.AMT.DLXF.CD');