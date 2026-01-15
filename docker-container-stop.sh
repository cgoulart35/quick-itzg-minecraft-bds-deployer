if [[ "${CONFIG_SET:-false}" != "true" ]]; then
  source docker-project-initialize.sh "$@"
fi

echo "Stopping container..."
docker stop "$PROJECT_NAME"
