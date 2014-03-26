package com.homerun.io {
	import com.homerun.meta.ui.challenge.MetaChallenge;
	import com.homerun.meta.ui.highscore.MetaHighscore;
	import com.homerun.meta.ui.highscore.MetaHighscorePanel;
	import com.lachhhEngine.io.Callback;
	import com.lachhhEngine.io.externalAPI.dataSharingAPI.levelVault.LevelVaultSharedData;

	/**
	 * @author Lachhh
	 */
	public class HB_LevelVaultController {
		static private var _dailyScores:MetaHighscorePanel ;
		static private var _weeklyScores:MetaHighscorePanel ;
		static private var _alltimeScores:MetaHighscorePanel ;
		static private var _friends:MetaHighscorePanel = new MetaHighscorePanel(1,5);
		static private var _myChallengerHighscore:MetaHighscore ;
		
		static private var _inMyFaceHighScore:MetaHighscore ;
		
		static private var _showInMyFaceScreen:Boolean ;
		static private var _blockInMyFaceScreen:Boolean ;
		static private var _onceMyInfoRetreived:Callback;
		
		static public function Init():void {
			//Score bidon
			if(_dailyScores == null) {
				_dailyScores = new MetaHighscorePanel(1,5);
				_weeklyScores = new MetaHighscorePanel(1,5);
				_alltimeScores = new MetaHighscorePanel(1,5);
				for (var i:int = 0 ; i < 5 ; i++) {
					var mDaily:MetaChallenge = new MetaChallenge();
					var mWeekly:MetaChallenge = new MetaChallenge();
					var mAllTime:MetaChallenge = new MetaChallenge();
					var metaDailyHighscore:MetaHighscore = new MetaHighscore(-1, "Mr.DailyPhony"+i, mDaily);
					var metaWeekHighscore:MetaHighscore = new MetaHighscore(-1, "Mr.WeeklyPhony"+i, mWeekly);
					var metaAllTimeHighscore:MetaHighscore = new MetaHighscore(-1, "AllTimePhony"+i, mAllTime);
					mWeekly.quoteBefore0 = mAllTime.quoteBefore0 = mDaily.quoteBefore0 = "Woah that game is cool !";
					mWeekly.quoteBefore1 = mAllTime.quoteBefore1 = mDaily.quoteBefore1 = "Seriously dude wow";
					mWeekly.quoteBefore2 = mAllTime.quoteBefore2 = mDaily.quoteBefore2 = "Yippie !";
					mWeekly.quoteBefore3 = mAllTime.quoteBefore3 = mDaily.quoteBefore3 = "I'm mister random";
					mWeekly.quoteBefore4 = mAllTime.quoteBefore4 = mDaily.quoteBefore4 = "You are cool";
					mWeekly.quoteAfter0 = mAllTime.quoteAfter0 = mDaily.quoteAfter0 = "Woohoo !";
					mWeekly.quoteAfter1 = mAllTime.quoteAfter1 = mDaily.quoteAfter1 = "Yeah!";
					mWeekly.quoteAfter2 = mAllTime.quoteAfter2 = mDaily.quoteAfter2 = "Random msg";
					mWeekly.quoteAfter3 = mAllTime.quoteAfter3 = mDaily.quoteAfter3 = "You are coolerer";
					mWeekly.quoteAfter4 = mAllTime.quoteAfter4 = mDaily.quoteAfter4 = "Yippie";
					mDaily.scoreToBeat = 5000*(5-i);
					mWeekly.scoreToBeat = 15000*(5-i);
					mAllTime.scoreToBeat = 25000*(5-i);
					_dailyScores.AddItem(metaDailyHighscore);
					_weeklyScores.AddItem(metaWeekHighscore);
					_alltimeScores.AddItem(metaAllTimeHighscore); 	
				}
			}	
			
			HB_LevelVaultModel.onRetreiveDailyScore = new Callback(InitDaily, HB_LevelVaultController, null);
			HB_LevelVaultModel.onRetreiveWeeklyScore = new Callback(InitWeekly, HB_LevelVaultController, null);
			HB_LevelVaultModel.onRetreiveAllTimeScore = new Callback(InitAllTime, HB_LevelVaultController, null);
			HB_LevelVaultModel.onRetreiveChallenge = new Callback(InitChallenge, HB_LevelVaultController, null);
			HB_LevelVaultModel.onRetreiveFriends = new Callback(InitFriends, HB_LevelVaultController, null);
			HB_LevelVaultModel.onRetreiveMyInfo = new Callback(InitMyInfo, HB_LevelVaultController, null);
			HB_LevelVaultModel.onRetreiveMyInfoMissing = new Callback(RequestToInitMyInfo, HB_LevelVaultController, null);
			
			_showInMyFaceScreen = false;
			_blockInMyFaceScreen = false;
			
			InitDaily();
			InitWeekly();
			InitAllTime();
			InitFriends();
			InitChallenge();
			InitMyInfo();
		}
		
		static public function RequestToInitMyInfo():void {
			if(HB_LevelVaultModel.myScore == null) { 
				HB_LevelVaultModel.InitMyInfo(HB_GameProgress.gameProgress.metaMyChallenge.Encode());
			} 
		}
		
		static public function InitMyInfo():void {
			if(HB_LevelVaultModel.myScore != null) { 
				HB_GameProgress.gameProgress.metaMyChallenge.Decode(HB_LevelVaultModel.myScore.data);
			}
			
			if(_onceMyInfoRetreived != null) {
				_onceMyInfoRetreived.DoCallback();
				_onceMyInfoRetreived = null;
			} 
		}
		
		static private function InitChallenge():void {
			if(HB_LevelVaultModel.myChallenge == null) return ;
			var d:LevelVaultSharedData = HB_LevelVaultModel.myChallenge;
			var m:MetaChallenge = new MetaChallenge();
			var h:MetaHighscore = new MetaHighscore(d.id, String(d.GetCustomFieldFromKey(HB_LevelVaultModel.ATT_AUTHOR).value), m);
			m.Decode(d.data);
			m.scoreToBeat = int(d.GetCustomFieldFromKey(HB_LevelVaultModel.ATT_ALL_TIME).value);
			SetChallengeHighscore(h);
		}
		
		static private function InitDaily():void {
			FeedFromRawData(HB_LevelVaultModel.dailyScores, _dailyScores, HB_LevelVaultModel.ATT_DAILY); 	
		}
		
		static private function InitWeekly():void {
			FeedFromRawData(HB_LevelVaultModel.weeklyScores, _weeklyScores, HB_LevelVaultModel.ATT_WEEKLY); 	
		}
		
		static private function InitAllTime():void {
			FeedFromRawData(HB_LevelVaultModel.alltimeScores, _alltimeScores, HB_LevelVaultModel.ATT_ALL_TIME); 	
		}
		
		static private function InitFriends():void {
			if(HB_LevelVaultModel.friends == null) return ;
			FeedFromRawData(HB_LevelVaultModel.friends, _friends, HB_LevelVaultModel.ATT_HAS_CHALLENGED + myName, HB_LevelVaultModel.friends.length);
			_friends.SortByHighscore();
			/*
			 * 
			 
			if(HB_LevelVaultController.numFriends >= 1) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_27);
			if(HB_LevelVaultController.numFriends >= 10) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_28);
			if(HB_LevelVaultController.numFriends >= 20) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_29);
			 
			 */
		}
		
		static private function FeedFromRawData(data:Array, highscorePanel:MetaHighscorePanel, scoreAtt:String, n:int = 5):void {
			if(data == null) return ;
			highscorePanel.Clear();
			for (var i:int = 0 ; i < n ; i++) {
				var d:LevelVaultSharedData = data[i];
				SetInPanel(d, highscorePanel, scoreAtt, i);
			}
			trace(scoreAtt + " : Feed Complete");
		}
		
		
		static private function SetInPanel(d:LevelVaultSharedData, highscorePanel:MetaHighscorePanel, scoreAtt:String, i:int):void {
			
			if(d != null) {
				var metaChallenge:MetaChallenge = new MetaChallenge();
				metaChallenge.Decode(d.data);
				metaChallenge.scoreToBeat = int(d.GetCustomFieldFromKey(scoreAtt).value);
				var metaHighscore:MetaHighscore = new MetaHighscore(d.id, String(d.GetCustomFieldFromKey(HB_LevelVaultModel.ATT_AUTHOR).value), metaChallenge);
				highscorePanel.AddItem(metaHighscore);
			} else {
				highscorePanel.AddItem(null);
			}
		}
		
		static public function SetChallengeHighscore(h : MetaHighscore) : void {
			_myChallengerHighscore = h;
		}
		
		static public function SetHasChallenged(score:int):void {
			if(_myChallengerHighscore == null) return ;
			if(HB_LevelVaultModel.GetHasChallengedScore(_myChallengerHighscore.name) < score) {
				HB_LevelVaultModel.SetHasChallenged(_myChallengerHighscore.name, score);
			}
		}
		
		static public function GetHasChallengedScore(author:String):int {
			return HB_LevelVaultModel.GetHasChallengedScore(author)	;
		}
		
		
		static public function InHisFace():void {
			_myChallengerHighscore = null;
			_inMyFaceHighScore = null;
		}
		
		static public function CheckForInMyFace():void {
			for (var i:int = _friends.numItems-1 ; i >= 0 ; i--) {
				var h:MetaHighscore = MetaHighscore(_friends.GetAbsolute(i));
				if(h.highscore > myAllTime) {
					_inMyFaceHighScore = h;
					_showInMyFaceScreen = true;
					break;
				}
			}
		} 
		
		static public function get myScoreLoaded() : Boolean {return HB_LevelVaultModel.myScore != null;}
		static public function get myDaily() : int {return HB_LevelVaultModel.myDaily;}
		static public function get myWeekly() : int {return HB_LevelVaultModel.myWeekly;}
		static public function get myAllTime() : int {return HB_LevelVaultModel.myAlltime;}
		static public function get myName() : String {return HB_LevelVaultModel.myName;}
		
		static public function get dailyScores() : MetaHighscorePanel {return _dailyScores;}
		static public function get weeklyScores() : MetaHighscorePanel {return _weeklyScores;}
		static public function get alltimeScores() : MetaHighscorePanel {return _alltimeScores;}
		static public function get friends() : MetaHighscorePanel {return _friends;}
		static public function get numFriends() : int {return _friends.numItems;}
		static public function get numDaysPlayed() : int {return HB_LevelVaultModel.numDaysPlayed;}
		static public function get myChallengerHighscore() : MetaHighscore {return _myChallengerHighscore;}
		
		static public function get showInMyFaceScreen() : Boolean {return _showInMyFaceScreen && !_blockInMyFaceScreen;}
		static public function set showInMyFaceScreen(showInMyFaceScreen : Boolean) : void {_showInMyFaceScreen = showInMyFaceScreen;}
		static public function get inMyFaceHighScore() : MetaHighscore {return _inMyFaceHighScore;}
		
		static public function get blockInMyFaceScreen() : Boolean {return _blockInMyFaceScreen;}
		static public function set blockInMyFaceScreen(blockInMyFaceScreen : Boolean) : void {_blockInMyFaceScreen = blockInMyFaceScreen;
		}
		
		static public function get onceMyInfoRetreived() : Callback {return _onceMyInfoRetreived;}
		static public function set onceMyInfoRetreived(onceMyInfoRetreived : Callback) : void {_onceMyInfoRetreived = onceMyInfoRetreived;}
	}
}
