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
- [minikube start](https://minikube.sigs.k8s.io/docs/start/)

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
