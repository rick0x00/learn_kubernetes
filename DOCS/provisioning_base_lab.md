# PROVISIONING BASE LAB

---
Create "Vagrantfile" for provision vms to Kubernetes execution

```yaml
Vagrant.configure("2") do |config|
    config.vm.define "vm1" do |vm1|
        vm1.vm.box = "debian/bookworm64"
        vm1.vm.hostname = 'kuberneteslab.local'
        vm1.vm.network "public_network", type: "dhcp"
        #vm1.vm.network "private_network", ip: "192.168.56.100"
        config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1", auto_correct: true
        config.vm.network "forwarded_port", guest: 443, host: 4443, host_ip: "127.0.0.1", auto_correct: true
        config.vm.provider "virtualbox" do |v|
            v.name = "kuberneteslab"
            v.gui = false
            v.cpus = 2
            v.memory = 2048
            v.customize ["modifyvm", :id, "--nested-hw-virt", "on"]
        end
        vm1.vm.post_up_message = <<-MSG 
        " VM is up!
        Execute: sudo iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 8080
        Execute: sudo iptables -t nat -A PREROUTING -p tcp --dport 443 -j REDIRECT --to-port 4443
        "
        MSG
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
