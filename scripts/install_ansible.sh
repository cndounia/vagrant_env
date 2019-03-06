#!/bin/bash

if [ ! -f /root/.ansible_installed ]; then
  echo "Installing Ansible ..."
  sudo apt-get update
  sudo apt-get install -y software-properties-common
  sudo apt-add-repository -y ppa:ansible/ansible
  sudo apt-get update
  sudo apt-get install ansible -y

  echo "Installing Python dependencies ..."
  sudo apt-get install python-pip -y
  sudo pip install docker-py

  touch /root/.ansible_installed
  sudo apt-get autoremove --purge -y && sudo apt-get autoclean
fi
