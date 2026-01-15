if [[ "${CONFIG_SET:-false}" != "true" ]]; then
  source docker-project-initialize.sh "$@"
fi

echo "Updating image to latest version..."
docker compose -f "$COMPOSE_FILE" -p "$PROJECT_NAME" pull
