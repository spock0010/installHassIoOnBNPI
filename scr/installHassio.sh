#!/bin/bash
# installHassio.sh
# written by A.o.Schmidt alias spock0010
# under non commercial use / only private non commercial use open source license
# date of creation (see Github Stamp) orgin creation 06.02.2020
# all rights reserved
# you culd copy and use these script / software for personal purpose
# you are not allowed to use it for your commercial purpose (ask for an license!)
# you are able to fix errors in the script if you wuld inform me on issuse Tracker and send me the fix.
# 

case $1 in 
  "-h") 
  echo ' Help for installHassio.sh
  if you use the configs, the order for loading and overwriting is:
  # * internal-config # base Settings
  # * next for overloading is install.cfg
  # * next is overloading with  ?"g
  # * next is overloading with  commandline Parameters"
  # * next is overloading with  -h  is for help"
  # * 
  
  
  
  '
  exit 0;;
  
esac

installconfig="$pwdir/install.cfg"

#################################################################################################
# base initalisation Setting

# global variable-fields
containername="home-assist"

# and Home
# lets have a look if the configfile is available and if it is, lets load the saved Settings
if [ -f ${pwdir}/etc/settings.d/install.cfg ]
  then
    # datei existiert, also laden
    . ${pwdir}/etc/install.cfg    
fi


echo "Wellcome to the HassIO install Script for an Armbian" 
echo "this Script will Help you to Install Hassio/Hass.Io in an Docker Env on Armbian"
echo "maybe it works on other Linux Distributions as well, but no garanty"
echo "this Software / Script is Provided as is, maybe it makes a coffemashine out of your SOC or it will work for you"
read -p "continue ore abort (c/a):>" abort
case $abort in
  "a")
  "A")
  "abort")
  "Abort")
     echo "okay we will abort the process. are you feared ?"
     exit 1 ;;
  
  "c")
  "C")
  "continue")
  "Continue")
     echo "we will procede and continue to make a Coffe-Mashine ;) !";;
esac
sleep 5
echo "okay we are trying to make an Hassio-server on an armbian!"

#########################################################################################################
# only do changes if you are an developer or you know what you are doing

# simple single-functions for use as low-level-toolset
function getNameOfContainer(){

}

function check_requirements(){
   echo "now we will bring your Distro up to date to use all nessesary packages"
   apt-get update # update sources
   apt-get upgrade # upgrade packages
   apt-get dist-upgrade # upgrade Distro and Packages


}
  
function install_docker(){
   echo "Lets Try to install Docker on Armbian"
   check_requirements
   apt-get install docker-ce
}
function install_HassioInDocker(){
    echo "lets Try to install HomeAssistant latest stable docker container on local machine"
    docker run --init -d --name="$containername" -e "TZ=Europe/Berlin" -v /home/hassio:/config -p 8123:8123 homeassistant/home-assistant:stable

}
function start_HassioContainer(){
   docker container start ${containername}

}

function stop_HassioContainer(){
    docker container kill ${containername}
    install_HassioInDocker
    
}
function rebuildContainer(){
     stop_HassioContainer
     docker container rm ${containername}
     install_HassioInDocker
     
}
function saveConfig(){
echo "" ${installconfig}
}
####################################################################################
# simple methodes
# for doing work with functions
function mInstall(){
getNameOfContainer
install_docker
install_HassioInDocker
start_HassioContainer

}

####################################################################################
# simple Logic

case $1 in

install) 
*)
mInstall ;;

esac

