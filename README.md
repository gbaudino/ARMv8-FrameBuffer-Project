# ARMv8 FrameBuffer Project

### Overview
This project wants to take us back to the nostalgic era of the arcade machines where we enjoyed each of their games without the best graphics. In this mini example, alluding to the work of past years (as a legacy) and the great game "Donkey Kong". We have created the animation where we turn on one of these machines, we want to start the game but it breaks and we can't use it anymore, its screen now flickers randomly for eternity.

### Code particularities
- [x] Code portability
- [x] Abstraction of dependencies
- [x] Code compatibility
- [x] Code reuse
- [x] Position independent code
- [x] Local/Global functions and variables
- [x] Code modularisation

### Complications and solutions
#### Portability, scalability and compatibility
One of the first problems we encountered during the production of the code was the fact that on some machines it ran and on others it didn't, that we were dependent on the machine being able to install the dependencies and that we were always getting files that we didn't want. After a couple of attempts, the solution that we found and proposed to use is the [dockerisation of our application](https://github.com/GBaudino/ARMv8-FrameBuffer-Project#alternative-1-neater) to give a greater portability, being able to use it on any device that can install docker, and independence of all the requirements for the operation of the project. However, we have left the possibility of doing it with the initial alternative of running the Makefile locally.

#### Overlapping registers
Some functions make use of some temporary registers which only make sense within that function. When in the beginning these were not saved before the execution of the function, it happened that a function f that called another function g inside it, could want to retain a temporary value x9 to make a decision or operation with it but g also used that register so the value was totally lost in the call to g. To solve this and any other overlapping what is done is a saving of the temporary registers to be used in the stack pointer, which are returned to their value prior to execution of the function just before returning to the place of the function call. This achieves an encapsulation and now the temporary variables are local to the function and only make sense there.

#### Monolithic structure
Having a single block of code in a file was very cumbersome when searching for something specific in it, and that is why we decided to do a total modularization of the code having in each file specific functions of the structure/figure in question, making the code much more reusable, readable and independent of the position. This was achieved by splitting the code into files that contain code that is reusable in other parts of the code and are related to each other. For this it is necessary that the functions that will be called from another file are of global type and those that are not, which are local/"static" functions in C, are not of this global type (See in the [screen.s file](https://github.com/GBaudino/ARMv8-FrameBuffer-Project/blob/main/source/screen.s) the functions screenPowerEffect and powerOnScreen).

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