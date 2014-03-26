package com.homerun.debug {
	import com.homerun.screens.HB_ScreenFactory;
	import com.lachhhEngine.games.screens.ScreenManager;
	import com.homerun.HB_Game;
	import com.hurlant.crypto.prng.ARC4;
	import com.homerun.init.HB_VersionInfo;
	import com.homerun.io.HB_LevelVaultModel;
	import com.lachhhEngine.games.Game;
	import com.lachhhEngine.games.debug.DebugCallback;
	import com.lachhhEngine.games.debug.DebugTree;
	import com.lachhhEngine.games.debug.GameTree;

	/**
	 * @author Lachhh
	 */
	public class HB_Debug {
		static public function Init(context:Game):void {
			GameTree.AddChildWithCallBack(TraceDebug, HB_Debug, context);
			GameTree.AddChildWithCallBack(Challenge, HB_Debug, context);
			GameTree.AddChildWithCallBack(MTVScore, HB_Debug, context);
			GameTree.AddChildWithCallBack(MTVName, HB_Debug, context);
			GameTree.AddDebugCallback(new DebugCallback("nocol", NoCol, HB_Debug, [context]));
			GameTree.AddDebugCallback(new DebugCallback("xp", NoCol, HB_Debug, [context]));
			GameTree.AddDebugCallback(new DebugCallback("cleanLevelVault", CleanLevelVault, HB_Debug, null));
			GameTree.AddDebugCallback(new DebugCallback("stopgeek", StopGeek, HB_Debug, [context]));
			GameTree.AddDebugCallback(new DebugCallback("gamecomplete", GameCompleted, HB_Debug, [context]));
			
		}
		
		static private function NoCol(s:String, context:Game):void {
			//Hero.DEBUG_NO_COLLISION = !Hero.DEBUG_NO_COLLISION; 
		}
		
		static private function StopGeek(s:String, context:Game):void {
			var params:Array = s.split("_");
			var cmd:String = params.shift();
			if(params.length > 0) {
				HB_Game(context).geek.px  = (params.shift())/HB_Game(context).pixelToDistance;	
			}
			
			HB_Game(context).geek.vx = 2 ;
			HB_Game(context).geek.vy = 0 ;
			HB_Game(context).geek.py = -200 ;
		}
		
		static private function GameCompleted(s:String, context:Game):void {
			ScreenManager.instance.ShowScreen(HB_ScreenFactory.ID_GAMECOMPLETED_SCREEN);
		}
		
		static private function CleanLevelVault(s:String, context:Game):void {
			//HB_LevelVaultModel.CleanData();
			HB_LevelVaultModel.InitGameInfo();
		}
				
		static private function TraceDebug(context:Game, child:DebugTree):void {   
			child.name = "Debug " ;
		}
		
		static private function Challenge(context:Game, child:DebugTree):void {   
			child.name = "Challenger : " + HB_VersionInfo.challengeWith;
		}
		
		static private function MTVScore(context:Game, child:DebugTree):void {   
			child.name = "MTV Name : " + HB_VersionInfo.mTVPlayerName;
		}
		static private function MTVName(context:Game, child:DebugTree):void {   
			child.name = "MTV Score : " + HB_VersionInfo.mTVPlayerScore;
		}
	}
}
