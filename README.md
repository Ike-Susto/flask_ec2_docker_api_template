# Flask EC2 Docker API template

Template for developing and running a flask application using containers.

Features:
1. Two-stage Dockerfile (dev and prod)
1. Devcontainer development
1. AWS EC2 support - TBD

## Repository layout

```text
.
├── .devcontainer/
│   └── devcontainer.json       # Optional: VS Code Dev Containers config (uses the same Dockerfile)
├── app/
│   ├── __init__.py
│   └── main.py                 # Flask app object: app
├── Dockerfile                  # One Dockerfile with two targets: dev + prod
├── requirements.txt            # Runtime deps (prod)
├── requirements-dev.txt        # Dev deps (dev)
└── README.md
```

## Prereqs on your laptop
- VS Code
- Docker 
- Git

### VS Code setup

[Install VS Code](https://code.visualstudio.com/download) on local machine.

[Install Dev Container extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) into VS Code.

Restart VS Code

### Docker setup

[Install docker engine](https://docs.docker.com/engine/install/)

In order to allow VS Code to open a Dev Container without sudo privileges the current user must be added into the docker GROUP.

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

Configure your Git identity (once per machine):
```bash
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
```

Clone the repository:
```bash
git clone https://github.com/Ike-Susto/flask_ec2_docker_api_template.git
cd flask_ec2_docker_api_template
```

If you created a new repo from this template, point `origin` to your new repository URL:

```bash
git remote -v
git remote set-url origin <YOUR_NEW_REPO_URL>
git remote -v
```

Commit any local changes and push:

```bash
git status
git add -A
git commit -m "Your message"    # if there are changes to commit
git push -u origin main
```

## Dev Use

Start a new shell session with docker as a primary group.
```bash
newgrp docker
```
Open the project on VS Code.

If not prompted to `Reopen in Dev Container`, run
`ctrl + shift + p` then `Reopen in Dev Container` 