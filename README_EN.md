# Garbage collector for Docker Swarm

![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/pdacity/docker_gc) 
![Docker stuff](https://img.shields.io/badge/%F0%9F%90%B3-useful%20stuff-lightgray) 
![PizzaWare](https://img.shields.io/badge/%F0%9F%8D%95-PizzaWare-orange) 
![Tea powered](https://img.shields.io/badge/%F0%9F%8D%B5-tea%20powered-yellowgreen)

## About 

Image for automatic removing unused Docker Swarm objects. Alos works just as Docker Service.

By default these types of objects are deleted:
- container
- volume
- network

## Configuration

Set config parameters in the yml file:
* AGE - the max time for resource to be unused (format: timestamp or Go duration strings (10m, 1h30m))
* SLEEP - the time frame between checking for unused objects (format: timestamp or Go duration strings (10m, 1h30m))
* STICKY_LABEL - do not remove image with this label

### Building image with `STICKY_LABEL`

If you need to protect an image from automatic deletion use LABEL directive, for example: `persistent_image=yes`. To do it just create Dockerfile for you image <IMAGENAME>.

```yaml
FROM <IMAGENAME>
LABEL persistent_image=yes
```

Before run the stack build the image from Dockerfile mentioned above:

docker-compose.yaml
```yaml
...
  <SERVICENAME>
    container_name: <CONTAINERNAME>
    build:
      context: .
...

```
* <IMAGENAME> - the image which is protected from automatic deletion
* <SERVICENAME> - service name in the stack
* <CONTAINERNAME> - container name (optionally)

Also you should set `STICKY_LABEL: persisten_image=yes` in the docker_gc run variables


## Run

* docker-stack.yml - to deploy the service in Docker Swarm
* docker-compose.yml - to run just a Docker Service

## GitHub

Prebuild docker image on hub.docker.com - https://hub.docker.com/r/pdacity/docker_gc

