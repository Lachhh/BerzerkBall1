package com.homerun.constants {
	import com.homerun.init.HB_VersionInfo;
	import com.lachhhEngine.io.LachhhXMLLoader;
	import com.lachhhEngine.io.XMLCallback;
	import com.lachhhEngine.multilingual.ExternalLanguageController;

	import flash.utils.describeType;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;

	/**
	 * @author Lachhh
	 */
	public class ExternalConstants {
		private var _shortClassName : String ;
		private var _longClassName : String ;

		public function ExternalConstants() {
			_longClassName = getQualifiedClassName(this);
			_shortClassName = _longClassName.split("::")[1];
		}

		public function Init() : void {
			if(HB_VersionInfo.loadExternalConstant) {
				LoadExternalDefault();
			} 
		}

		public function LoadExternalDefault() : void {
			LoadExternal("GameDesignHelper/" + _shortClassName + ".xml");
		}

		public function LoadExternal(path : String) : void {
			LachhhXMLLoader.LoadXML(path, new XMLCallback(LoadFromXML, this, null));
		}

		public function LoadFromXML(xml : XML) : void {
			var attNamesList : XMLList = xml.@*;
			var thisClass : Class = Class(getDefinitionByName(_longClassName));
			var traceResult : String = "CONSTANTS OF : " + _longClassName + "\n"; 
			
			for (var i : int = 0;i < attNamesList.length(); i++) { 
				var name : String = attNamesList[i].name(); 
				var value : String = String(xml.attribute(name));
				
				if(thisClass[name] == null) {
					throw new Error("Variable " + _shortClassName + "." + name + " is not declared");
				} else {
					thisClass[name] = value;
				}
				
				if(value.indexOf(",") != -1) {
					traceResult += ("static public var " + name + ":String = \"" + value + "\";\n");	
				} else {
					traceResult += ("static public var " + name + ":Number = " + value + ";\n");
				}
			} 
			traceResult += "\n\n";
			
			if(HB_VersionInfo.traceExternalConstant) {
				trace(traceResult);
			}
		}

		protected function GetValueAt(str : String, i : int) : int {
			if(str == null) return -1;
			return int(str.split(",")[i]);
		}
	
		public function get shortClassName() : String {
			return _shortClassName;
		}
		
		
		public function TraceXML():String {
			var pClass:Class = Class(getDefinitionByName(getQualifiedClassName(this)));
			var xml:XML = flash.utils.describeType(pClass);
			var varList:XMLList = xml..variable;
			var result :String = "<" + _shortClassName + "\n";
			var aChild:Array = new Array();
			
			for(var i:int; i < varList.length(); i++){
				if(varList[i].@type == "Number" || varList[i].@type == "String") {
					aChild.push(varList[i]);		 
				}
			}
			
			aChild.sort(sortOnName);
			
			for (i = 0; i < aChild.length; i++) {
				var node:XML = aChild[i];
				var name:String = node.@name;
				var value:String = pClass[node.@name]; 
				result += "   " + name + "=\"" + value + "\"\n";
			}
			
			result += "/>";
			return result;
		}
		
		public function SaveInFile():void {
			ExternalLanguageController.SaveString(TraceXML(), _shortClassName + ".xml");
		}
		
		private function sortOnName(a:XML, b:XML):int {
			if(a.@name > b.@name) return 1;
			if(a.@name < b.@name) return -1;
			return 0;
		}
		
	}
}
