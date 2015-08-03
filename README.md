# Altimeter-ANE
iOS ANE for the [CMAltimeter](https://developer.apple.com/library/prerelease/ios/documentation/CoreMotion/Reference/CMAltimeter_class/index.html#//apple_ref/occ/cl/CMAltimeter) class.

Usage:
```as3
import com.davikingcode.nativeExtensions.altimeter.Altimeter;
import com.davikingcode.nativeExtensions.altimeter.AltimeterEvent;

import flash.utils.setTimeout;

var altimeter:Altimeter = new Altimeter();

if (altimeter.isAvailable()) {

	altimeter.addEventListener(AltimeterEvent.AltitudeData, altimeterEvent);
	altimeter.addEventListener(AltimeterEvent.AltitudeError, altimeterEvent);
	
	altimeter.start();
	
	setTimeout(function():void {
		
		altimeter.stop();
		
	}, 10000);
}

function altimeterEvent(aEvt:AltimeterEvent):void {
			
	trace(aEvt.type, aEvt.informations);

	var data:Object = JSON.parse(aEvt.informations);
	trace(data.pressure);
	trace(data.relativeAltitude);
}
```

This ANE open source version has been sponsored by Paracam.
