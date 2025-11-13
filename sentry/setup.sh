# Sentry Setup Script
# This script helps initialize Sentry database and create admin user

#!/bin/bash

echo "Setting up Sentry..."

# Wait for PostgreSQL to be ready
echo "Waiting for PostgreSQL..."
docker compose exec sentry-postgres pg_isready -U sentry

# Run Sentry migrations
echo "Running Sentry migrations..."
docker compose exec sentry-web sentry upgrade

# Create admin user (optional - can be done via web interface)
echo "Creating admin user..."
docker compose exec sentry-web sentry createuser \
  --email admin@michaelfisher.tech \
  --password admin \
  --superuser \
  --no-input

echo "Sentry setup complete!"
echo "Access Sentry at: http://sentry.michaelfisher.tech"
echo "Login with: admin@michaelfisher.tech / admin"