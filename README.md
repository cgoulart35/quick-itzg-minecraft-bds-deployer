# quick-itzg-minecraft-bds-deployer scripts:
- For all scripts, you will need to provide the --"Project Folder Name" argument. This is the name of the folder (in the generated 'servers' directory) of where the Minecraft BDS configuration and Docker volume will live. Use double quotes when using spaces.
- You can choose to either start a new server with default settings on-demand, or initialize a new one to tweak before deployment. For on-demand servers, the project folder name will be used for the world/level name, and sanitized to be used in the Docker container name.

### `docker-project-initialize.sh`
**Description:** Run this script to create a new project folder with default settings; generates the docker-project-config.sh file, the docker-compose.yml file, and the data volume directory in the project folder. This script is automatically ran by the docker-container-build.sh below to generate new projects on-demand (if project does not exist already). You can use this script to initialize the project without deploying it incase you want to tweak settings first.
```bash
./docker-project-initialize.sh --"Project Folder Name"
```
---
### `docker-container-build.sh`
**Description:** Run this script to create the itzg BDS Docker image and deploy a container from the referenced project folder's docker-compose.yml file. After the container/server is started, the script also runs the docker-container-server-initialize.sh file below to initialize the server with any default configurations not configurable in the docker-compose.yml file (default custom game rules defined in docker-project-config.sh).
```bash
./docker-container-build.sh --"Project Folder Name"
```
---
### `docker-container-delete.sh`
**Description:** Run this script to take down and delete the currently deployed container for the specifed project.
```bash
./docker-container-delete.sh --"Project Folder Name"
```
---
### `docker-container-rebuild.sh`
**Description:** This script runs docker-container-delete.sh, then docker-container-build.sh (mentioned above).
```bash
./docker-container-rebuild.sh --"Project Folder Name"
```
---
### `docker-container-server-initialize.sh`
**Description:** This script is ran by docker-container-build.sh to initialize the server with any default configurations not configurable in the docker-compose.yml file (default custom game rules defined in docker-project-config.sh).
```bash
./docker-container-server-initialize.sh --"Project Folder Name"
```
---
### `docker-image-update.sh`
**Description:** Run this script to pull the latest itzg BDS image to use for deployments.
```bash
./docker-image-update.sh --"Project Folder Name"
```
---
### `docker-container-update.sh`
**Description:** Run this script (which calls docker-image-update.sh mentioned above) to pull the latest itzg BDS image, and rebuild the Docker container for the specified project (calls docker-container-rebuild.sh mentioned above).
```bash
./docker-container-update.sh --"Project Folder Name"
```
---
### `docker-container-stop.sh`
**Description:** Run this script to stop the container/server for the specifed project.
```bash
./docker-container-stop.sh --"Project Folder Name"
```
---
### `docker-container-start.sh`
**Description:** Run this script to start the container/server for the specifed project.
```bash
./docker-container-start.sh --"Project Folder Name"
```
---
### `docker-container-restart.sh`
**Description:** This script runs docker-container-stop.sh, then docker-container-start.sh (mentioned above)
```bash
./docker-container-restart.sh --"Project Folder Name"
```
---
### `docker-container-server-console.sh`
**Description:** Run this script to open the BDS console to run Minecraft server commands (set OPs, game rules, etc).
```bash
./docker-container-server-console.sh --"Project Folder Name"
```
---
### `docker-container-bash.sh`
**Description:** Run this script to open a bash shell into the container of the specified project.
```bash
./docker-container-bash.sh --"Project Folder Name"
```
---
### `docker-container-network-disconnect.sh`
**Description:** Run this script to disconnect the container of the specified project from the internet.
```bash
./docker-container-network-disconnect.sh --"Project Folder Name"
```
---
### `docker-container-network-connect.sh`
**Description:** Run this script to connect the container of the specified project to the internet.
```bash
./docker-container-network-connect.sh --"Project Folder Name"
```
---

# How to initialize a Minecraft BDS project folder to fine tune for deployment:
```
user@MACHINE:/volume2/System/Apps/MinecraftBedrock$ ./docker-project-initialize.sh --Server1-MyFirstWorld   <- argument is the folder name, and it is sanitized for the container name
Creating project folder: Server1-MyFirstWorld
Creating project data folder: Server1-MyFirstWorld/data
Generating docker-project-config.sh...
Generating docker-compose.yml...
Setting project configuration variables...

user@MACHINE:/volume2/System/Apps/MinecraftBedrock$ ./docker-project-initialize.sh --"The Other World"
Creating project folder: The Other World
Creating project data folder: The Other World/data
Generating docker-project-config.sh...
Generating docker-compose.yml...
Setting project configuration variables...
```

