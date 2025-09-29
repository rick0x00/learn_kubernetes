# Learning Kubernetes

[Official Documentation](https://kubernetes.io/docs/home/)

Kubernetes is an open-source container orchestration system for automating software deployment, scaling, and management. [Wikipedia](https://en.wikipedia.org/wiki/Kubernetes)

To start the study, follow the instructions
 
- [Architecture](/DOCS/architecture.md)


---

## Study Guide and Architecture

To start your study and understand the environment's foundation:

- [Architecture](/DOCS/architecture.md)
- [Provisioning the Base LAB (with Vagrant)](/DOCS/provisioning_base_lab.md)
- [Container Runtime Installation](/DOCS/install_container_runtime.md)

---

## Kubernetes Installation Options and Environments

| Environment / Tool | CRI (Container Runtime) | kubectl | Notes |
|--------------------|--------------------------|---------|-------|
| **kubeadm (manual setup)** | ❌ Needs to be installed manually (e.g., containerd, CRI-O, Docker shim*) | ❌ Needs to be installed manually | Full flexibility, but more complex. Good for learning internals. |
| **kind** | ✅ Included (uses containerd inside Docker containers) | ❌ Needs to be installed locally | Runs Kubernetes clusters inside Docker. kubectl must be installed on your host. |
| **k3s** | ✅ Included (lightweight containerd, embedded CRI) | ✅ Included, but often you’ll use your local kubectl with the provided kubeconfig | Very lightweight, optimized for edge/IoT. |
| **minikube** | ✅ Included (supports Docker, containerd, CRI-O) | ❌ Needs to be installed locally | Provides a single-node cluster in a VM or container. |
| **GKE / EKS / AKS (Managed Clouds)** | ✅ Included and managed by the provider | ❌ Needs to be installed locally | You only need kubectl + kubeconfig to access the cluster. |


### Kubernetes Cluster Provisioning Tools

| Tool | Reference |
| :--- | :--- |
| **Minikube** | [Install Minikube](/DOCS/install_minikube.md) |
| **Kubeadm** | [Official Documentation](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/) |
| **Kind** | [Official Documentation](https://kind.sigs.k8s.io/docs/user/quick-start/#installation) |
| **K3s** | [Official Documentation](https://docs.k3s.io/installation) |

---

### Container Runtimes

| Runtime | Reference |
| :--- | :--- |
| **Containerd** | [Official Documentation](https://github.com/containerd/containerd/blob/main/docs/getting-started.md) |
| **CRI-O** | [Official Documentation](https://cri-o.io/#install) |
| **Docker Engine** | [Includes `cri-dockerd` setup](/DOCS/install/docker/engine.md)  |
| **Docker Shim** | [Installed via `cri-dockerd` for K8s](/DOCS/install/docker/engine.md) |

---

### 💻 Kubernetes CLI Tool

| Tool | Reference |
| :--- | :--- |
| **kubectl** | [Install kubectl](/DOCS/install_k8s.md) |
---

## Let's get started

- [Start Guide with Minikube](/DOCS/start_guide_with_minikube.md)
- [Basic Manipulation Commands](/DOCS/basic_commands.md)
- [More Commands (Pods, YAML)](/DOCS/more_commands.md)

