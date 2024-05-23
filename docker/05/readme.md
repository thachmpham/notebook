# Run
Startup.
```sh
$ docker-compose up
```

Check status
```sh
$ docker ps
CONTAINER ID   IMAGE       COMMAND                  CREATED          STATUS          PORTS                                   NAMES
a59a48f13a5f   05-phpapp   "docker-php-entrypoi…"   10 seconds ago   Up 10 seconds   0.0.0.0:8080->80/tcp, :::8080->80/tcp   05-phpapp-1
```

Send request
```sh
$ curl localhost:8080
Hello, World Docker!
```

# Rebuild
Startup with rebuild.
```sh
$ docker-compose up --build
```