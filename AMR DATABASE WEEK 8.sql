-- CREATE SCHEMA amr_db;
-- USE amr_db;

-- CREATE TABLE amr_db.Country (
-- 	country_id INT PRIMARY KEY,
--     country_name VARCHAR(50) NOT NULL
-- );

-- CREATE TABLE amr_db.Region (
-- 	region_id INT PRIMARY KEY,
--     region_name VARCHAR(50) NOT NULL,
--     country_id INT,
--     FOREIGN KEY (country_id) REFERENCES amr_db.Country(country_id)
-- );

-- CREATE TABLE amr_db.Hospital (
-- 	hospital_id INT PRIMARY KEY,
--     hospital_name VARCHAR(100) NOT NULL,
--     region_id INT,
--     FOREIGN KEY (region_id) REFERENCES amr_db.Region(region_id)
-- );

-- CREATE TABLE amr_db.Patient (
-- 	patient_id INT PRIMARY KEY,
--     patient_name VARCHAR(100) NOT NULL,
--     hospital_id INT,
--     FOREIGN KEY (hospital_id) REFERENCES amr_db.Hospital(hospital_id)
-- );

-- CREATE TABLE amr_db.Antibiotic (
-- 	antibiotic_id INT PRIMARY KEY,
--     antibiotic_name VARCHAR(50) NOT NULL
-- );

-- CREATE TABLE amr_db.AMR_TEST (
-- 	test_id INT PRIMARY KEY,
--     patient_id INT,
--     test_date DATE NOT NULL,
--     antibiotic_id INT,
--     result VARCHAR(20) NOT NULL CHECK (result IN ('resistant', 'susceptible')),
--     FOREIGN KEY (patient_id) REFERENCES amr_db.Patient(patient_id),
--     FOREIGN KEY (antibiotic_id) REFERENCES amr_db.Antibiotic(antibiotic_id)
-- );

-- INSERT INTO amr_db.Country (country_id, country_name) VALUES
-- 	(1, 'South Africa'),
--     (2, 'Nigeria'),
--     (3, 'Egypt');
--     
-- INSERT INTO amr_db.Region (region_id, region_name, country_id) VALUES
--   (1, 'Gauteng', 1),
--   (2, 'Lagos', 2),
--   (3, 'Cairo', 3),
--   (4, 'KwaZulu-Natal', 1),
--   (5, 'Oyo', 2);

-- INSERT INTO amr_db.Hospital (hospital_id, hospital_name, region_id) VALUES
--   (1, 'Johannesburg General', 1),
--   (2, 'Lagos University Teaching Hospital', 2),
--   (3, 'Cairo University Hospital', 3),
--   (4, 'Durban Hospital', 4),
--   (5, 'Ibadan University College Hospital', 5);
--   
-- INSERT INTO amr_db.Patient (patient_id, patient_name, hospital_id) VALUES
--   (1, 'Emma Wales', 1),
--   (2, 'Samita Igbo', 2),
--   (3, 'Ahmed Ali', 3),
--   (4, 'Thabo Mbeki', 4),
--   (5, 'Nneka Okoro', 5);

--   INSERT INTO amr_db.Antibiotic (antibiotic_id, antibiotic_name) VALUES
--   (1, 'Ciprofloxacin'),
--   (2, 'Ceftriaxone'),
--   (3, 'Meropenem');
  
--   INSERT INTO amr_db.AMR_Test (test_id, patient_id, test_date, antibiotic_id, result) VALUES
--   (1, 1, '2020-01-01', 1, 'resistant'),
--   (2, 2, '2020-02-01', 2, 'susceptible'),
--   (3, 3, '2020-03-01', 1, 'resistant'),
--   (4, 4, '2020-04-01', 3, 'susceptible'),
--   (5, 5, '2020-05-01', 2, 'resistant');

-- Data Retrieval
-- Retrieve all patients with AMR test results:
-- SELECT p.patient_name, t.test_date, t.result, a.antibiotic_name
-- FROM amr_db.Patient p
-- JOIN amr_db.AMR_Test t ON p.patient_id = t.patient_id
-- JOIN amr_db.Antibiotic a ON t.antibiotic_id = a.antibiotic_id;

-- Retrieve the number of patients with resistant AMR test results by region:
-- SELECT r.region_name, COUNT(t.test_id) AS num_resistant
-- FROM amr_db.Region r
-- JOIN amr_db.Hospital h ON r.region_id = h.region_id
-- JOIN amr_db.Patient p ON h.hospital_id = p.hospital_id
-- JOIN amr_db.AMR_Test t ON p.patient_id = t.patient_id
-- WHERE t.result = 'resistant'
-- GROUP BY r.region_name;

-- Retrieve the top 3 antibiotics with the highest number of resistant AMR test results:
-- SELECT a.antibiotic_name, COUNT(t.test_id) AS num_resistant
-- FROM amr_db.Antibiotic a
-- JOIN amr_db.AMR_Test t ON a.antibiotic_id = t.antibiotic_id
-- WHERE t.result = 'resistant'
-- GROUP BY a.antibiotic_name
-- ORDER BY num_resistant DESC
-- LIMIT 3;

-- Calculate the percentage of patients with resistant AMR test results by region:
-- SELECT r.region_name, 
--        (COUNT(t.test_id) / (SELECT COUNT(*) FROM amr_db.AMR_Test)) * 100 AS percentage_resistant
-- FROM amr_db.Region r
-- JOIN amr_db.Hospital h ON r.region_id = h.region_id
-- JOIN amr_db.Patient p ON h.hospital_id = p.hospital_id
-- JOIN amr_db.AMR_Test t ON p.patient_id = t.patient_id
-- WHERE t.result = 'resistant'
-- GROUP BY r.region_name;

-- Identify the regions with the highest number of patients with resistant AMR test results:
-- SELECT r.region_name, COUNT(t.test_id) AS num_resistant
-- FROM amr_db.Region r
-- JOIN amr_db.Hospital h ON r.region_id = h.region_id
-- JOIN amr_db.Patient p ON h.hospital_id = p.hospital_id
-- JOIN amr_db.AMR_Test t ON p.patient_id = t.patient_id
-- WHERE t.result = 'resistant'
-- GROUP BY r.region_name
-- ORDER BY num_resistant DESC;





  

