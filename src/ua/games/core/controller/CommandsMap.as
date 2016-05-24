package ua.games.core.controller 
{
	import flash.events.Event;
	import ua.games.core.IDestroy;
	import ua.games.core.IGameContext;
	import ua.games.core.controller.events.BaseGameEvent;
	/**
	 * Base implementation of ICommandsMap interface.
	 * @author Mihaylenko A.L.
	 */
	public class CommandsMap implements ICommandsMap 
	{
//////////PRIVATE VARIABLES		

		//Current game application context.
		private var _context:IGameContext;
		
		//Current map of a commands info.
		private var _commands:Vector.<CommandInfo>;
		
//////////		

		/**
		 * Default constructor.
		 */
		public function CommandsMap() { }
		
		/**
		 * Initialize command mapper.
		 * @param	context - Current game context.
		 */
		public final function init( context:IGameContext ):void
		{
			_context = context;
		}
		/**
		 * Map game context events to command.
		 * @param	eventType - Current event type( unique event type, for cast to a command )
		 * @param	cmdClass - Current class implementation of a ICommand interface.
		 * @param	gameEvent if use global game event, to cast all events in a handler to a ua.games.core.controller.events.BaseGameEvent
		 * @return result of operation.
		 */
		public final function registerEventToCommand( eventType:String, cmdClass:Class, executeOnes:Boolean=false ):Boolean
		{
			_filterMapEventType = eventType;
			
			if ( _commands.filter(filterMapByEventType, this ).length )
				return false;
				
				_context.addEventListener(eventType, context_gameEventsGlobal_Handler, false, 0, true);
		}
		
		/**
		 * Unregister current command from mapper.
		 * @param	eventType - Current game context event type.
		 * @return - result of operation.
		 */
		public final function unregisterEventCommand( eventType:String ):Boolean
		{
			_filterMapEventType = eventType;
			var currCommand:CommandInfo;
			
			for (var i:uint = 0; i < _commands.length; i++ )
			{
				currCommand = _commands[i];
				if ( currCommand.eventType == eventType )
				{
					_context.removeEventListener
					(
						eventType, 
						currCommand.useGameEvent
							?
							context_gameEventsGlobal_Handler
							:
							context_globalBaseEvents_Handler
					);
					_commands.splice(i, 1)[0].destroy();
					i--;
				}
			}
			
		}
		
		private var _filterMapEventType:String;
		private function filterMapByEventType( item:CommandInfo, index:int, vec:Vector.<CommandInfo> ):Boolean { }
		
		/**
		 * 
		 * @param	event
		 */
		private function context_gameEventsGlobal_Handler( event:Event ):void
		{

			_filterMapEventType = event.type;
			const fromGameEventData:Object = event is BaseGameEvent?( BaseGameEvent(event).data):null;
			_commands.filter(filterMapByEventType, this).map
			(
				function( item:CommandInfo, index:int, Vector.<CommandInfo>):void
				{
					item.execute(_context, fromGameEventData);
					if ( item.executeOnes )
						unregisterEventCommand(item.eventType);
				}
				,this
			);

		}
		
		/**
		 * 
		 * @param	event
		 */
		private function context_globalBaseEvents_Handler( event:Event ):void
		{
			
		}
	}
	
	class CommandInfo implements IDestroy
	{
		private var eventType:String;
		private var commandImpl:Class;
		private var cashedInstance:ICommand;
		private var useGameEvent:Boolean;
		private var executeOnes:Boolean;
		/**
		 * Try execute current command.
		 * @param	context - game context impl.
		 */
		private function execute( context:IGameContext, data:Object=null ):void
		{
			if (!cashedInstance)
				cashedInstance = new commandImpl();
				
			cashedInstance.execute( context, data );
		}
		/**
		 * Destroy allocated data.
		 */
		public final function destroy():void
		{
			if (cashedInstance)
			{
				cashedInstance.destroy();
				cashedInstance = null;
			}
			eventType = null;
			commandImpl = null;
		}
		
	}
}