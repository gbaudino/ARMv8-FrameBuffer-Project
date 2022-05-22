echo
echo "#############################################"
echo "######### Installing necessary pkgs #########"
echo "#############################################"
echo
sudo pacman -S --needed docker xorg-xhost && sudo systemctl start docker.service && xhost +
sudo chmod +x ./run.sh
echo
echo "#########################################"
echo "######### Installation finished #########"
echo "#########################################"
echo