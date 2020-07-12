#!/bin/bash
echo "-----------------Запуск GoCD контейнера-----------------"
# САЙТ: https://hub.docker.com/r/gocd/gocd-server

NAME="--name gocd-server" # имя контейнера
# USER="--user ros" # имя пользователя
# HOST="--hostname gitlab.home" # имя хоста
IMAGE="gocd/gocd-server:v20.5.0" # образ

# -p|--publish [host port]:[image port] - проброс портов 
PORTS="--publish 8153:8153" # Сайт http
# PORTS+=" --publish 22:22" # ssh

# --mount type=<volume|bind|tmpfs>,src=[host path],dst=[image path] - подключение папки к контейнеру
MOUNT_DIRS="--mount type=volume,src=gocd-godata,dst=/godata" # Файлы конфигурации (docker volume create gocd-godata)
MOUNT_DIRS+=" --mount type=volume,src=gocd-home,dst=/home/go" # Домашня папка

# FLAGS="--ipc=host" # проброс процессов
# FLAGS+=" --network=host" # проброс сети в контейнер (открывает доступ ко всей сети)
# FLAGS+=" --rm" # удалить контейнер после завершения
# FLAGS+=" --interactive --tty" # интерактивная сессия
FLAGS+=" --detach" # запустить контейнер в фоновом режиме и вывести id
FLAGS+=" --env TERM=xterm-256color" # установить поддержку цветов в терминале
# FLAGS+=" --security-opt label:disable" # отключить selinux для контейнера

docker run ${NAME} ${HOST} ${PORTS} ${MOUNT_DIRS} ${FLAGS} ${IMAGE}