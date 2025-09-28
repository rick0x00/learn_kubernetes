# BASIC COMMANDS

---

[Learn Kubernetes Basics](https://kubernetes.io/docs/tutorials/kubernetes-basics/)

---
---
Create a Cluster

---

Start Minikube

```bash
minikube start
```

---
Add more nodes to the cluster

```bash
minikube node add
```

---
List nodes

```bash
# minikube command
minikube node list
```

```bash
# Kubernetes command
kubectl get nodes
```

---
---
Deploy an app

---

Crete Deployment(high level of application)

```bash
kubectl create deployment kubernetes-bootcamp --image=gcr.io/google-samples/kubernetes-bootcamp:v1
```

---
inspect deployments(and pods, services)

```bash
kubectl get deployments -o wide
kubectl describe deployments
kubectl get pods -o wide
kubectl describe pods
kubectl get services -o wide
kubectl describe services
```

---
View the app

```bash
# on another terminal execute
kubectl proxy
```

```bash
# using terminal to display content
curl http://localhost:8001/version
```

---
---
Explore your app

---

Crete Deployment(high level of application)

```bash
kubectl create deployment kubernetes-bootcamp --image=gcr.io/google-samples/kubernetes-bootcamp:v1
```

---

get the Pod name and store it in the POD_NAME environment variable

```bash
export POD_NAME="$(kubectl get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}')"
echo Name of the Pod: $POD_NAME
```

---

start a bash session inside pod container

```bash
kubectl exec "$POD_NAME" -- env
```

---
---
Expose Your app publicly

---

Create the service "NodePort"

```bash
kubectl expose deployment/kubernetes-bootcamp --type="NodePort" --port 8080
```

---

test that the app is exposed outside of the cluster

```bash
curl http://"$(minikube ip):8080"
```

---
---
Scale Your app

---

scale the Deployment to 4 replicas

```bash
kubectl scale deployments/kubernetes-bootcamp --replicas=4
```

---
---
Scale Your app

---

update the image of the application to version 2

```bash
kubectl set image deployments/kubernetes-bootcamp kubernetes-bootcamp=jocatalin/kubernetes-bootcamp:v2
```
