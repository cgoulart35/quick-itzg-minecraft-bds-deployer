SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

generate_docker_project_config() {
if [ -f "${SCRIPT_DIR}/${PROJECT_FOLDER_NAME}/docker-project-config.sh" ]; then
  return
fi
echo "Generating docker-project-config.sh..."
cat << EOF > "${SCRIPT_DIR}/${PROJECT_FOLDER_NAME}/docker-project-config.sh"
echo "Setting project configuration variables..."

CONFIG_SET=true

SERVER_DIR="\$(cd "\$(dirname "\${BASH_SOURCE[0]}")" && pwd)"
COMPOSE_FILE="\$SERVER_DIR/docker-compose.yml"
PROJECT_NAME="docker-minecraft-bds-${PROJECT_FOLDER_NAME_SANITIZED}"

DEFAULT_GAMERULES=()
#DEFAULT_GAMERULES=(
#"keepInventory true"
#"mobGriefing false"
#"doFireTick false"
#"playersSleepingPercentage 0"
#)
EOF
}

generate_docker_compose() {
if [ -f "${SCRIPT_DIR}/${PROJECT_FOLDER_NAME}/docker-compose.yml" ]; then
  return
fi
echo "Generating docker-compose.yml..."
cat << EOF > "${SCRIPT_DIR}/${PROJECT_FOLDER_NAME}/docker-compose.yml"
services:
  bds:
    image: itzg/minecraft-bedrock-server
    container_name: docker-minecraft-bds-${PROJECT_FOLDER_NAME_SANITIZED}
    ports:
      - "19132:19132/udp"
    volumes:
      - ${SCRIPT_DIR}/${PROJECT_FOLDER_NAME}/data:/data
    restart: unless-stopped
    stdin_open: true
    tty: true
    user: "1000:10"
    
    # cpu settings
    cpuset: "0-1"
    cpu_shares: 2048
    
    # memory settings
    mem_limit: 4g
    mem_reservation: 2g
    
    # minecraft settings
    environment:

      # -------------------------
      # server-specific settings
      # -------------------------
      SERVER_NAME: "${USER}"
      VERSION: "LATEST"
      TZ: "America/New_York"

      # -------------------------
      # gameplay settings
      # -------------------------
      GAMEMODE: "survival"
      FORCE_GAMEMODE: "true"
      DIFFICULTY: "easy"
      ALLOW_CHEATS: "false"
      LEVEL_NAME: "${PROJECT_FOLDER_NAME}"
      LEVEL_SEED: ""
      LEVEL_TYPE: ""
      TEXTUREPACK_REQUIRED: "false"

      # -------------------------
      # player & permissions
      # -------------------------
      DEFAULT_PLAYER_PERMISSION_LEVEL: "member"
      #OP_PERMISSION_LEVEL: ""
      ALLOW_LIST: "false"
      #ALLOW_LIST_USERS: ""
      #WHITE_LIST: ""
      OPS: ""
      MAX_PLAYERS: "10"
      CHAT_RESTRICTION: "None"
      DISABLE_CUSTOM_SKINS: "false"
      ONLINE_MODE: "true"
      #MSA_GAMERTAGS_ONLY: ""

      # -------------------------
      # networking & performance
      # -------------------------
      SERVER_PORT: "19132"
      SERVER_PORT_V6: "19133"
      ENABLE_LAN_VISIBILITY: "true"
      VIEW_DISTANCE: "16"
      TICK_DISTANCE: "4"
      #SIMULATION_DISTANCE: "4"
      SYNC_CHUNK_WRITES: "false"
      PLAYER_IDLE_TIMEOUT: "30"
      MAX_THREADS: "2"

      # -------------------------
      # logging
      # -------------------------
      CONTENT_LOG_FILE_ENABLED: "false"
      CONTENT_LOG_CONSOLE_OUTPUT_ENABLED: "false"
      CONTENT_LOG_LEVEL: "info"
      #ITEM_TRANSACTION_LOGGING_ENABLED: ""

      # -------------------------
      # compression
      # -------------------------
      COMPRESSION_THRESHOLD: "1"
      COMPRESSION_ALGORITHM: "zlib"

      # -------------------------
      # movement & interaction
      # -------------------------
      #SERVER_AUTHORITATIVE_MOVEMENT: "false"
      #SERVER_AUTHORITATIVE_BLOCK_BREAKING: "false"
      SERVER_AUTHORITATIVE_BLOCK_BREAKING_PICK_RANGE_SCALAR: "1.5"
      #CORRECT_PLAYER_MOVEMENT: ""
      PLAYER_POSITION_ACCEPTANCE_THRESHOLD: "0.5"
      PLAYER_MOVEMENT_ACTION_DIRECTION_THRESHOLD: "0.85"
      #PLAYER_MOVEMENT_DISTANCE_THRESHOLD: ""
      #PLAYER_MOVEMENT_SCORE_THRESHOLD: ""
      #PLAYER_MOVEMENT_DURATION_THRESHOLD_IN_MS: ""
      DISABLE_PLAYER_INTERACTION: "false"
      CLIENT_SIDE_CHUNK_GENERATION_ENABLED: "true"
      BLOCK_NETWORK_IDS_ARE_HASHES: "true"
      DISABLE_PERSONA: "false"
      SERVER_BUILD_RADIUS_RATIO: "Disabled"

      # -------------------------
      # scripts & debugging
      # -------------------------
      ALLOW_OUTBOUND_SCRIPT_DEBUGGING: "false"
      ALLOW_INBOUND_SCRIPT_DEBUGGING: "false"
      #FORCE_INBOUND_DEBUG_PORT: "19144"
      SCRIPT_DEBUGGER_AUTO_ATTACH: "disabled"
      #SCRIPT_DEBUGGER_AUTO_ATTACH_CONNECT_ADDRESS: "19144"
      #SCRIPT_WATCHDOG_ENABLE: "true"
      #SCRIPT_WATCHDOG_ENABLE_EXCEPTION_HANDLING: "true"
      #SCRIPT_WATCHDOG_ENABLE_SHUTDOWN: "true"
      #SCRIPT_WATCHDOG_HANG_EXCEPTION: "true"
      #SCRIPT_WATCHDOG_HANG_THRESHOLD: "10000"
      #SCRIPT_WATCHDOG_SPIKE_THRESHOLD: "100"
      #SCRIPT_WATCHDOG_SLOW_THRESHOLD: "10"
      #SCRIPT_WATCHDOG_MEMORY_WARNING: "100"
      #SCRIPT_WATCHDOG_MEMORY_LIMIT: "250"

      # -------------------------
      # miscellaneous
      # -------------------------
      EULA: "TRUE"
      #VARIABLES: ""
      #EMIT_SERVER_TELEMETRY: ""

EOF
}

