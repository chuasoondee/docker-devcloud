# Docker Cookbook
Goal is to automate creation of development environment.

## Environments
Each Dockerfile represent a dev server/component, which includes

## Building
You'll have to build a `base` image from any `centos` images available in docker index.
I've used `hansode/centos-6.5-x86_64`. To build

```shell
docker pull hansode/centos-6.5-x86_64
docker run -t -i hansode/centos-6.5-x86_64 /bin/bash
# within container
passwd          # change root password
yum update -y   # optionally update system
exit            # exit from container thereby stopping container process
# in host
docker commit -author="Your Name <your_name@your_email.com>" -m "initial images" <container id> base
```

With above "base" image available. Now you'll have to build "sdchua/base" which install neccessary
services, e.g. ssh-server, supervisord and etc.

I have wrote a convenient `dbuild` command to build docker images. To use `dbuild` command just
do
```shell
. start.sh
```

To build the "sdchua/base" image, `dbuild base`
To build the "sdchua/jenkins" image, `dbuild jenkins`

## Cookbook
1. Jenkins
2. SCM
3. Private Yum Repository
4. Maven Repository
5. Test Environment
6. Redmine Server
