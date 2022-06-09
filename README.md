# ARMv8 FrameBuffer Project

## Alternative 1 (Neater)
> **Note**  
> In this alternative, all the requirements are automatically installed, compiled and the project is executed in an encapsulated form in a docker container for greater neatness and portability.
### Installation

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


### Usage
The follow command build, run and clean Docker container which runs the program

> **Note**  
> By executing the run.sh file we are deleting the container at the end of its execution so as not to retain unnecessary containers.

```
./run.sh
```

## Alternative 2

> **Note**  
> In this alternative, you must take care of installing the necessary dependencies for the project to work correctly.

### Usage
The following command automatically compiles all .s files and executes the project.

```
./make runQEMU
```

You can then run this other command if you want to delete all these build files created.

```
./make clean
```