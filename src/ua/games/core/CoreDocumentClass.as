package ua.games.core 
{
	import flash.display.Sprite;
	
	/**
	 * Core document class,
	 * please extend for enjoy you game extension.
	 * @author Mihaylenko A.L.
	 */
	public class CoreDocumentClass extends Sprite 
	{
		/**
		 * The default 
		 * Constructor.
		 */
		public function CoreDocumentClass() { }
		
		
		private function init():void
		{
			
		}
		
		
		protected function initializeComplete():void
		{
			
		}
		
		/**
		 * Ovveride fabric method, 
		 * for extend the IGameContext api implementation.
		 * @return Instance implementation of IGameContext
		 */
		protected function createGameContext():IGameContext { return null; }
		
	}
}