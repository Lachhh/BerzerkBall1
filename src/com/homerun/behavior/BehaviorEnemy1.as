package com.homerun.behavior {
	import com.homerun.actor.HB_Actor;
	import com.lachhhEngine.games.Game;
	import com.lachhhEngine.games.behaviors.Behavior;
	import com.lachhhEngine.games.behaviors.IControllable;
	import com.lachhhEngine.games.meta.MetaObject;

	/**
	 * @author Lachhh
	 */
	public class BehaviorEnemy1 extends Behavior {
		private var _gotoX:Number;
		private var _gotoY:Number;

		override public function Init(metaObject : MetaObject, context : Game) : void {
			super.Init(metaObject, context);
			_gotoX = metaBehavior.param[0];
			_gotoY = metaBehavior.param[1];
			if(isNaN(_gotoX)) _gotoX = 0 ;
			if(isNaN(_gotoY)) _gotoY = 0 ;			
		}

		override public function Control(context : Game, obj : IControllable) : void {
			super.Control(context, obj);
			var actor:HB_Actor = HB_Actor(obj);
			actor.handleMove.x = (_gotoX - actor.px)*0.01*context.speedManager.GetSpeed() ;
			actor.handleMove.y = (_gotoY - actor.py)*0.01*context.speedManager.GetSpeed() ;   
		}
	}
}
