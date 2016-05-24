package ua.games.core 
{
	import away3d.containers.View3D;
	import feathers.controls.StackScreenNavigator;
	import flash.events.EventDispatcher;
	import starling.utils.AssetManager;
	import ua.games.core.IGameContext;
	
	/**
	 * ...
	 * @author Mihaylenko A.L.
	 */
	public class GameContext extends EventDispatcher implements IGameContext 
	{
		
		public function GameContext() 
		{
			
		}
		/**
		 * Current ui screen navigator.
		 * At the top of renderer( 1) 3d scene, 2)screens navigator. )
		 */
		function get screenNavigator():StackScreenNavigator;
		
		/**
		 * Current starling asset manager instance.
		 */
		function get assetsManager():AssetManager;
		
		/**
		 * Current Away3d instance.
		 */
		function get away3d():View3D;
		
		/**
		 * Pause game context definition.
		 */
		function pause():void;
		
		/**
		 * Resume game context definition
		 */
		function resume():void;		
	}

}