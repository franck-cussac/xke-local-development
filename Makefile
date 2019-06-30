docker-build:
	docker build -t xke/spark-deploy-data .

run-hadoop-docker:
	docker-compose up -d

deploy-local:
	cp target/*-shaded.jar ansible-deployment/roles/deploy-word-count/files/
	cd ansible-deployment && ansible-playbook -i inventories/config-local playbook.yml

down-hadoop-docker:
	docker-compose down

get-into-airflow:
	docker-compose exec -u root airflow bash

get-into-spark-master:
	docker-compose exec spark-master bash

get-into-spark-worker:
	docker-compose exec spark-worker bash

remove-local-dag:
	docker exec -u root airflow rm -rf /project/dags/word-count-dag.py
	docker exec -u root airflow rm -rf /usr/local/airflow/dags/word-count-dag.py
	curl -X GET localhost:8080/admin/airflow/delete?dag_id=smart_seo