# How to deploy a Minecraft BDS container (new or existing):
```
user@MACHINE:/volume2/System/Apps/MinecraftBedrock$ ./docker-container-build.sh --MyFirstWorld
Creating project folder: MyFirstWorld
Creating project data folder: MyFirstWorld/data
Generating docker-project-config.sh...
Generating docker-compose.yml...
Setting project configuration variables...
Building container from current image...
[+] Running 15/15
 ✔ bds Pulled                                                                                                                                                                                                 6.3s
   ✔ 2981f7e8980b Pull complete                                                                                                                                                                               1.4s
   ✔ 5834d15444ed Pull complete                                                                                                                                                                               0.7s
   ✔ 4f4fb700ef54 Pull complete                                                                                                                                                                               0.3s
   ✔ 6594556b86ef Pull complete                                                                                                                                                                               0.7s
   ✔ 90af7da1817c Pull complete                                                                                                                                                                               1.0s
   ✔ a1de59750e93 Pull complete                                                                                                                                                                               1.3s
   ✔ 5c06592fce68 Pull complete                                                                                                                                                                               1.5s
   ✔ 828c3a281e94 Pull complete                                                                                                                                                                               1.5s
   ✔ 8d49732cc323 Pull complete                                                                                                                                                                               1.7s
   ✔ 928b04ef526a Pull complete                                                                                                                                                                               1.9s
   ✔ 993f14af1a4f Pull complete                                                                                                                                                                               1.7s
   ✔ 3c05afcda7bc Pull complete                                                                                                                                                                               1.9s
   ✔ 20fb333aae1b Pull complete                                                                                                                                                                               2.0s
   ✔ 9de055f860db Pull complete                                                                                                                                                                               2.2s
[+] Running 2/2
 ✔ Network docker-minecraft-bds-myfirstworld_default  Created                                                                                                                                                 0.1s
 ✔ Container docker-minecraft-bds-myfirstworld        Started                                                                                                                                                 0.2s
Waiting for server to start...
Initializing server...

user@MACHINE:/volume2/System/Apps/MinecraftBedrock$ ./docker-container-build.sh --MyFirstWorld
Using existing project folder...
Setting project configuration variables...
Building container from current image...
[+] Running 2/2
 ✔ Network docker-minecraft-bds-myfirstworld_default  Created                                                                                                                                                 0.1s
 ✔ Container docker-minecraft-bds-myfirstworld        Started                                                                                                                                                 0.0s
Waiting for server to start...
Initializing server...

```

# File structure:
```
/volume2/System/Apps/MinecraftBedrock/
-rwxrwxrwx 1 user admin  200 Jan 14 08:40  docker-container-bash.sh
-rwxrwxrwx 1 user admin  303 Jan 14 08:40  docker-container-build.sh
-rwxrwxrwx 1 user admin  182 Jan 14 08:40  docker-container-delete.sh
-rwxrwxrwx 1 user admin  204 Jan 14 08:40  docker-container-network-connect.sh
-rwxrwxrwx 1 user admin  210 Jan 14 08:40  docker-container-network-disconnect.sh
-rwxrwxrwx 1 user admin  167 Jan 14 08:40  docker-container-rebuild.sh
-rwxrwxrwx 1 user admin  165 Jan 14 08:41  docker-container-restart.sh
-rwxrwxrwx 1 user admin  188 Jan 14 08:41  docker-container-server-console.sh
-rwxrwxrwx 1 user admin  240 Jan 14 08:41  docker-container-server-initialize.sh
-rwxrwxrwx 1 user admin  153 Jan 14 08:41  docker-container-start.sh
-rwxrwxrwx 1 user admin  152 Jan 14 08:41  docker-container-stop.sh
-rwxrwxrwx 1 user admin  165 Jan 14 08:41  docker-container-update.sh
-rwxrwxrwx 1 user admin  196 Jan 14 08:41  docker-image-update.sh
-rwxrwxrwx 1 user admin 5396 Jan 14 09:13  docker-project-initialize.sh
-rwxrwxrwx 1 user admin 1069 Jan 15 00:03  LICENSE
drwxrwxrwx 3 user admin 4096 Jan 15 00:18  servers                       <- initialized
-rwxrwxrwx 1 user admin 1838 Jan 15 00:25  README.md

/volume2/System/Apps/MinecraftBedrock/servers/MyFirstWorld/              <- initialized
drwxrwxrwx 14 user admin 4096 Jan 15 00:18 data                          <- initialized
-rwxrwxrwx  1 user admin 3857 Jan 15 00:18 docker-compose.yml            <- initialized (default values; customizable)
-rwxrwxrwx  1 user admin  367 Jan 15 00:18 docker-project-config.sh      <- initialized (default values; customizable)
```
