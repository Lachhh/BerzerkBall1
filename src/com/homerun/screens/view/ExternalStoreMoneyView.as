package com.homerun.screens.view {
	import com.lachhhEngine.io.externalAPI.MochiCoinController;
	import com.lachhhEngine.io.externalAPI.ExternalAPIManager;
	import com.lachhhEngine.utils.Utils;

	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.text.TextField;

	/**
	 * @author Lachhh
	 */
	public class ExternalStoreMoneyView extends ObjectView {
		public function ExternalStoreMoneyView(visual : MovieClip) {
			super(visual);
			getMoreBtn.addEventListener(MouseEvent.MOUSE_DOWN, onClickGetMore);
			
		}

		override public function Destroy() : void {
			super.Destroy();
			getMoreBtn.removeEventListener(MouseEvent.MOUSE_DOWN, onClickGetMore);
		}

		private function onClickGetMore(event : MouseEvent) : void {
			ExternalAPIManager.premiumAPI.ShowStore();
		} 	
		
		override public function Refresh() : void {
			super.Refresh();
			visual.visible = ExternalAPIManager.premiumAPI.canShowMyMoney ;
			myMoneyTxt.text =  Utils.PutVirgules(ExternalAPIManager.premiumAPI.myGold);
			goldAcronymTxt.text = ExternalAPIManager.premiumAPI.goldCurrencyName;
			Utils.SetMaxSizeOfTxtField(myMoneyTxt, 22);
			Utils.SetMaxSizeOfTxtField(goldAcronymTxt, 22);
		}
		
		public function Hide():void {
			visual.visible = false;	
		}
		
		public function Show():void {
			visual.visible = true;	
		}
		

		public function get getMoreBtn():MovieClip { return MovieClip(visual.getChildByName("getMoreBtn"));}
		public function get myMoneyTxt():TextField { return TextField(visual.getChildByName("myMoneyTxt"));}
		public function get goldAcronymTxt():TextField { return TextField(visual.getChildByName("goldAcronymTxt"));}
		
		
	}
}
