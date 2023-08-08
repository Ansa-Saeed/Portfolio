-- Table: international_debt

CREATE TABLE international_debt
(
  country_name character varying(50),
  country_code character varying(50),
  indicator_name text,
  indicator_code text,
  debt numeric
);

-- Copy over data from CSV
COPY international_debt FROM 'D:\Portfolio\SQL\Analyze International Debt Statistics\datasets\international_debt.csv' DELIMITER ',' CSV HEADER;