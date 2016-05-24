package ua.games.core.controller 
{
	import ua.games.core.IGameContext;
	
	/**
	 * ...
	 * @author Mihaylenko A.L.
	 */
	public interface ICommandsMap 
	{
		/**
		 * Initialize command mapper.
		 * @param	context - Current game context.
		 */
		function init( context:IGameContext ):void;
		
		/**
		 * Map game context events to command.
		 * @param	eventType - Current event type( unique event type, for cast to a command )
		 * @param	cmdClass - Current class implementation of a ICommand interface.
		 * 
		 * @return result of operation.
		 */
		function registerEventToCommand( eventType:String, cmdClass:Class ):Boolean;
		
		/**
		 * Unregister current command from mapper.
		 * @param	eventType - Current game context event type.
		 * @return - result of operation.
		 */
		function unregisterEventCommand( eventType:String ):Boolean;
	}
}