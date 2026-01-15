if [[ "${CONFIG_SET:-false}" != "true" ]]; then
  source docker-project-initialize.sh "$@"
fi

echo "Bashing into container..."
echo "Ctrl P, Ctrl Q to exit"
docker exec -it "$PROJECT_NAME" /bin/bash
