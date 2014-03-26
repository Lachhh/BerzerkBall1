package com.homerun.screens {
	import com.homerun.factories.HB_SfxFactory;
	import com.lachhhEngine.games.sfx.Jukebox;
	import com.homerun.factories.HB_AnimationFactory;
	import com.homerun.meta.ui.trophy.MetaTrophy;
	import com.lachhhEngine.games.Game;
	import com.lachhhEngine.games.MainGame;
	import com.lachhhEngine.games.animation.Animation;
	import com.lachhhEngine.games.animation.AnimationManager;
	import com.lachhhEngine.games.meta.MetaObject;
	import com.lachhhEngine.games.screens.OpenCloseScreen;
	import com.lachhhEngine.io.Callback;
	import com.lachhhEngine.multilingual.TextFactory;

	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.text.TextField;

	/**
	 * @author Lachhh
	 */
	public class AchPopupScreen extends OpenCloseScreen {
		private var _metaAch : MetaTrophy ;
		private var _closeCallback : Callback ;
		private var _closedCalled : Boolean ;

		override public function Init(metaObject : MetaObject, context : Game) : void {
			super.Init(metaObject, context);
			animation.addEventListener(MouseEvent.MOUSE_DOWN, onClick);
			_closedCalled = false;
			Jukebox.instance.PlaySound(HB_SfxFactory.ID_SFX_CROWD);
		}

		override public function RemoveListeners() : void {
			super.RemoveListeners();
			animation.removeEventListener(MouseEvent.MOUSE_DOWN, onClick);			
		}

		private function onClick(event : MouseEvent) : void {
			Close(true, _closeCallback);
		}

		public function ShowAch(metaAch : MetaTrophy, callback : Callback) : void {
			_metaAch = metaAch;
			_closeCallback = callback;
		}

		override public function Update(context : MainGame) : void {
			super.Update(context);
			diamondTxt.text = "+" + _metaAch.diamond+"";
			achTitle.text = TextFactory.instance.GetMsg(_metaAch.titleId);
			achDesc.text = TextFactory.instance.GetMsg(_metaAch.descId);
		}

		override public function ShowIdle(context : MainGame) : void {
			super.ShowIdle(context);
			panel.gotoAndStop(panel.currentFrame % panel.totalFrames + 1);
			if(panel.currentFrame >= panel.totalFrames - 3 && !_closedCalled) {
				Close(true, _closeCallback);	
				_closedCalled = true;
			}
		}

		override public function CreateVisual() : Animation {
			return AnimationManager.instance.CreateAnimation(HB_AnimationFactory.ID_TROPHYPOPUP_SCREEN);
		}

		private function get diamondTxt() : TextField {	return TextField(panel.getChildByName("diamondTxt"));}

		private function get achTitle() : TextField {
			return TextField(panel.getChildByName("achTitle"));	
		}

		private function get achDesc() : TextField {
			return TextField(panel.getChildByName("achDesc"));	
		}

		override protected function get openFrame() : int {	
			return 1;
		}

		override protected function get idleFrame() : int {	
			return 10;	
		}

		override protected function get closeFrame() : int {
			return 20;
		}
	}
}
