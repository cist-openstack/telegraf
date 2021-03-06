#!/bin/bash

if [ ! -f /etc/ssh/ssh_host_dsa_key ]; then
  ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key -N ""
fi

if [ ! -f /etc/ssh/ssh_host_ecdsa_key ]; then
  ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N ""
fi

if [ ! -f /etc/ssh/ssh_host_dsa_key ]; then
  ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key -N ""
fi

if [ ! -f /etc/ssh/ssh_host_rsa_key ]; then
  ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ""
fi
