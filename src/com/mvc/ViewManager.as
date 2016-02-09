package com.mvc {
	import com.player.PlayerView;
	import com.signal.Signaler;
	import com.signal.Signals;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	
	public class ViewManager {
		private var modelSignaler:Signaler;
		private var graphics:Sprite = new Sprite();
		private var player:PlayerView = new PlayerView();
		
		public function ViewManager(container:DisplayObjectContainer, modelSignaler:Signaler) {
			container.addChild(graphics);
			this.modelSignaler = modelSignaler;
			graphics.addChild(player.getGraphics());
			
			modelSignaler.awaitSignal(Signals.PLAYER_MOVEMENT, player.updatePosition);
		}
	}
}