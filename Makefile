PROJECT_NAME = myproject
APP_NAME = polls

build:
	docker-compose build

start:
	docker-compose up -d

stop:
	docker-compose down

restart:
	docker-compose restart

log:
	docker-compose logs

clean:
	rm ${PROJECT_NAME} -rf
	rm ${APP_NAME} -rf
	rm manage.py -f
	docker-compose down -v --rmi all --remove-orphans

create_project:
	docker-compose run web django-admin startproject ${PROJECT_NAME} .

create_app:
	docker-compose run web ./manage.py startapp ${APP_NAME}

pip_list:
	docker-compose run web pip list

python:
	docker-compose run web python

shell:
	docker-compose run web python manage.py shell

ssh:
	docker-compose run web /bin/bash

django_version:
	docker-compose run web python -c "import django; print(django.get_version())"

project_migrate:
	docker-compose run web python manage.py migrate

app_makemigrations:
	docker-compose run web python manage.py makemigrations ${APP_NAME}

app_sqlmigrate:
	docker-compose run web python manage.py sqlmigrate ${APP_NAME} 0001

app_migrate:
	docker-compose run web python manage.py migrate ${APP_NAME}

app_test:
	docker-compose run web python manage.py test ${APP_NAME}

create_super_user:
	docker-compose run web python manage.py createsuperuser