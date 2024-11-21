/*
Question: What skills are required for the top paying data analyst roles?
- Use the top 10 highest paying data analyst roles from first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills,
    helping job seekers understand which skills to develop that align with top salaries
*/

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
     salary_year_avg DESC

/*
[
  {
    "job_id": 229253,
    "company_name": "Torc Robotics",
    "job_title": "Director of Safety Data Analysis",
    "salary_year_avg": "375000.0",
    "skills": "sql"
  },
  {
    "job_id": 229253,
    "company_name": "Torc Robotics",
    "job_title": "Director of Safety Data Analysis",
    "salary_year_avg": "375000.0",
    "skills": "python"
  },
  {
    "job_id": 229253,
    "company_name": "Torc Robotics",
    "job_title": "Director of Safety Data Analysis",
    "salary_year_avg": "375000.0",
    "skills": "r"
  },
  {
    "job_id": 229253,
    "company_name": "Torc Robotics",
    "job_title": "Director of Safety Data Analysis",
    "salary_year_avg": "375000.0",
    "skills": "sas"
  },
  {
    "job_id": 229253,
    "company_name": "Torc Robotics",
    "job_title": "Director of Safety Data Analysis",
    "salary_year_avg": "375000.0",
    "skills": "matlab"
  },
  {
    "job_id": 229253,
    "company_name": "Torc Robotics",
    "job_title": "Director of Safety Data Analysis",
    "salary_year_avg": "375000.0",
    "skills": "spark"
  },
  {
    "job_id": 229253,
    "company_name": "Torc Robotics",
    "job_title": "Director of Safety Data Analysis",
    "salary_year_avg": "375000.0",
    "skills": "airflow"
  },
  {
    "job_id": 229253,
    "company_name": "Torc Robotics",
    "job_title": "Director of Safety Data Analysis",
    "salary_year_avg": "375000.0",
    "skills": "excel"
  },
  {
    "job_id": 229253,
    "company_name": "Torc Robotics",
    "job_title": "Director of Safety Data Analysis",
    "salary_year_avg": "375000.0",
    "skills": "tableau"
  },
  {
    "job_id": 229253,
    "company_name": "Torc Robotics",
    "job_title": "Director of Safety Data Analysis",
    "salary_year_avg": "375000.0",
    "skills": "power bi"
  },
  {
    "job_id": 229253,
    "company_name": "Torc Robotics",
    "job_title": "Director of Safety Data Analysis",
    "salary_year_avg": "375000.0",
    "skills": "sas"
  },
  {
    "job_id": 101757,
    "company_name": "Care.com",
    "job_title": "Head of Data Analytics",
    "salary_year_avg": "350000.0",
    "skills": "sql"
  },
  {
    "job_id": 101757,
    "company_name": "Care.com",
    "job_title": "Head of Data Analytics",
    "salary_year_avg": "350000.0",
    "skills": "python"
  },
  {
    "job_id": 101757,
    "company_name": "Care.com",
    "job_title": "Head of Data Analytics",
    "salary_year_avg": "350000.0",
    "skills": "r"
  },
  {
    "job_id": 101757,
    "company_name": "Care.com",
    "job_title": "Head of Data Analytics",
    "salary_year_avg": "350000.0",
    "skills": "bigquery"
  },
  {
    "job_id": 101757,
    "company_name": "Care.com",
    "job_title": "Head of Data Analytics",
    "salary_year_avg": "350000.0",
    "skills": "snowflake"
  },
  {
    "job_id": 101757,
    "company_name": "Care.com",
    "job_title": "Head of Data Analytics",
    "salary_year_avg": "350000.0",
    "skills": "tableau"
  },
  {
    "job_id": 101757,
    "company_name": "Care.com",
    "job_title": "Head of Data Analytics",
    "salary_year_avg": "350000.0",
    "skills": "power bi"
  },
  {
    "job_id": 101757,
    "company_name": "Care.com",
    "job_title": "Head of Data Analytics",
    "salary_year_avg": "350000.0",
    "skills": "looker"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "skills": "sql"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "skills": "python"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "skills": "r"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "skills": "azure"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "skills": "databricks"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "skills": "aws"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "skills": "pandas"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "skills": "pyspark"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "skills": "jupyter"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "skills": "excel"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "skills": "tableau"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "skills": "power bi"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "skills": "powerpoint"
  },
  {
    "job_id": 285766,
    "company_name": "Google",
    "job_title": "Partner Technology Manager, Data Analytics and AI",
    "salary_year_avg": "254000.0",
    "skills": "gcp"
  },
  {
    "job_id": 99305,
    "company_name": "Pinterest Job Advertisements",
    "job_title": "Data Analyst, Marketing",
    "salary_year_avg": "232423.0",
    "skills": "sql"
  },
  {
    "job_id": 99305,
    "company_name": "Pinterest Job Advertisements",
    "job_title": "Data Analyst, Marketing",
    "salary_year_avg": "232423.0",
    "skills": "python"
  },
  {
    "job_id": 99305,
    "company_name": "Pinterest Job Advertisements",
    "job_title": "Data Analyst, Marketing",
    "salary_year_avg": "232423.0",
    "skills": "r"
  },
  {
    "job_id": 99305,
    "company_name": "Pinterest Job Advertisements",
    "job_title": "Data Analyst, Marketing",
    "salary_year_avg": "232423.0",
    "skills": "hadoop"
  },
  {
    "job_id": 99305,
    "company_name": "Pinterest Job Advertisements",
    "job_title": "Data Analyst, Marketing",
    "salary_year_avg": "232423.0",
    "skills": "tableau"
  },
  {
    "job_id": 1021647,
    "company_name": "Uclahealthcareers",
    "job_title": "Data Analyst (Hybrid/Remote)",
    "salary_year_avg": "217000.0",
    "skills": "sql"
  },
  {
    "job_id": 1021647,
    "company_name": "Uclahealthcareers",
    "job_title": "Data Analyst (Hybrid/Remote)",
    "salary_year_avg": "217000.0",
    "skills": "crystal"
  },
  {
    "job_id": 1021647,
    "company_name": "Uclahealthcareers",
    "job_title": "Data Analyst (Hybrid/Remote)",
    "salary_year_avg": "217000.0",
    "skills": "oracle"
  },
  {
    "job_id": 1021647,
    "company_name": "Uclahealthcareers",
    "job_title": "Data Analyst (Hybrid/Remote)",
    "salary_year_avg": "217000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1021647,
    "company_name": "Uclahealthcareers",
    "job_title": "Data Analyst (Hybrid/Remote)",
    "salary_year_avg": "217000.0",
    "skills": "flow"
  },
  {
    "job_id": 168310,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "skills": "sql"
  },
  {
    "job_id": 168310,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "skills": "python"
  },
  {
    "job_id": 168310,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "skills": "go"
  },
  {
    "job_id": 168310,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "skills": "snowflake"
  },
  {
    "job_id": 168310,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "skills": "pandas"
  },
  {
    "job_id": 168310,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "skills": "numpy"
  },
  {
    "job_id": 168310,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "skills": "excel"
  },
  {
    "job_id": 168310,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "skills": "tableau"
  },
  {
    "job_id": 168310,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "skills": "gitlab"
  },
  {
    "job_id": 1281297,
    "company_name": "Upstart",
    "job_title": "Staff Data Analyst, Credit Analytics",
    "salary_year_avg": "200000.0",
    "skills": "python"
  },
  {
    "job_id": 1281297,
    "company_name": "Upstart",
    "job_title": "Staff Data Analyst, Credit Analytics",
    "salary_year_avg": "200000.0",
    "skills": "r"
  },
  {
    "job_id": 1281297,
    "company_name": "Upstart",
    "job_title": "Staff Data Analyst, Credit Analytics",
    "salary_year_avg": "200000.0",
    "skills": "sas"
  },
  {
    "job_id": 1281297,
    "company_name": "Upstart",
    "job_title": "Staff Data Analyst, Credit Analytics",
    "salary_year_avg": "200000.0",
    "skills": "vba"
  },
  {
    "job_id": 1281297,
    "company_name": "Upstart",
    "job_title": "Staff Data Analyst, Credit Analytics",
    "salary_year_avg": "200000.0",
    "skills": "databricks"
  },
  {
    "job_id": 1281297,
    "company_name": "Upstart",
    "job_title": "Staff Data Analyst, Credit Analytics",
    "salary_year_avg": "200000.0",
    "skills": "redshift"
  },
  {
    "job_id": 1281297,
    "company_name": "Upstart",
    "job_title": "Staff Data Analyst, Credit Analytics",
    "salary_year_avg": "200000.0",
    "skills": "snowflake"
  },
  {
    "job_id": 1281297,
    "company_name": "Upstart",
    "job_title": "Staff Data Analyst, Credit Analytics",
    "salary_year_avg": "200000.0",
    "skills": "excel"
  },
  {
    "job_id": 1281297,
    "company_name": "Upstart",
    "job_title": "Staff Data Analyst, Credit Analytics",
    "salary_year_avg": "200000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1281297,
    "company_name": "Upstart",
    "job_title": "Staff Data Analyst, Credit Analytics",
    "salary_year_avg": "200000.0",
    "skills": "looker"
  },
  {
    "job_id": 1281297,
    "company_name": "Upstart",
    "job_title": "Staff Data Analyst, Credit Analytics",
    "salary_year_avg": "200000.0",
    "skills": "sas"
  }
] */