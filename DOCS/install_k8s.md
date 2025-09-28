# INSTALL KUBERNETES

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

---

Install bash-completions

```bash
apt install bash-completion
kubectl completion bash | tee /etc/bash_completion.d/kubectl > /dev/null
chmod a+r /etc/bash_completion.d/kubectl

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
