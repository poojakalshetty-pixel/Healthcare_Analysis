CREATE TABLE healthcare (
    Name               VARCHAR(100),
    Age                INT,
    Gender             VARCHAR(10),
    Blood_Type         VARCHAR(5),
    Medical_Condition  VARCHAR(50),
    Date_of_Admission  DATE,
    Doctor             VARCHAR(100),
    Hospital           VARCHAR(100),
	
    Insurance_Provider VARCHAR(50),
    Billing_Amount     DECIMAL(10,2),
    Room_Number        INT,
    Admission_Type     VARCHAR(20),
    Discharge_Date     DATE,
    Medication         VARCHAR(50),
    Test_results       VARCHAR(20)
	);

SELECT* FROM HEALTHCARE LIMIT 5;

SELECT NAME , AGE, GENDER 
FROM HEALTHCARE ;

SELECT 
NAME
FROM HEALTHCARE 
WHERE GENDER = 'Female';

select name
from healthcare 
where age >60
order by age Desc;

select name 
from healthcare 
where medical_condition ='Diabetes'
and admission_type='Emergency';

SELECT
name
billing_amount
from healthcare
order by billing_amount Desc
limit 10;

select medical_condition,count(*)
from healthcare
group by medical_condition
order by count(*) desc;

select hospital ,sum(billing_amount)
from healthcare 
group by hospital;

SELECT hospital, ROUND(SUM(billing_amount), 2)
FROM healthcare
GROUP BY hospital
ORDER BY SUM(billing_amount) DESC;

select name, age,
case
when age < 18 then 'minor'
when age between 18 and 35 then 'younger adult'
when age between 36 and 60 then 'middle aged'
else 'senior'
end as age_group
from healthcare;


select name, billing_amount
from healthcare
where billing_amount > (select avg(billing_amount)from healthcare);

SELECT name, billing_amount,
RANK() OVER (ORDER BY billing_amount DESC) AS billing_rank
FROM healthcare;

SELECT name, medical_condition, billing_amount,
RANK() OVER (PARTITION BY medical_condition ORDER BY billing_amount DESC) AS rank_in_condition
FROM healthcare;

SELECT name, billing_amount,
LAG(billing_amount) OVER (ORDER BY billing_amount) AS previous_billing
FROM healthcare;

SELECT name, billing_amount,
LAG(billing_amount) OVER (ORDER BY billing_amount) AS previous_billing
FROM healthcare;

WITH abnormal_patients AS (
    SELECT name, medical_condition, test_results
    FROM healthcare
    WHERE test_results = 'Abnormal'
)
SELECT * FROM abnormal_patients;





