# Install
```sh
docker search gerrit

docker pull gerritcodereview/gerrit

docker run --name gerrit -p 8080:8080 -p 29418:29418 -d docker.io/gerritcodereview/gerrit
```


# Access Web UI
- Access: localhost:8080


# Create A New Account
- Register -> Login
- Account Setting -> SSH Keys


# Grant Permissions To The Account
- Login: admin
- Account Setting -> Groups -> Administrators -> Members
- Add the account to the Administrators group


# Create A New Project
- Browse -> Repositories -> Create New


# Clone The Project
```sh
git clone "ssh://mt@localhost:29418/hello_gerrit"
```


# Common tasks
## Insert a Change-Id, install the hook
```sh
gitdir=$(git rev-parse --git-dir); scp -O -p -P 29418 mt@localhost:hooks/commit-msg ${gitdir}/hooks/
git commit --amend --no-edit
```

## Push for review
```sh
git push origin HEAD:refs/for/master
```





