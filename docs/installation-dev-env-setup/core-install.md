<div align="center">

<a href="https://github.com/LABORA-INF-UFG/my5Gcore"><img width="20%" src="../figs/my5g-logo.png" alt="free5GC"/></a>

</div> 

# my5G-core Setup

## Table of Contents

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- [Hardware Tested](#hardware-tested)
- [Recommended Environment](#recommended-environment)
- [Installation](#installation)
  - [A. Pre-requisite](#a-pre-requisite)
  - [B. Install my5G-core entities](#b-install-my5g-core-entities)
- [Checking](#checking)
  - [A. Run the Core Network](#a-run-the-core-network)

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

### B. Install my5G-core entities
    
1. Clone my5G-core project
    ```bash
    cd ~
    git clone https://github.com/my5G/my5Gcore.git
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
3. Compile network function services in `my5g-core`
    ```bash
    cd ~/my5Gcore
    make all 
    ```
4. Customize the NFs as desired. The NF configuration file is `~/my5Gcore/config/<someNF>cfg.conf`, for example: `~/my5Gcore/config/amfcfg.conf`. Samples files are located on: `~/my5Gcore/sample/` 

## Checking
The goal is to validate the installation procedures in order to check if everything is ok.

### A. Run the Core Network 

1. Run network function services individually.  
``` ./bin/<some-NF> [-free5gccfg <core-configuration-file>] [-udmcfg <nf-configuration-file>] & ```

    For example, to run the AMF:

    ```bash
    cd ~/my5Gcore
    ./bin/amf
    ```
    to run with customized settings:
    ```bash
    # AMF
    ./bin/amf -free5gccfg sample/my5g_basic_config/free5GC.conf -amfcfg sample/my5g_basic_config/amfcfg.conf &
    ```
    **Note: The N3IWF needs specific configuration, which is detailed in section B.** 
2. Run whole core network
    ```bash
    # bash
    cd ~/my5Gcore
    ./run.sh
    ```
> Check "log output" for errors (highlighted in <span       style='color:red'>red.</span>)   
> Adjust the configuration files to resolve the warning messages (in <span       style='color:yellow'>yellow.</span>)
