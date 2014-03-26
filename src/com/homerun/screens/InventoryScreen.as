package com.homerun.screens {
	import com.homerun.screens.view.distribution.SponsorLogoView;
	import mochi.as3.MochiEvents;

	import com.homerun.factories.HB_AnimationFactory;
	import com.homerun.io.AchievementManager;
	import com.homerun.io.HB_GameProgress;
	import com.homerun.screens.view.equip.InventoryHeroView;
	import com.homerun.screens.view.perso.PersoUpgradeView;
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
	public class InventoryScreen extends HB_Screen {
		private var _persoStatsView:PersoUpgradeView;
		private var _inventoryHero:InventoryHeroView;
		private var _sponsorLogoView:SponsorLogoView;

		override public function Init(metaObject : MetaObject, context : Game) : void {
			super.Init(metaObject, context);
			_sponsorLogoView = new SponsorLogoView(sponsorInventory);
			_persoStatsView = new PersoUpgradeView(panel, context, true);
			_persoStatsView.SetMetaPerso(HB_GameProgress.gameProgress.metaProgress.lastSelected);
			
			_inventoryHero = new InventoryHeroView(panel, new Callback(Refresh, this, null));
			_inventoryHero.Refresh();
			
			optionsBtn.addEventListener(MouseEvent.MOUSE_DOWN, onClickOptions);
			shopBtn.addEventListener(MouseEvent.MOUSE_DOWN, onClickShop);
			exitBtn.addEventListener(MouseEvent.MOUSE_DOWN, onClickExit);
			trophyBtn.addEventListener(MouseEvent.MOUSE_DOWN, onTrophy);
			trophyNewBtn.visible = AchievementManager.hasNew;
			
			InitOkBtn(optionsBtn);
			InitOkBtn(shopBtn);
			InitOkBtn(trophyBtn);
			InitOkBtn(exitBtn);
			InitOkBtn(_inventoryHero.prevBtn);
			InitOkBtn(_inventoryHero.nextBtn);
		}

		private function onClickExit(event : MouseEvent) : void {
			CloseToScreen(HB_ScreenFactory.ID_ROUNDCOMPLETE_SCREEN);
		}

		private function onClickShop(event : MouseEvent) : void {
			CloseToScreen(HB_ScreenFactory.ID_SHOP_SCREEN);
			if(VersionInfo.sponsorVisualFrame == VersionInfo.FRAME_JALUDO) MochiEvents.trackEvent("Inventory", "Shop");
		}

		private function onClickOptions(event : MouseEvent) : void {
			var options:OptionsIngameScreen = OptionsIngameScreen(ScreenManager.instance.ShowScreen(HB_ScreenFactory.ID_OPTIONS_INGAME_SCREEN));
			options.SetExitScreen(metaInfo.instanceType);
			Close(true);
			if(VersionInfo.sponsorVisualFrame == VersionInfo.FRAME_JALUDO) MochiEvents.trackEvent("Inventory", "Options");
		}

		override public function RemoveListeners() : void {
			super.RemoveListeners();
			optionsBtn.removeEventListener(MouseEvent.MOUSE_DOWN, onClickOptions);
			shopBtn.removeEventListener(MouseEvent.MOUSE_DOWN, onClickShop);
			exitBtn.removeEventListener(MouseEvent.MOUSE_DOWN, onClickExit);
			trophyBtn.removeEventListener(MouseEvent.MOUSE_DOWN, onTrophy);
			_sponsorLogoView.Destroy();
		}
		
		private function onTrophy(event : MouseEvent) : void {
			var t:TrophySelectScreen = TrophySelectScreen(ScreenManager.instance.ShowScreen(HB_ScreenFactory.ID_TROPHYSELECT_SCREEN));
			t.SetLastScreen(HB_ScreenFactory.ID_INVENTORY_SCREEN);
			Close(true);
			if(VersionInfo.sponsorVisualFrame == VersionInfo.FRAME_JALUDO) MochiEvents.trackEvent("Inventory", "Trophies");
		}

		override public function Destroy() : void {
			super.Destroy();
			_persoStatsView.Destroy();
			_inventoryHero.Destroy();
		}

		override public function ShowIdle(context : MainGame) : void {
			super.ShowIdle(context);
			_persoStatsView.Update(context.game);
			_inventoryHero.Update();
		}
		
		override public function Refresh():void {
			_persoStatsView.Refresh();	
			_inventoryHero.Refresh();
		}

		override public function CreateVisual() : Animation {
			return AnimationManager.instance.CreateAnimation(HB_AnimationFactory.ID_INVENTORY_SCREEN);
		}
		
		private function get optionsBtn():Button {return Button(panel.getChildByName("optionsBtn"));}
		private function get shopBtn():Button {return Button(panel.getChildByName("shopBtn"));}
		private function get exitBtn():Button {return Button(panel.getChildByName("exitBtn"));}
		private function get trophyBtn():Button {return Button(panel.getChildByName("trophyBtn"));}
		private function get trophyNewBtn():MovieClip {return MovieClip(trophyBtn.getChildByName("newIcon"));}
		private function get sponsorInventory():MovieClip {return MovieClip(panel.getChildByName("sponsorInventory"));}
		
		
	}
}
