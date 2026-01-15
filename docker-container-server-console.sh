if [[ "${CONFIG_SET:-false}" != "true" ]]; then
  source docker-project-initialize.sh "$@"
fi

echo "Opening server console..."
echo "Ctrl P, Ctrl Q to exit"
docker attach "$PROJECT_NAME"
