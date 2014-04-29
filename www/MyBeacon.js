cordova.define("org.doublenian.mybeacon.MyBeacon", function(require, exports, module) { var exec = require('cordova/exec');
/**
 * Constructor
 */
 function MyBeacon() {}
             
  MyBeacon.prototype.getBeacons = function(sucess,error) {
          exec(sucess,
                    error,
                    "MyBeacon",
                    "getBeacons",
                    []
                    );
           }
               
   var myBeacon = new MyBeacon();
   module.exports = myBeacon;
   });
