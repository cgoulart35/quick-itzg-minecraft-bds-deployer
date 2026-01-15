if [[ "${CONFIG_SET:-false}" != "true" ]]; then
  source docker-project-initialize.sh "$@"
fi

echo "Building container from current image..."
docker compose -f "$COMPOSE_FILE" -p "$PROJECT_NAME" up -d --build

echo "Waiting for server to start..."
sleep 15

source docker-container-server-initialize.sh