package com.homerun.meta {
	import com.lachhhEngine.games.Game;
	import com.lachhhEngine.games.meta.MetaObject;
	import com.lachhhEngine.utils.Utils;

	/**
	 * @author Lachhh
	 */
	public class MetaHBGeek extends MetaHBActor{
		private var _animIdleId:int = -1;
		private var _animWalkId:int = -1;
		private var _animAirIdle:Array  = new Array();
		private var _animLanded:int = -1;
		private var _animFlyId:int = -1;
		

		override public function Init(metaObject : MetaObject, context : Game) : void {
			super.Init(metaObject, context);
			_animIdleId = -1;
			Utils.ClearArray(_animAirIdle);
			_animLanded = -1;
			_animFlyId = -1; 	
			_animWalkId = -1;
		}

		public function get animIdleId() : int {
			return _animIdleId;
		}
		
		public function set animIdleId(animIdleId : int) : void {
			_animIdleId = animIdleId;
		}
		
		public function get animAirIdle() : Array {
			return _animAirIdle;
		}
		
		public function get animLanded() : int {
			return _animLanded;
		}
		
		public function set animLanded(animLanded : int) : void {
			_animLanded = animLanded;
		}
		
		public function get animFlyId() : int {
			return _animFlyId;
		}
		
		public function set animFlyId(animId : int) : void {
			_animFlyId = animId;
		}
		
		public function get animWalkId() : int {
			return _animWalkId;
		}
		
		public function set animWalkId(animWalkId : int) : void {
			_animWalkId = animWalkId;
		}	
	}
}
