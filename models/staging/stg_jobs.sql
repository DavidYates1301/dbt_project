-- models/staging/stg_jobs.sql

-- Định nghĩa nguồn dữ liệu (source) từ dbt_project.yml
-- `source('ndc_nd_schedule', 'job')` sẽ tham chiếu đến bảng 'job'
-- trong schema 'public' của database 'ndc_nd_schedule'
with source_jobs as (
    select *
    from {{ source('ndc_nd_schedule', 'job') }}
),

-- Chọn và chuẩn hóa các trường
-- Thực hiện các phép biến đổi đơn giản như cắt khoảng trắng,
-- đổi tên cột cho dễ đọc hơn nếu cần, hoặc ép kiểu dữ liệu.
transformed_jobs as (
    select
        id,
        dag_id,
        state,
        job_type,
        start_date,
        end_date,
        latest_heartbeat,
        executor_class,
        hostname,
        unixname
        -- Ví dụ về biến đổi:
        -- trim(job_type) as job_type_cleaned,
        -- cast(start_date as timestamp) as job_start_timestamp,
        -- ... các biến đổi khác nếu cần
    from source_jobs
)

-- Trả về tập dữ liệu đã được biến đổi
select *
from transformed_jobs
