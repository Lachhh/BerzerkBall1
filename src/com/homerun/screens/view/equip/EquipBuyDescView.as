package com.homerun.screens.view.equip {
	import com.homerun.init.HB_VersionInfo;
	import com.homerun.Main;
	import com.homerun.constants.HBConstants;
	import com.homerun.factories.HB_SfxFactory;
	import com.homerun.io.AchievementManager;
	import com.homerun.io.HB_GameProgress;
	import com.homerun.meta.ui.MetaGameProgress;
	import com.homerun.meta.ui.equip.MetaEquipWeapon;
	import com.homerun.meta.ui.equip.MetaEquipmentEnum;
	import com.homerun.meta.ui.trophy.MetaTrophyEnum;
	import com.homerun.multilingual.HB_TextFactory;
	import com.homerun.screens.HB_ScreenFactory;
	import com.lachhhEngine.games.screens.FlashScreen;
	import com.lachhhEngine.games.screens.ScreenFactory;
	import com.lachhhEngine.games.screens.ScreenManager;
	import com.lachhhEngine.games.sfx.Jukebox;
	import com.lachhhEngine.interfaces.forms.Button;
	import com.lachhhEngine.io.Callback;
	import com.lachhhEngine.multilingual.TextFactory;
	import com.lachhhEngine.utils.Utils;

	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.text.TextField;

	/**
	 * @author Lachhh
	 */
	public class EquipBuyDescView extends EquipDescView {
		private var _refreshScreen:Callback ;
		public function EquipBuyDescView(visual : MovieClip, refreshScreen:Callback) {
			super(visual);
			buyBtn.addEventListener(MouseEvent.MOUSE_DOWN, onClickBuy);
			_refreshScreen = refreshScreen;
		}

		override public function Destroy() : void {
			super.Destroy();
			buyBtn.removeEventListener(MouseEvent.MOUSE_DOWN, onClickBuy);			
		}
		
		private function onClickBuy(event : MouseEvent) : void {
			if(metaEquip.isPremium) {
				if(myDiamond >= metaEquip.price) {
					BuyAndEquip();
				} else {
					Main.ShowMsgBox(HB_TextFactory.ID_QUESTION_NOT_ENOUGH_DIAMOND);
				}
			} else {
				if(myMoney >= metaEquip.price) {
					HB_GameProgress.gameProgress.cash -= metaEquip.price; 
					BuyAndEquip();
				} else {
					Main.ShowMsgBox(HB_TextFactory.ID_QUESTION_NOT_ENOUGH_MONEY);
				}
			}	
		}
		
		private function BuyAndEquip():void {
			if(metaEquip == MetaEquipmentEnum.EQUIP_XP_PILL) {
				var crntLevel:int = metaProgress.lastSelected.xp.crntLevel; 
				metaProgress.lastSelected.xp.upgradeValue += HBConstants.XP_PILLS_XP_BONUS;
				var f:FlashScreen = FlashScreen(ScreenManager.instance.ShowScreen(ScreenFactory.FLASH_SCREEN));
				f.InitFlash(0xFFFFFF, 5);
				
				if(crntLevel < metaProgress.lastSelected.xp.crntLevel) {
					ScreenManager.instance.ShowScreen(HB_ScreenFactory.ID_QUICK_LVL_UP_SCREEN);
					Jukebox.instance.PlaySound(HB_SfxFactory.ID_SFX_CROWD);
				} else {
					Jukebox.instance.PlaySound(HB_SfxFactory.ID_SFX_LVL_END);
					var str:String = TextFactory.instance.GetMsg(HB_TextFactory.ID_AUTO_XPBONUS_PILL);
					str = str.split("[x]").join(HBConstants.XP_PILLS_XP_BONUS);
					Main.ShowMsgBoxFromString(str);
				}
			} else {
				metaProgress.lastSelected.metaEquipInventory.AddItem(metaEquip);
				metaProgress.lastSelected.Equip(metaEquip);

				if(metaEquip is MetaEquipWeapon && MetaEquipWeapon(metaEquip).idSound != -1) {
					Jukebox.instance.PlaySound(MetaEquipWeapon(metaEquip).idSound);
				} else {
					Jukebox.instance.PlaySound(HB_SfxFactory.ID_SFX_BUY);	
				}
				if(metaProgress.hasBoughtEverythingNonPremium) {
					AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_27);			
				}
				if(metaEquip is MetaEquipWeapon) {
					AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_36);	
				} else {
					AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_35);	
				}
			}
			_refreshScreen.DoCallback();
			
		}

		override public function Refresh() : void {
			super.Refresh();
			if(metaEquip == null) {
				itemNameTxt.text = "---";
				//costTxt.text = "$---";
				buyBtn.visible = false;
			} else {
				//itemNameTxt.text = metaEquip.isLocked ? "?????" : TextFactory.instance.GetMsg(metaEquip.titleId);
				itemNameTxt.text = TextFactory.instance.GetMsg(metaEquip.titleId);
				Utils.SetMaxSizeOfTxtField(itemNameTxt, 24);
				//costTxt.text = "$" + Utils.PutVirgules(metaEquip.price);
				buyBtn.visible = !metaProgress.lastSelected.metaEquipInventory.HasItem(metaEquip);
			}
			
			if(HB_VersionInfo.showPremiumTab) {
				buyBtn.x = 70;
				buyBtn.y = 17;
			} else {
				buyBtn.x = -91.95;
				buyBtn.y = 26.55;
			}
			//myMoneyTxt.text = "$" + Utils.PutVirgules(myMoney) ; 
		}
		
		private function get metaProgress():MetaGameProgress { return HB_GameProgress.gameProgress.metaProgress ; }
		private function get myMoney():int { return HB_GameProgress.gameProgress.cash; }
		private function get myDiamond():int { return HB_GameProgress.gameProgress.diamondTotal; }
	//	private function get myMoneyTxt():TextField { return TextField(visual.getChildByName("myMoneyTxt")); }
		//private function get costTxt():TextField { return TextField(visual.getChildByName("costTxt")); }
		private function get itemNameTxt():TextField { return TextField(visual.getChildByName("itemNameTxt")); }
		private function get buyBtn():Button { return Button(visual.getChildByName("buyBtn")); }
		
		
		
	}
}
