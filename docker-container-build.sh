SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ "${CONFIG_SET:-false}" != "true" ]]; then
  source "${SCRIPT_DIR}/docker-project-initialize.sh" "$@"
fi

echo "Building container from current image..."
docker compose -f "$COMPOSE_FILE" -p "$PROJECT_NAME" up -d --build

echo "Waiting for server to start..."
sleep 15

source "${SCRIPT_DIR}/docker-container-server-initialize.sh"