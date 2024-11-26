# Introduction
Dive into the data job market of 2023! Focusing mainly on data analyst roles with some business analyst roles as well, this project explores top paying jobs, in demand skills, and where demand meets high salary in the fiield of data analytics.

Check out these SQL queries here: [project_sql folder](/project_sql/)

# Background
Driven by a quest to navigate the data analyst job market more effectively, I started this project from a desire to pinpoint top paid and in demand skills, increasing my own SQL skills while searching for optimal jobs.

Data hails from my [SQL Course](https://lukebarousse.com/sql). It's packed with insights on job titles, salaries, locations, and essential skills.

### The questions I wanted to answer through my SQL queries were:

1. What are the top paying jobs for my desired position(s)?
2. What are the skills required for these top paying jobs?
3. What are the most in demand skills for my desired role(s)?
4. What are the top skills based on salary for my desired role(s)?
5. What are the most optimal skills to learn?

# Tools I used
For this deep dive into the data analyst job market of 2023, I harnessed the power of several key tools along the way:

- **SQL:** The backbone of my analysis, it allowed me to query this database and find critical insights on the data analyst job market.
- **PostgreSQL:** The chosen database management system, that is ideal for handling the job posting data.
- **Visual Studio Code:** Which has become my go-to for database management and executing SQL queries.
- **Git & Github:** Essential for version control and sharing all of the applicable work I've done with SQL scripts and analysis, ensuring collaboration and project tracking.

# The Analysis
Every query I wrote for this project was aimed at investigating specific aspects of the data analyst job market of 2023. Here's how I approached each question:

### 1. Top Paying Data Analyst Jobs
To identify the top paying jobs in my area and abroad I sorted all data and business analyst positions by their average yearly salary and location, focusing more on remote jobs than in office. The query below highlights those oppurtunities in my preferred fields.

```sql
SELECT
    job_id,
    name AS company_name,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date
FROM
    job_postings_fact
LEFT JOIN 
    company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    (job_title_short = 'Data Analyst' OR job_title_short = 'Business Anaylst') AND 
    (job_location = 'Anywhere' OR job_location LIKE '%, TX') AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;
```
Here's the breakdown of the top data analyst jobs in 2023:
- **Wide Salary Range:** Top 10 paying data analyst roles span from $184,000 to $650,000, indicating significant salary potential in the field.
- **Diverse Employers:** Companies like SmartAsset, Meta, and AT&T are among those offering high salaries, showing a broad interest across different industries.
- **Job Title Variancy:** There's a high diversity in job titles, from Data Analyst to Director of Analytics, reflecting varies roles and specializations within data analytics.

![Top Paying Jobs](assets\1_top_paying_jobs.png)
*This is a bar graph to help visualize the results for the top ten paying roles for business/data analysts; Chatgpt aided in generating this graph from my given parameters and SQL query results* 


### 2. Highest Paying Jobs and Required Skill
After the first query, I felt compelled to find not just what jobs are paying the most, but also which skills are connected to those roles. These jobs are ordered by their yearly salary offered while showing the required skills.

```sql
WITH top_paying_jobs AS (
    SELECT
        job_id,
        name AS company_name,
        job_title,
        salary_year_avg
    FROM
        job_postings_fact
    LEFT JOIN 
        company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        (job_title_short = 'Data Analyst' OR job_title_short = 'Business Anaylst') AND 
        (job_location = 'Anywhere' OR job_location LIKE '%, TX') AND
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
     salary_year_avg DESC;
```
Here's the breakdown of the highest paying jobs and related skills for 2023:

- **Most Compensated Skills:** The main skills that were consistently well compensated for and required by companies were SQL, Python, and Tableau 

![Well Paid Skills Jobs Require](assets\2_top_paying_job_skills.png)
*This bar graph will help in visualizing which skills that companies are requiring applicants to have and the frequency of those skills being sought after while also being high paying.*


### 3. Top Demanded Skills
The next path that seemed the most logical for me to follow was to then write a query to see which skills were in the most demand across the data and businees analyst roles.

```sql
SELECT
    skills,
    COUNT(skills_job_dim.job_id) AS Demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    (job_title_short = 'Data Analyst' OR job_title_short = 'Business Analyst') AND
    job_work_from_home = TRUE
GROUP BY
    skills
ORDER BY
     demand_count DESC
LIMIT 5
```
Here's the breakdown for the most in demand analyst skills in 2023:

- **Skills Demanded:** So for this query, it quickly became evident that SQL dominates the market when it comes to the skills that companies are pushing for their possible employees to know, but Excel and Python are both shown to be important skills if someone wants to be well rounded.

| Skill      | Demand Count |
|------------|--------------|
| SQL        | 8,557        |
| Excel      | 5,594        |
| Python     | 4,876        |
| Tableau    | 4,473        |
| Power BI   | 3,164        |

*Table of the demand for the top 5 skills in data analyst job postings*


### 4. Top Paid Skills
Earlier on we checked to see what jobs were paying the most and the skills that were consistently required for those jobs. Now we will see which skills are paying the most instead of only see what skills were required.

```sql
SELECT
    skills,
    ROUND(AVG(salary_year_avg), 2) AS salary_avg
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    --'remove as a comment to check remote work'AND job_work_from_home = TRUE
GROUP BY
    skills
ORDER BY
    salary_avg DESC
LIMIT 20
```
Here's the breakdown for the highest paid skills in 2023:

- **Specialized Skill Success:** The query results show that specialized skills such as svn, twilio, and vmware were demanded the highest paid positions in the market.

- **Future Objectives:** Another major insight that came from these results are that the base skills of SQL and Python etc... are essential, when it comes to progressing in this field specialization makes a huge difference.

| Skill         | Salary Average (USD) |
|---------------|-----------------------|
| SVN           | 400,000.00           |
| Solidity      | 179,000.00           |
| Couchbase     | 160,515.00           |
| DataRobot     | 155,485.50           |
| GoLang        | 155,000.00           |
| MXNet         | 149,000.00           |
| dplyr         | 147,633.33           |
| VMware        | 147,500.00           |
| Terraform     | 146,733.83           |
| Twilio        | 138,500.00           |
| GitLab        | 134,126.00           |
| Kafka         | 129,999.16           |
| Puppet        | 129,820.00           |
| Keras         | 127,013.33           |
| PyTorch       | 125,226.20           |
| Perl          | 124,685.75           |
| Ansible       | 124,370.00           |
| Hugging Face  | 123,950.00           |
| TensorFlow    | 120,646.83           |
| Cassandra     | 118,406.68           |

*table for the top paid skills in data analyst postings*


### 5. Optimal Skills
Lastly, putting together everything we've learned so far, this query results in showing which skills would be the most optimal to pursue for a aspiring data or business analyst.

```sql
SELECT
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 2) AS salary_avg
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    (job_title_short = 'Data Analyst' OR job_title_short = 'Business Analyst')
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE
GROUP BY
    skills_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id) > 15
ORDER BY
    salary_avg DESC,
    demand_count DESC
LIMIT 25;
```
Here's the breakdown for optimal data/business analyst skills in 2023: 

- **Optimal Overall:** the skills like snowflake and hadoop commanded the most monetary compensation, even though their demand was lower than some of the more well known skills.

- **In Depth Optimal Skills:** While snowflake was shown to have the highest average salary its demand was low, and SQL was shown to have the most demand by far with it's average salary being competitive among other skills. When it came to getting the best of both worlds Python and Tableau took the lead by having high demand and a great salary average

| Skill        | Demand Count | Salary Average (USD) |
|--------------|--------------|-----------------------|
| Snowflake    | 38           | 112,988.82           |
| Hadoop       | 25           | 111,848.62           |
| Go           | 30           | 111,121.23           |
| BigQuery     | 16           | 110,812.50           |
| Azure        | 35           | 110,804.39           |
| AWS          | 32           | 108,317.30           |
| Looker       | 54           | 106,258.69           |
| Oracle       | 43           | 103,877.35           |
| Jira         | 22           | 103,402.64           |
| Python       | 256          | 102,578.39           |
| Java         | 21           | 102,257.60           |
| R            | 156          | 101,223.38           |
| Tableau      | 257          | 99,807.24            |
| Redshift     | 17           | 99,557.82            |
| SAS          | 70           | 98,908.06            |
| SQL          | 440          | 97,416.89            |
| SQL Server   | 37           | 97,405.42            |
| Power BI     | 122          | 96,744.37            |
| Alteryx      | 17           | 94,144.53            |
| Flow         | 35           | 93,568.43            |
| Spark        | 16           | 92,212.50            |
| JavaScript   | 27           | 90,881.11            |
| SPSS         | 26           | 90,235.48            |
| PowerPoint   | 63           | 89,661.33            |

*table for skills that are the most optimal to pursue*


# What I learned
Throughout the making of this project I've become assured that I've gained a firm foundation with SQL that will assist in propelling me forward:

- **Complex Query Crafting:** I became adept in my usage of SQL by writing queries involving the merging of tables via JOIN functions, and by the usage of WITH clauses when needed.

- **Data Aggregation:** Got comfortable with using GROUP BY and turned aggregate functions like COUNT(), AVG(), SUM() into code that I'm confident in using on a daily basis.

- **Adeptly Applying Analytics:** I've increased my real-world puzzle solving skills through the knowledge acquired and insightful queries practiced. 

# Conclusions
This project has helped me expand from my pre-conceived notions of the data/business analyst field and gave me insights on what skills I should be focusing on and why. While it also helped in enhancing my own SQL skills, this project also shows how important it is to continually increase your knowledge and adapt to which trends emerge in the field of data analytics.