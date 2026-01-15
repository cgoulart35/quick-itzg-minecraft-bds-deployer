# How to initialize a Minecraft BDS project folder to fine tune for deployment:
```
user@MACHINE:/volume2/System/Apps/MinecraftBedrock$ ./docker-project-initialize.sh --Server1-MyFirstWorld   <- argument is the folder name, and it is sanitized for the container name
Creating project folder: Server1-MyFirstWorld
Creating project data folder: Server1-MyFirstWorld/data
Setting project configuration variables...

user@MACHINE:/volume2/System/Apps/MinecraftBedrock$ ./docker-project-initialize.sh --"The Other World"
Creating project folder: The Other World
Creating project data folder: The Other World/data
Setting project configuration variables...
```

# How to deploy a Minecraft BDS container (new or existing):
```
user:MACHINE:/volume2/System/Apps/MinecraftBedrock$ ./docker-container-build.sh --MyFirstWorld
Creating project folder: MyFirstWorld
Creating project data folder: MyFirstWorld/data
Setting project configuration variables...
Building container from current image...
[+] Running 2/2
 ✔ Network docker-minecraft-bds-myfirstworld_default  Created                                                                                      0.1s 
 ✔ Container docker-minecraft-bds-myfirstworld        Started                                                                                      0.0s 
Waiting for server to start...
Initializing server...

user@MACHINE:/volume2/System/Apps/MinecraftBedrock$ ./docker-container-build.sh --MyFirstWorld
Using existing project folder...
Setting project configuration variables...
Building container from current image...
[+] Running 1/0
 ✔ Container docker-minecraft-bds-myfirstworld  Running                                                                                            0.0s 
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
drwxrwxrwx 3 user admin 4096 Jan 15 00:18  MyFirstWorld                  <- initialized
-rwxrwxrwx 1 user admin 1838 Jan 15 00:25  README.md

/volume2/System/Apps/MinecraftBedrock/MyFirstWorld/                      <- initialized
drwxrwxrwx 14 user admin 4096 Jan 15 00:18 data                          <- initialized
-rwxrwxrwx  1 user admin 3857 Jan 15 00:18 docker-compose.yml            <- initialized (default values; customizable)
-rwxrwxrwx  1 user admin  367 Jan 15 00:18 docker-project-config.sh      <- initialized (default values; customizable)
```

# Other scripts:
...
