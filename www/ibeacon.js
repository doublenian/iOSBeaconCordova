cordova.define("org.doublenian.iBeacons", function(require, exports, module)
{
    var exec = require('cordova/exec');
    var iBeacons = {
               
    getBeacons:function (successCallback){
               
               exec(successCallback,
                    function () {
                    },
                    "CDViBeacon",
                    "getBeacons",
                    []
                    );
               }
               }
    module.exports = iBeacons;

               });