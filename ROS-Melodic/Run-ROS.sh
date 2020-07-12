#!/bin/bash

NAME="--name test-ros" # имя контейнера
USER="--user ros" # имя пользователя
HOST="--hostname MELODIC-IMAGE" # имя хоста
IMAGE="ros-melodic" # образ

# -e|--env - установить переменную окружения
# -v|--volume [host path]:[image path]:[file mod] - подключение папки к контейнеру
GUI="--env DISPLAY --env QT_X11_NO_MITSHM=1 --volume /tmp/.X11-unix/:/tmp/.X11-unix/:rw"

SHARED_DIRS="--privileged --volume /dev/bus/usb/:/dev/bus/usb/" # Подключение usb устройств
SHARED_DIRS+=" --volume /dev:/dev" # Подключение всех устройств
SHARED_DIRS+=" --volume /home/igor/Documents/Source/Ros:/home/ros/catkin_ws" # Подключение рабочей дериктории

FLAGS="--ipc=host" # проброс процессов
FLAGS+=" --network=host" # проброс сети в контейнер
FLAGS+=" --rm" # удалить контейнер после завершения
FLAGS+=" --interactive --tty" # интерактивная сессия
FLAGS+=" --env TERM=xterm-256color" # установить поддержку цветов в терминале

# +name — Добавляет «name» (название IP или хостнейма) в список тех, кто имеет право подключаться к X-серверу.
# local:root — Разрешить запуск графических программ от имени root на локальной машине
# -name — Удаляет «name» (название IP или хостнейма) из списка тех, кто имеет право подключаться к X-серверу.
xhost +local:root
docker run ${NAME} ${USER} ${HOST} ${GUI} ${SHARED_DIRS} ${FLAGS} ${IMAGE}
xhost -local:root