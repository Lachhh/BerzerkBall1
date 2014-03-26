package com.homerun.screens {
	import flash.events.MouseEvent;

	import com.lachhhEngine.games.Game;
	import com.lachhhEngine.games.meta.MetaObject;

	/**
	 * @author Lachhh
	 */
	public class OptionsTitleScreen extends OptionsScreen {
		override public function Init(metaObject : MetaObject, context : Game) : void {
			super.Init(metaObject, context);
			saveBtn.visible = false;
		}

		override protected function onClickExit(event : MouseEvent) : void {
			super.onClickExit(event);
			Close(true);
		}
	}
}
