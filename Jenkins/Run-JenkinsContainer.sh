#!/bin/bash
echo "Запуск Jenkins контейнера"

NAME="--name jenkins-main" # имя контейнера
# USER="--user ros" # имя пользователя
# HOST="--hostname jenkins-main" # имя хоста
IMAGE="jenkins/jenkins:lts" # образ

# -p|--publish [host port]:[image port] - проброс портов 
PORTS="--publish 8080:8080" # Сайт
PORTS+=" --publish 50000:50000" # Управление агентами

# -v|--volume [host path]:[image path]:[file mod] - подключение папки к контейнеру
SHARED_DIRS="--volume $configDir:/var/jenkins_home:Z" # Файлы конфигурации
SHARED_DIRS+=" --volume $HOME/Source:/var/source:roz" # Подключение всех устройств

# --mount type=<volume|bind|tmpfs>,src=[host path],dst=[image path] - подключение папки к контейнеру
MOUNT_DIRS="--mount type=volume,src=jenkins,dst=/var/jenkins_home" # Файлы конфигурации (docker volume create jenkins)
MOUNT_DIRS+=" --mount type=bind,src=$HOME/Source,dst=/source" # Код

# FLAGS="--ipc=host" # проброс процессов
# FLAGS+=" --network=host" # проброс сети в контейнер (открывает доступ ко всей сети)
# FLAGS+=" --rm" # удалить контейнер после завершения
# FLAGS+=" --interactive --tty" # интерактивная сессия
FLAGS+=" --detach" # запустить контейнер в фоновом режиме и вывести id
FLAGS+=" --env TERM=xterm-256color" # установить поддержку цветов в терминале
FLAGS+=" --security-opt label:disable" # отключить selinux для контейнера

docker run ${NAME} ${HOST} ${PORTS} ${MOUNT_DIRS} ${FLAGS} ${IMAGE}