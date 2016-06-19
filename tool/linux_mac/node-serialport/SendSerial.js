	console.log('com=' + process.argv[2]);
	//console.log('msg=' + process.argv[3]);

var serialport = require("serialport");
var sp = new serialport.SerialPort( process.argv[2], {
	baudrate: 9600,
	dataBits:8,
	parity:'none',
	flowControl:false
});

sp.on("open", function () {
	console.log('open com');
	sp.write(process.argv[3]); 
	console.log('Sended ' + process.argv[3]); 
	setTimeout(function() {
		process.exit();
    }, 1000); 
});

// data from Serial port
sp.on('data', function(input) {
    console.log(input.toString());
});

