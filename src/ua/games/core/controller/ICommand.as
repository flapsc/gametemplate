package ua.games.core.controller 
{
	import ua.games.core.IDestroy;
	import ua.games.core.IGameContext;
	
	/**
	 * Base interface of a command
	 * @author Mihaylenko A.L.
	 */
	public interface ICommand extends IDestroy
	{
		/**
		 * Execute current command implementation.
		 * @param 
		 */
		function execute( context:IGameContext, data:Object = null ):void;
	}
	
}