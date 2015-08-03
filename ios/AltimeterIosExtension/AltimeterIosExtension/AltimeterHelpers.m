//
//  AltimeterHelpers.m
//  AltimeterIosExtension
//
//  Created by Aymeric Lamboley on 31/07/2015.
//  Copyright (c) 2015 Da Viking Code. All rights reserved.
//

#import "AltimeterHelpers.h"
#import "TypeConversion.h"

@implementation AltimeterHelpers

- (id) initWithContext:(FREContext) context {
    
    if (self = [super init]) {
        
        ctx = context;
        
        altimeter = [[CMAltimeter alloc] init];
        queue = [[NSOperationQueue alloc] init];
    }
    
    return self;
}

- (void) start {
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    
    [altimeter startRelativeAltitudeUpdatesToQueue:queue withHandler:^(CMAltitudeData *altitudeData, NSError *error) {
        
        if (!error) {
            
            [dic setObject:altitudeData.pressure forKey:@"pressure"];
            [dic setObject:altitudeData.relativeAltitude forKey:@"relativeAltitude"];
            
            NSString *JSONString = [TypeConversion ConvertNSDictionaryToJSONString:dic];
            
            [self dispatchEvent:@"AltitudeData" withParams:JSONString];
            
        } else
            [self dispatchEvent:@"AltitudeError" withParams:error.description];
    }];
}

- (void) stop {
    
    [altimeter stopRelativeAltitudeUpdates];
}

- (void) dispatchEvent:(NSString *) event withParams:(NSString * ) params {
    
    const uint8_t* par = (const uint8_t*) [params UTF8String];
    const uint8_t* evt = (const uint8_t*) [event UTF8String];
    
    FREDispatchStatusEventAsync(ctx, evt, par);
}

@end
