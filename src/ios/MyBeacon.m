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
@property NSArray *detectedBeacons;



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
    
  
    
    
    [self.locationManager startRangingBeaconsInRegion:self.beaconRegion];
    
}



-(void)getBeacons:(CDVInvokedUrlCommand *)command
{
    
    [self.commandDelegate runInBackground:^{
        NSMutableArray* output = [NSMutableArray array];
        
      //  NSLog(@"...output Beacons Count is:%d...",[output count]);
        
        if([self.detectedBeacons count] > 0)
        {
            //convert list of beacons to a an array of simple property-value objects
         //     NSLog(@"...detected Beacons Count is:%d...",[self.detectedBeacons count]);
            
            
            for (CLBeacon *beacon in self.detectedBeacons) {
                [output addObject:[self beaconToDictionary:beacon]];
            }
            
             NSLog(@"...Output Count is:%d...",[output count]);
        }
        
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsArray:output];
        
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];

}


- (NSMutableDictionary*)beaconToDictionary:(CLBeacon *)beacon
{
    NSMutableDictionary* props = [NSMutableDictionary dictionaryWithCapacity:3];
    NSNumber* major = beacon.major;
    NSNumber* minor = beacon.minor;
    NSNumber* rssi = [NSNumber numberWithInt:beacon.rssi];
    /*
    
    if(major == nil) {
        major = beacon.major;
    }
    if(minor == nil) {
        minor = beacon.minor;
    }
    if(rssi == nil) {
        rssi = [NSNumber numberWithInt:beacon.rssi];
    }
     */
    
    [props setValue:major forKey:@"major"];
    [props setValue:minor forKey:@"minor"];
    [props setValue:rssi forKey:@"rssi"];
 
    

   /*
    if(beacon != nil) {
        [props setValue:beacon.distance forKey:@"distance"];
        [props setValue:[NSNumber numberWithInt:beacon.proximity] forKey:@"proximity"];
        
        if(beacon.proximityUUID != nil) {
            [props setValue:beacon.proximityUUID.UUIDString forKey:@"proximityUUID"];
        }
    }
    */
    
    
    return props;
}


- (void)locationManager:(CLLocationManager *)manager didRangeBeacons:(NSArray *)beacons inRegion:(CLBeaconRegion *)region
{
    //self.detectedBeacons = beacons;
  
  
       // NSLog(@"...RangeBeacons Count is:%d...",[beacons count]);
        self.detectedBeacons = beacons;
        
    
    
    
    
}



@end
