var serialport = require("serialport");
var sp = new serialport.SerialPort("COM" + process.argv[2], {
  baudrate: 9600,
  dataBits:8,
  parity:'none',
  flowControl:false
});

sp.on("open", function () {
 // console.log('open');
  //setTimeout(function() {
    sp.write(process.argv[3]); 
    //console.log('Sended msg'); 
	process.exit();
  //}, 1); 

});



