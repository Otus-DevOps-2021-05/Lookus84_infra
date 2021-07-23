#!/bin/bash
IMAGE_ID=$(yc compute image list | grep reddit-full | awk '{print $2}')
yc compute instance create \
 --name reddit-full \
 --hostname reddit-full \
 --memory=4 \
 --create-boot-disk name=reddit-full,image-id=$IMAGE_ID,size=10GB \
 --network-interface subnet-name=default-ru-central1-c,nat-ip-version=ipv4 \
 --metadata serial-port-enable=1 \
 --ssh-key ~/.ssh/id_rsa.pub
