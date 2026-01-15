if [[ "${CONFIG_SET:-false}" != "true" ]]; then
  source docker-project-initialize.sh "$@"
fi

echo "Connecting container from network..."
docker network connect "${PROJECT_NAME}_default" "$PROJECT_NAME"
