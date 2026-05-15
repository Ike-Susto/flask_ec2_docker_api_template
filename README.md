# Flask EC2 Docker API template

## Repository layout

```text
.
├── .devcontainer/
│   └── devcontainer.json       # Optional: VS Code Dev Containers config (uses the same Dockerfile)
├── app/
│   ├── __init__.py
│   └── main.py                 # Flask app object: app
├── .dockerignore
├── Dockerfile                  # One Dockerfile with two targets: dev + prod
├── requirements.txt            # Runtime deps (prod)
├── requirements-dev.txt        # Dev deps (dev)
└── README.md
```

## Prereqs on your laptop

### VS Code setup

[Install VS Code](https://code.visualstudio.com/download) on local machine.

[Install Dev Container extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) into VS Code.

Restart VS Code

### Docker setup

[Install docker engine](https://docs.docker.com/engine/install/)

In order to allow VS Code to open a Dev Container docker without sudo privileges the current user must be added into docker GROUP.

Add current user to docker GROUP.
```bash
sudo usermod -aG docker $USER
```
Start a new shell session with docker as a primary group.
```bash
newgrp docker
```
Test permissions by listing current containers
```bash
docker ps -a
```
### Git Setup

### Dev Container startup

Clone the repository into your local machine.
```bash
cd ./my_workspace_folder
git clone 
```

Build application using Flask`s own server.
```bash
flask --app app.main --debug run --host 0.0.0.0 --port 8000
```

