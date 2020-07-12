#!/bin/bash
echo "Запуск Nginx контейнера"

NAME="--name nginx-test" # имя контейнера
# USER="--user ros" # имя пользователя
# HOST="--hostname jenkins-main" # имя хоста
IMAGE="nginx:stable-alpine" # образ

# -p|--publish [host port]:[image port] - проброс портов 
PORTS="--publish 8888:80" # http

# --mount type=<volume|bind|tmpfs>,src=[host path],dst=[image path] - подключение папки к контейнеру
MOUNT_DIRS="--mount type=volume,src=nginx-web,dst=/usr/share/nginx/html,readonly" # Файлы конфигурации (docker volume create jenkins)

# FLAGS="--ipc=host" # проброс процессов
# FLAGS+=" --network=host" # проброс сети в контейнер (открывает доступ ко всей сети)
# FLAGS+=" --rm" # удалить контейнер после завершения
# FLAGS+=" --interactive --tty" # интерактивная сессия
FLAGS+=" --detach" # запустить контейнер в фоновом режиме и вывести id
FLAGS+=" --env TERM=xterm-256color" # установить поддержку цветов в терминале
# FLAGS+=" --security-opt label:disable" # отключить selinux для контейнера

docker run ${NAME} ${HOST} ${PORTS} ${MOUNT_DIRS} ${FLAGS} ${IMAGE}