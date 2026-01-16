SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ "${CONFIG_SET:-false}" != "true" ]]; then
  source "${SCRIPT_DIR}/docker-project-initialize.sh" "$@"
fi

source "${SCRIPT_DIR}/docker-image-update.sh" && \
source "${SCRIPT_DIR}/docker-container-rebuild.sh"
