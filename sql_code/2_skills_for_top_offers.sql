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
        "skill_name": "python",
        "skill_count": "7"
    },
    {
        "skill_name": "pytorch",
        "skill_count": "3"
    },
    {
        "skill_name": "aws",
        "skill_count": "3"
    },
    {
        "skill_name": "pandas",
        "skill_count": "3"
    },
    {
        "skill_name": "sql",
        "skill_count": "3"
    },
    {
        "skill_name": "scikit-learn",
        "skill_count": "2"
    },
    {
        "skill_name": "github",
        "skill_count": "2"
    },
    {
        "skill_name": "mongodb",
        "skill_count": "2"
    },
    {
        "skill_name": "r",
        "skill_count": "2"
    },
    {
        "skill_name": "numpy",
        "skill_count": "2"
    },
    {
        "skill_name": "sas",
        "skill_count": "2"
    },
    {
        "skill_name": "oracle",
        "skill_count": "1"
    },
    {
        "skill_name": "pyspark",
        "skill_count": "1"
    },
    {
        "skill_name": "redshift",
        "skill_count": "1"
    },
    {
        "skill_name": "slack",
        "skill_count": "1"
    },
    {
        "skill_name": "snowflake",
        "skill_count": "1"
    },
    {
        "skill_name": "tableau",
        "skill_count": "1"
    },
    {
        "skill_name": "tensorflow",
        "skill_count": "1"
    },
    {
        "skill_name": "cassandra",
        "skill_count": "1"
    },
    {
        "skill_name": "couchbase",
        "skill_count": "1"
    },
    {
        "skill_name": "elasticsearch",
        "skill_count": "1"
    },
    {
        "skill_name": "java",
        "skill_count": "1"
    },
    {
        "skill_name": "jupyter",
        "skill_count": "1"
    },
    {
        "skill_name": "kafka",
        "skill_count": "1"
    },
    {
        "skill_name": "keras",
        "skill_count": "1"
    },
    {
        "skill_name": "matplotlib",
        "skill_count": "1"
    },
    {
        "skill_name": "nosql",
        "skill_count": "1"
    },
    {
        "skill_name": "notion",
        "skill_count": "1"
    }
]
*/