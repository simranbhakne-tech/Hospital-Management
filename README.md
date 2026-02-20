
# 🏥 Hospital Patient Management System

## **Project Overview**

The **Hospital Patient Management System** is a relational database project designed to manage hospital operations, including patients, doctors, appointments, diagnoses, and treatments. The system helps:

* Track patient visits and medical history
* Manage doctor schedules and appointments
* Monitor diagnoses and treatments
* Generate actionable insights for hospital administration

It demonstrates **RDBMS principles** and **SQL queries** for operational efficiency in a hospital setting.

---

## **Database Structure**

The system has **five main tables**:

1. **Patients:** Stores patient details (name, DOB, gender, contact).
2. **Doctors:** Stores doctor details (name, specialization, contact).
3. **Appointments:** Tracks patient-doctor appointments, including status.
4. **Diagnoses:** Records diagnoses for each appointment.
5. **Treatments:** Contains treatment plans and prescribed medications for each diagnosis.

**Relationships:**

* A patient can have multiple appointments.
* A doctor can have multiple appointments.
* Each appointment can have multiple diagnoses.
* Each diagnosis can have multiple treatments.

---

## **Key Functionalities & SQL Concepts**

### **1. Appointments per Doctor per Day**

* **SQL Concepts:** `SELECT`, `WHERE`, `DATE()`
* **Explanation:** `SELECT` retrieves columns, `WHERE` filters by doctor and date, `DATE()` extracts the date from a datetime field.
* **Purpose:** View a doctor’s daily schedule.

### **2. Patient Count per Doctor**

* **SQL Concepts:** `JOIN`, `COUNT(DISTINCT)`, `GROUP BY`
* **Explanation:** `JOIN` combines doctor and appointment tables, `COUNT(DISTINCT)` counts unique patients, `GROUP BY` aggregates data per doctor.
* **Purpose:** Analyze patient load for each doctor.

### **3. Most Common Diagnosis**

* **SQL Concepts:** `GROUP BY`, `ORDER BY`, `LIMIT`
* **Explanation:** Groups rows with the same diagnosis, sorts by frequency, and limits to the top result.
* **Purpose:** Identify frequent medical conditions.

### **4. Average Appointments per Day**

* **SQL Concepts:** `COUNT()`, Subqueries, `AVG()`
* **Explanation:** `COUNT()` counts appointments per day, subqueries calculate daily counts, `AVG()` computes the average.
* **Purpose:** Measure hospital activity trends for staffing and planning.

### **5. Missed Appointments**

* **SQL Concepts:** `JOIN`, `WHERE`, Conditional Filtering
* **Explanation:** `JOIN` connects patients and appointments, `WHERE` filters for 'Cancelled' or 'No-Show'.
* **Purpose:** Track patients who missed appointments.

### **6. Doctors with More than 20 Appointments per Week**

* **SQL Concepts:** `WEEK()`, `GROUP BY`, `HAVING`
* **Explanation:** `WEEK()` extracts week number, `GROUP BY` aggregates appointments per doctor per week, `HAVING` filters doctors exceeding 20 appointments.
* **Purpose:** Identify overbooked doctors.

### **7. Busiest Day of the Week**

* **SQL Concepts:** `DAYNAME()`, `GROUP BY`, `ORDER BY`
* **Explanation:** `DAYNAME()` returns weekday names, `GROUP BY` counts appointments per day, `ORDER BY` sorts to find the busiest day.
* **Purpose:** Optimize staffing and resources.

### **8. Treatments per Diagnosis**

* **SQL Concepts:** `JOIN`
* **Explanation:** `JOIN` links treatments with corresponding diagnoses.
* **Purpose:** Review treatments and medications prescribed for conditions.

### **9. Top Specializations by Appointments**

* **SQL Concepts:** `JOIN`, `GROUP BY`, `ORDER BY`, `LIMIT`
* **Explanation:** Combines doctor and appointment tables, groups by specialization, sorts by appointment count, and limits top 3.
* **Purpose:** Identify high-demand specialties.

### **10. Patient Re-Visit Rate**

* **SQL Concepts:** `COUNT()`, `GROUP BY`, `HAVING`
* **Explanation:** `COUNT()` counts appointments per patient, `GROUP BY` aggregates per patient, `HAVING` filters patients with more than one visit.
* **Purpose:** Track repeat visits for follow-ups and chronic care.

---

## **Benefits**

* Efficient appointment and patient management
* Operational insights for hospital administration
* Improved patient follow-ups and treatment monitoring
* Data-driven decisions for staffing, resources, and specialty planning

---

## **Potential Extensions**

* Integration with billing and payment tracking
* Patient lab reports and medical history integration
* Automated appointment reminders
* Dashboards and visual analytics
* Predictive analysis for hospital resource planning

---

## **Conclusion**

The **Hospital Patient Management System** demonstrates how relational databases and SQL concepts like `JOIN`, `GROUP BY`, `COUNT`, `HAVING`, subqueries, and date functions can streamline hospital operations. It enables efficient scheduling, treatment monitoring, and data-driven decision-making, and can be extended into a more comprehensive hospital management solution.

---

