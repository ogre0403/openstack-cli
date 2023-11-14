# openstack-cli

## Usage


```bash
docker run -ti -v /root/.openstack --name=opsk-config     ogre0403/openstack-cli:alpine

docker run --name opsk-cli  -h opsk-cli  --rm -ti --volumes-from opsk-config     ogre0403/openstack-cli:alpine bash
```


```bash
$ docker run -ti --rm \
  -e OS_PASSWORD=P@ssw0rd                   \
  -e OS_USERNAME=admin                      \
  -e OS_AUTH_URL=https://1.2.3.4:5000       \
  -e OS_REGION_NAME=RegionOne               \
  -e OS_PROJECT_NAME=NCHC   \
  ogre0403/openstack-cli:alpine bash
```

