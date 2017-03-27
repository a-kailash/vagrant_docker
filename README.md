# Running various Docker versions on Centos7 x64 Vagrant Virtual Box VM

*Used on Mac OS X Sierra 10.12.3*

## Software Platforms version
1. Vagrant version 1.9.1
2. Virtual Box version 5.1.12


## Install Virtual Box Guest Additions plugin

The official Centos7 Vagrant Box does not come with virtualbox Guest Addtions installed.

There is a Vagrant Plugin however which will automatically do this for you.
Run command:
```
vagrant plugin install vagrant-vbguest
```


## Commands to run

```
vagrant up --no-provision

#If you want Docker 1.12
vagrant provision --provision-with docker1.12
#If you want Docker 1.13
vagrant provision --provision-with docker1.13

#Quick test to prove Docker works
vagrant ssh
docker run hello-world
```
