FROM ubuntu:22.10

WORKDIR /src

RUN apt-get -y update && apt-get -y install gcc-aarch64-linux-gnu qemu-system-arm gdb-multiarch virt-viewer wget make x11-xserver-utils && wget -P ~ git.io/.gdbinit

COPY . .

CMD make runQEMU