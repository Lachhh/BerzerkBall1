package com.homerun.screens {
	import com.homerun.screens.view.distribution.SponsorLogoView;
	import com.homerun.Main;
	import com.homerun.factories.HB_AnimationFactory;
	import com.homerun.io.HB_GamePrefs;
	import com.homerun.multilingual.HB_TextFactory;
	import com.lachhhEngine.games.Game;
	import com.lachhhEngine.games.animation.Animation;
	import com.lachhhEngine.games.animation.AnimationManager;
	import com.lachhhEngine.games.meta.MetaObject;
	import com.lachhhEngine.games.screens.ScreenManager;
	import com.lachhhEngine.interfaces.forms.Button;
	import com.lachhhEngine.io.Callback;
	import com.lachhhEngine.io.files.FileManager;
	import com.lachhhEngine.io.files.GamePrefs;
	import com.lachhhEngine.multilingual.TextFactory;

	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.text.TextField;

	/**
	 * @author Lachhh
	 */
	public class OptionsScreen extends HB_Screen {
		private var _sponsorView:SponsorLogoView;
		override public function Init(metaObject : MetaObject, context : Game) : void {
			super.Init(metaObject, context);
			_sponsorView = new SponsorLogoView(sponsorOptions);
			InitButton(musicSelector);
			InitButton(sfxSelector);
			InitButton(qualitySelector);
			InitButton(languageSelector);
			InitButton(seasonSelector);
			Refresh();
			
			exitBtn.addEventListener(MouseEvent.MOUSE_DOWN, onClickExit);
			saveBtn.addEventListener(MouseEvent.MOUSE_DOWN, onClickSave);
			controlsBtn.addEventListener(MouseEvent.MOUSE_DOWN, onClickControls);
			deleteAllBtn.addEventListener(MouseEvent.MOUSE_DOWN, onClickDelete);
			
			InitOkBtn(exitBtn);
			InitOkBtn(saveBtn);
			InitOkBtn(deleteAllBtn);
			InitOkBtn(controlsBtn);
			state = STATE_IDLE;
			
			_sponsorView.Refresh();
		}
		
		override public function RemoveListeners() : void {
			super.RemoveListeners();
			DestroyButton(musicSelector);
			DestroyButton(sfxSelector);
			DestroyButton(qualitySelector);
			DestroyButton(languageSelector);
			DestroyButton(seasonSelector);			
			exitBtn.removeEventListener(MouseEvent.MOUSE_DOWN, onClickExit);
			saveBtn.removeEventListener(MouseEvent.MOUSE_DOWN, onClickSave);
			controlsBtn.removeEventListener(MouseEvent.MOUSE_DOWN, onClickControls);
			deleteAllBtn.removeEventListener(MouseEvent.MOUSE_DOWN, onClickDelete);
			_sponsorView.Destroy();
		}
		
		private function onClickControls(event : MouseEvent) : void {
			ScreenManager.instance.ShowScreen(HB_ScreenFactory.ID_CONTROL_SCREEN);
		}

		
		protected function InitButton(b:MovieClip):void {
			GetPrevOfButton(b).addEventListener(MouseEvent.MOUSE_DOWN, onClickPrev);
			GetNextOfButton(b).addEventListener(MouseEvent.MOUSE_DOWN, onClickNext);
			InitOkBtn(GetPrevOfButton(b));
			InitOkBtn(GetNextOfButton(b));
		}
		
		private function onClickNext(event : MouseEvent) : void {
			Next(event.target as MovieClip);
		}

		private function onClickPrev(event : MouseEvent) : void {
			Prev(event.target as MovieClip);
		}	
			
		protected function onClickExit(event : MouseEvent) : void {
			
		}
		
		protected function onClickSave(event : MouseEvent) : void {
			
		}
		
		private function onClickDelete(event : MouseEvent) : void {
			DeleteAll1();
		}
		
		private function DeleteAll1():void {
			Main.ShowMsgBox(HB_TextFactory.ID_QUESTION_DELETE_ALL1, new Callback(DeleteAll2, this, null), new Callback(CancelDelete, this, null));	
		}
		
		private function DeleteAll2():void {
			Main.ShowMsgBox(HB_TextFactory.ID_QUESTION_DELETE_ALL2, new Callback(DeleteAll3, this, null), new Callback(CancelDelete, this, null));	
		}
		
		private function DeleteAll3():void {
			Main.ShowMsgBox(HB_TextFactory.ID_QUESTION_DELETE_ALL3, new Callback(DeleteAllConfirmed, this, null), new Callback(CancelDelete, this, null));	
		}
		
		private function DeleteAllConfirmed():void {
			Main.ShowMsgBox(HB_TextFactory.ID_QUESTION_DELETE_ALL4_YES, new Callback(onMsgDeleteConfirmedClose, this, null), null, 24, QuestionBoxScreen.TYPE_OK);
			FileManager.instance.Clear();
			FileManager.instance.SaveToExternalAPI();
			FileManager.instance.SelectNewGameProgress(0);	
		}
		
		private function CancelDelete():void {
			Main.ShowMsgBox(HB_TextFactory.ID_QUESTION_DELETE_ALL4_NO);
		}
		
		protected function onMsgDeleteConfirmedClose():void {
			//Do stuff
		}
		
		protected function DestroyButton(b:MovieClip):void {
			GetPrevOfButton(b).removeEventListener(MouseEvent.MOUSE_DOWN, onClickPrev);
			GetNextOfButton(b).removeEventListener(MouseEvent.MOUSE_DOWN, onClickNext);
		}
				
		override public function Refresh():void {
			var onTxt:String = TextFactory.instance.GetMsg(HB_TextFactory.ID_SETTINGS_ON);
			var offTxt:String = TextFactory.instance.GetMsg(HB_TextFactory.ID_SETTINGS_OFF);
			var lowTxt:String = TextFactory.instance.GetMsg(HB_TextFactory.ID_SETTINGS_LOW);
			var medTxt:String = TextFactory.instance.GetMsg(HB_TextFactory.ID_SETTINGS_MED);
			var highTxt:String = TextFactory.instance.GetMsg(HB_TextFactory.ID_SETTINGS_HIGH);
			
			GetTextOfButton(musicSelector).text = (FileManager.instance.gamePrefs.musicOn ? onTxt : offTxt);
			GetTextOfButton(sfxSelector).text = (FileManager.instance.gamePrefs.soundOn ? onTxt : offTxt);
			
			switch (FileManager.instance.gamePrefs.quality) {
				case GamePrefs.QUALITY_LOW : GetTextOfButton(qualitySelector).text = lowTxt; break;
				case GamePrefs.QUALITY_MED: GetTextOfButton(qualitySelector).text = medTxt; break;
				case GamePrefs.QUALITY_HIGH : GetTextOfButton(qualitySelector).text = highTxt; break;  	
			}
			/*
			switch (FileManager.instance.gamePrefs.language) {
				case TextFactory.instance.LANGUAGE_EN.locale :	GetTextOfButton(languageSelector).text = enTxt; break;
				case TextFactory.instance.LANGUAGE_FR.locale :	GetTextOfButton(languageSelector).text = frTxt; break;
				case TextFactory.instance.LANGUAGE_CN.locale :	GetTextOfButton(languageSelector).text = cnTxt; break;  	
			}
			*/
			
			GetTextOfButton(languageSelector).text = TextFactory.instance.language.fullName;
			
			switch (HB_GamePrefs(FileManager.instance.gamePrefs).seasonId) {
				case HB_GamePrefs.SEASON_RANDOM : GetTextOfButton(seasonSelector).text = TextFactory.instance.GetMsg(HB_TextFactory.ID_SETTINGS_RANDOM); break;
				case HB_GamePrefs.SEASON_FALLS : GetTextOfButton(seasonSelector).text = TextFactory.instance.GetMsg(HB_TextFactory.ID_SETTINGS_FALLS); break;
				case HB_GamePrefs.SEASON_WINTER : GetTextOfButton(seasonSelector).text = TextFactory.instance.GetMsg(HB_TextFactory.ID_SETTINGS_WINTER); break;
				case HB_GamePrefs.SEASON_SUMMER : GetTextOfButton(seasonSelector).text = TextFactory.instance.GetMsg(HB_TextFactory.ID_SETTINGS_SUMMER); break;
				case HB_GamePrefs.SEASON_SPRING : GetTextOfButton(seasonSelector).text = TextFactory.instance.GetMsg(HB_TextFactory.ID_SETTINGS_SPRING); break;
			} 
		}
		
		private function Prev(b:MovieClip):void {
			switch(b.parent) {
				case musicSelector:	FileManager.instance.gamePrefs.ToggleMusic(); break;
				case sfxSelector: FileManager.instance.gamePrefs.ToggleSound(); break;
				case qualitySelector: FileManager.instance.gamePrefs.PrevQuality(); break;
				case languageSelector: HB_GamePrefs(FileManager.instance.gamePrefs).PrevLanguage(); break;
				case seasonSelector: HB_GamePrefs(FileManager.instance.gamePrefs).PrevSeason(); break;
			}
			
			if(FileManager.instance.gamePrefs.quality == GamePrefs.QUALITY_LOW) FileManager.instance.gamePrefs.PrevQuality();
			
			Refresh();
		}
		
		private function Next(b:MovieClip):void {
			switch(b.parent) {
				case musicSelector:	FileManager.instance.gamePrefs.ToggleMusic(); break;
				case sfxSelector: FileManager.instance.gamePrefs.ToggleSound(); break;
				case qualitySelector: FileManager.instance.gamePrefs.NextQuality(); break;
				case languageSelector: HB_GamePrefs(FileManager.instance.gamePrefs).NextLanguage(); break;
				case seasonSelector: HB_GamePrefs(FileManager.instance.gamePrefs).NextSeason(); break;	
			}
			if(FileManager.instance.gamePrefs.quality == GamePrefs.QUALITY_LOW) FileManager.instance.gamePrefs.NextQuality();
			Refresh();	
		}

		protected function GetNextOfButton(b:MovieClip):MovieClip {return MovieClip(b.getChildByName("nextBtn"));}
		protected function GetPrevOfButton(b:MovieClip):MovieClip {return MovieClip(b.getChildByName("prevBtn"));}
		protected function GetTextOfButton(b:MovieClip):TextField {return TextField(b.getChildByName("txt"));}		
		
		protected function get musicSelector():MovieClip {return MovieClip(panel.getChildByName("musicSelector"));}
		protected function get sfxSelector():MovieClip {return MovieClip(panel.getChildByName("sfxSelector"));}		
		protected function get qualitySelector():MovieClip {return MovieClip(panel.getChildByName("qualitySelector"));}
		protected function get languageSelector():MovieClip {return MovieClip(panel.getChildByName("languageSelector"));}
		protected function get seasonSelector():MovieClip {return MovieClip(panel.getChildByName("seasonSelector"));}
		protected function get sponsorOptions():MovieClip {return MovieClip(panel.getChildByName("sponsorOptions"));}
		
				
		override public function CreateVisual() : Animation {
			return AnimationManager.instance.CreateAnimation(HB_AnimationFactory.ID_OPTION_SCREEN);
		}
		
		protected function get exitBtn():Button { return Button(panel.getChildByName("exitBtn")); }
		protected function get saveBtn():Button { return Button(panel.getChildByName("saveBtn")); }
		protected function get controlsBtn():Button { return Button(panel.getChildByName("controlsBtn")); }
		
		protected function get deleteAllBtn():Button { return Button(panel.getChildByName("deleteAllBtn")); }
	}
}
