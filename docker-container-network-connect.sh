SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ "${CONFIG_SET:-false}" != "true" ]]; then
  source "${SCRIPT_DIR}/docker-project-initialize.sh" "$@"
fi

echo "Connecting container from network..."
docker network connect "${PROJECT_NAME}_default" "$PROJECT_NAME"
