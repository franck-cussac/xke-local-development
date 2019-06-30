from airflow import DAG
from airflow.operators.bash_operator import BashOperator
import datetime


default_args = {
    'owner': 'astroseo',
    'depends_on_past': False,
    'start_date': (datetime.datetime.now() - datetime.timedelta(days=1)).replace(hour=2, minute=20, second=0, microsecond=0),
    'retries': 0
}


dag = DAG(
    'word_count',
    default_args=default_args,
    description="xke Airflow word count",
    schedule_interval=None
)

kinit_task = BashOperator (
    task_id="kinit_task",
    bash_command="{{ kinit }}",
    dag=dag
)
word_count = BashOperator(
    task_id="word_count_test",
    pool="{{ pool_name }}",
    bash_command="""
export SPARK_HOME={spark_home}
{spark_submit} {spark_options} --name "word count" \
    --class {main_class} \
    {jar_path} {input_file} {output_file}
  """.format(
        spark_home="{{ spark_home }}",
        spark_submit="{{ spark_submit }}",
        spark_options="{{ spark_options }}",
        jar_path="{{ jar_path }}",
        main_class="{{ main_class }}",
        input_file="{{ input_file }}",
        output_file="{{ output_file }}"
    ),
    dag=dag
)

kinit_task >> word_count
