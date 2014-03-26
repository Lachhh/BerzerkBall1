package com.homerun.meta {
	import com.homerun.meta.ui.MetaPerso;
	import com.lachhhEngine.games.Game;
	import com.lachhhEngine.games.meta.MetaObject;
	import com.lachhhEngine.games.meta.metaObject.MetaActor;

	/**
	 * @author Lachhh
	 */
	public class MetaHBHero extends MetaHBActor{
		private var _animIdleId:int = -1;
		private var _animGatherInId:int = -1;
		private var _animGatherIdleId:int = -1;
		private var _animHitId:int = -1;
		private var _animRunningGatherHitId:int = -1;
		private var _animRunningGatherIdleId:int = -1;
		private var _metaPerso:MetaPerso ;
	
		
		override public function Init(metaObject : MetaObject, context : Game) : void {
			super.Init(metaObject, context);
			_animIdleId = -1;
			_animGatherInId = -1;
			_animGatherIdleId = -1;
			_animRunningGatherHitId = -1;
			_animRunningGatherIdleId = -1;
			_animHitId = -1;
			_metaPerso = null;
				
		}

		public function get animIdleId() : int {return _animIdleId;}
		public function set animIdleId(animIdleId : int) : void {_animIdleId = animIdleId;}
		public function get animGatherInId() : int {return _animGatherInId;}
		public function set animGatherInId(animGatherInId : int) : void {_animGatherInId = animGatherInId;}
		public function get animGatherIdleId() : int {return _animGatherIdleId;}
		public function set animGatherIdleId(animGatherIdleId : int) : void {_animGatherIdleId = animGatherIdleId;}
		public function get animHitId() : int {return _animHitId;}
		public function set animHitId(animHitId : int) : void {	_animHitId = animHitId;}
		public function get metaPerso() : MetaPerso {return _metaPerso;}
		public function set metaPerso(metaPerso : MetaPerso) : void {_metaPerso = metaPerso;}
		public function get animRunningGatherHitId() : int {	return _animRunningGatherHitId;}
		public function set animRunningGatherHitId(animRunningGatherInId : int) : void {_animRunningGatherHitId = animRunningGatherInId;}
		public function get animRunningGatherIdleId() : int {return _animRunningGatherIdleId;}
		public function set animRunningGatherIdleId(animRunningGatherIdleId : int) : void {_animRunningGatherIdleId = animRunningGatherIdleId;}		
	}
}
