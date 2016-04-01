#!/bin/bash -e

##
# Personal Laravel Development Setup
# Description: Opens Google Chrome, Virtual Box and Sublime Text. Changes into appropriate directories in iTerm tabs, ssh's into Homestead VM.
# Author: Spencer Putnam - @sgput
#
# Inspired by @ethicka script https://gist.github.com/ethicka/c1b71e258a88b8523b7f21f164656b88
#
# Additional thanks to Delicious Brains' @mattgrshaw for inspiration https://deliciousbrains.com/automating-local-wordpress-site-setup-scripts/?utm_source=Email+marketing+software&utm_medium=email&utm_campaign=weekly-article&utm_content=automating-local-wordpress-site-setup-scripts
#
# Dependencies: Laravel 5.2, Homestead, VirtualBox, Sublime Text, Google Chrome, iTerm
#
# Command: bash dev-setup-laravel.sh
##


# set variables
BLACK=$(tput setaf 0)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
LIME_YELLOW=$(tput setaf 190)
POWDER_BLUE=$(tput setaf 153)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
WHITE=$(tput setaf 7)
BRIGHT=$(tput bold)
NORMAL=$(tput sgr0)
REVERSE=$(tput smso)
UNDERLINE=$(tput smul)

# add a simple yes/no confirmation before we proceed
echo -n "Run Setup? [y/n] "
read run

# if the user didn't say no, then go ahead an install
if [ "$run" == n ] ; then
exit
else
echo "${CYAN}Beginning Laravel Development Setup...${NORMAL}"

# open VirtualBox
open -a VirtualBox
# open Sublime Text 3
open -a Sublime\ Text
# open Google Chrome
open -a Google\ Chrome

# re-activate iTerm window to observe echoed status
osascript -e 'tell application "iTerm" to activate'

# echo programs open and starting Homestead notice
echo "${LIME_YELLOW}programs now open"
echo "${CYAN}starting homestead VM ${NORMAL}"

# open Homestead folder and run Vagrant box
homestead up

# open local app in browser, Laravel documentation, Laracasts
echo "${CYAN}opening quickstart app and Larvavel in Chrome ${NORMAL}"
open http://quickstart.app # NOTE: update to applicable URL
open https://laravel.com/docs/5.2
open https://laracasts.com

# open new terminal tab and cd into local app directory
echo "${CYAN}opening new terminal tab ${NORMAL}"
osascript -e 'tell application "iTerm" to activate' -e 'tell application "System Events" to tell process "iTerm" to keystroke "t" using command down'

# echo confirm script has completed
echo "${CYAN}Alias in ~/.zshrc cd to home directory ${NORMAL}"

# echo confirm script has completed
echo "${CYAN}Laravel setup script has completed running ${NORMAL}"

# end of if statement if user enters "y"
fi
