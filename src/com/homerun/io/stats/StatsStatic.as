package com.homerun.io.stats {
	import com.lachhhEngine.io.stats.StatsGroup;

	/**
	 * @author Lachhh
	 */
	public class StatsStatic extends StatsGroup {
		private static var _instance : StatsStatic;
		static public const ID_MONEY_EARNED: int = instance.NewStats(0, "MONEY");
		static public const ID_KILL : int = instance.NewStats(0, "KILL");
		static public const ID_KILLER_SHOT : int = instance.NewStats(0, "KILLER_SHOT");
		
		static public const ID_HIT_MINE : int = instance.NewStats(0, "MINE");
		static public const ID_HIT_BEE : int = instance.NewStats(0, "BEE");
		static public const ID_INYOURFACES : int = instance.NewStats(0, "INYOURFACES");
		static public const ID_TWITTER_CLICK : int = instance.NewStats(0, "TWITTER_CLICK");
		static public const ID_FACEBOOK_CLICK : int = instance.NewStats(0, "FACEBOOK_CLICK");
		
		static public const ID_MAXDISTANCE : int = instance.NewStats(0, "DISTANCE");
		static public const ID_MAXHEIGHT: int = instance.NewStats(0, "HEIGHT");
		static public const ID_MAXPOWERSMASH: int = instance.NewStats(0, "MAXPOWERSMASH");
		
		static public function get instance() : StatsStatic {
			if(_instance == null) _instance = new StatsStatic();
			return _instance;
		}

		override public function get name() : String {
			return "Static";
		}
	}
}
