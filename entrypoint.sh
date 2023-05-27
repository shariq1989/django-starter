#!/bin/bash

# Apply database migrations
echo "Applying database migrations"
python /code/manage.py migrate

# Collect static files
echo "Collecting static files"
python /code/manage.py collectstatic --no-input

# Check deployment settings
echo "Django deployment checks"
python /code/manage.py check --deploy

# Start the Gunicorn server
gunicorn django_project.wsgi -b 0.0.0.0:8000 --timeout 90
