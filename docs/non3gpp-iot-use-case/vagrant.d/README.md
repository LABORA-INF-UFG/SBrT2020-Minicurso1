# Vagrantbox for free5gc-compose

## Prerequisites

### Vagrant

You can install vagrant by following the steps provided here: https://www.vagrantup.com/docs/installation/

### Virtualbox

Please update the provider in the `Vagrantfile` with your favorite one.

For the Virtualbox provider you need to install virtualbox on your machine. Please follow install steps here: https://www.virtualbox.org/wiki/Linux_Downloads


### Vagrant additional plugins

Once vagrant is installed, you need to add this plugin. It is needed for reloading automatically the box (for kernel upgrade).

```console
$ vagrant plugin install vagrant-reload
```

## Update

Please update the RAM and CPU values found in `Vagrantfile` to best fit you system configuration.

```console
vb.memory = <memory in KB>
vb.cpus = <number of cpus>
```
