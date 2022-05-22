FROM ubuntu

WORKDIR /src

RUN apt -y update && apt -y install gcc-aarch64-linux-gnu qemu-system-arm gdb-multiarch virt-viewer wget make x11-xserver-utils && wget -P ~ git.io/.gdbinit

COPY . .

CMD make runQEMU