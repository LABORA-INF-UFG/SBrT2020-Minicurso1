# Go packages

## Expected result

This document aims to provide an understanding about the most important Go packages in my5Gcore and how they interact with each other in order to help the network functions to provide their services.

<p align="center">
    <img src="images/demo1-exp1.png" height="300" alt="Go packages in my5Gcore"/> 
</p>

## What to expect from a network function (NF)

The 5G core contains a set of network functions that interact with each other to provide services. So, the building blocks of my5Gcore are these network functions. In a simplified way, we can 


* Implement (produce) services
* Explose services
* Consume services
* Store and manage states (context)
* Receive configuration

## Most important Go packages in my5Gcore

**Main package**

It's the entry point of the application. Basically, it just recover the command line parameters and invocate the _action_ function. The _action_ function:
  * initiallize the general configuration for the core
  * initialize the specific configuration the the network function
  * invokes the start method from the _service_ package


<p align="center">
    <img src="images/go-packages/demo1-exp1.png" height="300" alt="Go packages in my5Gcore"/> 
</p>

**Factory package**

**Context package**

**Service package**

**Producer package**

**Consumer package**

**Service-specific package**

**Requirements**

The installation can be done directly over the host operating system (OS) or inside a virtual machine (VM). System requirements:
* CPU type: x86-64 (specific model and number of cores only affect performance)
* RAM: 4 GB
* Disk space: 40 GB
* Ubuntu 18.04 LTS

**Steps**

Install python-minimal:
```
sudo apt update && apt -y install python-minimal
```

Install git:
```
sudo apt -y install git
```

Clone this repository:
```
git clone https://github.com/LABORA-INF-UFG/NetSoft2020-Tutorial4-Demo1-Exp1.git
```

Install Ansible:
```
sudo apt -y install ansible
```

Run the following Ansible playbook (password for sudo is required):
```
cd NetSoft2020-Tutorial4-Demo1-Exp1 && ansible-playbook -K Demo1Exp1.yml
```
Check if the containers are up:
```
sudo docker ps
```
The output should be similar to the following:
<p align="center">
    <img src="images/sudo_docker_ps.png"/> 
</p>

Done! The software is successfully installed.

## Tests

In order to make the tests, create two (command-line) terminals, one for the eNB and the other for the UE.