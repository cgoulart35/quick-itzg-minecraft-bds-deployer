SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ "${CONFIG_SET:-false}" != "true" ]]; then
  source "${SCRIPT_DIR}/docker-project-initialize.sh" "$@"
fi

echo "Initializing server..."

for GAMERULE in "${DEFAULT_GAMERULES[@]}"; do
    docker exec "$PROJECT_NAME" send-command gamerule $GAMERULE
done