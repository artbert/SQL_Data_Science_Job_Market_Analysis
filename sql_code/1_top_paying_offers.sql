/*
 1. What are the top-paying job offers for data scientists in Europe?
 - Retrieve the top 10 remote job offers sorted by annual average salary.
 - Include only listings that provide salary information.
*/

SELECT 
  job_offer_europe.id AS job_id,
  title,
  location,
  schedule_type,
  salary_year_avg,
  posted_date,
  name AS company_name
FROM job_offer_europe
  LEFT JOIN company ON job_offer_europe.company_id = company.id
WHERE title_short = 'Data Scientist'
  AND work_from_home = TRUE
  AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC,
  posted_date DESC
LIMIT 10

/*
Result set:

[
    {
        "job_id": 539610,
        "title": "Data Scientist, Machine Learning and RWD",
        "location": "Anywhere",
        "schedule_type": "Full-time",
        "salary_year_avg": "160000.0",
        "posted_date": "2023-08-27 07:15:14",
        "company_name": "Citeline"
    },
    {
        "job_id": 232562,
        "title": "Data Scientist - Service Logistics",
        "location": "Anywhere",
        "schedule_type": "Full-time",
        "salary_year_avg": "140500.0",
        "posted_date": "2023-11-07 23:38:17",
        "company_name": "Cisco"
    },
    {
        "job_id": 1017393,
        "title": "Bioprocess Data Scientist",
        "location": "Anywhere",
        "schedule_type": "Full-time",
        "salary_year_avg": "140000.0",
        "posted_date": "2023-12-07 16:52:16",
        "company_name": "Invert"
    },
    {
        "job_id": 36662,
        "title": "Data Scientist",
        "location": "Anywhere",
        "schedule_type": "Full-time",
        "salary_year_avg": "120000.0",
        "posted_date": "2023-07-19 10:38:45",
        "company_name": "Workato"
    },
    {
        "job_id": 452167,
        "title": "Credit Data Scientist (Mid-level)",
        "location": "Anywhere",
        "schedule_type": "Full-time",
        "salary_year_avg": "115000.0",
        "posted_date": "2023-05-03 11:53:32",
        "company_name": "Credora"
    },
    {
        "job_id": 669702,
        "title": "Senior Aktuary / Data Scientist for Pricing (m/f/d)",
        "location": "Anywhere",
        "schedule_type": "Full-time",
        "salary_year_avg": "87499.5",
        "posted_date": "2023-05-02 06:32:48",
        "company_name": "Allianz"
    },
    {
        "job_id": 488430,
        "title": "Data Scientist",
        "location": "Anywhere",
        "schedule_type": "Full-time",
        "salary_year_avg": "80000.0",
        "posted_date": "2023-11-10 13:34:18",
        "company_name": "Lago"
    },
    {
        "job_id": 446498,
        "title": "Content Manager with ML/Data Science Experience",
        "location": "Anywhere",
        "schedule_type": "Contractor",
        "salary_year_avg": "60000.0",
        "posted_date": "2023-02-27 13:14:54",
        "company_name": "Neurons Lab"
    },
    {
        "job_id": 1804497,
        "title": "Junior Data Scientist (Clone)",
        "location": "Anywhere",
        "schedule_type": "Full-time",
        "salary_year_avg": "55000.0",
        "posted_date": "2023-02-07 09:29:28",
        "company_name": "mlxar"
    },
    {
        "job_id": 249359,
        "title": "Database Engineer",
        "location": "Anywhere",
        "schedule_type": "Full-time",
        "salary_year_avg": "55000.0",
        "posted_date": "2023-01-10 06:35:14",
        "company_name": "Alcor"
    }
]
*/