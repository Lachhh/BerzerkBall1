package com.homerun.screens {
	import com.lachhhEngine.games.Game;
	import com.lachhhEngine.games.MainGame;
	import com.lachhhEngine.games.animation.Animation;
	import com.lachhhEngine.games.animation.AnimationManager;
	import com.lachhhEngine.games.meta.MetaObject;
	import com.lachhhEngine.games.screens.Screen;
	import com.lachhhEngine.games.screens.ScreenManager;
	import com.lachhhEngine.initializers.VersionInfo;

	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.utils.getDefinitionByName;

	/*
	 * @author Simon Lachance
	 */
	public class BerzerkLogo extends Screen {
		private var _closed:Boolean = false;
		private var _nextScreen:int = -1;
		private var _sponsorVisual:MovieClip ;
		
		public function BerzerkLogo() {
			super();
			state = STATE_IDLE;
							
		}

		override public function Init(metaInfo:MetaObject, context:Game):void {
			super.Init(metaInfo, context);
			
			var w:int = 700;
			var h:int = 550;
			
			visual.graphics.beginFill(0xFFFFFF);
			visual.graphics.drawRect(0, 0, w, h);
			visual.graphics.endFill();
			
			if(VersionInfo.canHaveExternalLinks) {
				visual.addEventListener(MouseEvent.MOUSE_DOWN, VersionInfo.OnClickBerzerkSite);
				visual.buttonMode = true;
			}
			
			try {
				var mainClass:Class = Class(getDefinitionByName(GetVisualString()));
				if(mainClass) {
					_sponsorVisual = MovieClip(new mainClass());
					visual.addChild(_sponsorVisual);
					//_sponsorVisual.x = w/2;
					//_sponsorVisual.y = h/2;
					_sponsorVisual.scaleX = w/700;
					_sponsorVisual.scaleY = h/550;
				}
			} catch(e:Error) {
				
			}
		}

		override public function CreateVisual():Animation {
			return AnimationManager.instance.CreateAnimation(AnimationManager.factory.ID_EMPTY);
		}
		
		protected function GetVisualString():String {
			return "com.berzerkstudio.exported.BERZERK_LOGO";
		}
			
		private function Close():void {
			if(_closed) return; 
			_closed = true;
			if(_sponsorVisual != null) {
				_sponsorVisual.stop();
				visual.removeChild(_sponsorVisual);
			}
			ScreenManager.instance.RemoveScreen(this);			
		}
						
		override public function ShowIdle(context:MainGame):void {
			if(_sponsorVisual == null) {
				Close();
				return ;
			}
			if(_sponsorVisual.currentFrame >= _sponsorVisual.totalFrames-3) {
				Close();
			}
		}
		
		public function get nextScreen():int {
			return _nextScreen;
		}
		
		public function set nextScreen(nextScreen:int):void {
			_nextScreen = nextScreen;
		}

		override protected function get trackMetrics():Boolean {return false;}
	}
}
