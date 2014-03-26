package com.homerun.screens.view.distribution {
	import com.lachhhEngine.initializers.nonExVersions.JaludoNonInit;
	import com.homerun.init.HB_VersionInfo;
	import com.homerun.io.AchievementManager;
	import com.homerun.meta.ui.trophy.MetaTrophyEnum;
	import com.homerun.screens.view.ObjectView;
	import com.lachhhEngine.initializers.VersionInfo;

	import flash.display.MovieClip;
	import flash.events.MouseEvent;

	/**
	 * @author Lachhh
	 */
	public class SponsorLogoView extends ObjectView {
		private var _linkToGame:Boolean = false;
		public function SponsorLogoView(visual : MovieClip) {
			super(visual);
			logo.gotoAndStop(VersionInfo.sponsorVisualFrame);
			visual.addEventListener(MouseEvent.MOUSE_DOWN, onClickLogo);
			Refresh();
		}
		
		private function onClickLogo(e:MouseEvent):void {
			if(!HB_VersionInfo.sponsorLogoClickable) return ;
			
			if(VersionInfo.sponsorVisualFrame == VersionInfo.FRAME_JALUDO) {
				(visual.root as JaludoNonInit).LogoMoreGame("");
			} else {
				if(linkToGame) {
					if(VersionInfo.sponsorSiteThisGameUrl == "") return ;
					VersionInfo.OnClickSponsorThisGame(null);
				} else {
					if(VersionInfo.sponsorSiteUrl == "") return ;
					VersionInfo.OnClickSponsorSite(null);
				}	
			}
			AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_37);			
		}
		
		override public function Destroy() : void {
			super.Destroy();
			visual.removeEventListener(MouseEvent.MOUSE_DOWN, onClickLogo);
		}		

		override public function Refresh() : void {
			super.Refresh();
			logo.gotoAndStop(VersionInfo.sponsorVisualFrame);
			if(spilGroupBrand != null) {
				spilGroupBrand.visible = (VersionInfo.sponsorVisualFrame == VersionInfo.FRAME_SPIL_GROUP);
				spilGroupBrand.gotoAndStop(1);
			}
		}

		private function get logo():MovieClip { return MovieClip(visual.getChildByName("logo"));}
		private function get spilGroupBrand():MovieClip { return MovieClip(logo.getChildByName("spilGroupBrand"));}
		
		public function get linkToGame() : Boolean {
			return _linkToGame;
		}
		
		public function set linkToGame(linkToGame : Boolean) : void {
			_linkToGame = linkToGame;
		}
	}
}
