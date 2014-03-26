package com.homerun.screens {
	import com.homerun.Main;
	import com.homerun.factories.HB_AnimationFactory;
	import com.homerun.screens.view.distribution.SponsorLogoView;
	import com.lachhhEngine.games.Game;
	import com.lachhhEngine.games.animation.Animation;
	import com.lachhhEngine.games.animation.AnimationManager;
	import com.lachhhEngine.games.meta.MetaObject;
	import com.lachhhEngine.interfaces.forms.Button;
	import com.lachhhEngine.io.Callback;
	import com.lachhhEngine.multilingual.TextFactory;

	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;

	/**
	 * @author Lachhh
	 */
	public class QuestionBoxScreen extends HB_Screen {
		static public const TYPE_AUTO : int = 0 ; 
		static public const TYPE_YES_NO : int = 1 ;
		static public const TYPE_OK : int = 2 ; 
		private var _yesCallback : Callback ;
		private var _noCallback : Callback ;
		private var _sponsor:SponsorLogoView;

		override public function Init(metaObject : MetaObject, context : Game) : void {
			super.Init(metaObject, context);
			_sponsor = new SponsorLogoView(sponsorQuestion);
			ok.addEventListener(MouseEvent.MOUSE_DOWN, onOk);
			yes.addEventListener(MouseEvent.MOUSE_DOWN, onYes);
			no.addEventListener(MouseEvent.MOUSE_DOWN, onNo);
			
			InitOkBtn(ok);
			InitOkBtn(yes);
			InitCancelBtn(no);
			//Jukebox.instance.PlaySound(TM_SfxFactory.ID_SFX_METAL_UI);
			//ok.addEventListener(MouseEvent.MOUSE_DOWN, onOk);	
		}

		override public function RemoveListeners() : void {
			super.RemoveListeners();
			ok.removeEventListener(MouseEvent.MOUSE_DOWN, onOk);
			yes.removeEventListener(MouseEvent.MOUSE_DOWN, onYes);
			no.removeEventListener(MouseEvent.MOUSE_DOWN, onNo);
			_sponsor.Destroy();
		}

		override public function CreateVisual() : Animation {
			return AnimationManager.instance.CreateAnimation(HB_AnimationFactory.ID_MSGBOX_SCREEN);
		}

		override public function Close(remove : Boolean, c : Callback = null, quickClose : Boolean = false) : void {
			super.Close(remove, c, quickClose);
		}

		private function onOk(e : Event = null) : void {
			Close(true, _yesCallback);
			Main.PlayOkSound();
		}

		private function onYes(e : Event = null) : void {
			Close(true, _yesCallback);
			Main.PlayOkSound();
		}

		private function onNo(e : Event = null) : void {
			Close(true, _noCallback);
			Main.PlayCancelSound();
		}

		public function InitMsgBox(msgId : int, yesCallback : Callback = null, noCallback : Callback = null, size : int = 24, typeMsg : int = TYPE_AUTO) : void {
			desc.text = TextFactory.instance.GetMsg(msgId);
			var tf : TextFormat = desc.getTextFormat();
			tf.size = size;
			desc.setTextFormat(tf);
			if((typeMsg == TYPE_AUTO && (yesCallback != null || noCallback != null)) || typeMsg == TYPE_YES_NO) {
				SetQuestionBox(yesCallback, noCallback);
			} else {
				SetMsgBox(yesCallback);
			}
		}

		public function InitMsgBoxWithString(msgText : String, yesCallback : Callback = null, noCallback : Callback = null) : void {
			desc.text = msgText;
			var tf : TextFormat = desc.getTextFormat();
			tf.size = 24;
			tf.align = TextFormatAlign.LEFT;
			desc.setTextFormat(tf);
			if(yesCallback == null && noCallback == null) {
				SetMsgBox(yesCallback);
			} else {
				SetQuestionBox(yesCallback, noCallback);		
			}
		}

		private function SetMsgBox(y : Callback) : void {
			yes.visible = false;
			no.visible = false;
			_yesCallback = y;
		}

		private function SetQuestionBox(y : Callback, n : Callback) : void {
			ok.visible = false;
			_yesCallback = y;
			_noCallback = n;
		}

		private function get desc() : TextField {
			return TextField(panel.getChildByName("descTxt"));	
		}

		private function get ok() : Button {
			return Button(panel.getChildByName("next"));	
		}

		private function get yes() : Button {
			return Button(panel.getChildByName("yes"));	
		}

		private function get no() : Button {
			return Button(panel.getChildByName("no"));	
		}
		public function get sponsorQuestion():MovieClip { return (panel.getChildByName("sponsorQuestion")) as MovieClip;}
		
	}
}
