if [[ "${CONFIG_SET:-false}" != "true" ]]; then
  source docker-project-initialize.sh "$@"
fi

echo "Initializing server..."

for GAMERULE in "${DEFAULT_GAMERULES[@]}"; do
    docker exec "$PROJECT_NAME" send-command gamerule $GAMERULE
done