FROM ubuntu:22.04
ARG USER="ubuntu"
ARG UID="1000"
ARG GROUP="ubuntu"
ARG GID="1000"
ARG DOCKER_CONTAINER_NAME="ubuntu:22.04"


RUN useradd -m $USER && \
    usermod -u $UID $USER && \
    groupmod -g $GID $GROUP

RUN apt-get update && \
    apt-get install -y sudo locales && \
    locale-gen ja_JP.UTF-8

ENV LANG=ja_JP.UTF-8
ENV LANGUAGE=ja_JP:ja
ENV LC_ALL=ja_JP.UTF-8
ENV TZ=Asia/Tokyo

ARG USER_HOME="/home/$USER"
RUN mkdir -p $USER_HOME && \
    chown -R $UID:$GID $USER_HOME && \
    echo "$USER ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers

USER $USER
ENV HOME=$USER_HOME

WORKDIR $HOME

RUN sudo apt-get install -y git
RUN git clone https://www.github.com/asana17/devpc-configurations.git

RUN devpc-configurations/ubuntu/ubuntu_configuration.sh

RUN cat >> ~/.config/fish/config.fish <<EOF
if test -f /proc/self/cgroup && grep -q docker /proc/self/cgroup
    set -l container_id (cat /proc/self/cgroup | grep docker | head -n 1 | cut -d "/" -f 3 | cut -d "-" -f 1)
    if test -n "$container_id"
        set -gx DOCKER_CONTAINER_NAME $container_id
    end
end
EOF

RUN cat >> ~/.config/starship.toml <<EOF
[custom.docker]
command = "echo -n \"🐳 \" && echo $DOCKER_CONTAINER_NAME"
when = "test -n \"$DOCKER_CONTAINER_NAME\""
format = "[:$output]($style) "
style = "cyan bold"
EOF
