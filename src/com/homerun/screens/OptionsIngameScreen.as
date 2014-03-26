package com.homerun.screens {
	import com.homerun.Main;
	import com.lachhhEngine.games.Game;
	import com.lachhhEngine.games.MainGame;
	import com.lachhhEngine.games.meta.MetaObject;
	import com.lachhhEngine.games.screens.ScreenManager;
	import com.lachhhEngine.io.Callback;
	import com.lachhhEngine.io.files.FileManager;

	import flash.events.MouseEvent;

	/**
	 * @author Lachhh
	 */
	public class OptionsIngameScreen extends OptionsScreen {	
		private var _destroyCalled:Boolean ;
		private var _wait:Number = 1;
		private var _context:Game;
		private var _idScreen:int = -1;
		private var _onClose:Callback ;
		override public function Init(metaObject : MetaObject, context : Game) : void {
			super.Init(metaObject, context);
			_destroyCalled = false;
			_wait = 1;
			_context = context;
			_idScreen = -1;
			deleteAllBtn.visible = false;
		}
		
		public function SetExitScreen(id:int):void {
			_idScreen = id;	
		}
		
		public function SetCloseCallback(c:Callback):void {
			_onClose = c;
		}
		
		override protected function onClickExit(event : MouseEvent) : void {
			super.onClickExit(event);
			CloseOptions();	
		}

		override protected function onMsgDeleteConfirmedClose() : void {
			super.onMsgDeleteConfirmedClose();
			CloseOptions();
		}

		public function CloseOptions():void {
			Close(true, _onClose);
			if(_idScreen != -1) {
				ScreenManager.instance.ShowScreen(_idScreen);
			}
		}
		
		override protected function onClickSave(event : MouseEvent) : void {
			super.onClickSave(event);
			FileManager.instance.SaveToExternalAPI();
			Close(false, new Callback(GotoMain, this, null));
		}
		
		private function GotoMain():void {
			if(_destroyCalled) return ;
			_context.DestroyAfterUpdate();
			_destroyCalled = true;	
		}
		

		override public function Update(context : MainGame) : void {
			super.Update(context);
			if(_destroyCalled && !context.game.isInit) {
				if(_wait <= 0) {
					Main(context).ClearAllCaches();
					ScreenManager.instance.RemoveScreen(this);
					ScreenManager.instance.ShowScreen(HB_ScreenFactory.ID_TITLE_SCREEN);
				}
				_wait -= context.game.speedManager.GetSpeed();
			}	
		}
	}
}
