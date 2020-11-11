#!/bin/bash

cd `dirname $0`/ansible 
sudo ansible-playbook -i dev.inventory setupwebsite.yml

