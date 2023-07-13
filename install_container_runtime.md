# INSTALL CONTAINER RUNTIME

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

---
---

- [Docker Engine](/install_docker_engine.md)
