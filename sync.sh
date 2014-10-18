#!/bin/bash

HELP="INFO\n
\t$0 - Synchronise source with destination on one of the NUCs via rsync.\n
USAGE\n
\t sync.sh [OPTION...] source destination\n
OPTIONS\n
\t -e \t Transfer to the NUC connected via ethernet (192.167.0.105, RAS15)\n\n
\t -u \t Specify the user to log in to the NUC as.\n\n
\t -y \t Skip the dry run. Only do this if you are SURE that everything is correct\n\n
\t -s \t Run silently. You will not be able to see rsync output.
\t -w \t Transfer to the NUC sitting on the robot via wlan (192.167.0.205, RAS25)"

RAS_ETH=192.168.0.105
RAS_WLAN=192.168.0.205

ESEL=0
WSEL=0
SKIP=0 # skip dry run?

while getopts "wehyu:" optname
do
    case "$optname" in
	"e")
	    ESEL=1
	    DEST_ADDR=$RAS_ETH
	    if [ $WSEL -eq 1 ]; then
		echo "Cannot use both -w and -e."
		exit
	    fi

            ;;
	"h")
	    echo -e $HELP
	    exit
	    ;;
	"u")
	    USER=$OPTARG
	    ;;
	"w")
	    WSEL=1
	    DEST_ADDR=$RAS_WLAN
	    if [ $ESEL -eq 1 ]; then
		echo "Cannot use both -w and -e."
		exit
	    fi
            ;;
	"y")
	    SKIP=1
	    ;;
	*)
	    echo -e $HELP
	    exit
	    ;;
    esac
done


if [ $(($ESEL + $WSEL)) -ne 1 ]; then
    echo "You need to use either the -w or -e switch."
    echo -e $HELP
    exit
fi

# Exit if not enough parameters were specified
if [ $# -lt 4 ]; then
    echo -e "You need to specify at least the user, source, and destination!\n"
    echo -e $HELP
    exit
fi


# shift params so that processed switches are ignored
shift $(($OPTIND - 1))
SOURCE=$1
DEST=$2

if [ $SKIP -eq 0 ]; then
    echo "---------- DRY RUN ----------"
    echo "Doing a dry run. Use this to make sure that the source and destination are correct, and that only the expected files are being changed."
    rsync -azvnP --delete $SOURCE $USER@$DEST_ADDR:$DEST
    echo -e "\nSource: $SOURCE"
    echo -e "Destination: $USER@$DEST_ADDR:$DEST\n"
    # confirm continuation or exit
    echo "Check that everything looks OK."
    while true; do
	read -p "Continue with sync? (y/n)" yn
	case $yn in
            [Yy]* ) break;;
            [Nn]* ) exit;;
            * ) echo "Please answer y or n.";;
	esac
    done
fi

echo "---------- REAL RUN ----------"
rsync -azvP --delete --backup --backup-dir="/backup/$(tr -s ' ' '_' <<< $(date))" --suffix="waught" $SOURCE $USER@$DEST_ADDR:$DEST
