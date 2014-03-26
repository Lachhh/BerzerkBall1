/**
* ...
* @author Default
* @version 0.1
*/

package com.homerun {
	import com.homerun.hero.HB_HeroManager;
	import com.homerun.levelEvent.LevelXML;
	import com.homerun.meta.MetaHBActor;
	import com.lachhhEngine.games.LevelEditor;
	import com.lachhhEngine.games.meta.MetaManager;
	import com.lachhhEngine.initializers.VersionInfo;
	import com.lachhhEngine.io.Callback;
	import com.lachhhEngine.io.files.FileManager;

	import flash.events.Event;

	public class HB_MainLevelEditor extends Main {
		private var _levelEditor : LevelEditor;

		public function HB_MainLevelEditor() {
			super();
			VersionInfo.debugVersion = true;
			Init();
			FileManager.instance.SelectNewGameProgress(0);
		}
		
		override protected function CreateManagers():void {
			super.CreateManagers();
			_game.levelEditorMode = true;
			_levelEditor = new LevelEditor(_game);

			_levelEditor.AddPossibleLevel(MetaManager.instance.CreateMetaLevel(LevelXML.LEVEL_XML, _game));
			_levelEditor.AddPossibleLevel(MetaManager.instance.CreateMetaLevel(LevelXML.LEVEL_2_XML, _game));
			_levelEditor.AddPossibleLevel(MetaManager.instance.CreateMetaLevel(LevelXML.LEVEL_3_XML, _game));
			
			_levelEditor.ShowLoadLevelScreen(new Callback(LevelLoaded, this, null));
		}
		
		override public function LevelLoaded():void {
			
			//file1.metaHero.GiveItem(0x0FFFFF);
			var metaHero:MetaHBActor = HB_HeroManager(_game.heroManager).CreateMetaGeek();
			_game.AddPlayerFromMeta(metaHero, false);
			_game.camera.isManual = true;
			_game.camera.SetIfMustRespectBounds(false);
		}

		override public function Update(e:Event):void {
			stage.focus = this;
			_levelEditor.Update();
			super.Update(e);
				
		}
	}
}
