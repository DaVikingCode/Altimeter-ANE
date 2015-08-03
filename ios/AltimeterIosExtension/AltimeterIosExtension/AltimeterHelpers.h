//
//  AltimeterHelpers.h
//  AltimeterIosExtension
//
//  Created by Aymeric Lamboley on 31/07/2015.
//  Copyright (c) 2015 Da Viking Code. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreMotion/CoreMotion.h>
#import "FlashRuntimeExtensions.h"

@interface AltimeterHelpers : NSObject {
    
    FREContext ctx;
    CMAltimeter *altimeter;
    NSOperationQueue *queue;
}

- (id) initWithContext:(FREContext) context;
- (void) start;
- (void) stop;
@end
