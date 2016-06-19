
D=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)
source $D/../_define.sh

node $D/SendSerial.js $COM $ERR_OFF




