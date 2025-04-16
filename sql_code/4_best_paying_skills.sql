/*
 4. Which specialized skills command a premium in compensation?
 - Analyze average annual salaries associated with each skill for remote data scientist roles.
 - Identify the top 25 most financially rewarding skills.
*/

SELECT 
  skill_name,
  ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_offer_europe
  INNER JOIN job_has_skill ON job_offer_europe.id = job_has_skill.job_id
  INNER JOIN skill ON job_has_skill.skill_id = skill.id
WHERE title_short = 'Data Scientist'
  AND salary_year_avg IS NOT NULL
  AND work_from_home = TRUE
GROUP BY skill_name
ORDER BY avg_salary DESC
LIMIT 25

/*
Result set:

[
    {
        "skill_name": "redshift",
        "avg_salary": "160000"
    },
    {
        "skill_name": "keras",
        "avg_salary": "160000"
    },
    {
        "skill_name": "pyspark",
        "avg_salary": "160000"
    },
    {
        "skill_name": "tensorflow",
        "avg_salary": "160000"
    },
    {
        "skill_name": "scikit-learn",
        "avg_salary": "150250"
    },
    {
        "skill_name": "numpy",
        "avg_salary": "150000"
    },
    {
        "skill_name": "pandas",
        "avg_salary": "146833"
    },
    {
        "skill_name": "oracle",
        "avg_salary": "140500"
    },
    {
        "skill_name": "jupyter",
        "avg_salary": "140500"
    },
    {
        "skill_name": "matplotlib",
        "avg_salary": "140500"
    },
    {
        "skill_name": "snowflake",
        "avg_salary": "140500"
    },
    {
        "skill_name": "tableau",
        "avg_salary": "140500"
    },
    {
        "skill_name": "mongodb",
        "avg_salary": "140000"
    },
    {
        "skill_name": "notion",
        "avg_salary": "140000"
    },
    {
        "skill_name": "slack",
        "avg_salary": "140000"
    },
    {
        "skill_name": "pytorch",
        "avg_salary": "126667"
    },
    {
        "skill_name": "sql",
        "avg_salary": "118333"
    },
    {
        "skill_name": "github",
        "avg_salary": "110000"
    },
    {
        "skill_name": "python",
        "avg_salary": "108214"
    },
    {
        "skill_name": "r",
        "avg_salary": "101250"
    },
    {
        "skill_name": "aws",
        "avg_salary": "91667"
    },
    {
        "skill_name": "sas",
        "avg_salary": "87500"
    },
    {
        "skill_name": "java",
        "avg_salary": "87500"
    },
    {
        "skill_name": "nosql",
        "avg_salary": "55000"
    },
    {
        "skill_name": "kafka",
        "avg_salary": "55000"
    }
]
*/