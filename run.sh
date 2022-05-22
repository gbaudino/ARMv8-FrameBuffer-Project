echo
echo '###############################'
echo '####### Running project #######'
echo '###############################'
echo
echo '#####################################'
echo '####### Building docker Image #######'
echo '#####################################'
echo
sudo docker build -t virtual .
echo
echo '########################################'
echo '####### Running docker container #######'
echo '########################################'
echo
sudo docker run -it -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --name qemuSim virtual
echo
echo '#########################################'
echo '####### Cleaning docker container #######'
echo '#########################################'
echo
sudo docker rm qemuSim