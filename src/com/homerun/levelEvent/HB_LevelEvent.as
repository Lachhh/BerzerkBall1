package com.homerun.levelEvent {
	import com.homerun.HB_Game;
	import com.homerun.constants.HBConstants;
	import com.homerun.enemy.HB_EnemyManager;
	import com.homerun.factories.HB_AnimationFactory;
	import com.homerun.hero.Geek;
	import com.homerun.meta.ui.MetaPerso;
	import com.homerun.meta.ui.equip.MetaEquipmentEnum;
	import com.lachhhEngine.games.Game;
	import com.lachhhEngine.games.effects.GameEffectContainerId;
	import com.lachhhEngine.games.level.levelEvents.LevelEvent;
	import com.lachhhEngine.games.meta.MetaObject;
	import com.lachhhEngine.games.physique.Actor;
	import com.lachhhEngine.utils.Utils;

	import flash.display.DisplayObject;
	import flash.geom.Rectangle;

	/**
	 * @author Lachhh
	 */
	public class HB_LevelEvent extends LevelEvent {
		private const NB_NUAGES:int = 6;
		private const NB_NUAGES_FORE:int = 3;
		private const CREATE_MONSTER_EACH:int = 1000;
		private var _lastMonsterX:int =0 ; 
		private var _aNuages:Array = new Array();
		private var _aDecors:Array = new Array();
		private var _rectNuage:Rectangle = new Rectangle();
		private var _rectAction:Rectangle = new Rectangle();
		private var _startEdge:Actor  ;
		private var _runningSmoke:Actor ;
		private var _wait:Number = 10;
		
		override public function Init(metaLevelEvent : MetaObject, context : Game) : void {
			super.Init(metaLevelEvent, context);
			CreateNuage();
			_startEdge = context.gameEffectManager.CreateStaticFx(edgeAnimId, GameEffectContainerId.ABOVE, 0, 0, context.actionLayer.metaLayer, -1, true);
			context.actionLayer.GetLevelPartContainer().addChildAt(_startEdge.animationContainer, 0);
			_runningSmoke = context.gameEffectManager.CreateStaticFx(runningSmokeId, GameEffectContainerId.ABOVE, 0, 0, context.actionLayer.metaLayer, -1, true);
			_runningSmoke.animationContainer.alpha = 0 ; 
			_lastMonsterX = 0;
		}
		
		public function CreateNuage():void {
			var allNuage:Array = [];
			CreateAllNuageId(allNuage);
			for (var i:int = 0 ;i < NB_NUAGES; i++) {
				var randomId:int = int(Utils.PickRandomIn(allNuage)); 
				var randomContainer:int = int(Utils.PickRandomIn([GameEffectContainerId.BELOW,GameEffectContainerId.ABOVE]));
				var totalLayers:int = context.levelManager.GetAllLayers().length-1;
				var iLayer:int = (i%totalLayers);
				var crntNuage:Actor = context.gameEffectManager.CreateStaticFx(randomId, randomContainer, 0, 0, context.levelManager.GetLayer(iLayer).metaLayer, -1, true);
				
				Utils.RemoveFromArray(allNuage, randomId);				
				crntNuage.animationContainer.scaleX = crntNuage.animationContainer.scaleY = 1-(2-iLayer)*0.15;
				
				switch(iLayer) {
					case 0 : SetBack2Color(crntNuage.animationContainer); break;
					case 1 : SetBack1Color(crntNuage.animationContainer); break; 
				}
					
				crntNuage.cameraCanControlMe = false;
				
				
				_aNuages.push(crntNuage);
				if(allNuage.length <=0) {
					CreateAllNuageId(allNuage);
				}
			}
			
			for (i = 0 ; i < NB_NUAGES_FORE; i++) {
				var crntNuageFore:Actor = context.gameEffectManager.CreateStaticFx(nuageForeGrounId, GameEffectContainerId.ABOVE, 0, 0, context.levelManager.GetLayer(3).metaLayer, -1, true);
				crntNuageFore.cameraCanControlMe = false;	
				_aNuages.push(crntNuageFore);
			}
			
			PushDecor(_aDecors);
			for (i = 0 ; i <_aDecors.length ; i++) {
				var decor:Actor = Actor(_aDecors[i]);
				decor.px = decor.layer.boundsVisibleInCam.right + (3000) * (Math.random() + i);
				decor.py = 0;
				decor.layer.GetLevelPartContainer().addChildAt(decor.animationContainer, 0);
			}
		}
		
		protected function PushDecor(aDecors:Array):void {
			aDecors.push(context.gameEffectManager.CreateStaticFx(HB_AnimationFactory.ID_FX_DECOR_1, GameEffectContainerId.BELOW, -500, 0, context.levelManager.GetLayer(2).metaLayer, -1, true));
			aDecors.push(context.gameEffectManager.CreateStaticFx(HB_AnimationFactory.ID_FX_DECOR_2, GameEffectContainerId.BELOW, -500, 0, context.levelManager.GetLayer(2).metaLayer, -1, true));
			aDecors.push(context.gameEffectManager.CreateStaticFx(HB_AnimationFactory.ID_FX_DECOR_3, GameEffectContainerId.BELOW, -500, 0, context.levelManager.GetLayer(2).metaLayer, -1, true));
			aDecors.push(context.gameEffectManager.CreateStaticFx(HB_AnimationFactory.ID_FX_DECOR_4, GameEffectContainerId.BELOW, -500, 0, context.levelManager.GetLayer(2).metaLayer, -1, true));
		}
		
		protected function CreateAllNuageId(a:Array):void {
			a.push(HB_AnimationFactory.ID_DECOR_NUAGE1);
			a.push(HB_AnimationFactory.ID_DECOR_NUAGE2);
			a.push(HB_AnimationFactory.ID_DECOR_NUAGE3);
		}
		
		protected function get nuageForeGrounId():int {
			return HB_AnimationFactory.ID_FX_DECOR_NUAGE_FOREGROUND ;	
		}
		
		protected function SetBack2Color(d:DisplayObject):void {
			d.alpha = 0.40;
		}
		
		protected function SetBack1Color(d:DisplayObject):void {
			d.alpha = 0.70;
		}
		
		override public function Destroy() : void {
			while(_aNuages.length > 0) {
				var nuage:Actor = _aNuages.shift();
				context.gameEffectManager.DestroyGameEffect(nuage); 	
			}
			super.Destroy();
		}

		override public function UpdateLevel(context : Game) : void {
			super.UpdateLevel(context);
			
			if(typedContext.hasHit) {
				if(_wait < 0) {
					if(geek.vx >= 20) {
						if(typedContext.hero.nbHit > 0) {
							typedContext.hero.StartRunning();
						} else {
							typedContext.hero.StopRunning();
						}
					} else if(geek.px > 700) {
						HB_Game(context).hero.RunForwardCam();	
					}
					
					if(!geek.landed) {
						if(geek.hitByBerzerk != null && geek.waitBerzerker > 0) {
							geek.waitBerzerker -= context.speedManager.GetSpeed();
							typedContext.camera.GotoSmooth(typedContext, geek.hitByBerzerk.px, geek.hitByBerzerk.py, 1500, 0.1, 0.1, 1); 
						} else {
							typedContext.camera.Goto(typedContext, 0, 0, 0);
							
							var shake:int = Math.min(Math.max(geek.vx/25, -30), 30) ;
							var xOffset:int = Math.min(Math.max(geek.controlVx*2, -50), 50);
							var yOffset:int = Math.min(Math.max(geek.controlVy*2, -50), 50);
							typedContext.camera.Goto(typedContext, geek.px + xOffset + Math.random()*shake, geek.py + yOffset + Math.random()*shake, Math.min(1100 + geek.vx*2, 1750));
						}
					} else {
						typedContext.camera.GotoSmooth(typedContext, geek.px-225, geek.py, 1000, 0.1, 0.1, 0.5);
					}
				} else {
					_wait -= context.speedManager.GetSpeed();
					typedContext.camera.Goto(typedContext, typedContext.hero.px, typedContext.hero.py, 1000);
				}
			} else {
				_wait = 10;
				typedContext.camera.isManual = true;
				typedContext.camera.Goto(typedContext, typedContext.hero.px, typedContext.hero.py, 1000);
			}
			
			if(typedContext.hero.runningToGeek) {
				_runningSmoke.animationContainer.alpha += 0.1*context.speedManager.GetSpeed();
				_runningSmoke.px = typedContext.hero.px-50 ;
				_runningSmoke.py = 0;
			} else {
				_runningSmoke.animationContainer.alpha -= 0.1*context.speedManager.GetSpeed();
			}
			
			_runningSmoke.animationContainer.alpha = Math.min(1, Math.max(0, _runningSmoke.animationContainer.alpha));
			CheckNuage();
			CheckDecor();
			
			if(geek.px > _lastMonsterX + distBetweenNewEnemy) {
				_lastMonsterX += distBetweenNewEnemy;
				CreateRandomEnemy();	
			}
		}
		
		private function CreateRandomEnemy():void { 
			_rectAction.left = context.actionLayer.boundsVisibleInCam.x;
			_rectAction.right = context.actionLayer.boundsVisibleInCam.right;
			_rectAction.top = context.actionLayer.boundsVisibleInCam.top;
			_rectAction.bottom = context.actionLayer.boundsVisibleInCam.bottom;
			
			
			var x:int = _rectAction.right;
			var yBee:int = Math.max(_rectAction.top, context.camera.GetBounds().top) + _rectAction.height*Math.random();
			if(yBee > -100) yBee -= 400;
			var yCoin:int = Math.max(_rectAction.top, context.camera.GetBounds().top) + _rectAction.height*Math.random();
			if(yCoin > -100) yCoin -= 400;
			var beeRate:int = (metaPerso.IsEquipped(MetaEquipmentEnum.EQUIP_BANDANA_2) ? 1.5 : 1);
			var canonRate:int = (metaPerso.IsEquipped(MetaEquipmentEnum.EQUIP_BANDANA_2) ? 1.5 : 1);
			if(metaPerso.IsEquipped(MetaEquipmentEnum.EQUIP_BANDANA_7)) {
				canonRate = 2;
			}
			
			var mechCommRate:int = (metaPerso.IsEquipped(MetaEquipmentEnum.EQUIP_BRACERS_3) ? 1.5 : 1);
			var mineRate:int = (metaPerso.IsEquipped(MetaEquipmentEnum.EQUIP_BRACERS_3) ? 1.5 : 1);
			
			var berzerkRate:int = (metaPerso.IsEquipped(MetaEquipmentEnum.EQUIP_BELT_2) ? 1.5 : 1);
			var spiderRate:int = (metaPerso.IsEquipped(MetaEquipmentEnum.EQUIP_BELT_2) ? 1.5 : 1);
			var canPlayWithVx:Boolean = geek.vx < 500; 
			
			//Coin
			if(Math.random()*100 < HBConstants.ENEMY_COIN_RATE) {HB_EnemyManager(context.enemyManager).CreateCoin(x, yCoin); }
			
			//Bee
			if(Math.random()*100 < HBConstants.ENEMY_BEE_RATE * beeRate) { HB_EnemyManager(context.enemyManager).CreateBee(x, yBee);}
			
			//Spider
			if(Math.random()*100 < HBConstants.ENEMY_SPIDER_RATE * spiderRate) { HB_EnemyManager(context.enemyManager).CreateSpider(x);	return;}
			
			//Mine
			if(Math.random()*100 < HBConstants.ENEMY_MINE_RATE * mineRate) { HB_EnemyManager(context.enemyManager).CreateMine(x); return;}
			
			//Berzerker
			if(Math.random()*100 < HBConstants.ENEMY_BERZERKER_RATE * berzerkRate) { HB_EnemyManager(context.enemyManager).CreateBerzerker(x); return ;}
			
			//Blob
			if(Math.random()*100 < HBConstants.ENEMY_BLOB_RATE) { HB_EnemyManager(context.enemyManager).CreateBlob(x); return ;}
			
			//Canon
			if(Math.random()*100 < HBConstants.ENEMY_CANON_RATE * canonRate) { HB_EnemyManager(context.enemyManager).CreateCanon(x); return ;}
			
			//MechComm
			if(Math.random()*100 < HBConstants.ENEMY_MECHCOMM_RATE * mechCommRate) { HB_EnemyManager(context.enemyManager).CreateMechComm(x); return ;}
			
			//Cezar
			//if(Math.random()*100 < 10 + cezarRate) { HB_EnemyManager(context.enemyManager).CreateCezar(x, y)}

			
		}
		
		private function CheckNuage():void {
			
			for (var i:int = 0 ; i < _aNuages.length ; i++) {
				var nuage:Actor = Actor(_aNuages[i]);
				
				_rectNuage.x = nuage.layer.boundsVisibleInCam.x - nuage.animationContainer.width * nuage.layer.GetPctOfView();
				_rectNuage.width = nuage.layer.boundsVisibleInCam.width + nuage.animationContainer.width * nuage.layer.GetPctOfView()*2;
				_rectNuage.y = nuage.layer.boundsVisibleInCam.y - nuage.animationContainer.height * nuage.layer.GetPctOfView();
				_rectNuage.height = nuage.layer.boundsVisibleInCam.height+ nuage.animationContainer.height * nuage.layer.GetPctOfView()*2;
				
				if(!_rectNuage.contains(nuage.px, nuage.py)) {
					if(Math.random()*100 < 50) {
						if(geek.vx > 0) {
							nuage.px = _rectNuage.right-1 ;
							nuage.py = _rectNuage.top + (_rectNuage.height-1)*Math.random()+1 ;
						} else {
							nuage.px = _rectNuage.left+1 ;
							nuage.py = _rectNuage.top + (_rectNuage.height-1)*Math.random()+1 ;
						}
					} else {
						if(geek.vy > 0) {
							nuage.px = _rectNuage.left + Math.random() * (_rectNuage.width-1)+1 + geek.vx;
							nuage.py = _rectNuage.bottom+ geek.vy  ;	
						} else {
							nuage.px = _rectNuage.left + Math.random() * (_rectNuage.width-1)+1+ geek.vx ;
							nuage.py = _rectNuage.top + geek.vy ;
						}
					}	
				}
				if(nuage.layer == context.levelManager.GetLayer(3)) {
					nuage.animationContainer.visible = (nuage.py <= -250) ;
				} else {
					nuage.animationContainer.visible = (nuage.py <= -500) ;
				}
			}

		}
		
		private function CheckDecor():void {
			for (var i:int = 0 ; i <_aDecors.length ; i++) {
				var decor:Actor = Actor(_aDecors[i]);
				if(decor.px + decor.animationContainer.width <= decor.layer.boundsVisibleInCam.x) {
					
					decor.px = decor.layer.boundsVisibleInCam.right + (decor.layer.boundsVisibleInCam.width) * (Math.random() + _aDecors.length);
					while(HasTwoStacked()) {
						decor.px += (Math.random() * 700);	
					} 
				}
				decor.py = 0;
			}
		}
		
		private function HasTwoStacked():Boolean {
			for (var i:int = 0 ; i <_aDecors.length ; i++) {
				for (var j:int = 0 ; j <_aDecors.length ; j++) {
					var decorA:Actor = Actor(_aDecors[i]);
					var decorB:Actor = Actor(_aDecors[j]);
					if(decorA == decorB) continue ;
					if(Math.abs(decorA.px - decorB.px) < 100) return true;
				}
			}
			return false;
		}
		
		private function get geek():Geek {
			return HB_Game(context).geek;
		}
		
		private function get typedContext():HB_Game {
			return HB_Game(context); 
		}

		private function get metaPerso():MetaPerso {
			return typedContext.hero.metaHero.metaPerso;	
		}
		
		protected function get edgeAnimId():int { return -1 ;}
		public function get runningSmokeId():int { return -1 ;}
		
		private function get distBetweenNewEnemy():Number {
			if(metaPerso.IsEquipped(MetaEquipmentEnum.EQUIP_BELT_8)) return CREATE_MONSTER_EACH - (CREATE_MONSTER_EACH*0.2);
			return CREATE_MONSTER_EACH ; 	
		} 
	}
}
