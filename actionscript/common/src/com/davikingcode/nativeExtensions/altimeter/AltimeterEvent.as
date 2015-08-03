package com.davikingcode.nativeExtensions.altimeter {

	import flash.events.Event;

	public class AltimeterEvent extends Event {

		static public const AltitudeData:String = "AltitudeData";
		static public const AltitudeError:String = "AltitudeError";

		private var _informations:String;

		public function AltimeterEvent(type:String, informations:String, bubbles:Boolean = false, cancelable:Boolean = false) {
			super(type, bubbles, cancelable);

			_informations = informations;
		}

		public function get informations():String {

			return _informations;
		}
	}
}
