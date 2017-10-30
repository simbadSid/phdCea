#!/bin/bash



#-----------------------------------------------------------------------------------------------------------
# --------------------------------------- UI parameters ----------------------------------------------------
#-----------------------------------------------------------------------------------------------------------
HEIGHT=25
WIDTH=100
CHOICE_HEIGHT=15
BACKTITLE="Backtitle here"
TITLE="Title here"
MENU="Choose one of the following options:"
DIRS_TO_COMPILE=""
OPTIONS=()
CHOICE=""


#-----------------------------------------------------------------------------------------------------------
# --------------------------------------- Auxiliary functions ----------------------------------------------
#-----------------------------------------------------------------------------------------------------------
function scanDir
{
	# Scan the directory looking for directories to compile
	counter=0
	for file in `ls -d ./*/`;
	do
		OPTIONS+=("$counter")
		OPTIONS+=("$file")
		counter=$((counter + 1))
	done;
}


function getUserChoice
{
	# Print the list of possible choices
	CHOICE=$(dialog --clear \
		        --backtitle "$BACKTITLE" \
		        --title "$TITLE" \
		        --menu "$MENU" \
		        $HEIGHT $WIDTH $CHOICE_HEIGHT \
		        "${OPTIONS[@]}" \
		        2>&1 >/dev/tty)
	clear
}


#-----------------------------------------------------------------------------------------------------------
# --------------------------------------- Main functions ----------------------------------------------
#-----------------------------------------------------------------------------------------------------------
scanDir
getUserChoice
#Print user choice
if [ ! ${CHOICE} ];
then
	exit
fi

CHOICE=$((CHOICE * 2)); CHOICE=$((CHOICE + 1))
CHOICE=${OPTIONS[ ${CHOICE} ]}
echo $CHOICE

