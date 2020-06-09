# installHassIoOnBNPI
Bash Script for Installing a Docker on an armbian for Banana Pi
This is a Simple Script to Install Hassio or Hass.io (known as Homeassistant in old and Home-Assit in newerdays) on 
an armbian minimal-installation.

This Script installs docker and all nessesary Components an armbian Build 2020 06 01 
Software is provided as is.
Use is for non commercial use only

It shuld help people to use this kind of Opensource easily
time requirements for newbs   : 30 min
Time requirements for experts : 2 min +download, imaging, cloning, configuring


Okay lets start.
after you have installed a armbian for your device,
install git via api-get install git

clone the git via 
* "mkdir src"
* "git clone <latest version from the button above>"

and go to "src" folder.
* "cd src/<tab><tab> " # where <Tab> means the tab-button on keyboard for autofillment
  now you are on the Gitfolder and see this readme.md an another src-folder
  type "cd src"
  
you will find bash scripts.


do a "chmod +x installHassio.sh" to make it startable
requirement: your loged in user shuld be root or on sudoers group.

now start ". installHassio.sh"
or type "./installHassio.sh"

now follow the questions and answers from the script. now you have an autostarting Hassio on port 8123
in version 0.1 without https, but be patient i will work on it if it bothers me.

#########################################################################################################################

