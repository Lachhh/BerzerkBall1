package com.homerun.screens.view {
	import com.homerun.Main;
	import com.homerun.io.HB_GamePrefs;
	import com.lachhhEngine.interfaces.forms.Button;
	import com.lachhhEngine.interfaces.forms.ButtonSelect;
	import com.lachhhEngine.interfaces.forms.ButtonSelectGroup;
	import com.lachhhEngine.io.Callback;
	import com.lachhhEngine.io.files.FileManager;
	import com.lachhhEngine.io.files.GamePrefs;
	import com.lachhhEngine.utils.Utils;

	import flash.display.MovieClip;
	import flash.events.MouseEvent;

	/**
	 * @author Lachhh
	 */
	public class OptionsWidget {
		private var _btnGroup : ButtonSelectGroup = new ButtonSelectGroup();
		private var _visual : MovieClip ;
		private var _soundSlider : Slider ;
		private var _musicSlider : Slider ;

		public function OptionsWidget(visual : MovieClip) {
			_visual = visual;
			_soundSlider = new Slider(sfxSliderVisual, new Callback(SetSfxVolumeFromSlider, this, null));
			_musicSlider = new Slider(musicSliderVisual, new Callback(SetMusicVolumeFromSlider, this, null));
			low.addEventListener(MouseEvent.MOUSE_DOWN, onClickQuality);
			med.addEventListener(MouseEvent.MOUSE_DOWN, onClickQuality);
			high.addEventListener(MouseEvent.MOUSE_DOWN, onClickQuality);
			
			sound.addEventListener(MouseEvent.MOUSE_DOWN, onClickSound);
			music.addEventListener(MouseEvent.MOUSE_DOWN, onClickMusic);
			
			low.addEventListener(MouseEvent.MOUSE_OVER, Main.PlayRollOverSound);
			med.addEventListener(MouseEvent.MOUSE_OVER, Main.PlayRollOverSound);
			high.addEventListener(MouseEvent.MOUSE_OVER, Main.PlayRollOverSound);
			sound.addEventListener(MouseEvent.MOUSE_OVER, Main.PlayRollOverSound);
			music.addEventListener(MouseEvent.MOUSE_OVER, Main.PlayRollOverSound);
			
			_btnGroup.AddButton(low);
			_btnGroup.AddButton(med);
			_btnGroup.AddButton(high);
			//UpdateAll();
		}

		public function Destroy() : void {
			low.removeEventListener(MouseEvent.MOUSE_DOWN, onClickQuality);
			med.removeEventListener(MouseEvent.MOUSE_DOWN, onClickQuality);
			high.removeEventListener(MouseEvent.MOUSE_DOWN, onClickQuality);
			
			sound.removeEventListener(MouseEvent.MOUSE_DOWN, onClickSound);
			music.removeEventListener(MouseEvent.MOUSE_DOWN, onClickMusic);
			
			low.removeEventListener(MouseEvent.MOUSE_OVER, Main.PlayRollOverSound);
			med.removeEventListener(MouseEvent.MOUSE_OVER, Main.PlayRollOverSound);
			high.removeEventListener(MouseEvent.MOUSE_OVER, Main.PlayRollOverSound);
			sound.removeEventListener(MouseEvent.MOUSE_OVER, Main.PlayRollOverSound);
			music.removeEventListener(MouseEvent.MOUSE_OVER, Main.PlayRollOverSound);
			
			_soundSlider.Destroy();
			_musicSlider.Destroy();
			_soundSlider = null;
			_musicSlider = null;
			_btnGroup.Destroy();
			_visual = null;
		}

		public function Update() : void {
			UpdateAll();	
		}

		private function SetSfxVolumeFromSlider() : void {
			gamePrefs.SetSoundOn(true);
			gamePrefs.soundVolume = Math.round(_soundSlider.prct * 100);	
			UpdateAll();
		}

		private function SetMusicVolumeFromSlider() : void {
			gamePrefs.SetMusicOn(true);
			gamePrefs.musicVolume = Math.round(_musicSlider.prct * 100);	
			UpdateAll();
		}

		private function onClickMusic(event : MouseEvent) : void {
			gamePrefs.ToggleMusic();
			UpdateAll();
			Main.PlayOkSound();
		}

		private function onClickSound(event : MouseEvent) : void {
			gamePrefs.ToggleSound();
			UpdateAll();
			Main.PlayOkSound();
		}

		private function onClickQuality(event : MouseEvent) : void {
			var b : ButtonSelect = ButtonSelect(event.currentTarget) ;
			switch(b) {
				case low: 
					gamePrefs.SetQuality(GamePrefs.QUALITY_LOW); 
					break;
				case med: 
					gamePrefs.SetQuality(GamePrefs.QUALITY_MED); 
					break;
				case high: 
					gamePrefs.SetQuality(GamePrefs.QUALITY_HIGH); 
					break;
			}
			UpdateAll();
			Main.PlayOkSound();
		}

		private function UpdateAll() : void {
			if(!gamePrefs.soundOn) {
				_soundSlider.prct = 0 ;
				Utils.SetColor(sound, 77, 77, 77, 0, 0.25, 0.25, 0.25, 1);
				Utils.SetColor(sfxSliderVisual, 77, 77, 77, 0, 0.25, 0.25, 0.25, 1); 	 	
			} else {
				_soundSlider.prct = gamePrefs.soundVolume / 100 ;
				Utils.SetColor(sound);
				Utils.SetColor(sfxSliderVisual);
			}
			
			if(!gamePrefs.musicOn) {
				_musicSlider.prct = 0 ;
				Utils.SetColor(music, 77, 77, 77, 0, 0.25, 0.25, 0.25, 1);
				Utils.SetColor(musicSliderVisual, 77, 77, 77, 0, 0.25, 0.25, 0.25, 1); 	
			} else {
				_musicSlider.prct = gamePrefs.musicVolume / 100 ;
				Utils.SetColor(music);
				Utils.SetColor(musicSliderVisual);
			}
			
			switch(gamePrefs.quality) {
				case GamePrefs.QUALITY_LOW : 
					_btnGroup.SelectButton(low); 
					break;
				case GamePrefs.QUALITY_MED : 
					_btnGroup.SelectButton(med); 
					break;
				case GamePrefs.QUALITY_HIGH : 
					_btnGroup.SelectButton(high); 
					break;
			}	
		}

		private function get low() : ButtonSelect {
			return ButtonSelect(_visual.getChildByName("low"));	
		}

		private function get med() : ButtonSelect {
			return ButtonSelect(_visual.getChildByName("med"));	
		}

		private function get high() : ButtonSelect {
			return ButtonSelect(_visual.getChildByName("high"));	
		}

		private function get sound() : Button {
			return Button(_visual.getChildByName("sound"));	
		}

		private function get music() : Button {
			return Button(_visual.getChildByName("music"));	
		}

		private function get sfxSliderVisual() : MovieClip {
			return MovieClip(_visual.getChildByName("sfxSlider"));
		}

		private function get musicSliderVisual() : MovieClip {
			return MovieClip(_visual.getChildByName("musicSlider"));
		}

		private function get gamePrefs() : HB_GamePrefs {
			return HB_GamePrefs(FileManager.instance.gamePrefs); 
		}
	}
}
