#!/bin/sh

bundle install
rake db:migrate

rm /app/tmp/pids/server.pid
rails server -b 0.0.0.0 -p 3000