# select * from diabete;

# Retrieve the Patient_id and ages of all patients.
# select patient_id, age from diabete;

# Select all female patients who are older than 40.
# Select * from diabete where gender = "female" and age > 40;

# Calculate the average BMI of patients
# Select AVG(bmi) as avg_bmi from diabete;

# List patients in descending order of blood glucose levels
# Select * from diabete order by blood_glucose_level desc;

# Find patients who have hypertension and diabetes.
# select * from diabete where hypertension = 1 && diabetes = 1; 
# alternate way
# select EmployeeName, patient_id, gender, age from diabete where hypertension = 1 && diabetes = 1;

# Determine the number of patients with heart disease
# select Count(*) as patient_with_heart_disease from diabete where heart_disease = 1;

# Group patients by smoking history and count how many smokers and non smokers there are
# select smoking_history, count(*) as count_of_history from diabete group by smoking_history;

# Retrieve the Patient_ids of patients who have a BMI greater than the average BMI.
# select patient_id from diabete where bmi > (select(avg(bmi)) from diabete);

# Find the patient with the highest HbA1c level and the patient with the lowest HbA1clevel.
-- Patient with the highest HbA1c level
 -- SELECT *
-- FROM diabete
-- ORDER BY hba1c_level DESC
-- LIMIT 1;

-- Patient with the lowest HbA1c level
-- SELECT *
-- FROM diabete
-- ORDER BY hba1c_level ASC
-- LIMIT 1;

# Calculate the age of patients in years (assuming the current date as of now).
-- SELECT patient_id, ABS(age - YEAR(NOW())) AS birth_year
-- FROM diabete;

#  Rank patients by blood glucose level within each gender group
-- select patient_id, gender, 
-- row_number() over(order by blood_glucose_level desc, gender desc) as patient_rank 
-- from diabete;

# Update the smoking history of patients who are older than 50 to "Ex-smoker."
-- SET SQL_SAFE_UPDATES = 0;
-- UPDATE diabete
-- SET smoking_history = 'Ex-smoker'
-- WHERE age > 50;
 -- re-enable safe updates
-- SET SQL_SAFE_UPDATES = 1;

# Insert a new patient into the database with sample data.
-- INSERT INTO diabete 
 -- values("jennie", "PT10001012","Female", 36, 0,0, "never", 23, 5, 128, 1);

# Delete all patients with heart disease from the database
-- SET SQL_SAFE_UPDATES = 0;
-- DELETE from diabete where heart_disease = 1;
-- SET SQL_SAFE_UPDATES = 1;

#  Find patients who have hypertension but not diabetes using the EXCEPT operator.

-- select * from diabete where hypertension = 1 EXCEPT select * from diabete where diabete = 1; 
# The EXCEPT operator is not directly supported in MySQL.

-- alternative way
-- SELECT *
-- FROM diabete
-- WHERE hypertension = 1 AND patient_id NOT IN (
   -- SELECT patient_id
    -- FROM diabete
    -- WHERE diabetes = 1
-- );

# encountring duplicate id problem 
 -- SET SQL_SAFE_UPDATES = 0;
-- UPDATE diabete
-- SET patient_id = 'PTA11111'
-- WHERE EmployeeName = "jennie";
-- SET SQL_SAFE_UPDATES = 1;

# Define a unique constraint on the "patient_id" column to ensure its values are unique
-- ALTER TABLE diabete modify Patient_id varchar(255) unique;

# Create a view that displays the Patient_ids, ages, and BMI of patients.
-- create view bmi_of_patient as (select patient_id, age, bmi from diabete);