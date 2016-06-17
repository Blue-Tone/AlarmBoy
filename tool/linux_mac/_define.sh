#!/bin/sh
echo off
# ---------------- MUST SETUP----------------
# Environment dependent Config. ä¬ã´àÀë∂ê›íË

# set NODE_PATH. for call node-serialport
#NODE_PATH=C:\Users\admin\AppData\Roaming\npm\node_modules

# set arduino COM port number
COM=5

# set jenkins userID
USER=apiUser

# set jenkins userAPI token
API_TOKEN=2200a230d4748bf84a3688b8891ae997


# -------------- define command -------------
D=`dirname $0`
source $D/_definePin.sh

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

