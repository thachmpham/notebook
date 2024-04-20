# Forward to 127.0.0.1
## 1. Manual
```sh
-L [bind_address:]port:host:hostport
-L [bind_address:]port:remote_socket
-L local_socket:host:hostport
-L local_socket:remote_socket
    Specifies that connections to the given TCP port or Unix socket on the local (client) host are to be forwarded to the given host and port, or Unix socket, on the remote side. This works by allocating a socket to listen to either a TCP port on the local side, optionally bound to the specified bind_address, or to a Unix socket. Whenever a connection is made to the local port or socket, the connection is forwarded over the secure channel, and a connection is made to either host port hostport, or the Unix socket remote_socket, from the remote machine.

    Port forwardings can also be specified in the configuration file. Only the superuser can forward privileged ports. IPv6 addresses
    can be specified by enclosing the address in square brackets. By default, the local port is bound in accordance with the GatewayPorts setting.  However, an explicit bind_address may be used to bind the connection to a specific address.  The bind_address of “localhost” indicates that the listening port be bound for local use only, while an empty address or ‘*’ indicates that the port should be available from all interfaces.
```

## 2. Lab 1
### 2.1. Description
- IP of local machine:  172.16.111.1
- IP of remote machine: 172.16.111.130

```
                (local machine)                 (remote machine)

netcat  --->    127.0.0.1:2000                  127.0.0.1:2000
                    |                               ^
                    |                               |
                    ⌄                               |
                172.16.111.1        --->        172.16.111.130
```

### 2.2. Practice
**Local create tunnel**
```sh
$ ssh root@172.16.111.130 -L 127.0.0.1:2000:127.0.0.1:2222
```
- ssh root@172.16.111.130: login
- -L 127.0.0.1:2000:127.0.0.1:2222:
    - Local machine listens at 127.0.0.1:2000
    - If local machine receives messages at 127.0.0.1:2000, it forwards messages to 127.0.0.1:2222 of remote machine.

**Remote listens for messages**
```sh
$ nc -l 127.0.0.1 -p 2222
```

**Local sends message**
```sh
$ lsof -i4 -P -n | grep LISTEN
TCP 127.0.0.1:2000 (LISTEN)

$ echo 'Hello' | nc 127.0.0.1 2000
```

## 3. Lab 2
### 3.1. Description
**Problem**
- The remote machine starts an http server at 127.0.0.1:3333. 
- The local machine wants to open the server on its browswer. But, it is impossible to access the server through public IP 172.16.111.130.

**Solution**
- Create tunnel
```
    (local)                         (remote)

    127.0.0.1:3000                  127.0.0.1:3333
        |                               ^
        |                               |
        ⌄                               |
    172.16.111.1        --->        172.16.111.130
```

### 2.2. Practice
**Remote starts http server**
```sh
$ python3 -m http.server -b 127.0.0.1 3333
```

```sh
$ lsof -P -i -n | grep -i listen
TCP 127.0.0.1:3333 (LISTEN)
```

**Local create tunnel**
```sh
$ ssh root@172.16.111.130 -L 127.0.0.1:3000:127.0.0.1:3333
```

**Local accesses the http server**
Open in web browser: http://127.0.0.1:3000