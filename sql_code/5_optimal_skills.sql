/*
 5. What is the optimal skill set for aspiring Data Scientists?
 - Identify the most frequently required skills that also offer high average salaries in remote data scientist job offers.
 - Highlight the top 25 skills that combine high demand with strong compensation potential.
*/

SELECT
  skill.id,
  skill.skill_name,
  COUNT(job_has_skill.job_id)::INTEGER AS demand_count,
  ROUND(AVG(job_offer_europe.salary_year_avg), 0) AS avg_salary
FROM job_offer_europe
  INNER JOIN job_has_skill ON job_offer_europe.id = job_has_skill.job_id
  INNER JOIN skill ON job_has_skill.skill_id = skill.id
WHERE title_short = 'Data Scientist'
  AND salary_year_avg IS NOT NULL
  AND work_from_home = TRUE
GROUP BY skill.id
HAVING COUNT(job_has_skill.job_id) > 1
ORDER BY avg_salary DESC,
  demand_count DESC
LIMIT 25
/*
Result set:

[
    {
        "id": 106,
        "skill_name": "scikit-learn",
        "demand_count": 2,
        "avg_salary": "150250"
    },
    {
        "id": 94,
        "skill_name": "numpy",
        "demand_count": 2,
        "avg_salary": "150000"
    },
    {
        "id": 93,
        "skill_name": "pandas",
        "demand_count": 3,
        "avg_salary": "146833"
    },
    {
        "id": 101,
        "skill_name": "pytorch",
        "demand_count": 3,
        "avg_salary": "126667"
    },
    {
        "id": 0,
        "skill_name": "sql",
        "demand_count": 3,
        "avg_salary": "118333"
    },
    {
        "id": 216,
        "skill_name": "github",
        "demand_count": 2,
        "avg_salary": "110000"
    },
    {
        "id": 1,
        "skill_name": "python",
        "demand_count": 7,
        "avg_salary": "108214"
    },
    {
        "id": 5,
        "skill_name": "r",
        "demand_count": 2,
        "avg_salary": "101250"
    },
    {
        "id": 76,
        "skill_name": "aws",
        "demand_count": 3,
        "avg_salary": "91667"
    }
]
*/