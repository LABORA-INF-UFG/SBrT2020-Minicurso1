<div align="center">

<a href="https://github.com/LABORA-INF-UFG/my5Gcore"><img width="40%" src="../figs/my5g-logo.jpeg" alt="free5GC"/></a>

![GitHub](https://img.shields.io/github/license/LABORA-INF-UFG/my5GCore?color=blue) ![GitHub release (latest by date including pre-releases)](https://img.shields.io/github/v/release/LABORA-INF-UFG/my5GCore?include_prereleases) ![GitHub All Releases](https://img.shields.io/github/downloads/LABORA-INF-UFG/my5GCore/total) ![GitHub go.mod Go version](https://img.shields.io/github/go-mod/go-version/LABORA-INF-UFG/my5GCore) ![GitHub commit activity](https://img.shields.io/github/commit-activity/y/LABORA-INF-UFG/my5GCore) ![GitHub repo file count](https://img.shields.io/github/directory-file-count/LABORA-INF-UFG/my5GCore)
 ![GitHub repo size](https://img.shields.io/github/repo-size/LABORA-INF-UFG/my5GCore) ![GitHub Workflow Status](https://img.shields.io/github/workflow/status/labora-inf-ufg/my5gcore/My5Gcore%20Workflow) ![GitHub last commit](https://img.shields.io/github/last-commit/LABORA-INF-UFG/my5GCore) ![GitHub contributors](https://img.shields.io/github/contributors/LABORA-INF-UFG/my5GCore) ![Github All Contributors](https://img.shields.io/github/all-contributors/LABORA-INF-UFG/my5GCore)
</div>

<!-- 
![YouTube Video Comments](https://img.shields.io/youtube/comments/my5G-initiative?style=social)

![GitHub forks](https://img.shields.io/github/forks/LABORA-INF-UFG/my5GCore?label=Forks&style=social)

![GitHub followers](https://img.shields.io/github/followers/LABORA-INF-UFG?style=social)

![GitHub watchers](https://img.shields.io/github/watchers/LABORA-INF-UFG/my5Gcore?style=social) 

-->


## Table of Contents

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- [Hardware Tested](#hardware-tested)
- [Questions](#questions)
- [Recommended Environment](#recommended-environment)
- [Installation](#installation)
  - [A. Pre-requisite](#a-pre-requisite)
  - [B. Install Control Plane Entities](#b-install-control-plane-entities)
  - [C. Install User Plane Function (UPF)](#c-install-user-plane-function-upf)
- [Run](#run)
  - [A. Run Core Network](#a-run-core-network)
  - [B. Run N3IWF (Individually)](#b-run-n3iwf-individually)
  - [C. Run all in one with outside RAN](#c-run-all-in-one-with-outside-ran)
  - [D. Deploy with container](#d-deploy-with-container)
- [Test](#test)
- [Release Note](#release-note)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Hardware Tested
There are no gNB and UE for standalone 5GC available in the market yet.
<!-- 
## Questions
For questions and support please use the [official forum](https://forum.free5gc.org). The issue list of this repo is exclusively
for bug reports and feature requests. -->

## Recommended Environment
- Software
    - OS: Ubuntu 18.04
    - gcc 7.3.0
    - Go 1.14.4 linux/amd64
    - kernel version 5.0.0-23-generic or higher (MUST for UPF)
    
    **Note: Tested on Ubuntu 20.04 and kernel version 5.4.0-52-generic** 


    You can use `go version` to check your current Go version.
```bash
- Hardware
    - CPU: Intel i5 processor
    - RAM: 4GB
    - Hard drive: 160G
    - NIC card: 1Gbps ethernet card

- Hardware recommended
    - CPU: Intel i7 processor
    - RAM: 8GB
    - Hard drive: 160G
    - NIC card: 10Gbps ethernet card
```


## Installation
### A. Pre-requisite

0. Required kernel version `5.0.0-23-generic`. This request is from the module [gtp5g](https://github.com/PrinzOwO/gtp5g) that we has used. Any more details please check [here](https://github.com/PrinzOwO/gtp5g)
   ```bash
   # Check kernel version
   $ uname -r
   5.0.0-23-generic
   ```

1. Require go language
    * If another version of Go is installed
        - Please remove the previous Go version
            - ```sudo rm -rf /usr/local/go```
        - Install Go 1.14.4
            ```bash
            wget https://dl.google.com/go/go1.14.4.linux-amd64.tar.gz
            sudo tar -C /usr/local -zxvf go1.14.4.linux-amd64.tar.gz
            ```
    * Clean installation
        - Install Go 1.14.4
             ```bash
            wget https://dl.google.com/go/go1.14.4.linux-amd64.tar.gz
            sudo tar -C /usr/local -zxvf go1.14.4.linux-amd64.tar.gz
            mkdir -p ~/go/{bin,pkg,src}
            echo 'export GOPATH=$HOME/go' >> ~/.bashrc
            echo 'export GOROOT=/usr/local/go' >> ~/.bashrc
            echo 'export PATH=$PATH:$GOPATH/bin:$GOROOT/bin' >> ~/.bashrc
            source ~/.bashrc
            ```

2. Required packages for control plane
    ```bash
    sudo apt -y update
    sudo apt -y install mongodb wget git
    sudo systemctl start mongodb
    ```

3. Required packages for user plane
    ```bash
    sudo apt -y update
    sudo apt -y install gcc cmake autoconf build-essential
    sudo apt -y install libtool pkg-config libmnl-dev libyaml-dev 
    go get -u github.com/sirupsen/logrus
    go get -u github.com/calee0219/fatal
    ```

4. Network Setting
    ```bash
    sudo sysctl -w net.ipv4.ip_forward=1
    sudo iptables -t nat -A POSTROUTING -o <dn_interface> -j MASQUERADE
    sudo systemctl stop ufw
    ```

### B. Install Control Plane Entities
    
1. Clone my5GCore project
    ```bash
    cd ~
    git clone git@github.com:LABORA-INF-UFG/my5Gcore.git
    cd ~/my5Gcore
    git checkout master
    git submodule sync
    git submodule update --init --jobs `nproc`
    git submodule foreach git checkout master
    git submodule foreach git pull --jobs `nproc`
    ```

2. Run the script to install dependent packages
    ```bash
    cd ~/my5Gcore
    go mod download
    ```
3. Compile network function services in `free5gc` individually, e.g. AMF (redo this step for each NF), or
    ```bash
    cd ~/my5Gcore
    make all 
    ```
### C. Install User Plane Function (UPF)
    
1. Please check Linux kernel version if it is `5.0.0-23-generic` or higher
    ```bash
    uname -r
    ```


    Get Linux kernel module 5G GTP-U
    ```bash
    cd ~
    git clone -b v0.1.0 https://github.com/PrinzOwO/gtp5g.git
    cd gtp5g
    make
    sudo make install
    ```

## Run

### A. Run Core Network 
Option 1. Run network function service individually, e.g. AMF (redo this for each NF), or
```bash
cd ~/my5Gcore
./bin/amf
```

**Note: For N3IWF needs specific configuration in section B** 

Option 2. Run whole core network with command
```
./run.sh
```

### B. Run N3IWF (Individually)
To run N3IWF, make sure the machine is equipped with three network interfaces. (one is for connecting AMF, another is for connecting UPF, the other is for IKE daemon)

We need to configure each interface with a suitable IP address.

We have to create an interface for IPSec traffic:
```bash
# replace <...> to suitable value
sudo ip link add ipsec0 type vti local <IKEBindAddress> remote 0.0.0.0 key <IPSecInterfaceMark>
```
Assign an address to this interface, then bring it up:
```bash
# replace <...> to suitable value
sudo ip address add <IPSecInterfaceAddress/CIDRPrefix> dev ipsec0
sudo ip link set dev ipsec0 up
```

Run N3IWF (root privilege is required):
```bash
cd ~/free5gc/
sudo ./bin/n3iwf
```

### C. Run all in one with outside RAN

Reference to [sample config](./sample/ran_attach_config) if need to connect the
outside RAN with all in one free5GC core network.

### D. Deploy with container

Reference to [free5gc-compose](https://github.com/free5gc/free5gc-compose/) as
the sample for container deployment.

## Test
Start Wireshark to capture any interface with `pfcp||icmp||gtp` filter and run the tests below to simulate the procedures:
```bash
cd ~/free5gc
chmod +x ./test.sh
```
a. TestRegistration
```bash
(In directory: ~/free5gc)
./test.sh TestRegistration
```
b. TestServiceRequest
```bash
./test.sh TestServiceRequest
```
c. TestXnHandover
```bash
./test.sh TestXnHandover
```
d. TestDeregistration
```bash
./test.sh TestDeregistration
```
e. TestPDUSessionReleaseRequest
```bash
./test.sh TestPDUSessionReleaseRequest
```

f. TestPaging
```!
./test.sh TestPaging
```

g. TestN2Handover
```!
./test.sh TestN2Handover
```

h. TestNon3GPP
```bash
./test.sh TestNon3GPP
```

i. TestULCL
```bash
./test_ulcl.sh -om 3 TestRegistration
```

**For more details, you can reference to our [wiki](https://github.com/free5gc/free5gc/wiki)**

## Release Note
Detailed changes for each release are documented in the [release notes](https://github.com/free5gc/free5gc/releases).

