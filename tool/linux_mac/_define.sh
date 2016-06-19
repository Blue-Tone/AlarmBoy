#!/bin/sh
echo off
# ---------------- MUST SETUP----------------
# Environment dependent Config. ä¬ã´àÀë∂ê›íË

# set NODE_PATH. for call node-serialport
#export NODE_HOME=/home/[username]/.nvm/versions/node/v6.2.2
export NODE_HOME=/usr/local/
export NODE_PATH=$NODE_HOME/lib/node_modules
export PATH=$NODE_HOME/bin:$PATH

# set arduino COM port number
#export COM=/dev/ttyUSB0
export COM=/dev/tty.wchusbserial1a1230

# set jenkins userID and API token
export USER=apiUser
#API_TOKEN=598b61b95ae3ea1951dd48e123c1c490
export API_TOKEN=801fb88b704e724b490f57341876a743

# -------------- define command -------------
THIS_DEFINE_PATH=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)
source $THIS_DEFINE_PATH/_definePin.sh

ERR_ON=$D2_ON
ERR_OFF=$D2_OFF
WARN_ON=$D3_ON
WARN_OFF=$D3_OFF
NG_ON=$D4_ON
NG_OFF=$D4_OFF
OK_ON=$D5_ON
OK_OFF=$D5_OFF
TESTING_ON=$D8_ON
TESTING_OFF=$D8_OFF
BUILD_ON=$D9_ON
BUILD_OFF=$D9_OFF
NG_SOUND=$A5_ON
OK_SOUND=$A5_OFF

