#!/bin/sh
echo off
# ---------------- MUST SETUP----------------
# Environment dependent Config. ä¬ã´àÀë∂ê›íË

# set NODE_PATH. for call node-serialport
#NODE_PATH=/home/yukio/.nvm/versions/node/v6.2.2/lib
#export NODE_PATH

# set arduino COM port number
COM=/dev/ttyUSB0
export COM

# set jenkins userID
USER=apiUser
export USER

# set jenkins userAPI token
API_TOKEN=2200a230d4748bf84a3688b8891ae997
export API_TOKEN


# -------------- define command -------------
THIS_DEFINE_PATH=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)
source $THIS_DEFINE_PATH/_definePin.sh

ERR_ON=$D2_ON
ERR_OFF=$D2__OFF
WARN_ON=$D3_ON
WARN_OFF=$D3__OFF
NG_ON=$D4_ON
NG_OFF=$D4__OFF
OK_ON=$D5_ON
OK_OFF=$D5__OFF
TESTING_ON=$D8_ON
TESTING_OFF=$D8__OFF
BUILD_ON=$D9_ON
BUILD_OFF=$D9__OFF
NG_SOUND=$A5_ON
OK_SOUND=$A5__OFF

