# [Kubernetes Architecture](https://kubernetes.io/docs/concepts/architecture/)

![Architecture diagram](https://kubernetes.io/images/docs/kubernetes-cluster-architecture.svg)

- **Control Plane (Management)**
  - **API Server**: It's a pod running on port **6443**. All communication and management of the cluster happen through the API Server.  
  - **etcd**: A key-value database used as the data source for all cluster state and configuration information.  
  - **Scheduler**: Makes scheduling decisions, assigning pods to available nodes.  
  - **Controller Manager**: Runs controllers that continuously monitor resources and ensure the desired state of the cluster by automatically orchestrating services, pods, and other resources.  
  - **Cloud Controller Manager**: Responsible for interacting with cloud platforms (AWS, GCP, Azure, etc.).  

- **Data Plane**
  - **kubelet**: An agent running on each node. It receives specifications (PodSpecs) from the API Server and ensures that containers are running as expected, provisioning resources when needed.  
  - **kube-proxy**: Manages network rules on nodes (using iptables, nftables, or cloud provider mechanisms) to enable communication between services and pods inside or outside the cluster.  
  - **CRI (Container Runtime Interface)**: The interface that allows Kubernetes to communicate with container runtimes (e.g., containerd, CRI-O, Docker shim). It is responsible for pulling images and running containers.  
  - **Pods**: The smallest deployable unit in Kubernetes. A pod encapsulates one or more containers that share the same network namespace and storage volumes, and are scheduled together on a node.  
