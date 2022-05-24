FROM ubuntu:22.10

WORKDIR /src

RUN apt-get -y update && apt-get -y install gcc-aarch64-linux-gnu qemu-system-arm gdb-multiarch virt-viewer wget make x11-xserver-utils && wget --progress=dot:giga -P ~ git.io/.gdbinit && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY . .

CMD make runQEMU