package com.homerun.ammo {
	import com.lachhhEngine.games.Game;
	import com.lachhhEngine.games.ammo.Ammo;
	import com.lachhhEngine.games.animation.Animation;
	import com.lachhhEngine.games.animation.AnimationManager;
	import com.lachhhEngine.games.meta.MetaObject;

	/**
	 * @author Lachhh
	 */
	public class HB_Ammo extends Ammo {
		private var _anim:Animation;
		
		override public function Init(metaObject : MetaObject, context : Game) : void {
			super.Init(metaObject, context);
			_anim = AnimationManager.instance.CreateAnimation(animId);
			animationContainer.addChild(_anim);
		}

		override public function Destroy() : void {
			super.Destroy();
			DestroyAnimation();
		}
		
		private function DestroyAnimation():void {
			if(_anim != null) {
				AnimationManager.instance.Destroy(_anim);
				_anim = null;
			}	
		}

		

		protected function get animId():int {
			return -1;
		}
		
		public function get anim() : Animation {
			return _anim;
		}
	}
}
