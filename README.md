# Learning Kubernetes

[Official Doccumentation](https://kubernetes.io/docs/home/)

Kubernetes is an open-source container orchestration system for automating software deployment, scaling, and management. [Wikipedia](https://en.wikipedia.org/wiki/Kubernetes)

To start the study, follow the instructions

---
Create "Vagrantfile" for provision vms to Kubernetes execution

```yaml
Vagrant.configure("2") do |config|
    config.vm.define "vm1" do |vm1|
        vm1.vm.box = "debian/bullseye64"
        vm1.vm.hostname = 'kuberneteslab'
        vm1.vm.network "public_network", type: "dhcp"
        config.vm.provider "virtualbox" do |v|
            v.gui = false
            v.cpus = 1
            v.memory = 2048
        end
    end
end
```

---
Provision VMS with Vagrant

```bash
vagrant up
```

---
Enter the Vagrant vm

```bash
vagrant ssh vm1
```

---

- [Install and Set Up kubectl on Linux](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/)

Install From Source

```bash
# Download Kubernetes Binary
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
# Validate Binary
curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
# Install Kubectl
install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
# Test version intallerd
kubectl version --output=yaml
# clean up the installation files
rm kubectl kubectl.sha256
```

Install From Package Manager(apt)

```bash
# install packages needed
apt install -y ca-certificates curl debsigs
# Download the Google Cloud public signing key
curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | gpg --dearmor -o /usr/share/keyrings/kubernetes-archive-keyring.gpg
# Add the Kubernetes apt repository
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list
# Update apt package index with the new repository and install kubectl
apt update
apt install -y kubectl
```

Install bash-completions

```bash
apt install bash-completion
echo "source /usr/share/bash-completion/bash_completion" >> ~/.bashrc
echo 'source <(kubectl completion bash)' >> ~/.bashrc
# reload bash
```

Install kubectl convert plugin

```bash
# Download the latest release with the command:
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl-convert"
# Validate the binary (optional)
curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl-convert.sha256"
# Validate the kubectl-convert binary
echo "$(cat kubectl-convert.sha256) kubectl-convert" | sha256sum --check
# Install kubectl-convert
install -o root -g root -m 0755 kubectl-convert /usr/local/bin/kubectl-convert
# Verify plugin is successfully installed
kubectl convert --help
# clean up the installation files
rm kubectl-convert kubectl-convert.sha256
```

---

- [Install Tools (minikube)](https://minikube.sigs.k8s.io/docs/start/)

Install from Source

```bash
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
install minikube-linux-amd64 /usr/local/bin/minikube
```

Install From Package Manager(apt)

```bash
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
dpkg -i minikube_latest_amd64.deb
```

---

- [Install Container Runtime](https://kubernetes.io/docs/setup/production-environment/container-runtimes/)

Configure prerequisites

```bash
# Setting Modules
echo -e "\noverlay\nbr_netfilter\n" > /etc/modules-load.d/k8s.conf
modprobe overlay
modprobe br_netfilter
# Setting sysctl params
echo -e "\nnet.bridge.bridge-nf-call-iptables = 1\nnet.bridge.bridge-nf-call-ip6tables = 1\nnet.ipv4.ip_forward = 1\n" > /etc/sysctl.d/k8s.conf
# Apply sysctl params without reboot
sysctl --system
# Verify that the modules are loaded
lsmod | grep "br_netfilter\|overlay"
# Verify that system variables are set correctly(= 1)
sysctl net.bridge.bridge-nf-call-iptables net.bridge.bridge-nf-call-ip6tables net.ipv4.ip_forward
```

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
# test Docker intallation
docker version
docker run hello-world
```

- [Install cri-dockerd](https://github.com/Mirantis/cri-dockerd)

Install from deb Package

```bash
wget https://github.com/Mirantis/cri-dockerd/releases/download/v0.3.2/cri-dockerd_0.3.2.3-0.debian-bullseye_amd64.deb
apt install -y ./cri-dockerd_0.3.2.3-0.debian-bullseye_amd64.deb
```

---
Start local cluster with minikube

```bash
minikube start
```

---
Check cluster status

```bash
minikube status
```

---
show Kubernetes resources

```bash
kubectl get nodes 
```

---
Creating a POD

```bash
kubectl run nginx-pod --image=nginx:latest
```

---
Monitoring POD

```bash
kubectl get nodes --watch
```

---
Inspecting POD

```bash
kubectl decribe pod nginx-pod
```

---
Edit POD

```bash
kubectl edit pod nginx-pod
```

---
---

Using Files to Create PODs

---
Create file provision-pod.yaml

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: first-pod
spec:
  containers:
    - name: nginx-container
      image: nginx:stable
```

---
Applying Workloads file

```bash
kubectl apply -f provision-pod.yaml
```
