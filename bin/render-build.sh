#!/usr/bin/env bash
# exit on error
set -o errexit

echo "render-bulid.sh: start"

echo "installing bundle"
bundle install

echo "precompiling assets"
bundle exec rake assets:precompile
bundle exec rake assets:clean

echo "executing migrate"
bundle exec rails db:migrate

echo "executing seed_fu"
bundle exec rails db:seed_fu

echo "render-build.sh: done"