if [[ "${CONFIG_SET:-false}" != "true" ]]; then
  source docker-project-initialize.sh "$@"
fi

source docker-container-delete.sh && \
source docker-container-build.sh
