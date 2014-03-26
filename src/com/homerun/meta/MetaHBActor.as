package com.homerun.meta {
	import com.lachhhEngine.games.Game;
	import com.lachhhEngine.games.meta.MetaObject;
	import com.lachhhEngine.games.meta.metaObject.MetaActor;
	import com.lachhhEngine.games.meta.metaObject.MetaBehavior;

	/**
	 * @author Lachhh
	 */
	public class MetaHBActor extends MetaActor {
		private var _team : int ;
		private var _targetTeam : int ;
		private var _metaBehavior : MetaBehavior ;
		

		override public function Init(metaObject : MetaObject, context : Game) : void {
			super.Init(metaObject, context);
			_team = -1 ;
			_targetTeam = -1 ;
			_metaBehavior = null;
			 
		}
		
		public function get team() : int {
			return _team;
		}
		
		public function set team(team : int) : void {
			_team = team;
		}
		
		public function get targetTeam() : int {
			return _targetTeam;
		}
		
		public function set targetTeam(targetTeam : int) : void {
			_targetTeam = targetTeam;
		}
		
		public function get metaBehavior() : MetaBehavior {
			return _metaBehavior;
		}
		
		public function set metaBehavior(metaBehavior : MetaBehavior) : void {
			_metaBehavior = metaBehavior;
		}
	}
}
