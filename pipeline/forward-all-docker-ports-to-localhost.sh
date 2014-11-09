#!/bin/bash

VBoxManage modifyvm "boot2docker-vm" --natpf1 "tcp-port8080,tcp,,8080,,8080"
VBoxManage modifyvm "boot2docker-vm" --natpf1 "tcp-port8081,tcp,,8081,,8081"
VBoxManage modifyvm "boot2docker-vm" --natpf1 "tcp-port9000,tcp,,9000,,9000"
VBoxManage modifyvm "boot2docker-vm" --natpf1 "tcp-port5000,tcp,,5000,,5000"

for i in {49000..49900}; do
 VBoxManage modifyvm "boot2docker-vm" --natpf1 "tcp-port$i,tcp,,$i,,$i";
 VBoxManage modifyvm "boot2docker-vm" --natpf1 "udp-port$i,udp,,$i,,$i";
done