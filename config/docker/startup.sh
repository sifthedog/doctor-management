#! /bin/sh

bundle install
yarn install --check-files

# Wait for MySQL if needed
until nc -z -v -w30 $DB_HOST $DB_PORT; do
 echo 'Waiting for MySQL...'
 sleep 1
done
echo "MySQL is up and running!"

# Prepare DB (Migrate - If not? Create db & Migrate)
RAILS_ENV=development bundle exec rake db:migrate || RAILS_ENV=development bundle exec rake db:create db:migrate

# Start Application
echo "Done!"
bundle exec puma -e development -p 3000