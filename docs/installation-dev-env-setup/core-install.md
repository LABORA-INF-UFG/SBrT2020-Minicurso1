<div align="center">

<a href="https://github.com/my5G/my5G-core"><img width="20%" src="../figs/my5g-logo.png" alt="free5GC"/></a>

</div> 

# my5G-core Setup

## Table of Contents

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- [my5G-core Setup](#my5g-core-setup)
  - [Table of Contents](#table-of-contents)
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

## Recommended Environment
- Software (minimum) You can use actual versions like Ubuntu 20.04
    - OS: Ubuntu 18.04
    - gcc 7.3.0
    - Go 1.14.4 linux/amd64
    - kernel version 5.0.0-23-generic or higher (for UPF)

        Notes:  
            - You can use `uname -r` to check your current kernel version.  
            - Also tested on Ubuntu 20.04 with `5.4.0-53-generic` kernel version.   
            - You can use `go version` to check your current Go version.
- Hardware minimum
    - CPU: Intel i5 processor
    - RAM: 4GB
    - Hard drive: 40G
    - NIC card: 1Gbps ethernet card

- Hardware recommended
    - CPU: Intel i7 processor
    - RAM: 8GB
    - Hard drive: 160G
    - NIC card: 10Gbps ethernet card

## Installation
> All steps must be run from the `/home/<user>` folder with `sudo` privileges. If you are going to customize or install as `root`, please set paths, folders and tools according to your new configuration.

### A. Pre-requisite

 1. General required packages 
    ```bash
    sudo apt -y update && sudo apt -y upgrade
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
    > * Required minimum kernel version `5.0.0-23-generic`. This request is from the module **gtp5g**.  
    > * Some linux kernel versions between `5.0.0-23-generic` and `5.4.0-53-generic` were tested without problems.   
    > * For any more details please check [here](https://github.com/PrinzOwO/gtp5g). 

    Please check Linux kernel version if it is `5.0.0-23-generic` or higher
    ```bash
    uname -r
    ```

    Get Linux kernel module 5G GTP-U
    ```bash
    cd ~
    git clone https://github.com/PrinzOwO/gtp5g.git
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
    
1. Clone the My5G-core project and its submodules
    ```bash
    cd ~
    git clone https://github.com/my5G/my5G-core.git
    cd ~/my5G-core
    git checkout master
    git submodule sync
    git submodule update --init --jobs `nproc`
    git submodule foreach git checkout master
    git submodule foreach git pull --jobs `nproc`
    ```

2. Run the script to install dependent packages
    ```bash
    cd ~/my5G-core
    go mod download
    ```
3. Compile network function services in `my5g-core`
    ```bash
    cd ~/my5G-core
    make all 
    ```
4. Customize the NFs as desired. The NF configuration file is `~/my5G-core/config/<someNF>cfg.conf`, for example: `~/my5G-core/config/amfcfg.conf`. Samples files are located on: `~/my5G-core/sample/` 

## Checking
The goal is to validate the installation procedures in order to check if everything is ok.

### A. Run the Core Network 

1. Run network function services individually.  
``` ./bin/<some-NF> [-free5gccfg <core-configuration-file>] [-udmcfg <nf-configuration-file>] & ```
Due to the SBA and the producer/consumer relationship between the NFs, consider the following order to run the network functions: "nrf amf smf udr pcf udm nssf ausf"  
    
    For example, to run the NRF:

    ```bash
    cd ~/my5G-core
    ./bin/nrf
    ```
    to run with customized settings:
    ```bash
    ./bin/nrf -free5gccfg sample/my5g_basic_config/free5GC.conf -nrfcfg sample/my5g_basic_config/nrfcfg.conf &
    ```
2. Run whole core network
    ```bash
    cd ~/my5G-core
    ./run.sh
    ```
> Check "log output" for errors (highlighted in <span       style='color:red'>red.</span>)          
> Adjust the configuration files to resolve the warning messages (in <span       style='color:yellow'>yellow.</span>)


