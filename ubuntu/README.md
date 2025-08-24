# ubuntu-configurations

Read [ubuntu_configuration.md](./ubuntu_configuration.md) for more info.

## Bash script for automation

You can automatically install all settings with [ubuntu_configuration.sh](ubuntu_configuration.sh).

```
./ubuntu_configuration.sh
```

## GitHub codespaces

You can use [./setup.sh](./setup.sh) to set up your environment in GitHub codespaces.

```
./setup.sh
```

## Docker container

[./dockerfiles/Dockerfile](./dockerfiles/Dockerfile) can be used to create docker image with these configs.

This Dockerfile is based on `ubuntu:22.04.`

### Use Makefile to create Docker container

To build image and run container, do:

```
cd ./dockerfiles
make
```

or

```
make OPTS=--no-cache
```

To start shell in the container, do:

```
make docker-exec
```

To delete container, do:
```
make clean
```

To delete container and image, do:

```
make mrproper
```
