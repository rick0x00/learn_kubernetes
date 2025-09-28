# START GUIDE WITH MINIKUBE

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
kubectl get pods -A
```

---
---
[Hello Minikube](https://kubernetes.io/docs/tutorials/hello-minikube/)

Create a Deployment

---

```bash
# Run a test container image that includes a webserver
kubectl create deployment hello-node --image=registry.k8s.io/e2e-test-images/agnhost:2.39 -- /agnhost netexec --http-port=8080
```

---
View the Deployment

```bash
kubectl get deployments
```

---
View the Pod

```bash
kubectl get pods
```

---
View cluster events

```bash
kubectl get events
```

---
View the kubectl configuration

```bash
kubectl config view
```

---
Create a Service

---
Expose the Pod to the "public" internet

```bash
kubectl expose deployment hello-node --type=LoadBalancer --port=8080
```

---
View the Service you created

```bash
kubectl get services
```

---
Test Web service for deployment

```bash
# on CLI
curl $(minikube service hello-node --url)
# on Web browser
minikube service hello-node
```

---
Enable Addons

---
List the currently supported addons

```bash
minikube addons list
```

---
Enable an addon, for example, metrics-server

```bash
minikube addons enable metrics-server
```

---
View the Pod and Service you created by installing that addon

```bash
kubectl get pod,svc -n kube-system
```

---
Clean up

---

```bash
minikube addons disable metrics-server
kubectl delete service hello-node
kubectl delete deployment hello-node
minikube stop
# Optional
minikube delete
```
