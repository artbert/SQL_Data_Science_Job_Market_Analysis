/*
 3. What skills are most frequently demanded in the field of data science?
 - Identify the top 5 most in-demand skills based on the number of remote data scientist job listings.
 - Calculate the percentage of all remote data scientist jobs that require each skill.
*/

WITH skill_demand AS (
  SELECT 
    skill_name,
    COUNT(job_has_skill.job_id) AS demand_count,
    title_short
  FROM job_offer_europe
    INNER JOIN job_has_skill ON job_offer_europe.id = job_has_skill.job_id
    INNER JOIN skill ON job_has_skill.skill_id = skill.id
  WHERE title_short = 'Data Scientist'
    AND work_from_home = TRUE
  GROUP BY skill_name,
    title_short
  ORDER BY demand_count DESC
  LIMIT 5
), total_jobs_per_role AS (
  SELECT 
    title_short,
    COUNT(*) AS total_jobs
  FROM job_offer_europe
  WHERE title_short = 'Data Scientist'
    AND work_from_home = TRUE
  GROUP BY title_short
)
SELECT 
  skill_name,
  demand_count::INTEGER,
  ROUND(
    demand_count::FLOAT / total_jobs_per_role.total_jobs * 100
  ) AS demand_percent
FROM skill_demand
  INNER JOIN total_jobs_per_role ON skill_demand.title_short = total_jobs_per_role.title_short

/*
Result set:

[
    {
        "skill_name": "python",
        "demand_count": 2292,
        "demand_percent": 72
    },
    {
        "skill_name": "sql",
        "demand_count": 1395,
        "demand_percent": 44
    },
    {
        "skill_name": "r",
        "demand_count": 801,
        "demand_percent": 25
    },
    {
        "skill_name": "aws",
        "demand_count": 566,
        "demand_percent": 18
    },
    {
        "skill_name": "azure",
        "demand_count": 470,
        "demand_percent": 15
    }
]
*/