#!/bin/bash
set -e

echo "Starting entrypoint script"

#wait for the docker to get rdy
until docker info > /dev/null 2>&1; do
  echo "Waiting for Docker to be available..."
  sleep 1
done

echo "Docker is available, running Ansible playbook"

#run ansible playbook
ansible-playbook /ansible/create_container_playbook.yml

echo "Ansible playbook execution completed"

#starting server in order to keep the container running
echo "Starting Python HTTP server"
python -m http.server 8080