if [[ "${CONFIG_SET:-false}" != "true" ]]; then

  # determine user defined project
  PROJECT_FOLDER_NAME="${1#--}"
  PROJECT_FOLDER_NAME_SANITIZED="${PROJECT_FOLDER_NAME// /}"          # remove spaces
  PROJECT_FOLDER_NAME_SANITIZED="${PROJECT_FOLDER_NAME_SANITIZED,,}"  # convert to lowercase
  
  # create user project if does not exist
  if [[ ! -d "${SCRIPT_DIR}/${PROJECT_FOLDER_NAME}" ]]; then
    echo "Creating project folder: $PROJECT_FOLDER_NAME"
    mkdir -p "${SCRIPT_DIR}/${PROJECT_FOLDER_NAME}"
  else
    echo "Using existing project folder..."
  fi

  # create user project data folder for volume if does not exist
  if [[ ! -d "${SCRIPT_DIR}/${PROJECT_FOLDER_NAME}/data" ]]; then
    echo "Creating project data folder: ${PROJECT_FOLDER_NAME}/data"
    mkdir -p "${SCRIPT_DIR}/${PROJECT_FOLDER_NAME}/data"
  fi
  
  # generate the project files if do not exist
  generate_docker_project_config
  generate_docker_compose
  
  # set project configuration variables
  source "${SCRIPT_DIR}/${PROJECT_FOLDER_NAME}/docker-project-config.sh"
  
fi