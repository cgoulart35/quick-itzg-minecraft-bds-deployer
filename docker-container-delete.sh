if [[ "${CONFIG_SET:-false}" != "true" ]]; then
  source docker-project-initialize.sh "$@"
fi

echo "Deleting container..."
docker compose -f "$COMPOSE_FILE" -p "$PROJECT_NAME" down
