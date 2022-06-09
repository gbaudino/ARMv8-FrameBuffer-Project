#!/bin/sh
. /etc/os-release

echo
echo "#############################################"
echo "######### Installing necessary pkgs #########"
echo "#############################################"
echo

if [ $ID = "centos" ]; then
    sudo yum install docker xorg-xhost
elif [ $ID = "ubuntu" ] || [ $ID = "debian" ] || [ $ID = "mint" ]; then
    sudo apt-get install -y docker xorg-xhost
elif [ $ID = "alpine" ]; then
    sudo apk add docker xorg-xhost
elif [ $ID = "arch" ] || [ $ID = "endeavouros" ] || [ $ID = "arcolinux" ]; then
    sudo pacman -S --needed docker xorg-xhost
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