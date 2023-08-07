#!/bin/sh
. /etc/os-release

echo
echo "#############################################"
echo "######### Installing necessary pkgs #########"
echo "#############################################"
echo

echo $ID
echo

if [ $ID = "centos" ]; then
    sudo yum install docker
elif [ $ID = "ubuntu" ] || [ $ID = "debian" ] || [ $ID = "linuxmint" ]; then
    sudo apt-get install -y docker
elif [ $ID = "alpine" ]; then
    sudo apk add docker
elif [ $ID = "arch" ] || [ $ID = "endeavouros" ] || [ $ID = "arcolinux" ]; then
    sudo pacman -S --needed docker
else
    echo "########################################################################"   
    echo "WARNING: Unsupported linux distribution. Please install DOCKER manually."
    echo "########################################################################"
fi
echo
echo "##############################################"
echo "######### Give necessary permissions #########"
echo "##############################################"
echo
sudo chmod +x ./run.sh
echo
echo "#############################################"
echo "########### Installation finished ###########"
echo "#############################################"
echo
