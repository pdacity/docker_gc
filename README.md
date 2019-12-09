# Garbage collector for Docker Swarm

![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/pdacity/docker_gc?style=plastic)


## About 

Образ для автоматической очистки неиспользуемых обьектов в Docker Swarm (работает и просто как Docker Service )

По умолчанию удаляются следующие типы обьектов:
- container
- volume
- network

## Настройка 

Для работы необходимо задать 2 параметра в yml файле:
* AGE - срок в формате timestamp или Go duration strings (10m, 1h30m) после которого неиспользуемые ресурсы будут удалены
* SLEEP - периодичность проверки в формате timestamp или Go duration strings (10m, 1h30m)

## Запуск

* docker-stack.yml - для деплоя сервиса в  Docker swarm
* docker-compose.yml - для запуска Docker Service

