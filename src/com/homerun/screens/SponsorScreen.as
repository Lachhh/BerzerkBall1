package com.homerun.screens {
	import com.homerun.factories.HB_AnimationFactory;
	import com.homerun.screens.HB_Screen;
	import com.lachhhEngine.games.Game;
	import com.lachhhEngine.games.animation.Animation;
	import com.lachhhEngine.games.animation.AnimationManager;
	import com.lachhhEngine.games.meta.MetaObject;
	import com.lachhhEngine.interfaces.forms.Button;

	import flash.events.MouseEvent;

	/**
	 * @author Lachhh
	 */
	public class SponsorScreen extends HB_Screen {
		override public function Init(metaObject : MetaObject, context : Game) : void {
			super.Init(metaObject, context);
			okBtn.addEventListener(MouseEvent.MOUSE_DOWN, onClickExit);
			//ExternalAPIManager.premiumAPI.HideBar();
			InitOkBtn(okBtn);
		}

		override public function RemoveListeners() : void {
			super.RemoveListeners();
			okBtn.removeEventListener(MouseEvent.MOUSE_DOWN, onClickExit);
		}
		
		private function onClickExit(event : MouseEvent) : void {
			CloseToScreen(HB_ScreenFactory.ID_DISCLAIMER_SCREEN);
		}

		override public function CreateVisual() : Animation {
			return AnimationManager.instance.CreateAnimation(HB_AnimationFactory.ID_SPONSOR_SCREEN);
		}

		override protected function get playOpenSound() : Boolean {
			return false;
		}

		private function get okBtn():Button { return Button(panel.getChildByName("okBtn"));}
	}
}
