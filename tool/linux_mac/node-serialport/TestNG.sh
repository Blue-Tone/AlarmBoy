
D=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)
source $D/../_define.sh

node $D/SendSerial.js $COM $OK_OFF$NG_ON$NG_SOUND$ERR_OFF




