#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /enjublog/tmp/pids/server.pid

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"

rails db:drop
rails db:create
rails db:migrate

rails s -b 0.0.0.0 -p 3000
