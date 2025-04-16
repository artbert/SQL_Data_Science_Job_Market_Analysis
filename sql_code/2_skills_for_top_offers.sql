/*
 2. Which skills are predominantly associated with top-paying data scientist roles in Europe?
 - Identify the most frequently required skills in the 10 highest-paying remote job offers.
 - Help job seekers better understand and prepare for these positions.
*/

WITH top_paying_jobs AS (
  SELECT 
    job_offer_europe.id,
    title,
    salary_year_avg,
    name AS company_name
  FROM job_offer_europe
    LEFT JOIN company ON job_offer_europe.company_id = company.id
  WHERE title_short = 'Data Scientist'
    AND work_from_home = TRUE
    AND salary_year_avg IS NOT NULL
  ORDER BY salary_year_avg DESC
  LIMIT 10
)
SELECT 
  skill_name,
  COUNT(skill_name) AS skill_count
FROM (
    SELECT 
      top_paying_jobs.*,
      skill.skill_name
    FROM top_paying_jobs
      INNER JOIN job_has_skill ON top_paying_jobs.id = job_has_skill.job_id
      INNER JOIN skill ON job_has_skill.skill_id = skill.id
    ORDER BY salary_year_avg DESC
  ) AS top_paying_jobs_skills
GROUP BY skill_name
ORDER BY skill_count DESC

