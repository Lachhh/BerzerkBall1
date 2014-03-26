package com.homerun.screens.view.challenge {
	import com.google.analytics.debug.VisualDebugMode;
	import com.homerun.factories.HB_AnimationFactory;
	import com.homerun.factories.HB_SfxFactory;
	import com.homerun.meta.ui.challenge.MetaChallenge;
	import com.homerun.screens.view.ObjectView;
	import com.lachhhEngine.games.Game;
	import com.lachhhEngine.games.animation.Animation;
	import com.lachhhEngine.games.animation.AnimationManager;
	import com.lachhhEngine.games.sfx.Jukebox;
	import com.lachhhEngine.interfaces.forms.ButtonSelect;
	import com.lachhhEngine.interfaces.forms.ButtonSelectGroup;
	import com.lachhhEngine.io.Callback;
	import com.lachhhEngine.utils.Utils;

	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.text.TextField;

	/**
	 * @author Lachhh
	 */
	public class ChallengeView extends ObjectView {
		private var _challengeQuoteView0:ChallengeQuoteView ;
		private var _challengeQuoteView1:ChallengeQuoteView ;
		private var _challengeQuoteView2:ChallengeQuoteView ;
		private var _challengeQuoteView3:ChallengeQuoteView ;
		private var _challengeQuoteView4:ChallengeQuoteView ;
		private var _metaChallenge:MetaChallenge;
		private var _btnGroup:ButtonSelectGroup ;
		private var _quote : Animation;
		private var _geekAnim : Animation;
		private var _waitQuoteTime : Number;
		private var _isDirty:Boolean ;
		private const WAIT_UNTIL_NEXT_QUOTE:int = 4*36;
		private const WAIT_UNTIL_QUOTE_DISAPPEAR:int = 1*36;

		public function ChallengeView(visual : MovieClip) {
			super(visual);
			_btnGroup = new ButtonSelectGroup();
			_btnGroup.AddButton(before);
			_btnGroup.AddButton(after);
			before.addEventListener(MouseEvent.MOUSE_DOWN, onClickOnglet) ;
			after.addEventListener(MouseEvent.MOUSE_DOWN, onClickOnglet) ;
			var c:Callback = new Callback(SelectQuote, this, null);
			_challengeQuoteView0 = new ChallengeQuoteView(quote0, c);
			_challengeQuoteView1 = new ChallengeQuoteView(quote1, c);
			_challengeQuoteView2 = new ChallengeQuoteView(quote2, c);
			_challengeQuoteView3 = new ChallengeQuoteView(quote3, c);
			_challengeQuoteView4 = new ChallengeQuoteView(quote4, c);
			_waitQuoteTime = WAIT_UNTIL_QUOTE_DISAPPEAR;
			_quote = AnimationManager.instance.CreateAnimation(HB_AnimationFactory.ID_FX_GEEKBULLANIM);
			_quote.x = 120;
			_quote.y = 330;
			_quote.alpha = 0;
			_quote.mouseChildren = _quote.mouseEnabled = false;
			visual.addChildAt(_quote, visual.numChildren - 2);
			_isDirty = false;
			
			after.tabEnabled = before.tabEnabled = false;
		}

		override public function Destroy() : void {
			DestroyVisual();
			super.Destroy();
			before.removeEventListener(MouseEvent.MOUSE_DOWN, onClickOnglet) ;
			after.removeEventListener(MouseEvent.MOUSE_DOWN, onClickOnglet) ;
			_challengeQuoteView0.Destroy();
			_challengeQuoteView1.Destroy();
			_challengeQuoteView2.Destroy();
			_challengeQuoteView3.Destroy();
			_challengeQuoteView4.Destroy();
			AnimationManager.instance.Destroy(_quote);
			
		}
		
		private function DestroyVisual():void {
			if(_geekAnim != null) {
				visual.removeChild(_geekAnim);
				AnimationManager.instance.Destroy(_geekAnim);
				_geekAnim = null;
			}	
		}
		
		public function UpdateMetaChallenge():void {
			if(_btnGroup.selectedButton == before) {
				_metaChallenge.quoteBefore0 = _challengeQuoteView0.quote ;
				_metaChallenge.quoteBefore1 = _challengeQuoteView1.quote ;
				_metaChallenge.quoteBefore2 = _challengeQuoteView2.quote ;
				_metaChallenge.quoteBefore3 = _challengeQuoteView3.quote ;
				_metaChallenge.quoteBefore4 = _challengeQuoteView4.quote ;	
			} else {
				_metaChallenge.quoteAfter0 = _challengeQuoteView0.quote ;
				_metaChallenge.quoteAfter1 = _challengeQuoteView1.quote ;
				_metaChallenge.quoteAfter2 = _challengeQuoteView2.quote ;
				_metaChallenge.quoteAfter3 = _challengeQuoteView3.quote ;
				_metaChallenge.quoteAfter4 = _challengeQuoteView4.quote ;
			}	
			_isDirty = _challengeQuoteView0.isDirty ||
				_challengeQuoteView1.isDirty ||
				_challengeQuoteView2.isDirty ||
				_challengeQuoteView3.isDirty ||
				_challengeQuoteView4.isDirty ;
		}
		
		private function onClickOnglet(event : MouseEvent) : void {
			var b:ButtonSelect = event.target as ButtonSelect ;
			UpdateMetaChallenge();
			
				
			switch(b) {
				case before : _btnGroup.SelectButton(before) ; break;
				case after : _btnGroup.SelectButton(after) ; break;	
			}
			Refresh();
		}

		public function SetMetaChallenge(metaChallenge:MetaChallenge):void {
			_metaChallenge = metaChallenge ;
			_btnGroup.SelectButton(before);
			Refresh();
		}	
		
		private function SelectQuote(quote:String):void {
			//Fait parler le geek
			var allSnd:Array = [HB_SfxFactory.ID_SFX_GEEK_CAVE1, 
				HB_SfxFactory.ID_SFX_GEEK_CAVE2, 
				HB_SfxFactory.ID_SFX_GEEK_CAVE3,
				HB_SfxFactory.ID_SFX_GEEK_CAVE4,
				HB_SfxFactory.ID_SFX_GEEK_CAVE5,
				HB_SfxFactory.ID_SFX_GEEK_CAVE6];
			
			_waitQuoteTime = WAIT_UNTIL_NEXT_QUOTE;
			quoteTxt.text = quote;
			Jukebox.instance.PlaySound(int(Utils.PickRandomIn(allSnd)));
		}
		
		override public function Refresh() : void {
			super.Refresh();
			if(_metaChallenge == null) {
				return ;	
			}
			DestroyVisual();
			if(_btnGroup.selectedButton == before) {
				_challengeQuoteView0.SetQuote(_metaChallenge.quoteBefore0);
				_challengeQuoteView1.SetQuote(_metaChallenge.quoteBefore1);
				_challengeQuoteView2.SetQuote(_metaChallenge.quoteBefore2);
				_challengeQuoteView3.SetQuote(_metaChallenge.quoteBefore3);
				_challengeQuoteView4.SetQuote(_metaChallenge.quoteBefore4);
				_geekAnim = AnimationManager.instance.CreateAnimation(HB_AnimationFactory.ID_GEEK_COMPUTER_IDLE);
				_geekAnim.scaleX = 1;
				_geekAnim.x = 127;
				_geekAnim.y = 330;
				visual.addChildAt(_geekAnim, visual.getChildIndex(_quote));	
			} else {
				_challengeQuoteView0.SetQuote(_metaChallenge.quoteAfter0);
				_challengeQuoteView1.SetQuote(_metaChallenge.quoteAfter1);
				_challengeQuoteView2.SetQuote(_metaChallenge.quoteAfter2);
				_challengeQuoteView3.SetQuote(_metaChallenge.quoteAfter3);
				_challengeQuoteView4.SetQuote(_metaChallenge.quoteAfter4);
				_geekAnim = AnimationManager.instance.CreateAnimation(HB_AnimationFactory.ID_GEEK_COMPUTER_WALK);
				_geekAnim.scaleX = -1;
				_geekAnim.x = 127;
				_geekAnim.y = 330;
				visual.addChildAt(_geekAnim, visual.getChildIndex(_quote));
			}
			//highscore.text = Utils.PutVirgules(_metaChallenge.scoreToBeat) + "";
			
		}
		
		public function Update(context:Game):void {
			_waitQuoteTime -= context.speedManager.GetSpeed();
			if(_waitQuoteTime > WAIT_UNTIL_QUOTE_DISAPPEAR) {
				quoteBulleAnim.alpha = Math.min(1, quoteBulleAnim.alpha + 0.1) ;
			} else if(_waitQuoteTime > 0) {
				quoteBulleAnim.alpha = Math.max(0, quoteBulleAnim.alpha - 0.1) ;
			}
			if(_geekAnim != null) {
				_geekAnim.Update(context);	
			}
			
			if(_quote != null) {
				_quote.Update(context);	
			}
		}
		
		private function get before():ButtonSelect { return ButtonSelect(visual.getChildByName("before"));}
		private function get after():ButtonSelect { return ButtonSelect(visual.getChildByName("after"));}
		private function get quote0():MovieClip { return MovieClip(visual.getChildByName("quote0"));}
		private function get quote1():MovieClip { return MovieClip(visual.getChildByName("quote1"));}
		private function get quote2():MovieClip { return MovieClip(visual.getChildByName("quote2"));}
		private function get quote3():MovieClip { return MovieClip(visual.getChildByName("quote3"));}
		private function get quote4():MovieClip { return MovieClip(visual.getChildByName("quote4"));}
		//private function get highscore():TextField { return TextField(visual.getChildByName("highscore"));}
		
		private function get quoteBulleAnim():Animation {return Animation(_quote);}
		private function get quoteBulle():MovieClip {return MovieClip(_quote.getChildByName("bulle"));}
		private function get quoteTxt():TextField { return TextField(quoteBulle.getChildByName("dynamicText"));
		}
		
		public function get isDirty() : Boolean {
			return _isDirty;
		}
	}
}
