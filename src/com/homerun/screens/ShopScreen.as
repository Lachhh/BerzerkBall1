package com.homerun.screens {
	import com.homerun.screens.view.distribution.SponsorLogoView;
	import mochi.as3.MochiEvents;

	import com.homerun.factories.HB_AnimationFactory;
	import com.homerun.io.AchievementManager;
	import com.homerun.screens.view.equip.InventoryShopView;
	import com.lachhhEngine.games.Game;
	import com.lachhhEngine.games.MainGame;
	import com.lachhhEngine.games.animation.Animation;
	import com.lachhhEngine.games.animation.AnimationManager;
	import com.lachhhEngine.games.meta.MetaObject;
	import com.lachhhEngine.games.screens.ScreenManager;
	import com.lachhhEngine.initializers.VersionInfo;
	import com.lachhhEngine.interfaces.forms.Button;
	import com.lachhhEngine.io.Callback;

	import flash.display.MovieClip;
	import flash.events.MouseEvent;

	/**
	 * @author Lachhh
	 */
	public class ShopScreen extends HB_Screen {
		private var _inventoryShop:InventoryShopView ;
		private var _sponsorLogoView:SponsorLogoView;
		

		override public function Init(metaObject : MetaObject, context : Game) : void {
			super.Init(metaObject, context);
			_sponsorLogoView = new SponsorLogoView(sponsorShop);
			optionsBtn.addEventListener(MouseEvent.MOUSE_DOWN, onClickOptions);
			inventoryBtn.addEventListener(MouseEvent.MOUSE_DOWN, onClickInventory);
			exitBtn.addEventListener(MouseEvent.MOUSE_DOWN, onClickExit);
			challengeBtn.addEventListener(MouseEvent.MOUSE_DOWN, onClickChallenge);
			diamondBtn.addEventListener(MouseEvent.MOUSE_DOWN, onClickDiamond);
			trophyBtn.addEventListener(MouseEvent.MOUSE_DOWN, onTrophy);
			trophyNewBtn.visible = AchievementManager.hasNew;
			
			_inventoryShop = new InventoryShopView(this, panel, new Callback(Refresh, this, null));
			_inventoryShop.Refresh();
			
			InitOkBtn(optionsBtn);
			InitOkBtn(inventoryBtn);
			InitOkBtn(exitBtn);
			InitOkBtn(challengeBtn);
			InitOkBtn(diamondBtn);
			InitOkBtn(_inventoryShop.prevBtn);
			InitOkBtn(_inventoryShop.nextBtn);
		}

		override public function RemoveListeners() : void {
			super.RemoveListeners();
			optionsBtn.removeEventListener(MouseEvent.MOUSE_DOWN, onClickOptions);
			inventoryBtn.removeEventListener(MouseEvent.MOUSE_DOWN, onClickInventory);
			exitBtn.removeEventListener(MouseEvent.MOUSE_DOWN, onClickExit);
			challengeBtn.removeEventListener(MouseEvent.MOUSE_DOWN, onClickChallenge);
			trophyBtn.removeEventListener(MouseEvent.MOUSE_DOWN, onTrophy);
		}
		
		private function onClickDiamond(event : MouseEvent) : void {
			if(VersionInfo.exclusiveStuffVisible) { 
				var c:HB_Screen = HB_Screen(ScreenManager.instance.ShowScreen(HB_ScreenFactory.ID_DIAMOND_SCREEN));
				c.SetLastScreen(HB_ScreenFactory.ID_ROUNDCOMPLETE_SCREEN);
			} else {
				var t:HB_Screen = HB_Screen(ScreenManager.instance.ShowScreen(HB_ScreenFactory.ID_TROPHYSELECT_SCREEN));
				t.SetLastScreen(HB_ScreenFactory.ID_ROUNDCOMPLETE_SCREEN);
			}
			Close(true);
		}
		
		private function onClickChallenge(event : MouseEvent) : void {
			CloseToScreen(HB_ScreenFactory.ID_CHALLENGE_SCREEN);
		}

		private function onClickExit(event : MouseEvent) : void {
			CloseToScreen(HB_ScreenFactory.ID_ROUNDCOMPLETE_SCREEN);
		}

		private function onClickInventory(event : MouseEvent) : void {
			CloseToScreen(HB_ScreenFactory.ID_INVENTORY_SCREEN);
			if(VersionInfo.sponsorVisualFrame == VersionInfo.FRAME_JALUDO) MochiEvents.trackEvent("Shop", "Inventory");
		}

		private function onClickOptions(event : MouseEvent) : void {
			var options:OptionsIngameScreen = OptionsIngameScreen(ScreenManager.instance.ShowScreen(HB_ScreenFactory.ID_OPTIONS_INGAME_SCREEN));
			options.SetExitScreen(metaInfo.instanceType);
			Close(true);
			if(VersionInfo.sponsorVisualFrame == VersionInfo.FRAME_JALUDO) MochiEvents.trackEvent("Shop", "Options");
		}
		
		private function onTrophy(event : MouseEvent) : void {
			var t:TrophySelectScreen = TrophySelectScreen(ScreenManager.instance.ShowScreen(HB_ScreenFactory.ID_TROPHYSELECT_SCREEN));
			t.SetLastScreen(HB_ScreenFactory.ID_SHOP_SCREEN);
			Close(true);
			if(VersionInfo.sponsorVisualFrame == VersionInfo.FRAME_JALUDO) MochiEvents.trackEvent("Shop", "Trophy");
		}
		
		override public function Refresh():void {
			_inventoryShop.Refresh();	
		}

		override public function ShowIdle(context : MainGame) : void {
			super.ShowIdle(context);
			_inventoryShop.Update();
		}

		override public function CreateVisual() : Animation {
			return AnimationManager.instance.CreateAnimation(HB_AnimationFactory.ID_SHOP_SCREEN);
		}
		
		private function get optionsBtn():Button {return Button(panel.getChildByName("optionsBtn"));}
		private function get inventoryBtn():Button {return Button(panel.getChildByName("inventoryBtn"));}
		private function get exitBtn():Button {return Button(panel.getChildByName("exitBtn"));}
		private function get challengeBtn():Button {return Button(panel.getChildByName("challengeBtn"));}
		private function get diamondBtn():Button {return Button(panel.getChildByName("diamondBtn"));}
		private function get trophyBtn():Button {return Button(panel.getChildByName("trophyBtn"));}
		private function get trophyNewBtn():MovieClip {return MovieClip(trophyBtn.getChildByName("newIcon"));}
		private function get sponsorShop():MovieClip {return MovieClip(panel.getChildByName("sponsorShop"));}
		
	}
}
