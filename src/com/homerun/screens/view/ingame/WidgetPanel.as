package com.homerun.screens.view.ingame {
	import com.lachhhEngine.io.Callback;
	import com.lachhhEngine.io.KeyManager;
	import com.lachhhEngine.utils.Utils;

	import flash.display.MovieClip;
	import flash.filters.ColorMatrixFilter;

	/**
	 * @author Lachhh
	 */
	public class WidgetPanel {
		private const BLACK_N_WHITE:ColorMatrixFilter = new ColorMatrixFilter([0.3086000084877014,0.6093999743461609,0.0820000022649765,0,0,0.3086000084877014,0.6093999743461609,0.0820000022649765,0,0,0.3086000084877014,0.6093999743461609,0.0820000022649765,0,0,0,0,0,1,0]);
		private var _visual : MovieClip;
		private var _valueArray:Array = new Array();
		private var _valueIndex:int ;
		private var _indexMod:int = 1;
		private var _isOn:Boolean ;
		
		private var _callback:Callback ;
		public function WidgetPanel(visual:MovieClip) {
			_visual = visual;
			_valueIndex = 0 ;
			_indexMod = 1; 
			_isOn = false;
			nbValue = 25;
		}
		
		public function On(c:Callback):void {
			_callback = c;
			_isOn = true;
			_visual.filters = [];
		}
		
		public function Off():void {
			_isOn = false;
			_visual.filters = [BLACK_N_WHITE];
		}
		
		public function Update():void {
			if(bestPatch != null) bestPatch.nextFrame();
			if(!_isOn) return ;
			
			_valueIndex += _indexMod;
			if(_valueIndex >= _valueArray.length) {
				_indexMod *= -1;
				_valueIndex = (_valueArray.length-1);
			} else if(_valueIndex < 0) {
				_indexMod *= -1;
				_valueIndex = 0;
			}
		}
		
		public function StopAndSelect():void {
			_isOn = false;
			_callback.DoCallback();
			_callback = null;
			if(isMaxed && bestPatch != null) {
				bestPatch.visible = true;
				bestPatch.gotoAndStop(1);	
			}
		}
		
		public function Show():void {
			_visual.visible = true;
			if(bestPatch != null) {
				bestPatch.visible = false;
				bestPatch.gotoAndStop(1);
			}	
		}
		
		public function Hide():void {
			_visual.visible = false;	
		}

		public function get visual() : MovieClip {
			return _visual;
		}
		
		public function set nbValue(speed : Number) : void {
			if(speed <=0) return ;
			Utils.ClearArray(_valueArray);
			var d:Number = 1 / speed;
			var crntValue:Number = 0;
			while(crntValue <= 1) {
				_valueArray.push(crntValue);
				crntValue += d;
			}
			_valueArray[Math.floor(_valueArray.length/2)] = 0.5;
			_valueArray[_valueArray.length-1] = 1;
		}
		
		public function get value() : Number {
			return _valueArray[_valueIndex];
		}
		
		public function get isMaxed():Boolean {
			return value >= 0.95;	
		}
		
		protected function set valueIndex(valueIndex : int) : void {
			_valueIndex = valueIndex;
		}
		
		public function get isOn() : Boolean {return _isOn;}
		
		private function get bestPatch():MovieClip {return MovieClip(visual.getChildByName("bestPatch"));
		}
		
		protected function get valueArray() : Array {
			return _valueArray;
		}
	}
}
