package com.homerun.screens {
	import com.homerun.factories.HB_SfxFactory;
	import com.lachhhEngine.games.Game;
	import com.lachhhEngine.games.MainGame;
	import com.lachhhEngine.games.draw.CopypixelableBmpData;
	import com.lachhhEngine.games.draw.DrawUtils;
	import com.lachhhEngine.games.meta.MetaObject;
	import com.lachhhEngine.games.screens.OpenCloseScreen;
	import com.lachhhEngine.games.screens.Screen;
	import com.lachhhEngine.games.screens.ScreenManager;
	import com.lachhhEngine.games.sfx.Jukebox;
	import com.lachhhEngine.io.Callback;

	import flash.display.Bitmap;
	import flash.display.MovieClip;

	/**
	 * @author Lachhh
	 */
	public class HB_Screen extends OpenCloseScreen {
		private var _cp : CopypixelableBmpData ;
		private var _bmp : Bitmap ;
		private var _movieClip:MovieClip;
		private var _modeVector:Boolean ;
		private var _lastScreen:int ;		
		

		override public function Init(metaObject : MetaObject, context : Game) : void {
			super.Init(metaObject, context);
			_modeVector = true;
			animation.playChildren = false;
			_movieClip = new MovieClip();
			if(playOpenSound) Jukebox.instance.PlaySound(HB_SfxFactory.randomUiOpen);
		}
		
		public function SetLastScreen(i:int):void {
			_lastScreen = i;
		}

		override public function Destroy() : void {
			super.Destroy();
			SwitchToVector();
		}

		private function DestroyBmp():void {
			if(_bmp != null) {
				_bmp.bitmapData.dispose();
				_bmp = null;	
			}
		}
		
		override public function Idle() : void {
			super.Idle();
			SwitchToVector();
		}

		override public function ShowOpen(context : MainGame) : void {
			super.ShowOpen(context);
			SwitchToBmp();
		}

		override public function Close(remove : Boolean, c : Callback = null, quickClose : Boolean = false) : void {
			super.Close(remove, c, quickClose);
			SwitchToBmp();
			//Jukebox.instance.PlaySound(HB_SfxFactory.ID_SFX_UI_CLOSE1);
		}
		
		private function SwitchToBmp():void {
			if(!_modeVector) return ;
			_modeVector = false;
			
			while(panel.numChildren >0) {
				_movieClip.addChild(panel.getChildAt(0));
			}
			
			_cp = DrawUtils.CreateCopypixelableBmpData(_movieClip, false);
			
			_bmp = new Bitmap(_cp.bmpData);
			_bmp.x = _cp.x ;
			_bmp.y = _cp.y ;
			
			panel.addChild(_bmp);
		}
		
		private function SwitchToVector():void {
			if(_modeVector) return ;
			_modeVector = true;
			panel.removeChild(_bmp);
			DestroyBmp();
			while(_movieClip.numChildren > 0) {
				panel.addChild(_movieClip.getChildAt(0));		
			}
		}
		
		protected function CloseToScreen(idScreen:int):void {
			Close(true);
			if(idScreen != -1) {
				var s:Screen = ScreenManager.instance.ShowScreen(idScreen);
			}	
		}
		
		private function afterClose(id:int):void {
			ScreenManager.instance.ShowScreen(id);
		}
		
		protected function get playOpenSound():Boolean {
			return true;
		}

		override protected function get idleFrame() : int {	return 8;}
		override protected function get closeFrame() : int {return 30;}
		
		public function get lastScreen() : int {
			return _lastScreen;
		}
	}
}
