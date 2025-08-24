IMAGE?=ubuntu-dev-image
CONTAINER?=ubuntu-dev
USER?=docker
OPT?=

.PHONY: all help clean mrproper ${IMAGE} ${CONTAINER} docker-exec
.SILENT: clean mrproper

all: .${CONTAINER}

help:
	@echo "Make the ubuntu container using Docker commands."
	@echo
	@echo "all - Run the ubuntu container, building the ubuntu-image"
	@echo "  if necessary. You can pass OPT='--no-cache' to build"
	@echo "  the image without cache."
	@echo "docker-exec - Enter the ubuntu container."
	@echo "clean - remove container."
	@echo "mrproper - remove container and image."


.${IMAGE}: Dockerfile
	docker build -t ${IMAGE} -f Dockerfile . ${OPT} \
		--build-arg UID=$(shell id -u) \
		--build-arg GID=${shell id -g} \
		${OPT}
	touch $@

${IMAGE}: .${IMAGE}

.${CONTAINER}: .${IMAGE}
	docker run -dit --net host -e DISPLAY=${DISPLAY} \
		-e TERM=xterm-256color \
		-v ${HOME}/.Xauthority:/home/${USER}/.Xauthority \
		--name ${CONTAINER} ${IMAGE}:latest
	touch $@

${CONTAINER}: .${CONTAINER}

docker-exec: .${CONTAINER}
	docker exec -it ${CONTAINER} /usr/bin/fish

clean:
	docker rm -f ${CONTAINER}
	$(RM) .${CONTAINER}

mrproper: clean
	docker rmi -f ${IMAGE}
	$(RM) .${IMAGE}
