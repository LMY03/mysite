#!/bin/sh

# Exit immediately if a command exits with a non-zero status
set -e

# Wait for the database to be ready
echo "Waiting for the database to be ready..."
while ! nc -z db 3306; do
  sleep 1
done

# Navigate to the app directory
cd /app

# Pull the latest changes from the Git repository
echo "Pulling the latest changes from the repository..."
git pull origin main

# Install any new dependencies
pip install --no-cache-dir -r requirements.txt

# Apply database migrations
echo "Applying database migrations..."
python manage.py migrate

# Collect static files
echo "Collecting static files..."
python manage.py collectstatic --noinput

# Start the Django application using Gunicorn
echo "Starting the Django server..."
exec gunicorn mysite.wsgi:application --bind 0.0.0.0:8000
