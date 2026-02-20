CREATE DATABASE HOSPITAL_PATIENTS;

USE HOSPITAL_PATIENTS;

CREATE TABLE patients (
    patient_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE,
    gender VARCHAR(10),
    phone VARCHAR(15)
);
desc patients;

INSERT INTO patients (patient_id, name, date_of_birth, gender, phone) VALUES
(1, 'Amit Sharma', '1990-05-12', 'Male', '9876543210'),
(2, 'Neha Verma', '1985-08-22', 'Female', '9876543211'),
(3, 'Rahul Singh', '1992-03-18', 'Male', '9876543212'),
(4, 'Pooja Patel', '1998-11-05', 'Female', '9876543213'),
(5, 'Rohit Mehta', '1980-01-30', 'Male', '9876543214');

select * from patients;

CREATE TABLE doctors (
    doctor_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    specialization VARCHAR(100),
    phone VARCHAR(15)
);

desc doctors;

INSERT INTO doctors (doctor_id, name, specialization, phone) VALUES
(101, 'Dr. Anjali Rao', 'Cardiology', '9123456780'),
(102, 'Dr. Vikram Malhotra', 'Orthopedics', '9123456781'),
(103, 'Dr. Sunita Kapoor', 'Neurology', '9123456782'),
(104, 'Dr. Rajesh Kumar', 'General Medicine', '9123456783');

select * from doctors;


CREATE TABLE appointments (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATETIME,
    status VARCHAR(20),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

desc appointments;

INSERT INTO appointments (appointment_id, patient_id, doctor_id, appointment_date, status) VALUES 
(1001, 1, 101, '2025-01-15 10:00:00', 'Completed'),
(1002, 2, 102, '2025-01-16 11:00:00', 'Completed'),
(1003, 3, 102, '2025-01-16 09:30:00', 'Cancelled'),
(1004, 1, 103, '2025-01-16 14:00:00', 'Completed'),
(1005, 4, 104, '2025-01-17 12:00:00', 'Scheduled'),
(1006, 5, 104, '2025-01-18 15:00:00', 'Completed'),
(1007, 2, 102, '2025-01-19 10:30:00', 'No-Show'),
(1008, 1, 101, '2025-01-20 09:00:00', 'Completed'),
(1009, 1, 101, '2025-01-21 09:00:00', 'Completed'),
(1010, 2, 101, '2025-01-21 10:00:00', 'Completed'),
(1011, 3, 101, '2025-01-21 11:00:00', 'Completed'),
(1012, 4, 101, '2025-01-21 12:00:00', 'Completed'),

(1013, 5, 101, '2025-01-22 09:00:00', 'Completed'),
(1014, 1, 101, '2025-01-22 10:00:00', 'Completed'),
(1015, 2, 101, '2025-01-22 11:00:00', 'Completed'),
(1016, 3, 101, '2025-01-22 12:00:00', 'Completed'),

(1017, 4, 101, '2025-01-23 09:00:00', 'Completed'),
(1018, 5, 101, '2025-01-23 10:00:00', 'Completed'),
(1019, 1, 101, '2025-01-23 11:00:00', 'Completed'),
(1020, 2, 101, '2025-01-23 12:00:00', 'Completed'),

(1021, 3, 101, '2025-01-24 09:00:00', 'Completed'),
(1022, 4, 101, '2025-01-24 10:00:00', 'Completed'),
(1023, 5, 101, '2025-01-24 11:00:00', 'Completed'),
(1024, 1, 101, '2025-01-24 12:00:00', 'Completed'),

(1025, 2, 101, '2025-01-25 09:00:00', 'Completed'),
(1026, 3, 101, '2025-01-25 10:00:00', 'Completed'),
(1027, 4, 101, '2025-01-25 10:00:00', 'Completed'),
(1028, 5, 101, '2025-01-25 10:00:00', 'Completed');


select * from appointments;

CREATE TABLE diagnoses (
    diagnosis_id INT PRIMARY KEY,
    appointment_id INT,
    diagnosis_code VARCHAR(20),
    description VARCHAR(255),
    FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id)
);

desc diagnoses;

