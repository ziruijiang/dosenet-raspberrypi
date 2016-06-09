#! /bin/bash
# system-update.sh
#
# This is a place where we can put system update scripting.
# E.g. modify system files.
# It gets run from git-pull-reboot.sh, AFTER git pull and BEFORE reboot.
#
# One input argument: stationID as a string

# If an update is only to be run once,
#  it should check that it has not been run yet!

# Make sure you check exit codes for whether the update actually worked.
# if [ $? -eq 0]; then echo "successful"; else echo "failed"; fi

LOGTAG=dosenet

case $1 in
  "10005")
    echo "This is station #10005"
    # commands for station 10005 to run

    ;;
  "7")
    #--------------------------------------------------------------------------
    # BEGIN Foothill system update: put eth0 on static IP
    #--------------------------------------------------------------------------
    echo "Foothill College: checking static IP"
    # check for update already happening
    OLD_INTERFACES="/etc/network/interfaces_OLD"
    UPDATE_LOG="/home/pi/foothill_update.log"
    if [ -f $OLD_INTERFACES ]; then
      echo "Found $OLD_INTERFACES so static IP update was already performed"
    elif [ -f $UPDATE_LOG ]; then
      echo "Found $UPDATE_LOG so static IP update was already performed"
    else
      echo "Did not find $OLD_INTERFACES or $UPDATE_LOG ! Performing update"
      NEW_INTERFACES="/home/pi/dosenet-raspberrypi/interfaces_foothill_new"
      REAL_INTERFACES="/etc/network/interfaces"

      echo "" >> $UPDATE_LOG
      echo "Attempting Foothill College network update" >> $UPDATE_LOG
      date >> $UPDATE_LOG
      echo  "> sudo cp $REAL_INTERFACES $OLD_INTERFACES" >> $UPDATE_LOG
      sudo cp $REAL_INTERFACES $OLD_INTERFACES
      echo "exit status $?" >> $UPDATE_LOG

      echo "> sudo cp $NEW_INTERFACES $REAL_INTERFACES" >> $UPDATE_LOG
      sudo cp $NEW_INTERFACES $REAL_INTERFACES
      echo "exit status $?" >> $UPDATE_LOG
      date >> $UPDATE_LOG
      echo "Foothill College network update complete!" >> $UPDATE_LOG
    fi
    #--------------------------------------------------------------------------
    # END Foothill system update: put eth0 on static IP
    #--------------------------------------------------------------------------
    ;;
  *)
    # commands for all stations besides 10005 to run
    :
    ;;
esac

# commands for every station to run

#--------------------------------------------------------------------------
# BEGIN system update: git config user.email, user.name to enable git stash
#--------------------------------------------------------------------------
DOSENETPATH=/home/pi/dosenet-raspberrypi
cd $DOSENETPATH

GIT_EMAIL="dosenet.pi@radwatch.berkeley.edu"
GIT_NAME="Anonymous Pi"
CUR_GIT_EMAIL=$(git config --get user.email)
CUR_GIT_NAME=$(git config --get user.name)

if [ ! "$CUR_GIT_EMAIL" = "$GIT_EMAIL" ]; then
  git config user.email "$GIT_EMAIL"
  if [ $? -eq 0 ]; then
    logger --stderr --id --tag $LOGTAG "Successfully updated git user.email"
  else
    logger --stderr --id --tag $LOGTAG "Failed to update git user.email!"
  fi
fi
if [ ! "$CUR_GIT_NAME" = "$GIT_NAME" ]; then
  git config user.name "$GIT_NAME"
  if [ $? -eq 0 ]; then
    logger --stderr --id --tag $LOGTAG "Successfully updated git user.name"
  else
    logger --stderr --id --tag $LOGTAG "Failed to update git user.name!"
  fi
fi
#--------------------------------------------------------------------------
# END system update: git config user.email, user.name to enable git stash
#--------------------------------------------------------------------------