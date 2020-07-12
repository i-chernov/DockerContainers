#!/bin/bash
echo "Запуск GitLab контейнера"

NAME="--name gitlab-main" # имя контейнера
# USER="--user ros" # имя пользователя
HOST="--hostname gitlab.home" # имя хоста
IMAGE="gitlab/gitlab-ce:latest" # образ

# -p|--publish [host port]:[image port] - проброс портов 
PORTS="--publish 8085:80" # Сайт http
PORTS+=" --publish 4443:443" # Сайт https
PORTS+=" --publish 22:22" # ssh

# --mount type=<volume|bind|tmpfs>,src=[host path],dst=[image path] - подключение папки к контейнеру
MOUNT_DIRS="--mount type=volume,src=gitlab-config,dst=/etc/gitlab" # Файлы конфигурации (docker volume create jenkins)
MOUNT_DIRS+=" --mount type=volume,src=gitlab-data,dst=/var/opt/gitlab" # Данные

# FLAGS="--ipc=host" # проброс процессов
# FLAGS+=" --network=host" # проброс сети в контейнер (открывает доступ ко всей сети)
# FLAGS+=" --rm" # удалить контейнер после завершения
# FLAGS+=" --interactive --tty" # интерактивная сессия
FLAGS+=" --detach" # запустить контейнер в фоновом режиме и вывести id
FLAGS+=" --env TERM=xterm-256color" # установить поддержку цветов в терминале
FLAGS+=" --security-opt label:disable" # отключить selinux для контейнера

docker run ${NAME} ${HOST} ${PORTS} ${MOUNT_DIRS} ${FLAGS} ${IMAGE}