#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f tmp/pids/server.pid

# Check for gem updates
bundle check || bundle install --jobs 4

# Exec the container's main process (what's set as CMD in the Dockerfile/docker-compose)
exec "$@"
