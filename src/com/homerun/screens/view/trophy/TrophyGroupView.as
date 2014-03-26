package com.homerun.screens.view.trophy {
	import com.homerun.init.HB_VersionInfo;
	import com.homerun.io.AchievementManager;
	import com.homerun.meta.ui.trophy.MetaTrophy;
	import com.homerun.meta.ui.trophy.MetaTrophyEnum;
	import com.homerun.meta.ui.trophy.MetaTrophyGroup;
	import com.homerun.screens.view.ObjectView;
	import com.homerun.screens.view.distribution.SponsorLogoView;
	import com.lachhhEngine.interfaces.forms.Button;
	import com.lachhhEngine.io.Callback;
	import com.lachhhEngine.multilingual.TextFactory;

	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.text.TextField;

	/**
	 * @author Lachhh
	 */
	public class TrophyGroupView extends ObjectView {
		private var _sponsorView:SponsorLogoView ;
		private var _allViews:Array = new Array();
		private var _groups:Array = new Array();
		private var _index:int = 0 ;
		public function TrophyGroupView(visual : MovieClip, clickCallback:Callback) {
			super(visual);
			_sponsorView = new SponsorLogoView(onlyOnSponsor);
			_sponsorView.Refresh();
			_sponsorView.linkToGame = true;
			_groups = [];
			
			for (var i : int = 0; i < MetaTrophyEnum.allTrophiesGroup.length; i++) {
				var g:MetaTrophyGroup = MetaTrophyEnum.allTrophiesGroup[i];
				if(g.numItems > 0) {
					_groups.push(g);
				}
			}

			prevBtn.addEventListener(MouseEvent.MOUSE_DOWN, onClickPrev);
			nextBtn.addEventListener(MouseEvent.MOUSE_DOWN, onClickNext);
			
			for (i = 0 ; i < 5 ; i++) {
				var viewVisual:Button = GetViewVisual(i) ;
				var view:TrophySmallView = new TrophySmallView(viewVisual, clickCallback);
				_allViews.push(view);
			}
		}

		override public function Destroy() : void {
			super.Destroy();
			_sponsorView.Destroy();
			prevBtn.removeEventListener(MouseEvent.MOUSE_DOWN, onClickPrev);
			nextBtn.removeEventListener(MouseEvent.MOUSE_DOWN, onClickNext);
			while(_allViews.length > 0) {
				var view:TrophySmallView = _allViews.shift();
				view.Destroy();
			}
		}
		
		private function onClickNext(event : MouseEvent) : void {
			_index++;
			Refresh();
		}

		private function onClickPrev(event : MouseEvent) : void {
			_index--;
			Refresh();
		}

		override public function Refresh() : void {
			super.Refresh();
			_sponsorView.Refresh();
			onlyOn.visible = false;
			if(HB_VersionInfo.showSponsorPromo && (_groups[_index] == MetaTrophyEnum.TROPHY_GROUP_6 || _groups[_index] == MetaTrophyEnum.TROPHY_GROUP_7)) {
				onlyOn.visible = true;	
			}
			
			prevBtn.visible = (_index > 0);
			nextBtn.visible = (_index < _groups.length-1);
			groupTxt.text = TextFactory.instance.GetMsg(crntMetaGroup.groupNameId);
			subDiamondTxt.text = crntMetaGroup.numDiamondsEarned + "/" + crntMetaGroup.numDiamondsTotal;
		
			totalDiamondTxt.text = MetaTrophyEnum.numDiamondsEarned + "/" + MetaTrophyEnum.numDiamondTotal;
			unlockedTxt.text = AchievementManager.instance.numBestowed + "/" + MetaTrophyEnum.numTrophies;
		
			for (var i:int = 0 ; i < _allViews.length ; i++) {
				var view:TrophySmallView = _allViews[i];
				view.SetMetaTrophy(MetaTrophy(crntMetaGroup.GetItemAt(i)));
				view.Refresh();
			}
		}
		
		private function GetViewVisual(i:int):Button {
			return Button(visual.getChildByName("achVisual"+ i));
		}
		
		private function get groupTxt():TextField {	return TextField(visual.getChildByName("groupTxt"));}
		public function get prevBtn():Button {	return Button(visual.getChildByName("prevBtn"));}
		public function get nextBtn():Button {	return Button(visual.getChildByName("nextBtn"));}
		public function get achVisual0():Button {	return Button(visual.getChildByName("achVisual0"));}
		public function get achVisual1():Button {	return Button(visual.getChildByName("achVisual1"));}
		public function get achVisual2():Button {	return Button(visual.getChildByName("achVisual2"));}
		public function get achVisual3():Button {	return Button(visual.getChildByName("achVisual3"));}
		public function get achVisual4():Button {	return Button(visual.getChildByName("achVisual4"));}
		
		private function get subDiamondTxt():TextField {	return TextField(visual.getChildByName("subDiamondTxt"));}
		private function get totalDiamondTxt():TextField {	return TextField(visual.getChildByName("totalDiamondTxt"));}
		private function get unlockedTxt():TextField {	return TextField(visual.getChildByName("unlockedTxt"));}
		private function get crntMetaGroup():MetaTrophyGroup {return _groups[_index];}
		public function get onlyOn():MovieClip {	return MovieClip(visual.getChildByName("onlyOn"));}
		public function get onlyOnSponsor():MovieClip {	return MovieClip(onlyOn.getChildByName("sponsor"));}
		
		
					
		
	}
}