INSERT INTO diagnoses (diagnosis_id, appointment_id, diagnosis_code, description) VALUES
(201, 1001, 'D101', 'Hypertension'),
(202, 1002, 'D101', 'Hypertension'),
(203, 1003, 'D202', 'Knee Injury'),
(204, 1004, 'D303', 'Migraine'),
(205, 1006, 'D404', 'Viral Fever'),
(206, 1008, 'D101', 'Hypertension');

select * from diagnoses;

CREATE TABLE treatments (
    treatment_id INT PRIMARY KEY,
    diagnosis_id INT,
    treatment_description VARCHAR(255),
    medication_prescribed VARCHAR(255),
    FOREIGN KEY (diagnosis_id) REFERENCES diagnoses(diagnosis_id)
);

desc treatments;

INSERT INTO treatments (treatment_id, diagnosis_id, treatment_description, medication_prescribed) VALUES
(301, 201, 'Blood pressure monitoring', 'Amlodipine'),
(302, 202, 'Diet and lifestyle advice', 'Losartan'),
(303, 203, 'Physiotherapy sessions', 'Pain Relievers'),
(304, 204, 'Migraine management', 'Sumatriptan'),
(305, 205, 'Rest and hydration', 'Paracetamol'),
(306, 206, 'Regular BP checkup', 'Atenolol');

select * from treatments;

-- Queries to Solve:
-- 1.	List all appointments for a specific doctor on a given day.

select * from appointments;

select appointment_id,appointment_date,doctor_id from appointments
where doctor_id=101 and date(appointment_date)='2025-01-15';

-- 2.	Count the number of patients per doctor.
  
  select * from doctors;
  select * from appointments;
  
select d.doctor_id,d.name,count(distinct a.patient_id) from doctors d
 join appointments a 
on d.doctor_id = a.doctor_id 
 group by d.doctor_id, d.name;
 
-- 3.	Find the most common diagnosis.

select * from diagnoses;
select count(diagnosis_code)as diagnostic_count,description from diagnoses
group by diagnosis_code , description
order by diagnostic_count desc limit 1;

-- 4.	Calculate the average number of appointments per day.

select * from appointments;

select avg(daily_count) as avg_appointment_per_day from 
(select appointment_date, count(appointment_id) as daily_count from appointments
 group by appointment_date)as daily_appointment;

select appointment_date, count(appointment_id) as daily_count from appointments
 group by appointment_date;
 
 -- 5.	List patients who have missed appointments (status = 'Cancelled' or no-show logic).
 
 select * from appointments;
  select * from patients;
  
 select p.patient_id,p.name,a.status from appointments a
 join  patients p on a.patient_id=p.patient_id
 where status ='cancelled'or status = 'no-show';  
 
 -- 6.	Find doctors who have more than 20 appointments in a week.
 
 select * from doctor;
 select * from appointments;
 
 select d.doctor_id,d.name, count(appointment_id) as highest_count,
 week(a.appointment_date,1)as week_no from appointments a 
 join doctors d on a.doctor_id=d.doctor_id
 group by d.doctor_id,week(a.appointment_date,1),d.name
 having count(d.doctor_id)>20;


-- 7.	Identify the busiest day of the week for appointments.

select * from appointments;
select count(appointment_id) as total_appointment ,dayname(appointment_date) as buisest_day from appointments
group by dayname(appointment_date)
order by count(appointment_id) desc limit 1 ;


-- 8.	List all treatments prescribed for a specific diagnosis.

select * from treatments;
select * from diagnoses;

select t.medication_prescribed, d.description from treatments t
join diagnoses d on t.diagnosis_id=d.diagnosis_id
where description ='hypertension';

-- 9.	Find the top 3 specializations with the highest number of appointments.

select * from appointments;
select * from doctors;

select count(appointment_id) as highest_appointment, d.specialization from appointments a
join doctors d on a.doctor_id=d.doctor_id 
group by d.specialization 
order by count(appointment_id)desc limit 3;

-- 10.	Calculate the patient re-visit rate (patients with more than one appointment).

select * from appointments;

select  patient_id, count(appointment_id)as 're-visit' from appointments
group by patient_id having count(appointment_id)>1;

