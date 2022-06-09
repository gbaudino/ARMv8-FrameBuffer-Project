# ARMv8 FrameBuffer Project

## Installation

> **Warning**  
> This installation is implemented for the linux distributions listed below, run the corresponding command according to your distribution or if not listed find out how to install git on your distribution.

These instructions will install git if necessary and clone the repository. Then, entering the folder, we give execution permissions to install and proceed to the installation.

```bash
# command for centos
sudo yum install git && git clone git://github.com/GBaudino/ARMv8-FrameBuffer-Project
# command for ubuntu based distributions
sudo apt-get install -y git && git clone git://github.com/GBaudino/ARMv8-FrameBuffer-Project
# command for alpine linux
sudo apk add git && git clone git://github.com/GBaudino/ARMv8-FrameBuffer-Project
# command for arch based distributions
sudo pacman -S -y --needed git && git clone https://github.com/GBaudino/ARMv8-FrameBuffer-Project

# finally execute this commands
cd ARMv8-FrameBuffer-Project && chmod +x install.sh
./install.sh
```

> **Note**  
> if your system is not listed and you want to perform this installation, then you will need to find a way to install [git](https://git-scm.com/downloads) and [docker](https://docs.docker.com/engine/install/) in your system. Finally activate docker and run the run.sh file.


## Usage
The follow command build, run and clean Docker container which runs the program

> **Note**  
> By executing the run.sh file we are deleting the container at the end of its execution so as not to retain unnecessary containers.


```
./run.sh
```
