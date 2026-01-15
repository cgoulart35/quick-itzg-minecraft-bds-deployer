if [[ "${CONFIG_SET:-false}" != "true" ]]; then
  source docker-project-initialize.sh "$@"
fi

source docker-image-update.sh && \
source docker-container-rebuild.sh
