SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ "${CONFIG_SET:-false}" != "true" ]]; then
  source "${SCRIPT_DIR}/docker-project-initialize.sh" "$@"
fi

source "${SCRIPT_DIR}/docker-container-stop.sh" && \
source "${SCRIPT_DIR}/docker-container-start.sh"
