```sh
$ pip install jupyterlab
```

```sh
$ jupyter lab --generate-config
Writing default config to: /root/.jupyter/jupyter_lab_config.py
```

- /root/.jupyter/jupyter_lab_config.py
```py
c.ServerApp.allow_root = True

c.ServerApp.open_browser = False
c.ExtensionApp.open_browser = False

c.ServerApp.ip = '0.0.0.0'
c.ServerApp.port = 8888
```

```
ssh -L localhost:8888:172.16.111.130:8888 root@172.16.111.130
```
