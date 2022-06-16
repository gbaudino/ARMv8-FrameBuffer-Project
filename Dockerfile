FROM ubuntu:latest

WORKDIR /src

RUN apt-get -y update && apt-get -y install gcc-aarch64-linux-gnu qemu-system-arm gdb-multiarch wget make x11-xserver-utils && wget -P ~ git.io/.gdbinit

COPY ./source .

CMD make runQEMU