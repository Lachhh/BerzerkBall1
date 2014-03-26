package com.homerun.screens {
	import com.lachhhEngine.io.Callback;
	import com.homerun.Main;
	import com.homerun.factories.HB_AnimationFactory;
	import com.homerun.init.HB_VersionInfo;
	import com.homerun.io.HB_GameProgress;
	import com.homerun.io.HB_PremiumConstants;
	import com.homerun.multilingual.HB_TextFactory;
	import com.homerun.screens.view.DiamondView;
	import com.homerun.screens.view.ExternalStoreMoneyView;
	import com.homerun.screens.view.distribution.SponsorLogoView;
	import com.lachhhEngine.games.Game;
	import com.lachhhEngine.games.MainGame;
	import com.lachhhEngine.games.animation.Animation;
	import com.lachhhEngine.games.animation.AnimationManager;
	import com.lachhhEngine.games.meta.MetaObject;
	import com.lachhhEngine.games.screens.ScreenManager;
	import com.lachhhEngine.interfaces.forms.Button;
	import com.lachhhEngine.io.externalAPI.ExternalAPIManager;
	import com.lachhhEngine.io.externalAPI.premiumAPI.MetaExternalPremiumItem;
	import com.lachhhEngine.multilingual.TextFactory;
	import com.lachhhEngine.utils.Utils;

	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.text.TextField;

	/**
	 * @author Lachhh
	 */
	public class DiamondScreen extends HB_Screen {
		private var _diamondView:DiamondView ;
		private var _sponsorView:SponsorLogoView ;
		private var _storeView:ExternalStoreMoneyView;
		override public function Init(metaObject : MetaObject, context : Game) : void {
			super.Init(metaObject, context);
			 
			_storeView = new ExternalStoreMoneyView(premiumStoreView);
			_storeView.Refresh();
			_diamondView = new DiamondView(panel);
			_diamondView.Refresh();
			_sponsorView = new SponsorLogoView(sponsorPromoSponsor);
			_sponsorView.Refresh();
			_sponsorView.linkToGame = true;
			exitBtn.addEventListener(MouseEvent.MOUSE_DOWN, onClickExit);
			challengeBtn.addEventListener(MouseEvent.MOUSE_DOWN, onClickChallenge);
			buy1Btn.addEventListener(MouseEvent.MOUSE_DOWN, onClickBuy1);
			buy2Btn.addEventListener(MouseEvent.MOUSE_DOWN, onClickBuy2);
			buy3Btn.addEventListener(MouseEvent.MOUSE_DOWN, onClickBuy3);
			
			premiumItemStoreBuy1Btn.addEventListener(MouseEvent.MOUSE_DOWN, onClickBuy1);
			premiumItemStoreBuy2Btn.addEventListener(MouseEvent.MOUSE_DOWN, onClickBuy2);
			premiumItemStoreBuy3Btn.addEventListener(MouseEvent.MOUSE_DOWN, onClickBuy3);
			
			premiumItemStoreMyDiamondsTxt.text = Utils.PutVirgules(HB_GameProgress.gameProgress.diamondTotal);
			
			connectBtn.addEventListener(MouseEvent.MOUSE_DOWN, onClickConnect);
			
			InitOkBtn(exitBtn);
			InitOkBtn(challengeBtn);
			InitOkBtn(buy1Btn);
			InitOkBtn(buy2Btn);
			InitOkBtn(buy3Btn);
			InitOkBtn(premiumItemStoreBuy1Btn);
			InitOkBtn(premiumItemStoreBuy2Btn);
			InitOkBtn(premiumItemStoreBuy3Btn);
			InitOkBtn(connectBtn);
			
			gsOnly.visible = !ExternalAPIManager.premiumAPI.loggedIn;
			trace(HB_VersionInfo.useViralFeature);
			if(!HB_VersionInfo.useViralFeature) {
				if(!HB_VersionInfo.showSponsorPromo) {
					premiumItemStore.visible = true;
					sponsorPromo.visible = false;
					
					if(!ExternalAPIManager.premiumAPI.canShowMyMoney) {
						premiumItemStoreItem1Price.visible = premiumItemStoreItem2Price.visible = premiumItemStoreItem3Price.visible = false;
						premiumItemStoreDiamond1Btn.x+= 140;
						premiumItemStoreDiamond2Btn.x+= 140;
						premiumItemStoreDiamond3Btn.x+= 140;
						premiumItemStoreDiamond1Label.x+= 140;
						premiumItemStoreDiamond2Label.x+= 140;
						premiumItemStoreDiamond3Label.x+= 140;	
					}
					
					premiumItemStoreItem1Price.text = ExternalAPIManager.premiumAPI.GetItemCostGold(HB_PremiumConstants.ITEM_DIAMOND_10) + " " + ExternalAPIManager.premiumAPI.goldAcronym;
					premiumItemStoreItem2Price.text = ExternalAPIManager.premiumAPI.GetItemCostGold(HB_PremiumConstants.ITEM_DIAMOND_50) + " " + ExternalAPIManager.premiumAPI.goldAcronym;
					premiumItemStoreItem3Price.text = ExternalAPIManager.premiumAPI.GetItemCostGold(HB_PremiumConstants.ITEM_DIAMOND_100) + " " + ExternalAPIManager.premiumAPI.goldAcronym;
					
					Utils.SetMaxSizeOfTxtField(premiumItemStoreItem1Price, 20);
					Utils.SetMaxSizeOfTxtField(premiumItemStoreItem2Price, 20);
					Utils.SetMaxSizeOfTxtField(premiumItemStoreItem3Price, 20);
				} else {
					premiumItemStore.visible = false;
					sponsorPromo.visible = true;
				}
			} else {
				premiumItemStore.visible = false;
				sponsorPromo.visible = false;	
			}
			sponsorPromoBulleGeekbulleAUTO_0.text = TextFactory.instance.GetMsg(HB_TextFactory.ID_AUTO_PROMO_SPONSOR);
		}

		private function onClickConnect(event : MouseEvent) : void {
			ExternalAPIManager.premiumAPI.ShowLogin();
		}

		override public function RemoveListeners() : void {
			super.RemoveListeners();
			if(exitBtn != null) exitBtn.removeEventListener(MouseEvent.MOUSE_DOWN, onClickExit);
			if(challengeBtn != null) challengeBtn.removeEventListener(MouseEvent.MOUSE_DOWN, onClickChallenge);
			if(buy1Btn != null) buy1Btn.removeEventListener(MouseEvent.MOUSE_DOWN, onClickBuy1);
			if(buy2Btn != null) buy2Btn.removeEventListener(MouseEvent.MOUSE_DOWN, onClickBuy2);
			if(buy3Btn != null) buy3Btn.removeEventListener(MouseEvent.MOUSE_DOWN, onClickBuy3);
			if(premiumItemStoreBuy1Btn != null) premiumItemStoreBuy1Btn.removeEventListener(MouseEvent.MOUSE_DOWN, onClickBuy1);
			if(premiumItemStoreBuy2Btn != null) premiumItemStoreBuy2Btn.removeEventListener(MouseEvent.MOUSE_DOWN, onClickBuy2);
			if(premiumItemStoreBuy3Btn != null) premiumItemStoreBuy3Btn.removeEventListener(MouseEvent.MOUSE_DOWN, onClickBuy3);
			if(_diamondView != null) _diamondView.Destroy();
			if(_sponsorView != null) _sponsorView.Destroy();
		}

		private function onClickBuy3(event : MouseEvent) : void {
			PurchaseItem(HB_PremiumConstants.ITEM_DIAMOND_100);
		}

		private function onClickBuy2(event : MouseEvent) : void {
			PurchaseItem(HB_PremiumConstants.ITEM_DIAMOND_50);
		}

		private function onClickBuy1(event : MouseEvent) : void {
			PurchaseItem(HB_PremiumConstants.ITEM_DIAMOND_10);
		}
		
		private function PurchaseItem(m:MetaExternalPremiumItem):void {
			if(ExternalAPIManager.premiumAPI.mustShowPurchasePopup && ExternalAPIManager.premiumAPI.GetItemCostGold(m) > ExternalAPIManager.premiumAPI.myGold) {
				TextFactory.instance.ReplaceTextFromIdOnAllLang("[x]", ExternalAPIManager.premiumAPI.goldCurrencyName, HB_TextFactory.ID_AUTO_NOT_ENOUGH_PREMIUM_CASH);
				Main.ShowMsgBox(HB_TextFactory.ID_AUTO_NOT_ENOUGH_PREMIUM_CASH, new Callback(onClickYes, this, [m]), new Callback(onClickNo, this, null));
			} else {
				ExternalAPIManager.premiumAPI.ShowItem(m);
			}
		}

		private function onClickYes(m:MetaExternalPremiumItem):void {
			ExternalAPIManager.premiumAPI.ShowStore();
		}
		
		private function onClickNo():void {
			
		}
		
		
		private function onClickChallenge(event : MouseEvent) : void {
			var challenge:ChallengeScreen = ChallengeScreen(ScreenManager.instance.ShowScreen(HB_ScreenFactory.ID_CHALLENGE_SCREEN));
			challenge.SetLastScreen(lastScreen);
			Close(true); 
		}

		private function onClickExit(event : MouseEvent) : void {
			CloseToScreen(lastScreen);
		}

		override public function ShowIdle(context : MainGame) : void {
			super.ShowIdle(context);
			gsOnly.visible = !ExternalAPIManager.premiumAPI.loggedIn;
		}

		override public function CreateVisual() : Animation {
			return AnimationManager.instance.CreateAnimation(HB_AnimationFactory.ID_DIAMOND_SCREEN);
		}
		
		private function get gsOnly():MovieClip { return MovieClip(panel.getChildByName("gsOnly")); }
		private function get connectBtn():Button { return Button(gsOnly.getChildByName("connectBtn")); }
		private function get challengeBtn():Button { return Button(panel.getChildByName("challengeBtn")); }
		private function get buy1Btn():Button { return Button(panel.getChildByName("buy1Btn")); }
		private function get buy2Btn():Button { return Button(panel.getChildByName("buy2Btn")); }
		private function get buy3Btn():Button { return Button(panel.getChildByName("buy3Btn")); }
		private function get exitBtn():Button { return Button(panel.getChildByName("exitBtn")); }
		
		private function get premiumItemStore():MovieClip { return MovieClip(panel.getChildByName("premiumItemStore")); }
		
		private function get premiumItemStoreDiamond1Btn():MovieClip { return MovieClip(premiumItemStore.getChildByName("diamond1")); }
		private function get premiumItemStoreDiamond2Btn():MovieClip { return MovieClip(premiumItemStore.getChildByName("diamond2")); }
		private function get premiumItemStoreDiamond3Btn():MovieClip { return MovieClip(premiumItemStore.getChildByName("diamond3")); }
		private function get premiumItemStoreDiamond1Label():TextField { return TextField(premiumItemStore.getChildByName("AUTO_7")); }
		private function get premiumItemStoreDiamond2Label():TextField { return TextField(premiumItemStore.getChildByName("AUTO_9")); }
		private function get premiumItemStoreDiamond3Label():TextField { return TextField(premiumItemStore.getChildByName("AUTO_11")); }
		
		private function get premiumItemStoreBuy1Btn():MovieClip { return MovieClip(premiumItemStore.getChildByName("buy1Btn")); }
		private function get premiumItemStoreBuy2Btn():MovieClip { return MovieClip(premiumItemStore.getChildByName("buy2Btn")); }
		private function get premiumItemStoreBuy3Btn():MovieClip { return MovieClip(premiumItemStore.getChildByName("buy3Btn")); }
		
		private function get premiumItemStoreItem1Price():TextField { return TextField(premiumItemStore.getChildByName("AUTO_6")); }
		private function get premiumItemStoreItem2Price():TextField { return TextField(premiumItemStore.getChildByName("AUTO_8")); }
		private function get premiumItemStoreItem3Price():TextField { return TextField(premiumItemStore.getChildByName("AUTO_10")); }
		private function get premiumItemStoreMyDiamondsTxt():TextField { return TextField(premiumItemStore.getChildByName("myDiamondsTxt")); }
		
		private function get premiumStoreView():MovieClip { return MovieClip(premiumItemStore.getChildByName("premiumStoreView")); }

		
		private function get sponsorPromo():MovieClip { return MovieClip(panel.getChildByName("sponsorPromo")); }
		private function get sponsorPromoBulleGeek():MovieClip { return MovieClip(sponsorPromo.getChildByName("bulleGeek")); }
		private function get sponsorPromoBulleGeekbulle():MovieClip { return MovieClip(sponsorPromoBulleGeek.getChildByName("bulle")); }
		private function get sponsorPromoBulleGeekbulleAUTO_0():TextField { return TextField(sponsorPromoBulleGeekbulle.getChildByName("AUTO_0")); }
		private function get sponsorPromoSponsor():MovieClip { return MovieClip(sponsorPromo.getChildByName("sponsor")); }
		
	}
}
