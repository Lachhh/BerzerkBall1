package com.homerun.screens.view.highscore {
	import com.homerun.init.HB_VersionInfo;
	import com.lachhhEngine.io.externalAPI.ExternalAPIManager;
	import com.lachhhEngine.interfaces.forms.Button;
	import flash.events.Event;
	import com.homerun.meta.ui.highscore.MetaHighscore;
	import com.lachhhEngine.multilingual.TextFactory;
	import com.homerun.multilingual.HB_TextFactory;
	import com.homerun.io.HB_LevelVaultController;
	import com.lachhhEngine.utils.Utils;
	import com.homerun.io.HB_GameProgress;
	import com.homerun.meta.ui.highscore.MetaHighscorePanel;
	import com.homerun.screens.view.ObjectView;
	import com.lachhhEngine.interfaces.forms.ButtonSelect;
	import com.lachhhEngine.interfaces.forms.ButtonSelectGroup;
	import com.lachhhEngine.io.Callback;

	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.text.TextField;

	/**
	 * @author Lachhh
	 */
	public class HighscoreView extends ObjectView {
		private var _btnGroup:ButtonSelectGroup ;
		private var _highscorePlayerView0:HighscorePlayerView ;
		private var _highscorePlayerView1:HighscorePlayerView ;
		private var _highscorePlayerView2:HighscorePlayerView ;
		private var _highscorePlayerView3:HighscorePlayerView ;
		private var _highscorePlayerView4:HighscorePlayerView ;
		private var _metaDailyHighscorePanel:MetaHighscorePanel ;
		private var _metaWeeklyHighscorePanel:MetaHighscorePanel ;
		private var _metaAlltimeHighscorePanel:MetaHighscorePanel ;
		private var _metaMyFriendsHighscorePanel:MetaHighscorePanel ;
		private var _selectedHighscore:MetaHighscorePanel ;
		
		private var _rollOverHighscoreView:HighscorePlayerView;
		
		public function HighscoreView(visual : MovieClip, clickback:Callback) {
			super(visual);
			_btnGroup = new ButtonSelectGroup();
			_btnGroup.AddButton(daily);
			_btnGroup.AddButton(weekly);
			_btnGroup.AddButton(allTime);
			_btnGroup.AddButton(myFriends);
			
			_highscorePlayerView0 = new HighscorePlayerView(highscore0, clickback);
			_highscorePlayerView1 = new HighscorePlayerView(highscore1, clickback);
			_highscorePlayerView2 = new HighscorePlayerView(highscore2, clickback);
			_highscorePlayerView3 = new HighscorePlayerView(highscore3, clickback);
			_highscorePlayerView4 = new HighscorePlayerView(highscore4, clickback);
			daily.addEventListener(MouseEvent.MOUSE_DOWN, onClickOnglet);
			weekly.addEventListener(MouseEvent.MOUSE_DOWN, onClickOnglet);
			allTime.addEventListener(MouseEvent.MOUSE_DOWN, onClickOnglet);
			myFriends.addEventListener(MouseEvent.MOUSE_DOWN, onClickOnglet);
			_rollOverHighscoreView = null;
			
			_highscorePlayerView0.visual.addEventListener(MouseEvent.ROLL_OVER, onRollOverHighscore);
			_highscorePlayerView1.visual.addEventListener(MouseEvent.ROLL_OVER, onRollOverHighscore);
			_highscorePlayerView2.visual.addEventListener(MouseEvent.ROLL_OVER, onRollOverHighscore);
			_highscorePlayerView3.visual.addEventListener(MouseEvent.ROLL_OVER, onRollOverHighscore);
			_highscorePlayerView4.visual.addEventListener(MouseEvent.ROLL_OVER, onRollOverHighscore);
			nobodyChallengeConnect.addEventListener(MouseEvent.MOUSE_DOWN, onClickConnect);
		}

		override public function Destroy() : void {
			super.Destroy();
			daily.removeEventListener(MouseEvent.MOUSE_DOWN, onClickOnglet);
			weekly.removeEventListener(MouseEvent.MOUSE_DOWN, onClickOnglet);
			allTime.removeEventListener(MouseEvent.MOUSE_DOWN, onClickOnglet);
			myFriends.removeEventListener(MouseEvent.MOUSE_DOWN, onClickOnglet);
			_highscorePlayerView0.visual.removeEventListener(MouseEvent.ROLL_OVER, onRollOverHighscore);
			_highscorePlayerView1.visual.removeEventListener(MouseEvent.ROLL_OVER, onRollOverHighscore);
			_highscorePlayerView2.visual.removeEventListener(MouseEvent.ROLL_OVER, onRollOverHighscore);
			_highscorePlayerView3.visual.removeEventListener(MouseEvent.ROLL_OVER, onRollOverHighscore);
			_highscorePlayerView4.visual.removeEventListener(MouseEvent.ROLL_OVER, onRollOverHighscore);
			nobodyChallengeConnect.removeEventListener(MouseEvent.MOUSE_DOWN, onClickConnect);
			
			_highscorePlayerView0.Destroy();
			_highscorePlayerView1.Destroy();
			_highscorePlayerView2.Destroy();
			_highscorePlayerView3.Destroy();
			_highscorePlayerView4.Destroy();
		}
		
		private function onClickConnect(event : MouseEvent) : void {
			ExternalAPIManager.premiumAPI.ShowLogin();
		}

		private function onRollOverHighscore(e:Event):void {
			var hv:HighscorePlayerView = GetViewFromVisual(e.target as MovieClip);
			if(hv != null) {
				if(hv.metaHighscore != null) { 
					_rollOverHighscoreView = hv;
				} else {
					_rollOverHighscoreView = null;
				}
			}
			Refresh(); 
		}
		
		private function onClickOnglet(event : MouseEvent) : void {
			var b:ButtonSelect = event.target as ButtonSelect;
			switch(b) {
				case daily : _selectedHighscore = _metaDailyHighscorePanel; break;
				case weekly : _selectedHighscore = _metaWeeklyHighscorePanel; break;
				case allTime : _selectedHighscore = _metaAlltimeHighscorePanel; break;
				case myFriends : _selectedHighscore = _metaMyFriendsHighscorePanel; break;
			}
			_highscorePlayerView0.SetMetaHighscorePlayer(_selectedHighscore.highscorePlayer0);
			_highscorePlayerView1.SetMetaHighscorePlayer(_selectedHighscore.highscorePlayer1);
			_highscorePlayerView2.SetMetaHighscorePlayer(_selectedHighscore.highscorePlayer2);
			_highscorePlayerView3.SetMetaHighscorePlayer(_selectedHighscore.highscorePlayer3);
			_highscorePlayerView4.SetMetaHighscorePlayer(_selectedHighscore.highscorePlayer4);
			Refresh();
		}

		
		public function SetMetaHighscorePanel(metaDailyHighscorePanel:MetaHighscorePanel, metaWeeklyHighscorePanel:MetaHighscorePanel, metaAlltimeHighscorePanel:MetaHighscorePanel, metaMyFriendsHighscorePanel:MetaHighscorePanel):void {
			_metaDailyHighscorePanel = metaDailyHighscorePanel;
			_metaWeeklyHighscorePanel = metaWeeklyHighscorePanel;
			_metaAlltimeHighscorePanel = metaAlltimeHighscorePanel;
			_metaMyFriendsHighscorePanel = metaMyFriendsHighscorePanel;
			_selectedHighscore = _metaDailyHighscorePanel; 
			_highscorePlayerView0.SetMetaHighscorePlayer(_selectedHighscore.highscorePlayer0);
			_highscorePlayerView1.SetMetaHighscorePlayer(_selectedHighscore.highscorePlayer1);
			_highscorePlayerView2.SetMetaHighscorePlayer(_selectedHighscore.highscorePlayer2);
			_highscorePlayerView3.SetMetaHighscorePlayer(_selectedHighscore.highscorePlayer3);
			_highscorePlayerView4.SetMetaHighscorePlayer(_selectedHighscore.highscorePlayer4);
			Refresh();
		}

		override public function Refresh() : void {
			super.Refresh();
			friendsLabelTxt.visible = false;
			nobodyChallenge.visible = false;
			switch(_selectedHighscore) {
				case _metaDailyHighscorePanel :	
					_btnGroup.SelectButton(daily) ;
					if(HB_LevelVaultController.myScoreLoaded) highscore.text = Utils.PutVirgules(HB_LevelVaultController.myDaily);
					highscoreLabel.text = TextFactory.instance.GetMsg(HB_TextFactory.ID_AUTO_YOUR_DAILY_HIGHSCORE);
					_highscorePlayerView0.canBeat = HB_LevelVaultController.myDaily < _highscorePlayerView0.score;
					_highscorePlayerView1.canBeat = HB_LevelVaultController.myDaily < _highscorePlayerView1.score;
					_highscorePlayerView2.canBeat = HB_LevelVaultController.myDaily < _highscorePlayerView2.score;
					_highscorePlayerView3.canBeat = HB_LevelVaultController.myDaily < _highscorePlayerView3.score;
					_highscorePlayerView4.canBeat = HB_LevelVaultController.myDaily < _highscorePlayerView4.score; 
					break;
				case _metaWeeklyHighscorePanel : 
					_btnGroup.SelectButton(weekly) ;
					if(HB_LevelVaultController.myScoreLoaded) highscore.text = Utils.PutVirgules(HB_LevelVaultController.myWeekly);
					highscoreLabel.text = TextFactory.instance.GetMsg(HB_TextFactory.ID_AUTO_YOUR_WEEKLY_HIGHSCORE);
					_highscorePlayerView0.canBeat = HB_LevelVaultController.myWeekly < _highscorePlayerView0.score;
					_highscorePlayerView1.canBeat = HB_LevelVaultController.myWeekly < _highscorePlayerView1.score;
					_highscorePlayerView2.canBeat = HB_LevelVaultController.myWeekly < _highscorePlayerView2.score;
					_highscorePlayerView3.canBeat = HB_LevelVaultController.myWeekly < _highscorePlayerView3.score;
					_highscorePlayerView4.canBeat = HB_LevelVaultController.myWeekly < _highscorePlayerView4.score; 
					break;
				case _metaAlltimeHighscorePanel : 
					_btnGroup.SelectButton(allTime) ; 
					if(HB_LevelVaultController.myScoreLoaded) highscore.text = Utils.PutVirgules(HB_LevelVaultController.myAllTime);
					highscoreLabel.text = TextFactory.instance.GetMsg(HB_TextFactory.ID_AUTO_YOUR_0);
					_highscorePlayerView0.canBeat = HB_LevelVaultController.myAllTime < _highscorePlayerView0.score;
					_highscorePlayerView1.canBeat = HB_LevelVaultController.myAllTime < _highscorePlayerView1.score;
					_highscorePlayerView2.canBeat = HB_LevelVaultController.myAllTime < _highscorePlayerView2.score;
					_highscorePlayerView3.canBeat = HB_LevelVaultController.myAllTime < _highscorePlayerView3.score;
					_highscorePlayerView4.canBeat = HB_LevelVaultController.myAllTime < _highscorePlayerView4.score;
					break;
				case _metaMyFriendsHighscorePanel : 
					_btnGroup.SelectButton(myFriends) ; 
					
					highscoreLabel.text = TextFactory.instance.GetMsg(HB_TextFactory.ID_AUTO_YOUR_0) + " " + TextFactory.instance.GetMsg(HB_TextFactory.ID_AUTO_AGAINST) + " " + (_rollOverHighscoreView == null ? "..." : _rollOverHighscoreView.name);
					friendsLabelTxt.visible = true;
					_highscorePlayerView0.canBeat = HB_LevelVaultController.GetHasChallengedScore(_highscorePlayerView0.name) < _highscorePlayerView0.score;
					_highscorePlayerView1.canBeat = HB_LevelVaultController.GetHasChallengedScore(_highscorePlayerView1.name) < _highscorePlayerView1.score;
					_highscorePlayerView2.canBeat = HB_LevelVaultController.GetHasChallengedScore(_highscorePlayerView2.name) < _highscorePlayerView2.score;
					_highscorePlayerView3.canBeat = HB_LevelVaultController.GetHasChallengedScore(_highscorePlayerView3.name) < _highscorePlayerView3.score;
					_highscorePlayerView4.canBeat = HB_LevelVaultController.GetHasChallengedScore(_highscorePlayerView4.name) < _highscorePlayerView4.score;
					if(HB_LevelVaultController.myScoreLoaded) {
						if(_rollOverHighscoreView != null) {
							highscore.text = Utils.PutVirgules(HB_LevelVaultController.GetHasChallengedScore(_rollOverHighscoreView.name));
						} else {
							highscore.text = "";
						}
					}
					if(_selectedHighscore.numItems <= 0) {
						nobodyChallenge.visible = true;
						if(!ExternalAPIManager.premiumAPI.loggedIn) {
							nobodyChallengeDesc.text = TextFactory.instance.GetMsg(HB_TextFactory.ID_AUTO_CONNECT_ON_GS_HIGHSCORE);
							nobodyChallengeConnect.visible = true;
							nobodyChallengeLink.visible = false;
						} else {
							nobodyChallengeDesc.text = TextFactory.instance.GetMsg(HB_TextFactory.ID_AUTO_JUST_0);
							nobodyChallengeConnect.visible = false;
							nobodyChallengeLink.visible = true;
							nobodyChallengeLink.text = HB_VersionInfo.urlChallenge + ExternalAPIManager.premiumAPI.accountName;  
						}
						Utils.SetMaxSizeOfTxtField(nobodyChallengeDesc, 22);
						Utils.SetMaxSizeOfTxtField(nobodyChallengeLink, 12);
					}
					break;	
			}
			
			Utils.SetMaxSizeOfTxtField(highscoreLabel, 30);
			_highscorePlayerView0.Refresh();
			_highscorePlayerView1.Refresh();
			_highscorePlayerView2.Refresh();
			_highscorePlayerView3.Refresh();
			_highscorePlayerView4.Refresh();
			if(!HB_LevelVaultController.myScoreLoaded) {
				highscore.text = Utils.PutVirgules(HB_GameProgress.gameProgress.highdistance);	
			}
		}
		
		private function GetViewFromVisual(mc:MovieClip):HighscorePlayerView {
			if(mc == null) return null;
			if(_highscorePlayerView0.visual == mc) return _highscorePlayerView0;
			if(_highscorePlayerView1.visual == mc) return _highscorePlayerView1;
			if(_highscorePlayerView2.visual == mc) return _highscorePlayerView2;
			if(_highscorePlayerView3.visual == mc) return _highscorePlayerView3;
			if(_highscorePlayerView4.visual == mc) return _highscorePlayerView4;
			return null; 	
		}
		
		private function get daily():ButtonSelect { return ButtonSelect(visual.getChildByName("daily"));}
		private function get weekly():ButtonSelect { return ButtonSelect(visual.getChildByName("weekly"));}
		private function get allTime():ButtonSelect { return ButtonSelect(visual.getChildByName("allTime"));}
		private function get myFriends():ButtonSelect { return ButtonSelect(visual.getChildByName("myFriends"));}
		
		private function get highscore():TextField { return TextField(visual.getChildByName("highscore"));}
		private function get highscore0():MovieClip { return MovieClip(visual.getChildByName("highscore0"));}
		private function get highscore1():MovieClip { return MovieClip(visual.getChildByName("highscore1"));}
		private function get highscore2():MovieClip { return MovieClip(visual.getChildByName("highscore2"));}
		private function get highscore3():MovieClip { return MovieClip(visual.getChildByName("highscore3"));}
		private function get highscore4():MovieClip { return MovieClip(visual.getChildByName("highscore4"));}
		private function get highscoreLabel():TextField { return TextField(visual.getChildByName("AUTO_0"));}
		private function get friendsLabelTxt():TextField { return TextField(visual.getChildByName("friendsLabelTxt"));}
		private function get nobodyChallenge():MovieClip { return MovieClip(visual.getChildByName("nobodyChallenge"));}
		private function get nobodyChallengeDesc():TextField { return TextField(nobodyChallenge.getChildByName("descTxt"));}
		public function get nobodyChallengeConnect():Button { return Button(nobodyChallenge.getChildByName("connectGSBtn"));}
		private function get nobodyChallengeLink():TextField { return TextField(nobodyChallenge.getChildByName("linkTxt"));}
		
	}
}
