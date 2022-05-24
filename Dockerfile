FROM ubuntu:latest

WORKDIR /src

RUN apt-get -y update && apt -y install gcc-aarch64-linux-gnu qemu-system-arm gdb-multiarch virt-viewer wget make x11-xserver-utils && wget --progress=dot:giga -P ~ git.io/.gdbinit

COPY . .

CMD make runQEMU