
D=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)
source $D/../_define.sh

node $D/SendSerial.js $COM cdefghijt
sleep 2
node $D/SendSerial.js $COM CDEFGHIJT
sleep 2

