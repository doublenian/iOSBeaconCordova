var exec = require('cordova/exec');
/**
 * Constructor
 */
function MyBeacon() {}

MyBeacon.prototype.getBeacons = function() {
  exec(function(result){
      // result handler
      alert(result);
    },
    function(error){
      // error handler
      alert("Error" + error);
    }, 
    "MyBeacon", 
    "getBeacons", 
    []
  );
}

var myBeacon = new MyBeacon();
module.exports = myBeacon;