FROM ubuntu:bionic

ARG USER_NAME
ARG USER_PASSWORD
ARG USER_ID
ARG USER_GID

# Настройка пользователя
RUN apt-get update && apt-get upgrade -y && apt-get install sudo apt-utils -y && \
useradd -ms /bin/bash ${USER_NAME} && \
usermod -aG sudo ${USER_NAME} && \
yes ${USER_PASSWORD} | passwd ${USER_NAME} && \
usermod -u ${USER_ID} ${USER_NAME} && \
groupmod -g ${USER_GID} ${USER_NAME} 

# Рабочая папка
WORKDIR /home/${USER_NAME}

# Копируем скрипты установки в образ
COPY scripts ./scripts
# Настройка окружения
RUN yes "Y" | scripts/setup.sh
# Установка ROS
ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn
RUN yes "Y" | scripts/install_ros.sh

# Устанавливаем собственником пользователя
RUN cd ${WORKDIR} && chown ${USER_NAME}:${USER_NAME} -R .

ENTRYPOINT [ "bash" ]

