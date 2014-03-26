package com.homerun.levelEvent {
	import com.lachhhEngine.games.Game;
	import com.lachhhEngine.games.meta.MetaManager;
	import com.lachhhEngine.games.meta.metaObject.MetaLevel;

	/**
	 * @author Lachhh
	 */
	public class AllMetaLevels {
		static public var SUMMER:MetaLevel ;
		static public var WINTER:MetaLevel ;
		static public var FALL:MetaLevel ;
		static public var SPRING:MetaLevel ;
		
		static public function Init(context:Game):void {
			SUMMER = MetaManager.instance.CreateMetaLevel(LevelXML.LEVEL_XML, context);
			WINTER = MetaManager.instance.CreateMetaLevel(LevelXML.LEVEL_2_XML, context);
			FALL = MetaManager.instance.CreateMetaLevel(LevelXML.LEVEL_3_XML, context);
			SPRING = MetaManager.instance.CreateMetaLevel(LevelXML.LEVEL_4_XML, context);
			
		}
	}
}
