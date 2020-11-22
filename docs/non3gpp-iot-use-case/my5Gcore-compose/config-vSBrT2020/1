#!/bin/bash

#Configuração da rede pare teste do ping
ip link set lo up 
ip addr add  60.60.0.101 dev lo   
ip link set lo up


#Configuração de regras de reteamento
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE 

#Configuração tunel gtp
#ip link set dev upfgtp mtu 1500


#Rules for lorawan

echo "Finish run script !!!"
