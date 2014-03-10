//
//  CDViBeacon.h
//  HelloWorld
//
//  Created by gameconcourse on 14-3-5.
//
//
#import <Foundation/Foundation.h>
#import <Cordova/CDV.h>

#import <CoreLocation/CoreLocation.h>
#import <CoreBluetooth/CoreBluetooth.h>


@interface MyBeacon : CDVPlugin <CLLocationManagerDelegate>


-(void)pluginInitialize;
-(void)getBeacons:(CDVInvokedUrlCommand *)command;
@end
