FROM python:3.9-slim-buster

RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir dbt-core==1.7.0 

RUN pip install --no-cache-dir dbt-bigquery==1.7.0

RUN pip install --no-cache-dir dbt-snowflake==1.7.0

RUN pip install --no-cache-dir dbt-postgres==1.7.0


RUN pip install --no-cache-dir dbt-mysql==1.7.0



RUN pip install --no-cache-dir dbt-databricks==1.7.0

RUN pip install --no-cache-dir dbt-redshift==1.7.0

RUN pip install --no-cache-dir dbt-trino==1.7.0

RUN pip install --no-cache-dir \
    pymysql \
    sqlalchemy \
    pandas

WORKDIR /usr/app
