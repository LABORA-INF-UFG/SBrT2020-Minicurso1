<!-- 
<div align="center">

<a href="https://github.com/LABORA-INF-UFG/my5Gcore"><img width="40%" src="../figs/my5g-logo.png" alt="free5GC"/></a>

![GitHub](https://img.shields.io/github/license/LABORA-INF-UFG/my5GCore?color=blue) ![GitHub release (latest by date including pre-releases)](https://img.shields.io/github/v/release/LABORA-INF-UFG/my5GCore?include_prereleases) ![GitHub All Releases](https://img.shields.io/github/downloads/LABORA-INF-UFG/my5GCore/total) ![GitHub go.mod Go version](https://img.shields.io/github/go-mod/go-version/LABORA-INF-UFG/my5GCore) ![GitHub commit activity](https://img.shields.io/github/commit-activity/y/LABORA-INF-UFG/my5GCore) 


 ![GitHub repo size](https://img.shields.io/github/repo-size/LABORA-INF-UFG/my5GCore) ![GitHub Workflow Status](https://img.shields.io/github/workflow/status/labora-inf-ufg/my5gcore/My5Gcore%20Workflow) ![GitHub last commit](https://img.shields.io/github/last-commit/LABORA-INF-UFG/my5GCore) ![GitHub contributors](https://img.shields.io/github/contributors/LABORA-INF-UFG/my5GCore)
</div>

 -->

<!-- 
![YouTube Video Comments](https://img.shields.io/youtube/comments/my5G-initiative?style=social)

![GitHub forks](https://img.shields.io/github/forks/LABORA-INF-UFG/my5GCore?label=Forks&style=social)

![GitHub followers](https://img.shields.io/github/followers/LABORA-INF-UFG?style=social)

![GitHub watchers](https://img.shields.io/github/watchers/LABORA-INF-UFG/my5Gcore?style=social) 

 ![Github All Contributors](https://img.shields.io/github/all-contributors/LABORA-INF-UFG/my5GCore)
![GitHub repo file count](https://img.shields.io/github/directory-file-count/LABORA-INF-UFG/my5GCore)
-->
# my5GCore Setup

## Table of Contents

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- [Hardware Tested](#hardware-tested)
- [Recommended Environment](#recommended-environment)
- [Installation](#installation)
  - [A. Pre-requisite](#a-pre-requisite)
  - [B. Install Control Plane Entities](#b-install-control-plane-entities)
  - [C. Install User Plane Function (UPF)](#c-install-user-plane-function-upf)
- [Instalation Test](#my5GCore-installation-test)
  - [A. Run Core Network](#a-run-core-network)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Hardware Tested
* There are no gNB and UE for standalone 5GC available in the market yet.
<!-- 
## Questions
For questions and support please use the [official forum](https://forum.free5gc.org). The issue list of this repo is exclusively
for bug reports and feature requests. -->

## Recommended Environment
- Software
    - OS: Ubuntu 18.04
    - gcc 7.3.0
    - Go 1.14.4 linux/amd64
    - kernel version 5.0.0-23-generic or higher (for UPF)

        Notes:  
            - Also tested on Ubuntu 20.04 with  5.4.0-52-generic kernel version.  
            - You can use `go version` to check your current Go version.
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

## Installation
### A. Pre-requisite

0. Required kernel version `5.0.0-23-generic`. This request is from the module **gtp5g** (will be installed next) . Any more details please check [here](https://github.com/PrinzOwO/gtp5g)
   ```bash
   # Check kernel version
   $ uname -r
   5.0.0-23-generic
   ```
 1. General required packages 
    ```bash
    sudo apt -y update
    sudo apt -y install mongodb wget git net-tools
    sudo systemctl status mongodb
    # if mongodb is not active
    sudo systemctl start mongodb
    ```

2. Require go language

    If another version of Go is installed

    ```bash
    # Please remove the previous Go version
    sudo rm -rf /usr/local/go
    ```
    ```bash
    # Install Go 1.14.4
    wget https://dl.google.com/go/go1.14.4.linux-amd64.tar.gz
    sudo tar -C /usr/local -zxvf go1.14.4.linux-amd64.tar.gz
    ```

    Clean installation
    ```bash 
    # Install Go 1.14.4
    wget https://dl.google.com/go/go1.14.4.linux-amd64.tar.gz
    sudo tar -C /usr/local -zxvf go1.14.4.linux-amd64.tar.gz
    mkdir -p ~/go/{bin,pkg,src}
    echo 'export GOPATH=$HOME/go' >> ~/.bashrc
    echo 'export GOROOT=/usr/local/go' >> ~/.bashrc
    echo 'export PATH=$PATH:$GOPATH/bin:$GOROOT/bin' >> ~/.bashrc
    source ~/.bashrc
    ```

3. Required packages for control and user planes
    ```bash
    sudo apt -y update
    sudo apt -y install gcc cmake autoconf build-essential
    sudo apt -y install libtool pkg-config libmnl-dev libyaml-dev 
    go get -u github.com/sirupsen/logrus
    go get -u github.com/calee0219/fatal
    ```
4. Installing kernel module

    Please check Linux kernel version if it is `5.0.0-23-generic` or higher
    ```bash
    uname -r
    ```

    Get Linux kernel module 5G GTP-U
    ```bash
    cd ~
    git clone -b v0.1.0 https://github.com/PrinzOwO/gtp5g.git
    ```
    Install Linux kernel module 5G GTP-U
    ```bash
    cd ~/gtp5g
    make
    sudo make install
    ```
5. Network Setting
    ```bash
    sudo sysctl -w net.ipv4.ip_forward=1
    sudo iptables -t nat -A POSTROUTING -o <dn_interface> -j MASQUERADE
    sudo systemctl stop ufw
    ```

### B. Install my5GCore entities
    
1. Clone my5GCore project
    ```bash
    cd ~
    git clone https://github.com/LABORA-INF-UFG/my5Gcore.git
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
3. Compile network function services in `my5gCore`
    ```bash
    cd ~/my5Gcore
    make all 
    ```

## my5GCore installation test

### Run Core Network 
> *Only for network function services installation check. my5GCore requires another settings to run. See them on [Setting-up development environment](./env-install.md) 

To run each network function separately.
```bash
# NRF
~/my5GCore/bin/nrf -free5gccfg sample/my5g_basic_config/free5GC.conf -nrfcfg sample/my5g_basic_config/nrfcfg.conf & 
# AMF
./bin/amf -free5gccfg sample/my5g_basic_config/free5GC.conf -amfcfg sample/my5g_basic_config/amfcfg.conf & 
# SMF
./bin/smf -free5gccfg sample/my5g_basic_config/free5GC.conf -smfcfg sample/my5g_basic_config/smfcfg.conf & 
# UDR
./bin/udr -free5gccfg sample/my5g_basic_config/free5GC.conf -udrcfg sample/my5g_basic_config/udrcfg.conf & 
# PCF
./bin/pcf -free5gccfg sample/my5g_basic_config/free5GC.conf -pcfcfg sample/my5g_basic_config/pcfcfg.conf &  
# UDM
./bin/udm -free5gccfg sample/my5g_basic_config/free5GC.conf -udmcfg sample/my5g_basic_config/udmcfg.conf & 
# NSSF
./bin/nssf -free5gccfg sample/my5g_basic_config/free5GC.conf -nssfcfg sample/my5g_basic_config/nssfcfg.conf & 
# AUSF
./bin/ausf -free5gccfg sample/my5g_basic_config/free5GC.conf -ausfcfg sample/my5g_basic_config/ausfcfg.conf &  
# N3IWF
./bin/n3iwf -free5gccfg sample/my5g_basic_config/free5GC.conf -n3iwfcfg sample/my5g_basic_config/n3iwfcfg.conf & 
```

Shell script
```bash
# bash
cd ~/my5Gcore
./run.sh
```
Check "log output" for errors (highlighted in <span style="color=red">\[red\]</span>)

