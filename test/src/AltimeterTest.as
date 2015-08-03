package {

	import com.davikingcode.nativeExtensions.altimeter.Altimeter;
	import com.davikingcode.nativeExtensions.altimeter.AltimeterEvent;

	import flash.display.Sprite;
	import flash.utils.setTimeout;

	/**
	 * @author Aymeric
	 */
	public class AltimeterTest extends Sprite {
		
		private var _altimeter:Altimeter;

		public function AltimeterTest() {
			
			_altimeter = new Altimeter();
			
			trace("Altimeter is available : " + _altimeter.isAvailable());
			
			if (_altimeter.isAvailable()) {

				_altimeter.addEventListener(AltimeterEvent.AltitudeData, _altimeterEvent);
				_altimeter.addEventListener(AltimeterEvent.AltitudeError, _altimeterEvent);
				
				_altimeter.start();
				
				setTimeout(function():void {
					
					_altimeter.stop();
					
				}, 10000);
			}
			
		}

		private function _altimeterEvent(aEvt:AltimeterEvent):void {
			
			trace(aEvt.type, aEvt.informations);
		}
	}
}
