# ARMv8 FrameBuffer Project

## Installation

> **Warning**  
> This installation is implemented for archlinux based  distributions which install packages with their pacman manager.

These instructions will install git if necessary and clone the repository. Then, entering the folder, we give execution permissions to install and proceed to the installation.
```bash
sudo pacman -S -y --needed git && git clone https://github.com/GBaudino/ARMv8-FrameBuffer-Project
cd ARMv8-FrameBuffer-Project && chmod +x install.sh
./install.sh
```

> **Note**
> If your system is not archlinux based and you want to perform this installation, then you will need to find a way to install what is installed with it in the following commands and in the install.sh file.

## Usage
The follow command build, run and clean Docker container which runs the program

> **Note**
> By executing the run.sh file we are deleting the container at the end of its execution so as not to retain unnecessary containers.

```
./run.sh
```

