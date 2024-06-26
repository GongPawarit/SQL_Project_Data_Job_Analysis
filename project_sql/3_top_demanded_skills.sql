/*
Question: What are the most in-demand skills for data engineer?
- Identify the top 5 in-demand skills for a data engineer.
- Focus on all job postings.
- Why? Retrieves the top 5 skills with the highest demand in the job market,
providing insights into the most valuable skills for job seekers.
*/

SELECT
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Engineer'
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5

/*
[
  {
    "skills": "sql",
    "demand_count": "113375"
  },
  {
    "skills": "python",
    "demand_count": "108265"
  },
  {
    "skills": "aws",
    "demand_count": "62174"
  },
  {
    "skills": "azure",
    "demand_count": "60823"
  },
  {
    "skills": "spark",
    "demand_count": "53789"
  }
]
*/