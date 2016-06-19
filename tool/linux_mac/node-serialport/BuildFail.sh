
D=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)
source $D/../_define.sh

node $D/SendSerial.js $COM $BUILD_OFF$TESTING_OFF$OK_OFF$NG_ON$ERR_ON$NG_SOUND

sleep 1s

# NG_SOUND again
node $D/SendSerial.js $COM $NG_SOUND

