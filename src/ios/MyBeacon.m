//
//  MyBeacon.m
//  HelloWorld
//
//  Created by gameconcourse on 14-3-5.
//
//

#import "MyBeacon.h"

static NSString * const kUUID = @"E2C56DB5-DFFB-48D2-B060-D0F5A71096E0";
static NSString * const kIdentifier = @"SomeIdentifier";

@interface MyBeacon ()
@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) CLBeaconRegion *beaconRegion;
//@property NSArray *detectedBeacons;
@property int detectedCount;

@end


@implementation MyBeacon


-(void)pluginInitialize
{
    NSUUID *proximityUUID = [[NSUUID alloc] initWithUUIDString:kUUID];
    self.beaconRegion = [[CLBeaconRegion alloc] initWithProximityUUID:proximityUUID identifier:kIdentifier];
    if (!self.locationManager) {
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
    }
    //self.detectedBeacons = [NSArray array];
    self.detectedCount = 0;
  
    
    
    [self.locationManager startRangingBeaconsInRegion:self.beaconRegion];
    
}



-(void)getBeacons:(CDVInvokedUrlCommand *)command
{
   // NSArray* output = [NSArray array];
   // NSDictionary* output;
    int output = self.detectedCount;
    
    /*
    if([self.detectedBeacons count] > 0)
    {
        //convert list of beacons to a an array of simple property-value objects
        for (CLBeacon *bt in self.detectedBeacons) {
           
            
        }
    }*/
    
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:output];
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];


}


- (void)locationManager:(CLLocationManager *)manager didRangeBeacons:(NSArray *)beacons inRegion:(CLBeaconRegion *)region
{
    //self.detectedBeacons = beacons;
    self.detectedCount = [beacons count];
    if([beacons count ] > 0)
    {
        NSLog(@"...RangeBeacons Count is:%d...",[beacons count]);
        
        for(CLBeacon *bt in beacons)
        {
            NSLog(@"detected Beacon %@,+++RSSI:%d",bt.minor,bt.rssi);
            
            
            
        }
    }
    
    
    
}



@end
