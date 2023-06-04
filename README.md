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
