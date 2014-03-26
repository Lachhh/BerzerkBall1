package com.homerun.screens {
	import com.homerun.factories.HB_AnimationFactory;
	import com.homerun.io.HB_GamePrefs;
	import com.homerun.screens.HB_Screen;
	import com.lachhhEngine.games.Game;
	import com.lachhhEngine.games.animation.Animation;
	import com.lachhhEngine.games.animation.AnimationManager;
	import com.lachhhEngine.games.meta.MetaObject;
	import com.lachhhEngine.interfaces.forms.Button;
	import com.lachhhEngine.io.files.FileManager;
	import com.lachhhEngine.io.files.GamePrefs;

	import flash.events.MouseEvent;

	/**
	 * @author Lachhh
	 */
	public class DisclaimerScreen extends HB_Screen {
		override public function Init(metaObject : MetaObject, context : Game) : void {
			super.Init(metaObject, context);
			okBtn.addEventListener(MouseEvent.MOUSE_DOWN, onClickOk);
			InitOkBtn(okBtn);
			HB_GamePrefs(FileManager.instance.gamePrefs).UpdateQuality(GamePrefs.QUALITY_HIGH);
		}

		override public function RemoveListeners() : void {
			super.RemoveListeners();
			okBtn.removeEventListener(MouseEvent.MOUSE_DOWN, onClickOk);
		}

		private function onClickOk(event : MouseEvent) : void {
			CloseToScreen(HB_ScreenFactory.ID_TITLE_SCREEN);
		}

		override public function CreateVisual() : Animation {
			return AnimationManager.instance.CreateAnimation(HB_AnimationFactory.ID_DISCLAIMER_SCREEN);
		}
		
		private function get okBtn():Button { return Button(panel.getChildByName("okBtn")); }
	}
}
