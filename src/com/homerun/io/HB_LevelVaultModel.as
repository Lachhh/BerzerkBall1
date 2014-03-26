package com.homerun.io {
	import com.lachhhEngine.io.Callback;
	import com.lachhhEngine.io.encryption.SecureNumber;
	import com.lachhhEngine.io.externalAPI.ExternalAPIManager;
	import com.lachhhEngine.io.externalAPI.GamerSafeController;
	import com.lachhhEngine.io.externalAPI.dataSharingAPI.fields.MetaCustomFieldNumber;
	import com.lachhhEngine.io.externalAPI.dataSharingAPI.fields.MetaCustomFieldString;
	import com.lachhhEngine.io.externalAPI.dataSharingAPI.levelVault.LevelVaultSharedData;
	import com.lachhhEngine.io.externalAPI.dataSharingAPI.queries.MetaSharedDataQuerySort;

	/**
	 * @author Lachhh
	 */
	public class HB_LevelVaultModel {
		//http://hoah.org/uploads/lachhh
		//http://levelvault.heimburg.com/services/LevelVaultAPI.php?debug=expiring
		
		static public const ATT_AUTHOR:String = "AUTHOR";
		static public const ATT_DAILY:String = "DAILY";
		static public const ATT_WEEKLY:String = "WEEKLY";
		static public const ATT_ALL_TIME:String = "ALL_TIME";
		static public const ATT_DEBUG:String = "FRIENDS";
		static public const ATT_HAS_CHALLENGED:String = "HASCHALLENGED_";
		static public const ATT_DATE_PLAYED:String = "DATE_PLAYED";
		
		static private var _dailyScores:Array ;
		static private var _weeklyScores:Array ;
		static private var _alltimeScores:Array ;
		static private var _friends:Array ;
		
		static private var _myCode:String ;
		
		static private var _myScore:LevelVaultSharedData ;
		static private var _myChallenge:LevelVaultSharedData ; // Challenge loadé par le string dans le url.
		static private var _sort:MetaSharedDataQuerySort = new MetaSharedDataQuerySort();
		
		static private var _myDaily:int = -1;
		static private var _myWeekly:int = -1;
		static private var _myAlltime:int = -1;
		
		static private var _onRetreiveFriends:Callback ;
		static private var _onRetreiveDailyScore:Callback ;
		static private var _onRetreiveWeeklyScore:Callback ;
		static private var _onRetreiveAllTimeScore:Callback ;
		static private var _onRetreiveChallenge:Callback ;
		static private var _onRetreiveMyInfo:Callback ;
		static private var _onRetreiveMyInfoMissing:Callback ;
		
		static private var _numDayPlayed:SecureNumber = new SecureNumber();
		static private function onError():void {
			trace("Level Vault Error !!!");
		}
		
		static public function InitGameInfo():void {
			if(gamerSafeController == null) return ;
			_sort.ascending = false;
			_sort.limit = 5;
			_sort.offset = 0;			
			gamerSafeController.SetPersistentErrorCallback(new Callback(onError, HB_LevelVaultModel, null));
			
			gamerSafeController.GetLevelsFromNumericKey(ATT_DAILY, 1, int.MAX_VALUE, _sort, new Callback(onEndDaily, HB_LevelVaultModel, null), null);
			gamerSafeController.GetLevelsFromNumericKey(ATT_WEEKLY, 1, int.MAX_VALUE, _sort, new Callback(onEndWeekly, HB_LevelVaultModel, null), null);
			gamerSafeController.GetLevelsFromNumericKey(ATT_ALL_TIME, 1, int.MAX_VALUE, _sort, new Callback(onEndAllTime, HB_LevelVaultModel, null), null);

		}
		
		static public function InitMyInfo(code:String):void {
			if(gamerSafeController == null) return ;
			if(!gamerSafeController.loggedIn) return ;
			_myCode = code;
			CheckAndCreateMyLevel();
		}
		
		static public function CleanData():void {
			if(gamerSafeController == null) return ;
			gamerSafeController.ClearLevelVaultQueue();
			
			var test:MetaSharedDataQuerySort = new MetaSharedDataQuerySort();
			test.limit = 999;
			test.offset = 0;
			
			gamerSafeController.GetLevelsFromStringKey(ATT_DEBUG, "null", test, new Callback(onEndClean, HB_LevelVaultModel, null), null);
		}
		
		static private function onEndClean(a:Array):void {
			if(gamerSafeController == null) return ;
			//Delete all others pas rapport
			for (var i:int = 0 ; i < a.length ; i++) {
				var d:LevelVaultSharedData = a[i];
				gamerSafeController.DestroyLevel(d.id, new Callback(onEndDestroyLevel, HB_LevelVaultModel, null), null);
			}	
			//CreateMyLevel();
			//CreateRandomScore();
		}
		
		static private function InitFriends():void {
			if(gamerSafeController == null) return ;
			if(_myScore == null) return;
			gamerSafeController.GetLevelsFromNumericKey(ATT_HAS_CHALLENGED + myName, 0, int.MAX_VALUE, _sort, new Callback(onEndFriends, HB_LevelVaultModel, null), null);
		}
		
		static private function InitDatePlayed():void {
			if(gamerSafeController == null) return ;
			if(datePlayed == null) {
				gamerSafeController.SetStringAttribute(_myScore.id, ATT_DATE_PLAYED, today, new Callback(onDatePlayedEdit, HB_LevelVaultModel, null), null);
				_numDayPlayed.value = 1;
				return;
			}
			var datePlayedArray:Array = datePlayed.split(",");
			var found:Boolean = false;
			for (var i:int = 0 ; i < datePlayedArray.length ; i++) {
				var aDate:String = datePlayedArray[i];
				if(aDate == today) {
					found = true;
				}
				
				if(aDate == "0") {
					datePlayedArray.splice(i,1);
					i--;
				}
			}
			
			_numDayPlayed.value = datePlayedArray.length;
			if(!found) {
				var newDatePlayed:String = today; 
				if(datePlayed == "") {
					newDatePlayed = today;
					_numDayPlayed.value = 1;
				} else {
					newDatePlayed = datePlayed + "," + today;
					_numDayPlayed.value = datePlayedArray.length+1;
				}	
				gamerSafeController.SetStringAttribute(_myScore.id, ATT_DATE_PLAYED, newDatePlayed, new Callback(onDatePlayedEdit, HB_LevelVaultModel, null), null);
			}
			
		}
		
		static private function onDatePlayedEdit():void {
			trace("Date played updated");
		}
	

		static public function SendNewScore(score:int):void {
			if(gamerSafeController == null) return ;
			if(!gamerSafeController.loggedIn) return ;
			var c:Callback = new Callback(onScoreSent, HB_LevelVaultModel, null);
			
			var keys:Array = [];
			var values:Array = [];
			var expires:Array = [];
			
			if(_myScore != null) {
				if(myDaily < score) {
					keys.push(ATT_DAILY);
					values.push(score);
					expires.push(today);
					_myDaily = score;
				}
				
				if(myWeekly < score) {
					keys.push(ATT_WEEKLY);
					values.push(score);
					expires.push(thisWeek);
					_myWeekly = score;
				}
				
				if(myAlltime < score) {
					keys.push(ATT_ALL_TIME);
					values.push(score);
					expires.push(null);
					_myAlltime = score;
				}
				
				if(keys.length > 0) {
					gamerSafeController.SetExpiringNumericAttributes(_myScore.id, keys, values, expires, c, null);	
				} else {
					InitGameInfo();	
				}
			} else {
				if(onRetreiveMyInfoMissing != null) onRetreiveMyInfoMissing.DoCallback();
				InitGameInfo();
			} 
		}
		
		static private function onScoreSent():void {
			trace("Score Sent ") ;
			InitGameInfo();
			//InitMyInfo(_myCode);	
		}
		
		static private function onEndDaily(a:Array): void {
			trace("Daily Loaded") ;	
			_dailyScores = a;
			if(_onRetreiveDailyScore != null) _onRetreiveDailyScore.DoCallback();  
		}
		static private function onEndWeekly(a:Array):void {
			trace("Weekly Loaded") ; 
			_weeklyScores = a; 
			if(_onRetreiveWeeklyScore != null) _onRetreiveWeeklyScore.DoCallback();
		}
		static private function onEndAllTime(a:Array):void {
			trace("Alltime Loaded") ; 
			_alltimeScores = a;
			if(_onRetreiveAllTimeScore != null) _onRetreiveAllTimeScore.DoCallback(); 
		}
		
		static private function onEndFriends(a:Array):void {
			trace("Frinds Loaded") ; 
			_friends = a;
			if(_onRetreiveFriends != null) _onRetreiveFriends.DoCallback(); 
		}

		
		/*static public function CreateRandomScore():void {
			var m:MetaChallenge = new MetaChallenge();
			m.quoteBefore0 = "Woah that game is cool !";
			m.quoteBefore1 = "Seriously dude wow";
			m.quoteBefore2 = "Yippie !";
			m.quoteBefore3 = "I'm mister random";
			m.quoteBefore4 = "You are cool";
			m.quoteAfter0 = "Woohoo !";
			m.quoteAfter1 = "Yeah!";
			m.quoteAfter2 = "Random msg";
			m.quoteAfter3 = "You are coolerer";
			m.quoteAfter4 = "Yippie"; 
			for (var i:int = 0 ; i < 5 ; i++) {
				var result:Array = new Array() ;
				result.push(new GamerSafeLevelVaultStringAttribute(ATT_AUTHOR, "Monsieur no"+(i+1)));
				result.push(new GamerSafeLevelVaultStringAttribute(ATT_FRIENDS, "null"));
				result.push(new GamerSafeLevelVaultNumericAttribute(ATT_DAILY, (i+1)*5000, 0));
				result.push(new GamerSafeLevelVaultNumericAttribute(ATT_WEEKLY, (i + 1) *10000, 0));
				result.push(new GamerSafeLevelVaultNumericAttribute(ATT_ALL_TIME, (i+1)*15000, 0));
			
				gamerSafeController.CreateLevel(m.Encode(), result, new Callback(onEndCreate, HB_LevelVaultController, null));
			}  	
		}*/
		
		static public function SetHasChallenged(author:String, score:int):void {
			if(gamerSafeController == null) return ;
			if(_myScore == null) return ;
			gamerSafeController.SetExpiringNumericAttribute(_myScore.id, ATT_HAS_CHALLENGED + author, score, null, new Callback(onSendInHisFace, HB_LevelVaultModel, null), null);
		}
		
		static private function onSendInHisFace():void {
			trace("In His Face Set : (Has Challenged set)");	
		}
		
		static public function CheckAndCreateMyLevel():void {
			if(gamerSafeController == null) return ;
			gamerSafeController.GetLevelsFromStringKey(ATT_AUTHOR, gamerSafeController.playerName, _sort, new Callback(onEndCheck, HB_LevelVaultModel, [null]), null);	
		}
		
		static private function onEndCheck(a:Array):void {
			if(gamerSafeController == null) return ;
			if(a == null || a.length <= 0) {
				CreateMyLevel(_myCode);
				return ;
			}
			
			_myScore = a[0];
			InitFriends();
			InitDatePlayed();
			
			if(onRetreiveMyInfo != null) onRetreiveMyInfo.DoCallback();
			trace("_myScore Set");
			
			//Delete all others pas rapport
			for (var i:int = 1 ; i < a.length ; i++) {
				var d:LevelVaultSharedData = a[i];
				gamerSafeController.DestroyLevel(d.id, new Callback(onEndDestroyLevel, HB_LevelVaultController, null), null);
			}
		}
		
		
		static private function onEndDestroyLevel():void {
			trace("LevelDestroyed");	
		}
		
		static public function EditMyChallenge(code:String):void {
			if(gamerSafeController == null) return ;
			if(_myScore == null) {
				CreateMyLevel(code);
			} else {
				gamerSafeController.EditLevel(code, _myScore.id, new Callback(onEndEdit, HB_LevelVaultModel, null), null);	
			}
		}
		
		static private function onEndEdit():void {
			trace("Edit Level Done");
		}
		
		static private function onEndCheckForEdit(a:Array):void {
			if(a == null || a.length <= 0) {
				CreateMyLevel(_myCode);
				return ;
			}
			_myScore = a[0];
			InitFriends();
		}
		
		static public function CreateMyLevel(code:String):void {
			if(gamerSafeController == null) return ;
			var result:Array = new Array() ;
			
			result.push(new MetaCustomFieldString(ATT_AUTHOR, gamerSafeController.playerName));
			result.push(new MetaCustomFieldString(ATT_DEBUG, "null"));
			result.push(new MetaCustomFieldString(ATT_DATE_PLAYED, ""));
			result.push(new MetaCustomFieldNumber(ATT_DAILY, 0, 0));
			result.push(new MetaCustomFieldNumber(ATT_WEEKLY, 0, 0));
			result.push(new MetaCustomFieldNumber(ATT_ALL_TIME, 0, 0));
			
			gamerSafeController.CreateLevel(code, result, new Callback(CheckAndCreateMyLevel, HB_LevelVaultModel, null), null);
			//HB_GameProgress.gameProgress.metaMyChallenge.Encode()	
		}		
		 
		static private function onEndCreate():void {
			trace("Level Created !");
		}		
		
		static public function LoadChallengeOf(author:String):void {
			if(gamerSafeController == null || !gamerSafeController.connected) return ;
			gamerSafeController.GetLevelsFromStringKey(ATT_AUTHOR, author, _sort, new Callback(onChallengeLoaded, HB_LevelVaultModel, null), null);
		}
		
		static private function onChallengeLoaded(data:Array):void {
			if(data == null || data.length <= 0) {
				return ;
			}
			_myChallenge = data[0];
			if(_onRetreiveChallenge != null) _onRetreiveChallenge.DoCallback(); 
		}		
		
		static private function get gamerSafeController():GamerSafeController {
			return (ExternalAPIManager.premiumAPI) as GamerSafeController;	
		}
		
		static public function get dailyScores() : Array {	return _dailyScores;}
		
		static public function get weeklyScores() : Array { return _weeklyScores;}
		
		static public function get alltimeScores() : Array { return _alltimeScores;}
		
		static public function get friends() : Array {	return _friends;}
		
		static public function get myDaily() : int {
			if(_myDaily != -1) return _myDaily;
			if(_myScore == null) return -1;
			if(_myScore.GetCustomFieldFromKey(ATT_DAILY) == null) {
				return -1;
			}
			return int(_myScore.GetCustomFieldFromKey(ATT_DAILY).value);
		}
		
		static public function get myWeekly() : int {
			if(_myWeekly != -1) return _myWeekly;
			if(_myScore == null) return -1;
			if(_myScore.GetCustomFieldFromKey(ATT_WEEKLY) == null) {
				return -1;
			}
			return int(_myScore.GetCustomFieldFromKey(ATT_WEEKLY).value);
		}
		
		static public function get myAlltime() : int {
			if(_myAlltime != -1) return _myAlltime;
			if(_myScore == null) return -1;
			if(_myScore.GetCustomFieldFromKey(ATT_ALL_TIME) == null) {
				return -1;
			}
			return int(_myScore.GetCustomFieldFromKey(ATT_ALL_TIME).value);
		}
		
		static public function get myName() : String {
			if(_myScore == null) return null;
			if(_myScore.GetCustomFieldFromKey(ATT_AUTHOR) == null) {
				return null;
			}
			return String(_myScore.GetCustomFieldFromKey(ATT_AUTHOR).value);  
		}
		
		static public function GetHasChallengedScore(author:String):int {
			if(_myScore == null) return 0;
			if(_myScore.GetCustomFieldFromKey(ATT_HAS_CHALLENGED + author) == null) {
				return 0;
			}
			return int(_myScore.GetCustomFieldFromKey(ATT_HAS_CHALLENGED + author).value);  
		}
		
		static public function get datePlayed() : String {
			if(_myScore == null) return null;
			if(_myScore.GetCustomFieldFromKey(ATT_DATE_PLAYED) == null) {
				return null;
			}
			return String(_myScore.GetCustomFieldFromKey(ATT_DATE_PLAYED).value);  
		}
		
		
		static public function get myChallenge() : LevelVaultSharedData {return _myChallenge;}
		
		static public function get onRetreiveFriends() : Callback {	return _onRetreiveFriends;}
		static public function set onRetreiveFriends(onRetreiveFriends : Callback) : void {_onRetreiveFriends = onRetreiveFriends;}
		static public function get onRetreiveDailyScore() : Callback {return _onRetreiveDailyScore;	}
		static public function set onRetreiveDailyScore(onRetreiveDailyScore : Callback) : void {_onRetreiveDailyScore = onRetreiveDailyScore;}
		static public function get onRetreiveWeeklyScore() : Callback {return _onRetreiveWeeklyScore;}
		static public function set onRetreiveWeeklyScore(onRetreiveWeeklyScore : Callback) : void {_onRetreiveWeeklyScore = onRetreiveWeeklyScore;}
		static public function get onRetreiveAllTimeScore() : Callback {return _onRetreiveAllTimeScore;}
		static public function set onRetreiveAllTimeScore(onRetreiveAllTimeScore : Callback) : void {_onRetreiveAllTimeScore = onRetreiveAllTimeScore;}
		static public function get onRetreiveChallenge() : Callback {return _onRetreiveChallenge;}
		static public function set onRetreiveChallenge(onRetreiveChallenge : Callback) : void {_onRetreiveChallenge = onRetreiveChallenge;}
		static public function get onRetreiveMyInfo() : Callback {return _onRetreiveMyInfo;}
		static public function set onRetreiveMyInfo(onRetreiveMyInfo : Callback) : void {_onRetreiveMyInfo = onRetreiveMyInfo;}
		
		static private function get today():String {
			var dtCurrentToday:Date = gamerSafeController.serverStartingTime;
			//var df:DateFormatter = new DateFormatter();
			//df.formatString = "YYYYMMDD";
			//return df.format(dtCurrentToday);
			return dtCurrentToday.toDateString();	
		}
		
		static private function get thisWeek():String {
			var dtCurrentToday:Date = gamerSafeController.serverStartingTime;
			var dtCurrentThisWeek:Date = new Date(dtCurrentToday.getUTCFullYear(), dtCurrentToday.getMonth(), dtCurrentToday.getDate() -dtCurrentToday.getDay()+8);
			//var df:DateFormatter = new DateFormatter();
			//df.formatString = "YYYYMMDD";
			//return df.format(dtCurrentThisWeek);
			return dtCurrentThisWeek.toDateString();	
		} 		
		
		static public function get myScore() : LevelVaultSharedData {
			return _myScore;
		}
		
		static public function get numDaysPlayed():int {
			return _numDayPlayed.value;
		}
		
		static public function get onRetreiveMyInfoMissing() : Callback {return _onRetreiveMyInfoMissing;}
		static public function set onRetreiveMyInfoMissing(onRetreiveMyInfoMissing : Callback) : void {_onRetreiveMyInfoMissing = onRetreiveMyInfoMissing;}
	}
}
