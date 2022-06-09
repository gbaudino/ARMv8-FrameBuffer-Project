echo
echo '###############################'
echo '####### Running project #######'
echo '###############################'
echo
bash ./initServices.sh
echo
echo '#####################################'
echo '####### Building docker Image #######'
echo '#####################################'
echo
sudo docker build -t qemu .
echo
echo '########################################'
echo '####### Running docker container #######'
echo '########################################'
echo
sudo docker run -it -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --name qemuSim qemu
echo
echo '#########################################'
echo '####### Cleaning docker container #######'
echo '#########################################'
echo
sudo docker rm qemuSim