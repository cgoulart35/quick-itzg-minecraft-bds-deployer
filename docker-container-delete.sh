SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ "${CONFIG_SET:-false}" != "true" ]]; then
  source "${SCRIPT_DIR}/docker-project-initialize.sh" "$@"
fi

echo "Deleting container..."
docker compose -f "$COMPOSE_FILE" -p "$PROJECT_NAME" down
