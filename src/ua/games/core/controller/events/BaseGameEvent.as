package ua.games.core.controller.events 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Mihaylenko A.L.
	 */
	public class BaseGameEvent extends Event 
	{
		private var _data:Object;
		
		public function BaseGameEvent(type:String, data:Object = null, bubbles:Boolean = false, cancelable:Boolean = false) 
		{ 
			super(type, bubbles, cancelable);
			_data = data;
		} 
		
		public override function clone():Event 
		{ 
			return new BaseGameEvent(type, _data, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("BaseGameEvent", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
		public final function get data():Object { return _data; }
	}
}