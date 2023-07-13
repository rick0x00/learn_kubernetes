# MORE COMMANDS

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
Create file ./provision-pod.yaml

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
kubectl apply -f ./provision-pod.yaml
```
