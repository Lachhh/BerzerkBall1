package com.homerun.screens.view.trophy {
	import com.homerun.init.HB_VersionInfo;
	import com.homerun.meta.ui.trophy.MetaTrophy;
	import flash.events.MouseEvent;
	import com.homerun.io.AchievementManager;
	import com.homerun.multilingual.HB_TextFactory;
	import com.lachhhEngine.multilingual.TextFactory;
	import com.lachhhEngine.utils.Utils;
	import com.homerun.meta.ui.trophy.MetaTrophyEnum;
	import com.homerun.screens.view.ObjectView;
	import com.lachhhEngine.interfaces.forms.Button;

	import flash.display.MovieClip;
	import flash.text.TextField;

	/**
	 * @author Lachhh
	 */
	public class TrophySelectorView extends ObjectView {
		private var _trophyView:TrophyDetailsView;
		private var _allTrophy:Array ;
		private var _index:int = 0 ;
		
		public function TrophySelectorView(visual : MovieClip) {
			super(visual);
			_trophyView = new TrophyDetailsView(visual);
			_allTrophy = MetaTrophyEnum.allTrophies.slice();
			if(!HB_VersionInfo.showViralAchievement) {
				Utils.RemoveFromArray(_allTrophy, MetaTrophyEnum.TROPHY_23);
				Utils.RemoveFromArray(_allTrophy, MetaTrophyEnum.TROPHY_24);
				Utils.RemoveFromArray(_allTrophy, MetaTrophyEnum.TROPHY_25);
				Utils.RemoveFromArray(_allTrophy, MetaTrophyEnum.TROPHY_26);
				Utils.RemoveFromArray(_allTrophy, MetaTrophyEnum.TROPHY_30);
				Utils.RemoveFromArray(_allTrophy, MetaTrophyEnum.TROPHY_31);
				Utils.RemoveFromArray(_allTrophy, MetaTrophyEnum.TROPHY_32);
			}
			
			prevBtn.addEventListener(MouseEvent.MOUSE_DOWN, onClickPrev);
			nextBtn.addEventListener(MouseEvent.MOUSE_DOWN, onClickNext);
			Next();
		}
		
		public function SetMetaTrophy(metaTrophy:MetaTrophy):void {
			_index = _allTrophy.indexOf(metaTrophy);
			_trophyView.SetMetaTrophy(metaTrophy);
			Refresh();
		}

		override public function Destroy() : void {
			prevBtn.removeEventListener(MouseEvent.MOUSE_DOWN, onClickPrev);
			nextBtn.removeEventListener(MouseEvent.MOUSE_DOWN, onClickNext);
			_trophyView.Destroy();
			super.Destroy();
		}
		
		private function onClickNext(event : MouseEvent) : void {
			Next();
		}

		private function onClickPrev(event : MouseEvent) : void {
			Prev();
		}

		private function Next():void {
			_index = Utils.CropIn(_index + 1, 0, (_allTrophy.length)-1);
			_trophyView.SetMetaTrophy(_allTrophy[_index]);
			Refresh();
		}

		private function Prev():void {
			_index = Utils.CropIn(_index - 1, 0, (_allTrophy.length)-1);
			_trophyView.SetMetaTrophy(_allTrophy[_index]);
			Refresh();			
		}

		override public function Refresh() : void {
			super.Refresh();
			_trophyView.Refresh();
			trophyPosTxt.text = TextFactory.instance.GetMsg(_trophyView.metaTrophy.titleId);
			//unlockedTxt.text = AchievementManager.instance.numBestowed + "/" + _allTrophy.length + " " + TextFactory.instance.GetMsg(HB_TextFactory.ID_UNLOCKED);
		}

		private function get trophyPosTxt():TextField { return TextField(visual.getChildByName("trophyPosTxt")) ;}
		private function get unlockedTxt():TextField { return TextField(visual.getChildByName("unlockedTxt")) ;}
		
		public function get nextBtn():Button { return Button(visual.getChildByName("nextBtn")) ;}
		public function get prevBtn():Button { return Button(visual.getChildByName("prevBtn")) ;}
		
		
		
	}
}
