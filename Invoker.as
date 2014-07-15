package  {
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	
	public class Invoker {
		
		public static var onInvoke:Array = new Array();

		public function Invoker() {
			// constructor code
		}
		public static function invoke(func:Function, time:Number):void {
			var timer:Timer = new Timer(time);
			timer.addEventListener(TimerEvent.TIMER, function() {
									if (onInvoke.indexOf(func) >= 0) {
										func.call();
										onInvoke.splice(onInvoke.indexOf(func), 1);
									}
									timer.stop();
			});
			
			onInvoke.push(func);
			
			timer.start();
		}
		public static function isInvoking(func:Function):Boolean {
			if (onInvoke.indexOf(func) >= 0) {
				return true;
			} else {
				return false;
			}
		}
		
		public static function cancelInvoke(func:Function):void {
			if (Invoker.isInvoking(func)) {
				onInvoke.splice(onInvoke.indexOf(func), 1);
			}
		}

	}
	
}
