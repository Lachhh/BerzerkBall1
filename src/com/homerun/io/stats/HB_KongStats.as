package com.homerun.io.stats {
	import com.homerun.io.AchievementManager;
	import com.lachhhEngine.io.externalAPI.ExternalAPIManager;
	import com.lachhhEngine.io.externalAPI.statsAPI.MetaStatData;

	/**
	 * @author Lachhh
	 */
	public class HB_KongStats {
		static private var DISTANCE:String = "distance";
		static private var HEIGHT:String = "height";
		static private var TROPHY:String = "trophy";
		static private var BEES:String = "bees";
		static private var KILLER_SHOT:String = "killer_shot";
		static private var POWER_SMASH:String = "power_smash";
		static private var MONEY_EARNED:String = "money_earned";
		
		
		static public function SendAll(dist:int, height:int):void {
			
			var metaDist:MetaStatData = new MetaStatData(DISTANCE, dist);
			var metaHeight:MetaStatData = new MetaStatData(HEIGHT, height);
			var metaTrophy:MetaStatData = new MetaStatData(TROPHY, AchievementManager.instance.numBestowed);
			var metaBees:MetaStatData = new MetaStatData(BEES, StatsStatic.instance.GetValue(StatsStatic.ID_HIT_BEE));
			var metaKillerShot:MetaStatData = new MetaStatData(KILLER_SHOT, StatsStatic.instance.GetValue(StatsStatic.ID_KILLER_SHOT));
			var metaMoney:MetaStatData = new MetaStatData(MONEY_EARNED, StatsStatic.instance.GetValue(StatsStatic.ID_MONEY_EARNED)); 
			var metaPowerSmash:MetaStatData = new MetaStatData(POWER_SMASH, StatsStatic.instance.GetValue(StatsStatic.ID_MAXPOWERSMASH));
			
			ExternalAPIManager.statsAPI.SendStat(metaDist);
			ExternalAPIManager.statsAPI.SendStat(metaHeight);
			ExternalAPIManager.statsAPI.SendStat(metaTrophy);
			ExternalAPIManager.statsAPI.SendStat(metaBees);
			ExternalAPIManager.statsAPI.SendStat(metaKillerShot);
			ExternalAPIManager.statsAPI.SendStat(metaMoney);
			ExternalAPIManager.statsAPI.SendStat(metaPowerSmash);
			//KongStats.SubmitDataArray([metaDist, metaHeight, metaTrophy, metaBees, metaKillerShot, metaMoney, metaPowerSmash]);
		}
	}
}
