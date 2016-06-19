
D=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)
source $D/../_define.sh

node $D/SendSerial.js $COM $NG_OFF$OK_ON$OK_SOUND$ERR_OFF



