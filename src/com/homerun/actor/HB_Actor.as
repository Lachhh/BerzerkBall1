package com.homerun.actor {
	import com.lachhhEngine.utils.Utils;
	import com.homerun.factories.HB_AnimationFactory;
	import com.homerun.behavior.HB_BehaviorFactory;
	import com.homerun.meta.MetaHBActor;
	import com.lachhhEngine.games.Game;
	import com.lachhhEngine.games.ammo.Ammo;
	import com.lachhhEngine.games.animation.Animation;
	import com.lachhhEngine.games.animation.AnimationManager;
	import com.lachhhEngine.games.behaviors.Behavior;
	import com.lachhhEngine.games.heurtable.CircleCollision;
	import com.lachhhEngine.games.heurtable.IHeurtable;
	import com.lachhhEngine.games.heurtable.IHeurtableContainer;
	import com.lachhhEngine.games.meta.MetaObject;
	import com.lachhhEngine.games.meta.metaObject.MetaBehavior;
	import com.lachhhEngine.games.physique.Actor;
	import com.lachhhEngine.games.physique.Collision;
	import com.lachhhEngine.games.physique.PhysicManager;

	import flash.geom.Point;

	/**
	 * @author Lachhh
	 */
	public class HB_Actor extends Actor implements IHeurtableContainer {
		private var _circleCol:CircleCollision ;
		private var _isDead:Boolean ;
		private var _handleMove:Point = new Point();
		private var _handleAim:Point = new Point();
		private var _handleShoot:Boolean = false;
		private var _behavior:Behavior ;
		private var _anim:Animation ;
		private var _circleColOffset:Point = new Point() ;
		
		override public function Init(metaObject : MetaObject, context : Game) : void {
			super.Init(metaObject, context);
			_circleCol = PhysicManager.instance.CreateCircleCollision(px, py, rayon, this);
			layer.AddTeamCollision(_circleCol, metaHBActor.team);
			_isDead = false;
			_handleMove.x = _handleMove.y = _handleAim.x = _handleAim.y = 0 ; 
			_handleShoot = false;
			_nBounce = 0.5;
			SwitchBehavior(metaHBActor.metaBehavior);
			_circleColOffset.x = 0 ;
			_circleColOffset.y = 0 ;  
		}

		override public function Destroy() : void {
			RemoveCol();
			DestroyAnimation();
			DestroyBehavior();
			super.Destroy();
			_isDead = true;
		}
		
		private function DestroyBehavior():void {
			if(_behavior != null && _behavior != HB_BehaviorFactory.BEHAVIOR_NULL) {
				context.behaviorManager.DestroyBehavior(_behavior);
				_behavior = null;
			}	
		}
		
		private function DestroyAnimation():void {
			if(_anim != null) {
				animationContainer.removeChild(_anim);
				AnimationManager.instance.Destroy(_anim);
				_anim = null;
			}	
		}
		
		private function SwitchBehavior(metaBehavior:MetaBehavior):void {
			DestroyBehavior();
			if(metaBehavior == null) {
				_behavior = HB_BehaviorFactory.BEHAVIOR_NULL;
				return;
			}
			_behavior = context.behaviorManager.CreateBehavior(metaBehavior);
		}

		private function RemoveCol():void {
			if(_circleCol != null) {
				layer.RemoveTeamCollision(_circleCol, metaHBActor.team);
				PhysicManager.instance.DestroyPhysicObject(_circleCol);
				_circleCol = null;
			}	
		}
		
		override public function Update(context : Game) : void {
			super.Update(context);
			if(_circleCol != null) {
				_circleCol.x = px + _circleColOffset.x;
				_circleCol.y = py + _circleColOffset.y;
			}
			if(_anim != null) {
				_anim.Update(context);
			}
			if(canBehave) Behave();
			if(canMove) Move();
			if(canShoot && _handleShoot) Shoot(); 
		}
		
		public function Behave():void {
			_behavior.Control(context, this);
		}
		
		public function Move():void {
			//Do Stuff
		}
		
		protected function SwitchAnim(animId:int):void {
			if(animId == -1) return;
			if(_anim != null && _anim.metaAnimation.instanceType == animId) return; 
			DestroyAnimation();
			_anim = AnimationManager.instance.CreateAnimation(animId);
			animationContainer.addChild(_anim);
		}
		
		protected function Shoot():void {}
		protected function Unshoot():void {}
		
		public function get canBehave():Boolean {return true;}
		public function get canMove():Boolean {return true;}
		public function get canShoot():Boolean {return true;}
		
		public function IsDead() : Boolean {return _isDead;}
		public function OnOwnerHit(victimCol : IHeurtable, attackerCol : IHeurtable, oCol : Collision) : void {
			if(victimCol == _circleCol && attackerCol is Ammo) {
				Hit(attackerCol as Ammo);	
			}
		}
		
		protected function Hit(ammo:Ammo):void {
			Die();	
		}
		
		protected function Die():void {
			_isDead = true;
		}

		public function get metaHBActor():MetaHBActor { return MetaHBActor(metaInfo) ;}
		public function get handleMove() : Point {return _handleMove;}
		public function get handleAim() : Point {return _handleAim;}
		public function get handleShoot() : Boolean {return _handleShoot;}
		public function set handleShoot(handleShoot : Boolean) : void {_handleShoot = handleShoot;
		}
		
		public function get anim() : Animation {
			return _anim;
		}
		
		public function get circleCol() : CircleCollision {
			return _circleCol;
		}
		
		public function get circleColOffset() : Point {
			return _circleColOffset;
		}  		
	}
}
