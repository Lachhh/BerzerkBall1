package com.homerun.meta.ui.challenge {
	import com.lachhhEngine.io.encryption.SecureNumber;

	/**
	 * @author Lachhh
	 */
	public class MetaChallenge {
		static private const SEPARATOR:String = "[CHA]";
		private var _quoteBefore0:String = "[TYPE YOUR OWN TAUNT HERE !]";
		private var _quoteBefore1:String = "I may be fat, but I'm a cartoon. You're REAL fat, good old 3D fat.";
		private var _quoteBefore2:String = "Beating my score is like you getting laid : impossible.";
		private var _quoteBefore3:String = "I'm just soooo better than you";
		private var _quoteBefore4:String = "You just can't beat my awesome score ! \\m/ (>.<) \\m/";
		private var _quoteAfter0:String = "[TYPE YOUR OWN TAUNT HERE !]";
		private var _quoteAfter1:String = "At least now I don't have to smell your bad breath.";
		private var _quoteAfter2:String = "I can still see you from here.....  you're fat.";
		private var _quoteAfter3:String = "Pathetic excuse of a shot";
		private var _quoteAfter4:String = "Dude, you're so lame";
		private var _scoreToBeat:SecureNumber = new SecureNumber();
		
		public function MetaChallenge() {
			
		}
		
		public function Encode():String {
			return _scoreToBeat.value + SEPARATOR +  
				quoteBefore0 + SEPARATOR + 
				quoteBefore1 + SEPARATOR +
				quoteBefore2 + SEPARATOR +
				quoteBefore3 + SEPARATOR +
				quoteBefore4 + SEPARATOR +
				quoteAfter0 + SEPARATOR +
				quoteAfter1 + SEPARATOR +
				quoteAfter2 + SEPARATOR +
				quoteAfter3 + SEPARATOR +
				quoteAfter4 ;
		}

		public function Decode(s:String):void {
			var params:Array = s.split(SEPARATOR);
			_scoreToBeat.value = int(params.shift());
			quoteBefore0 = String(params.shift());
			quoteBefore1 = String(params.shift());
			quoteBefore2 = String(params.shift());
			quoteBefore3 = String(params.shift());
			quoteBefore4 = String(params.shift());
			quoteAfter0 = String(params.shift());
			quoteAfter1 = String(params.shift());
			quoteAfter2 = String(params.shift());
			quoteAfter3 = String(params.shift());
			quoteAfter4 = String(params.shift());	
		}
		
		public function get scoreToBeat() : int {return _scoreToBeat.value;}
		public function set scoreToBeat(score : int) : void {_scoreToBeat.value = score;}
		
		public function PickRandomBeforeQuote():String {
			var n:Number = Math.random()*100;
			if(n <= 20) return quoteBefore0;
			if(n <= 40) return quoteBefore1;
			if(n <= 60) return quoteBefore2;
			if(n <= 80) return quoteBefore3;
			return quoteBefore4;
		}
		
		public function PickRandomAfterQuote():String {
			var n:Number = Math.random()*100;
			if(n <= 20) return quoteAfter0;
			if(n <= 40) return quoteAfter1;
			if(n <= 60) return quoteAfter2;
			if(n <= 80) return quoteAfter3;
			return quoteAfter4;	
		}
		
		
		public function get quoteBefore0() : String {return _quoteBefore0;}
		public function get quoteBefore1() : String {return _quoteBefore1;}	
		public function get quoteBefore2() : String {return _quoteBefore2;}	
		public function get quoteBefore3() : String {return _quoteBefore3;}	
		public function get quoteBefore4() : String {return _quoteBefore4;}
		
		public function get quoteAfter0() : String {return _quoteAfter0;}
		public function get quoteAfter1() : String {return _quoteAfter1;}
		public function get quoteAfter2() : String {return _quoteAfter2;}
		public function get quoteAfter3() : String {return _quoteAfter3;}
		public function get quoteAfter4() : String {return _quoteAfter4;}
				
		public function set quoteBefore0(quoteBefore : String) : void {_quoteBefore0 = quoteBefore;}
		public function set quoteBefore1(quoteBefore : String) : void {_quoteBefore1 = quoteBefore;}
		public function set quoteBefore2(quoteBefore : String) : void {_quoteBefore2 = quoteBefore;}
		public function set quoteBefore3(quoteBefore : String) : void {_quoteBefore3 = quoteBefore;}
		public function set quoteBefore4(quoteBefore : String) : void {_quoteBefore4 = quoteBefore;}
		
		public function set quoteAfter0(quoteAfter : String) : void {_quoteAfter0 = quoteAfter;}
		public function set quoteAfter1(quoteAfter : String) : void {_quoteAfter1 = quoteAfter;}
		public function set quoteAfter2(quoteAfter : String) : void {_quoteAfter2 = quoteAfter;}
		public function set quoteAfter3(quoteAfter : String) : void {_quoteAfter3 = quoteAfter;}
		public function set quoteAfter4(quoteAfter : String) : void {_quoteAfter4 = quoteAfter;}
		
		
	}
}
