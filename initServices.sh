echo
echo "#############################################"
echo "########## Init necessary services ##########"
echo "#############################################"
echo
sudo systemctl start docker.service && xhost +
echo
echo "#############################################"
echo "########### Installation finished ###########"
echo "#############################################"
echo