D=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)
source $D/_define.sh

# Build and Testing LED Off 
bash $D/node-serialport/BuildOff.sh
bash $D/node-serialport/TestingOff.sh

# output log api/xml
#curl -u $USER:$API_TOKEN $JOB_URL/$BUILD_NUMBER/api/xml

# check SUCCESS
curl -u $USER:$API_TOKEN $JOB_URL/$BUILD_NUMBER/api/xml | grep "<result>SUCCESS</result>"
SUCCESS=$?
echo SUCCESS=$SUCCESS

# check UNSTABLE
curl -u $USER:$API_TOKEN $JOB_URL/$BUILD_NUMBER/api/xml | grep "<result>UNSTABLE</result>"
UNSTABLE=$?
echo UNSTABLE=$UNSTABLE


if test $SUCCESS -eq 0 ; then
	# SUCCESS
	bash $D/node-serialport/TestOK.sh
else
	if test $UNSTABLE -eq 0 ; then
		# UNSTABLE
		bash $D/node-serialport/TestNG.sh
	else
		# FAILURE,ABORTED,NOT_BUILT
		bash $D/node-serialport/BuildFail.sh
	fi
fi


