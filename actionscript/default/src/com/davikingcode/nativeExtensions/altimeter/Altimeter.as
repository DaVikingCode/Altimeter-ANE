package com.davikingcode.nativeExtensions.altimeter {

	import flash.display.BitmapData;
	import flash.events.EventDispatcher;
	import flash.external.ExtensionContext;

	public class Altimeter extends EventDispatcher {

		private static var _instance:Altimeter;

		public static function getInstance():Altimeter {

			if (!_instance)
				_instance = new Altimeter();

			return _instance;
		}

		public function Altimeter() {

			if (_instance)
				throw new Error("Altimeter is already initialized.");

			_instance = this;
		}

		public function isAvailable():Boolean {

			return false;
		}

		public function start():void {

		}

		public function stop():void {

		}
	}
}