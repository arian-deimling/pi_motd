#!/usr/bin/bash

SCRIPTS_DIR=/usr/share/pi_motd

# TODO(AD) - remove hardcoded value: https://unix.stackexchange.com/a/417223
export TERM=xterm-256color

if [ -z "$USER" ]
then
    # 3 lines below, source: https://superuser.com/questions/981897/trying-to-print-username-at-message-of-the-day-motd
    PPID1=`cat /proc/$PPID/status | grep PPid | awk '{ print $2 }'`
    PPID2=`cat /proc/$PPID1/status | grep PPid | awk '{ print $2 }'`
    USERNAME=`ps -x | grep $PPID2 | awk '{ print $6 }' |  sed "s/[[:digit:].-]//g"`
else
    USERNAME=$(id -u -n)
fi

echo ""
echo -n "$(tput bold)Welcome $(tput setaf 1)$USERNAME$(tput sgr0)$(tput setaf 2)@$(tput bold)$(tput setaf 1)$HOSTNAME$(tput sgr0)$(tput bold)!"
echo " It is currently $($SCRIPTS_DIR/datetime.sh).$(tput sgr0)"

echo ""
$SCRIPTS_DIR/logo.sh
echo ""

SPACING="    "

LABEL_SPACES=14

echo "$(tput bold)$(tput setaf 2)  S    $SPACING$(tput setaf 1)$(printf "%-${LABEL_SPACES}s" "OS:")$(tput sgr0)$($SCRIPTS_DIR/distro.sh)"
echo                "$(tput bold)       $SPACING$(tput setaf 1)$(printf "%-${LABEL_SPACES}s" "Kernel:")$(tput sgr0)$($SCRIPTS_DIR/kernel.sh)"
echo "$(tput bold)$(tput setaf 2)  Y   I$SPACING$(tput setaf 1)$(printf "%-${LABEL_SPACES}s" "Uptime:")$(tput sgr0)$($SCRIPTS_DIR/uptime.sh)"
echo                "$(tput bold)       $SPACING$(tput setaf 1)$(printf "%-${LABEL_SPACES}s" "Packages:")$(tput sgr0)$($SCRIPTS_DIR/pkgs.sh)"
echo "$(tput bold)$(tput setaf 2)  S   N$SPACING$(tput setaf 1)$(printf "%-${LABEL_SPACES}s" "Shell:")$(tput sgr0)$($SCRIPTS_DIR/shell.sh)"
echo                "$(tput bold)       $SPACING$(tput setaf 1)$(printf "%-${LABEL_SPACES}s" "Disk:")$(tput sgr0)$($SCRIPTS_DIR/disk.sh)"
echo "$(tput bold)$(tput setaf 2)  T   F$SPACING$(tput setaf 1)$(printf "%-${LABEL_SPACES}s" "CPU:")$(tput sgr0)$($SCRIPTS_DIR/cpu.sh)"
echo                "$(tput bold)       $SPACING$(tput setaf 1)$(printf "%-${LABEL_SPACES}s" "RAM:")$(tput sgr0)$($SCRIPTS_DIR/mem.sh)"
echo "$(tput bold)$(tput setaf 2)  E   O$SPACING$(tput setaf 1)$(printf "%-${LABEL_SPACES}s" "Temperature:")$(tput sgr0)$($SCRIPTS_DIR/cpu_temp.sh)"
echo                "$(tput bold)       $SPACING$(tput setaf 1)$(printf "%-${LABEL_SPACES}s" "Voltage:")$(tput sgr0)$($SCRIPTS_DIR/volts.sh)"
echo "$(tput bold)$(tput setaf 2)  M    $SPACING$(tput setaf 1)$(printf "%-${LABEL_SPACES}s" "IP Addresses:")$(tput sgr0)$(hostname -I)"
echo ""
