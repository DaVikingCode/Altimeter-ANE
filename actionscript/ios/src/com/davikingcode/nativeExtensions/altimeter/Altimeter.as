package com.davikingcode.nativeExtensions.altimeter {

	import flash.events.EventDispatcher;
	import flash.events.StatusEvent;
	import flash.external.ExtensionContext;

	public class Altimeter extends EventDispatcher {

		private static var _instance:Altimeter;

		public var extensionContext:ExtensionContext;

		public static function getInstance():Altimeter {

			if (!_instance)
				_instance = new Altimeter();

			return _instance;
		}

		public function Altimeter() {

			if (_instance)
				throw new Error("Altimeter is already initialized.");

			_instance = this;

			extensionContext = ExtensionContext.createExtensionContext("com.davikingcode.nativeExtensions.Altimeter", null);

			if (!extensionContext)
				throw new Error("Altimeter native extension is not supported on this platform.");

			extensionContext.addEventListener(StatusEvent.STATUS, _onStatus);
		}

		private function _onStatus(sEvt:StatusEvent):void {

			dispatchEvent(new AltimeterEvent(sEvt.code, sEvt.level));
		}

		public function isAvailable():Boolean {

			return extensionContext.call("isAvailable");
		}

		public function start():void {

			extensionContext.call("start");
		}

		public function stop():void {

			extensionContext.call("stop");
		}

	}
}