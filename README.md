# Garbage collector for Docker Swarm

![Docker Automated build](https://img.shields.io/docker/automated/pdacity/docker_gc) 


## About 

Образ для автоматической очистки неиспользуемых обьектов в  Docker Swarm (работает и не в Swarm как Docker Service )

По умолчанию удаляются следующие типы обьектов:
- container
- volume
- network

## Настройка и запуск

Для работы необходимо задать 2 параметра в yml файле:
* AGE - срок в формате timestamp или Go duration strings (10m, 1h30m) после которого неиспользуемые ресурсы будут удалены
* SLEEP - периодичность проверки в формате timestamp или Go duration strings (10m, 1h30m)

docker-stack.yml] - для деплоя сервиса в  Docker swarm
docker-compose.yml - для запуска Docker Service

