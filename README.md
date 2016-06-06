# IPv6 Training VirtualMachines
The VMs in this repository can be used to set up a simple IPv6 environment to test with on [VirtualBox](https://www.virtualbox.org/).

With these VMs a simple setup can be created to play with IPv6 and understand how the basics work.

All VMs in this environment will be running Ubuntu Linux.

The setup consists out of two types of VMs:

- Router
- Client

The *router* will run the following software/components:

- radvd for Stateless AutoConfiguration (SLAAC) of clients
- Unbound for a DNS server
- Apache for a HTTP proxy server for the clients (only needed in this test)

With these VMs you will be able to experiment with a working IPv6 setup in a small lab environment and experience how the IPv6 protocol behaves differently then IPv4.

The *client* is just a plain Linux operating system where you can see how a client obtains an address and can communicate with it.

# Prerequisites
To run this Virtual Machines you need to match the following requirements:

- VirtualBox >4.X installed
- 10GB of free diskspace
- 2GB of memory

# Configure VirtualBox
Before you can inport the Virtual Machines you have to make sure that a *Host-Only* network is created.

Usually there is no such network on the system by default, so you can create one which will have the name *vboxnet0*.

Go to the VirtualBox preferences and create a Host-Only network.

When creating use the following IPv4 and IPv6 settings:

![alt text](./doc/virtualbox/screenshot_virtualbox_host-only_ip_settings.png "VirtualBox Networks")

And make sure DHCP is **not** enabled:

![alt text](./doc/virtualbox/screenshot_virtualbox_host-only_no_dhcp.png "VirtualBox Networks")

After you create the network you should have the following overview. *vboxnet0* should now exist.

![alt text](./doc/virtualbox/screenshot_virtualbox_networks.png "VirtualBox Networks")

# Importing Virtual Machines
You can import the *router* and *client* Virtual Machines in VirtualBox using their **.ovf** file.

After you import them, make sure that the network settings described below are applied to them.

## Router
For optimal usage the router needs internet access. We do this by providing two network cards to the Router:

- NIC 1: NAT
- NIC 2: Host-Only network *vboxnet0*

Using the *NAT* NIC it will have access to the internet.

![alt text](./doc/virtualbox/screenshot_virtualbox_router_nic_settings.png "VirtualBox Networks")

## Client
The client just needs to be connected to the router over the Host-Only network.

The NIC of the client needs to be connected to *vboxnet0*.

![alt text](./doc/virtualbox/screenshot_virtualbox_client_nic_settings.png "VirtualBox Networks")

# Starting
You can now start the Virtual Machines where it is best to start the router first.

After 30 seconds start the client.

# Logging in
After boot you can log in with these credentials:

- User: root
- Password: ipv6test

## SSH
From the machine where the Virtual Machines are running on you should be able to connect through SSH using your favorite SSH client.

Under Linux and Mac OSX you can use the *ssh* command on the command-line and on Windows [PuTTY](http://www.putty.org/). might be a good solution.

The **router** has a static IPv6 address: *2001:db8::1*

The *client* however obtains a dynamic IPv6 address. Log in through the terminal first and run:

```
root@ipv6client:~# ip addr show
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: enp0s3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 08:00:27:48:42:67 brd ff:ff:ff:ff:ff:ff
    inet6 2001:db8::a00:27ff:fe48:4267/64 scope global mngtmpaddr dynamic
       valid_lft 86398sec preferred_lft 14398sec
    inet6 fe80::a00:27ff:fe48:4267/64 scope link
       valid_lft forever preferred_lft forever
root@ipv6client:~#
```

In this case *2001:db8::a00:27ff:fe48:4267* is the IPv6 address of the client. Keep in mind, this address will be different in your situation.

# Building
If you want to build these Virtual Machines from source you can do so by running the *build-all.sh* script in the *vms* directory.

You need to make sure that [Packer](https://www.packer.io/) is installed as it's used for building the images.
