package com.homerun.screens {
	import com.lachhhEngine.games.MainGame;

	import flash.events.MouseEvent;
	import com.homerun.factories.HB_AnimationFactory;
	import com.homerun.io.HB_GameProgress;
	import com.homerun.screens.HB_Screen;
	import com.homerun.screens.view.perso.PersoUpgradeView;
	import com.lachhhEngine.games.Game;
	import com.lachhhEngine.games.animation.Animation;
	import com.lachhhEngine.games.animation.AnimationManager;
	import com.lachhhEngine.games.meta.MetaObject;
	import com.lachhhEngine.interfaces.forms.Button;

	/**
	 * @author Lachhh
	 */
	public class QuickLvlUpScreen extends HB_Screen {
		private var _persoUpgrade:PersoUpgradeView ;

		override public function Init(metaObject : MetaObject, context : Game) : void {
			super.Init(metaObject, context);
			_persoUpgrade = new PersoUpgradeView(panel, context, true);
			_persoUpgrade.SetMetaPerso(HB_GameProgress.gameProgress.metaProgress.lastSelected);
			exitBtn.addEventListener(MouseEvent.MOUSE_DOWN, onClickExit);
			InitOkBtn(exitBtn);
		}

		override public function RemoveListeners() : void {
			super.RemoveListeners();
			exitBtn.removeEventListener(MouseEvent.MOUSE_DOWN, onClickExit);
			_persoUpgrade.Destroy();
		}
		
		private function onClickExit(event : MouseEvent) : void {
			Close(true);
		}
		
		override public function CreateVisual() : Animation {
			return AnimationManager.instance.CreateAnimation(HB_AnimationFactory.ID_QUICKLVLUP_SCREEN);
		}

		override public function ShowIdle(context : MainGame) : void {
			super.ShowIdle(context);
			_persoUpgrade.Update(context.game);
		}

		private function get exitBtn():Button {	return Button(panel.getChildByName("exitBtn"));}
	}
}
