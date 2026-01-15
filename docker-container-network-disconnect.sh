if [[ "${CONFIG_SET:-false}" != "true" ]]; then
  source docker-project-initialize.sh "$@"
fi

echo "Disconnecting container from network..."
docker network disconnect "${PROJECT_NAME}_default" "$PROJECT_NAME"
