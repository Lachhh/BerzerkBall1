package com.homerun.enemy {
	import com.homerun.constants.HBConstants;
	import com.homerun.exported.BTN_HIT;
	import com.homerun.factories.HB_AnimationFactory;
	import com.homerun.factories.HB_SfxFactory;
	import com.homerun.hero.Geek;
	import com.homerun.io.HB_GameProgress;
	import com.homerun.meta.ui.equip.MetaEquipmentEnum;
	import com.lachhhEngine.games.Game;
	import com.lachhhEngine.games.ammo.Ammo;
	import com.lachhhEngine.games.effects.GameEffectContainerId;
	import com.lachhhEngine.games.meta.MetaObject;
	import com.lachhhEngine.games.physique.Actor;
	import com.lachhhEngine.games.physique.EquationVecto;
	import com.lachhhEngine.games.screens.FlashScreen;
	import com.lachhhEngine.games.screens.ScreenFactory;
	import com.lachhhEngine.games.screens.ScreenManager;
	import com.lachhhEngine.games.sfx.Jukebox;
	import com.lachhhEngine.io.KeyManager;
	import com.lachhhEngine.utils.Utils;

	import flash.display.MovieClip;
	import flash.events.MouseEvent;

	/**
	 * @author Lachhh
	 */
	public class Canon extends HB_Enemy {
		private var _hasGeek:Boolean;
		private var _hasShot:Boolean;
		private var _rot:Number ;
		private var _rotPlus:Boolean ;
		private var _force:Number ;
		private var _btnHit:BTN_HIT ;
		
		override public function Init(metaObject : MetaObject, context : Game) : void {
			super.Init(metaObject, context);
			_hasGeek = false;
			_hasShot = false; 
			_rot = 60 ;
			_rotPlus = true;
			_btnHit = new BTN_HIT(); 
			animationContainer.addChild(_btnHit);
			//_btnHit.addEventListener(MouseEvent.MOUSE_DOWN, onClickHit);
			_btnHit.visible = false;
		}
		
		private function onClickHit(event : MouseEvent) : void {
			DoStuffOnGeek(theGeek);
		}

		override public function Destroy() : void {
			super.Destroy();
			//_btnHit.removeEventListener(MouseEvent.MOUSE_DOWN, onClickHit);
			Utils.LazyRemoveFromParent(_btnHit);
		}

		override public function Update(context : Game) : void {
			super.Update(context);
			if(_hasGeek) {
				_rot += (_rotPlus ? 10 : -10)*context.speedManager.GetSpeed();
				if(_rot > 90) {
					_rotPlus = false;
					_rot = 90;
				}
				
				if(_rot < 0) {
					_rotPlus = true;
					_rot = 0;
				}
					
				canonHead.rotation = _rot;
			}
			_btnHit.visible = _hasGeek;
			if(_hasGeek && KeyManager.IsMousePressed()) {
				onClickHit(null);	
			}
		}

		override protected function DoStuffOnGeek(g : Geek) : void {
			super.DoStuffOnGeek(g);
			var bonus:Number = HB_GameProgress.gameProgress.metaProgress.lastSelected.IsEquipped(MetaEquipmentEnum.EQUIP_BELT_7) ? 1.5 : 1;
			
			g.vx = EquationVecto.MyCos(_rot+90)*-_force*(controlVXBonus*bonus);
			g.vy = EquationVecto.MySin(_rot+90)*-_force*(controlVYBonus*bonus);
			g.px += g.vx;
			g.py += g.vy;
			
			theGeek.ShowAndUnpause();
			Jukebox.instance.PlaySound(HB_SfxFactory.ID_SFX_CANON);
			_hasShot = true;
			_hasGeek = false;
			
			var a:Actor = context.gameEffectManager.CreateStaticFx(HB_AnimationFactory.ID_FX_CANONFIRE, GameEffectContainerId.ABOVE, px, py+canonHead.y, layer.metaLayer);
			a.animationContainer.rotation = _rot ;
		}

		override protected function Hit(ammo : Ammo) : void {
			super.Hit(ammo);
			if(!_hasShot) { 
				_hasGeek = true;
				theGeek.HideAndPause();
				theGeek.px = px;
				theGeek.py = py-40;
				 
				_force = Math.sqrt(theGeek.vx*theGeek.vx+theGeek.vy*theGeek.vy)+HBConstants.ENEMY_CANON_FORCE_BONUS;
				theGeek.vx = 0 ;
				
				var flash:FlashScreen = FlashScreen(ScreenManager.instance.ShowScreen(ScreenFactory.FLASH_SCREEN));
				flash.InitFlash(0xFFFFFF, 10);
				
				Jukebox.instance.PlaySound(HB_SfxFactory.ID_SFX_ACC_CLICK);
			}
		}

		override protected function get canBeHit() : Boolean { return false;}

		override protected function get animIdleId() : int {return HB_AnimationFactory.ID_EN_WOODENCANNON_IDLE;	}
		override protected function get animDieId() : int {	return HB_AnimationFactory.ID_EN_WOODENCANNON_IDLE;}
		private function get canonHead() : MovieClip {	return MovieClip(anim.getChildByName("canonHead"));}
		
	}
}
