#cloud-config
yc compute instance create \
  --name reddit-app-hw4 \
  --hostname reddit-app-hw4 \
  --memory=4 \
  --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB \
  --network-interface subnet-name=default-ru-central1-c,nat-ip-version=ipv4 \
  --metadata serial-port-enable=1 \
  --metadata-from-file user-data=./hw4.yaml
