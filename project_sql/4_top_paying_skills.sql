/*
Answer: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Engineer positions.
- Focuses on roles with specified salaries, regardless of location.
- Why? It reveals how different skills impact salary levels for Data Engineer
and helps identify the most financially rewarding skills to acquire or improve.
*/

SELECT
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Engineer'
    AND salary_year_avg IS NOT NULL
    -- AND job_work_from_home = TRUE
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25

/*
Here are the insights condensed into three bullet points:

1. Emerging Technologies and Frameworks:
- Node.js tops the list with an average salary of $181,862,
highlighting its importance in building scalable server-side applications.
- Modern web development frameworks like Vue.js and Next.js also command high salaries,
reflecting their growing demand.

2. Data Management and NoSQL Databases:
- MongoDB and Cassandra are among the highest-paying skills,
with average salaries of $179,403 and $150,255 respectively, indicating a strong need for expertise in NoSQL databases.

3. Programming Languages and Big Data:
- High-paying programming languages include Clojure ($153,663), Rust ($147,771), and Scala ($143,161),
which are valued for their efficiency and utility in data processing.
- Big data technologies like Kafka are also highly valued, with an average salary of $143,086,
underscoring the importance of real-time data processing skills.
*/