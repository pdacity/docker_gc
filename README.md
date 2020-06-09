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

If you need to protect an image from automatic deletion use LABEL directive, for example: `persistent_image=true`. To do it just create Dockerfile for you image <IMAGENAME>.

```yaml
FROM <IMAGENAME>
LABEL persistent_image=true
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
* `<IMAGENAME>` - the image which is protected from automatic deletion
* `<SERVICENAME>` - service name in the stack
* `<CONTAINERNAME>` - container name (optionally)

Also you should set `STICKY_LABEL: persisten_image=true` in the docker_gc run variables

## Run

* docker-stack.yml - to deploy the service in Docker Swarm
* docker-compose.yml - to run just a Docker Service

## GitHub

Prebuild docker image on hub.docker.com - https://hub.docker.com/r/pdacity/docker_gc


---

# Сборщик мусора для Docker Swarm и Docker

![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/pdacity/docker_gc) 
![Docker stuff](https://img.shields.io/badge/%F0%9F%90%B3-useful%20stuff-lightgray) 
![PizzaWare](https://img.shields.io/badge/%F0%9F%8D%95-PizzaWare-orange) 
![Tea powered](https://img.shields.io/badge/%F0%9F%8D%B5-tea%20powered-yellowgreen)

## О проекте 

Образ для автоматической очистки неиспользуемых обьектов в Docker Swarm (работает и просто как Docker Service )

По умолчанию удаляются следующие типы обьектов:
- container
- volume
- network

## Настройка 

Для работы необходимо задать параметры yml файле:

* AGE - срок в формате timestamp или Go duration strings (10m, 1h30m) после которого неиспользуемые ресурсы будут удалены
* SLEEP - периодичность проверки в формате timestamp или Go duration strings (10m, 1h30m)
* STICKY_LABEL - не удалять образа с этой меткой

### Сборка образа с `STICKY_LABEL`

В случае если необходимо защитить какой либо из образов от автоматического удаления необходимо добавить к образу  `label`, например `persistent_image=true` Для этого создайте Dockerfile для образа `<IMAGENAME>`

```yaml
FROM <IMAGENAME>
LABEL persistent_image=true
```

При запуске стека необходимо собрать образ из приведенного выше  Dockerfile

docker-compose.yaml
```yaml
...
  <SERVICENAME>
    container_name: <CONTAINERNAME>
    build:
      context: .
...

```
где `<IMAGENAME>` - название образа который должен быть защищен от автоматического удаления, `<SERVICENAME>` - название сервиса в стеке, `<CONTAINERNAME>` имя контейнера (опционально)

И задайте `STICKY_LABEL: persistent_image=true` в переменных запуска docker_gc

## Запуск

* docker-stack.yml - для деплоя сервиса в  Docker swarm
* docker-compose.yml - для запуска Docker Service

## Docker Hub

Prebuild docker image on hub.docker.com - https://hub.docker.com/r/pdacity/docker_gc


--- 

References:
English version of the documentation - https://habr.com/en/users/AlexanderTyutin/
