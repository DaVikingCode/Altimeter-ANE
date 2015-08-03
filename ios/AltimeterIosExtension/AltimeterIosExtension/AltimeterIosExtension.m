//
//  AltimeterIosExtension.m
//  AltimeterIosExtension
//
//  Created by Aymeric Lamboley on 31/07/2015.
//  Copyright (c) 2015 Da Viking Code. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreMotion/CoreMotion.h>
#import "FlashRuntimeExtensions.h"
#import "AltimeterHelpers.h"

#define DEFINE_ANE_FUNCTION(fn) FREObject (fn)(FREContext context, void* functionData, uint32_t argc, FREObject argv[])
#define MAP_FUNCTION(fn, data) { (const uint8_t*)(#fn), (data), &(fn) }

AltimeterHelpers *altimeterHelpers;

FREObject toBOOLToFREObject(BOOL boolean)
{
    FREObject result;
    FRENewObjectFromBool(boolean, &result);
    return result;
}

DEFINE_ANE_FUNCTION(isAvailable) {
    
    return toBOOLToFREObject([CMAltimeter isRelativeAltitudeAvailable]);
}

DEFINE_ANE_FUNCTION(start) {
    
    if (!altimeterHelpers)
        altimeterHelpers = [[AltimeterHelpers alloc] initWithContext:context];
    
    [altimeterHelpers start];
    
    return NULL;
}

DEFINE_ANE_FUNCTION(stop) {
    
    [altimeterHelpers stop];
    
    return NULL;
}

void AltimeterContextInitializer(void* extData, const uint8_t* ctxType, FREContext ctx, uint32_t* numFunctionsToSet, const FRENamedFunction** functionsToSet) {
    
    static FRENamedFunction functionMap[] = {
        MAP_FUNCTION(isAvailable, NULL),
        MAP_FUNCTION(start, NULL),
        MAP_FUNCTION(stop, NULL)
    };
    
    *numFunctionsToSet = sizeof(functionMap) / sizeof(FRENamedFunction);
    *functionsToSet = functionMap;
}

void AltimeterContextFinalizer(FREContext ctx) {
    return;
}

void AltimeterExtensionInitializer(void** extDataToSet, FREContextInitializer* ctxInitializerToSet, FREContextFinalizer* ctxFinalizerToSet) {
    
    extDataToSet = NULL;
    *ctxInitializerToSet = &AltimeterContextInitializer;
    *ctxFinalizerToSet = &AltimeterContextFinalizer;
}

void AltimeterExtensionFinalizer() {
    return;
}