# INSTALL DOCKER ENGINE

---

Install Docker Engine

- [Install Docker](https://docs.docker.com/engine/install/debian/)

```bash
# Install using the convenience script
# Download script
curl -fsSL https://get.docker.com -o get-docker.sh
# Show the script will run
sh ./get-docker.sh --dry-run
# Run the script, and install docker
sh get-docker.sh
# test Docker installation
docker version
docker run hello-world
# Setting docker to rootless execution
usermod -aG docker vagrant
su -c "docker run hello-world" vagrant
```

---
---

- [Install cri-dockerd](https://github.com/Mirantis/cri-dockerd)

Install from deb Package

```bash
wget https://github.com/Mirantis/cri-dockerd/releases/download/v0.3.2/cri-dockerd_0.3.2.3-0.debian-bullseye_amd64.deb
apt install -y ./cri-dockerd_0.3.2.3-0.debian-bullseye_amd64.deb
```