/*
Result set:

[
    {
        "id": 539610,
        "title": "Data Scientist, Machine Learning and RWD",
        "salary_year_avg": "160000.0",
        "company_name": "Citeline",
        "skill_name": "sql"
    },
    {
        "id": 539610,
        "title": "Data Scientist, Machine Learning and RWD",
        "salary_year_avg": "160000.0",
        "company_name": "Citeline",
        "skill_name": "python"
    },
    {
        "id": 539610,
        "title": "Data Scientist, Machine Learning and RWD",
        "salary_year_avg": "160000.0",
        "company_name": "Citeline",
        "skill_name": "aws"
    },
    {
        "id": 539610,
        "title": "Data Scientist, Machine Learning and RWD",
        "salary_year_avg": "160000.0",
        "company_name": "Citeline",
        "skill_name": "redshift"
    },
    {
        "id": 539610,
        "title": "Data Scientist, Machine Learning and RWD",
        "salary_year_avg": "160000.0",
        "company_name": "Citeline",
        "skill_name": "pandas"
    },
    {
        "id": 539610,
        "title": "Data Scientist, Machine Learning and RWD",
        "salary_year_avg": "160000.0",
        "company_name": "Citeline",
        "skill_name": "numpy"
    },
    {
        "id": 539610,
        "title": "Data Scientist, Machine Learning and RWD",
        "salary_year_avg": "160000.0",
        "company_name": "Citeline",
        "skill_name": "pyspark"
    },
    {
        "id": 539610,
        "title": "Data Scientist, Machine Learning and RWD",
        "salary_year_avg": "160000.0",
        "company_name": "Citeline",
        "skill_name": "tensorflow"
    },
    {
        "id": 539610,
        "title": "Data Scientist, Machine Learning and RWD",
        "salary_year_avg": "160000.0",
        "company_name": "Citeline",
        "skill_name": "keras"
    },
    {
        "id": 539610,
        "title": "Data Scientist, Machine Learning and RWD",
        "salary_year_avg": "160000.0",
        "company_name": "Citeline",
        "skill_name": "pytorch"
    },
    {
        "id": 539610,
        "title": "Data Scientist, Machine Learning and RWD",
        "salary_year_avg": "160000.0",
        "company_name": "Citeline",
        "skill_name": "scikit-learn"
    },
    {
        "id": 232562,
        "title": "Data Scientist - Service Logistics",
        "salary_year_avg": "140500.0",
        "company_name": "Cisco",
        "skill_name": "oracle"
    },
    {
        "id": 232562,
        "title": "Data Scientist - Service Logistics",
        "salary_year_avg": "140500.0",
        "company_name": "Cisco",
        "skill_name": "snowflake"
    },
    {
        "id": 232562,
        "title": "Data Scientist - Service Logistics",
        "salary_year_avg": "140500.0",
        "company_name": "Cisco",
        "skill_name": "pandas"
    },
    {
        "id": 232562,
        "title": "Data Scientist - Service Logistics",
        "salary_year_avg": "140500.0",
        "company_name": "Cisco",
        "skill_name": "jupyter"
    },
    {
        "id": 232562,
        "title": "Data Scientist - Service Logistics",
        "salary_year_avg": "140500.0",
        "company_name": "Cisco",
        "skill_name": "scikit-learn"
    },
    {
        "id": 232562,
        "title": "Data Scientist - Service Logistics",
        "salary_year_avg": "140500.0",
        "company_name": "Cisco",
        "skill_name": "matplotlib"
    },
    {
        "id": 232562,
        "title": "Data Scientist - Service Logistics",
        "salary_year_avg": "140500.0",
        "company_name": "Cisco",
        "skill_name": "tableau"
    },
    {
        "id": 1017393,
        "title": "Bioprocess Data Scientist",
        "salary_year_avg": "140000.0",
        "company_name": "Invert",
        "skill_name": "python"
    },
    {
        "id": 1017393,
        "title": "Bioprocess Data Scientist",
        "salary_year_avg": "140000.0",
        "company_name": "Invert",
        "skill_name": "mongodb"
    },
    {
        "id": 1017393,
        "title": "Bioprocess Data Scientist",
        "salary_year_avg": "140000.0",
        "company_name": "Invert",
        "skill_name": "mongodb"
    },
    {
        "id": 1017393,
        "title": "Bioprocess Data Scientist",
        "salary_year_avg": "140000.0",
        "company_name": "Invert",
        "skill_name": "pandas"
    },
    {
        "id": 1017393,
        "title": "Bioprocess Data Scientist",
        "salary_year_avg": "140000.0",
        "company_name": "Invert",
        "skill_name": "numpy"
    },
    {
        "id": 1017393,
        "title": "Bioprocess Data Scientist",
        "salary_year_avg": "140000.0",
        "company_name": "Invert",
        "skill_name": "pytorch"
    },
    {
        "id": 1017393,
        "title": "Bioprocess Data Scientist",
        "salary_year_avg": "140000.0",
        "company_name": "Invert",
        "skill_name": "github"
    },
    {
        "id": 1017393,
        "title": "Bioprocess Data Scientist",
        "salary_year_avg": "140000.0",
        "company_name": "Invert",
        "skill_name": "notion"
    },
    {
        "id": 1017393,
        "title": "Bioprocess Data Scientist",
        "salary_year_avg": "140000.0",
        "company_name": "Invert",
        "skill_name": "slack"
    },
    {
        "id": 36662,
        "title": "Data Scientist",
        "salary_year_avg": "120000.0",
        "company_name": "Workato",
        "skill_name": "python"
    },
    {
        "id": 452167,
        "title": "Credit Data Scientist (Mid-level)",
        "salary_year_avg": "115000.0",
        "company_name": "Credora",
        "skill_name": "sql"
    },
    {
        "id": 452167,
        "title": "Credit Data Scientist (Mid-level)",
        "salary_year_avg": "115000.0",
        "company_name": "Credora",
        "skill_name": "python"
    },
    {
        "id": 452167,
        "title": "Credit Data Scientist (Mid-level)",
        "salary_year_avg": "115000.0",
        "company_name": "Credora",
        "skill_name": "r"
    },
    {
        "id": 669702,
        "title": "Senior Aktuary / Data Scientist for Pricing (m/f/d)",
        "salary_year_avg": "87499.5",
        "company_name": "Allianz",
        "skill_name": "python"
    },
    {
        "id": 669702,
        "title": "Senior Aktuary / Data Scientist for Pricing (m/f/d)",
        "salary_year_avg": "87499.5",
        "company_name": "Allianz",
        "skill_name": "java"
    },
    {
        "id": 669702,
        "title": "Senior Aktuary / Data Scientist for Pricing (m/f/d)",
        "salary_year_avg": "87499.5",
        "company_name": "Allianz",
        "skill_name": "r"
    },
    {
        "id": 669702,
        "title": "Senior Aktuary / Data Scientist for Pricing (m/f/d)",
        "salary_year_avg": "87499.5",
        "company_name": "Allianz",
        "skill_name": "sas"
    },
    {
        "id": 669702,
        "title": "Senior Aktuary / Data Scientist for Pricing (m/f/d)",
        "salary_year_avg": "87499.5",
        "company_name": "Allianz",
        "skill_name": "sas"
    },
    {
        "id": 488430,
        "title": "Data Scientist",
        "salary_year_avg": "80000.0",
        "company_name": "Lago",
        "skill_name": "sql"
    },
    {
        "id": 488430,
        "title": "Data Scientist",
        "salary_year_avg": "80000.0",
        "company_name": "Lago",
        "skill_name": "python"
    },
    {
        "id": 488430,
        "title": "Data Scientist",
        "salary_year_avg": "80000.0",
        "company_name": "Lago",
        "skill_name": "pytorch"
    },
    {
        "id": 488430,
        "title": "Data Scientist",
        "salary_year_avg": "80000.0",
        "company_name": "Lago",
        "skill_name": "github"
    },
    {
        "id": 446498,
        "title": "Content Manager with ML/Data Science Experience",
        "salary_year_avg": "60000.0",
        "company_name": "Neurons Lab",
        "skill_name": "aws"
    },
    {
        "id": 249359,
        "title": "Database Engineer",
        "salary_year_avg": "55000.0",
        "company_name": "Alcor",
        "skill_name": "nosql"
    },
    {
        "id": 249359,
        "title": "Database Engineer",
        "salary_year_avg": "55000.0",
        "company_name": "Alcor",
        "skill_name": "elasticsearch"
    },
    {
        "id": 249359,
        "title": "Database Engineer",
        "salary_year_avg": "55000.0",
        "company_name": "Alcor",
        "skill_name": "cassandra"
    },
    {
        "id": 249359,
        "title": "Database Engineer",
        "salary_year_avg": "55000.0",
        "company_name": "Alcor",
        "skill_name": "couchbase"
    },
    {
        "id": 249359,
        "title": "Database Engineer",
        "salary_year_avg": "55000.0",
        "company_name": "Alcor",
        "skill_name": "aws"
    },
    {
        "id": 249359,
        "title": "Database Engineer",
        "salary_year_avg": "55000.0",
        "company_name": "Alcor",
        "skill_name": "kafka"
    },
    {
        "id": 1804497,
        "title": "Junior Data Scientist (Clone)",
        "salary_year_avg": "55000.0",
        "company_name": "mlxar",
        "skill_name": "python"
    }
]  
*/