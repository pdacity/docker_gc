# Garbage collector for Docker Swarm

![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/pdacity/docker_gc) 
![Docker stuff](https://img.shields.io/badge/%F0%9F%90%B3-useful%20stuff-lightgray) 
![PizzaWare](https://img.shields.io/badge/%F0%9F%8D%95-PizzaWare-orange) 
![Tea powered](https://img.shields.io/badge/%F0%9F%8D%B5-tea%20powered-yellowgreen)

## About 

Образ для автоматической очистки неиспользуемых обьектов в Docker Swarm (работает и просто как Docker Service )

По умолчанию удаляются следующие типы обьектов:
- container
- volume
- network

## Настройка 

Для работы необходимо задать параметры yml файле:

* AGE - срок в формате timestamp или Go duration strings (10m, 1h30m) после которого неиспользуемые ресурсы будут удалены
* SLEEP - периодичность проверки в формате timestamp или Go duration strings (10m, 1h30m)
* STICKY_LABEL = не удалять образа с этой меткой

## Запуск

* docker-stack.yml - для деплоя сервиса в  Docker swarm
* docker-compose.yml - для запуска Docker Service

## GitHub

Prebuild docker image on hub.docker.com - https://hub.docker.com/r/pdacity/docker_gc

