if [[ "${CONFIG_SET:-false}" != "true" ]]; then
  source docker-project-initialize.sh "$@"
fi

source docker-container-stop.sh && \
source docker-container-start.sh
