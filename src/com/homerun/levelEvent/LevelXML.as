package com.homerun.levelEvent {

	/**
	 * @author Simon Lachance
	 */
	public class LevelXML {
		
	static public var LEVEL_XML:XML = 
<Level levelEventId="com.homerun.levelEvent.LevelEvent1" Name="HB_Level" visualStaticBack="">
  <startPos hero1="250~-440" cameraPos="410~-205~1150" cameraBounds="8~999999999999~-10000~88"/>
  <Layer Name="LayerBack2" z="-600" bDrawable="true" bActionLayer="false" compression="1" levelPartWidth="256" levelPartHeight="256" xOffset="-236" yOffset="-4335" fxVisual="" enemyVisual="" bTransparent="false" tileHor="true" tileVer="false">
    <Visual dynamicVisual="com.homerun.exported.LEVELBACK2"/>
    <Collision/>
    <EventSwitch/>
  </Layer>
  <Layer Name="LayerBack1" z="-450" bDrawable="true" bActionLayer="false" compression="1" levelPartWidth="256" levelPartHeight="256" xOffset="-872" yOffset="-208" fxVisual="" enemyVisual="" bTransparent="true" tileHor="true" tileVer="false">
    <Visual dynamicVisual="com.homerun.exported.LEVELBACK1"/>
    <Collision/>
    <EventSwitch/>
  </Layer>
  <Layer Name="LayerAction1" z="0" bDrawable="true" bActionLayer="true" compression="1" levelPartWidth="256" levelPartHeight="256" xOffset="-9" yOffset="-4" fxVisual="" enemyVisual="" bTransparent="true" tileHor="true" tileVer="false">
    <Visual dynamicVisual="com.homerun.exported.LEVELACTION"/>
    <Collision>
      <Line x1="0" y1="0" x2="100" y2="0" canDrop="false" canWallKick="false"/>
    </Collision>
    <EventSwitch/>
  </Layer>
   <Layer Name="LayerAction1" z="500" compression="1" levelPartWidth="256" levelPartHeight="256" xOffset="0" yOffset="-6" fxVisual="" enemyVisual="" bTransparent="true" tileHor="true" tileVer="false">
    <Visual dynamicVisual="com.lachhhEngine.games.animation.Animation"/>
    <Collision>
      <Line x1="0" y1="0" x2="100" y2="0" canDrop="false" canWallKick="false"/>
    </Collision>
    <EventSwitch/>
  </Layer>
</Level>;

	static public var LEVEL_2_XML:XML = 
<Level levelEventId="com.homerun.levelEvent.LevelEvent2" Name="HB_Level2" visualStaticBack="">
  <startPos hero1="250~-440" cameraPos="450~-285~1150" cameraBounds="8~999999999999~-10000~88"/>
  <Layer Name="LayerBack2" z="-600" bDrawable="true" bActionLayer="false" compression="1" levelPartWidth="256" levelPartHeight="256" xOffset="-236" yOffset="-4335" fxVisual="" enemyVisual="" bTransparent="false" tileHor="true" tileVer="false">
    <Visual dynamicVisual="com.homerun.exported.LEVEL2BACK2"/>
    <Collision/>
    <EventSwitch/>
  </Layer>
  <Layer Name="LayerBack1" z="-450" bDrawable="true" bActionLayer="false" compression="1" levelPartWidth="256" levelPartHeight="256" xOffset="-872" yOffset="-208" fxVisual="" enemyVisual="" bTransparent="true" tileHor="true" tileVer="false">
    <Visual dynamicVisual="com.homerun.exported.LEVEL2BACK1"/>
    <Collision/>
    <EventSwitch/>
  </Layer>
  <Layer Name="LayerAction1" z="0" bDrawable="true" bActionLayer="true" compression="1" levelPartWidth="256" levelPartHeight="256" xOffset="0" yOffset="-6" fxVisual="" enemyVisual="" bTransparent="true" tileHor="true" tileVer="false">
    <Visual dynamicVisual="com.homerun.exported.LEVEL2ACTION"/>
    <Collision>
      <Line x1="0" y1="0" x2="100" y2="0" canDrop="false" canWallKick="false"/>
    </Collision>
    <EventSwitch/>
  </Layer>
   <Layer Name="LayerAction1" z="500" compression="1" levelPartWidth="256" levelPartHeight="256" xOffset="0" yOffset="-6" fxVisual="" enemyVisual="" bTransparent="true" tileHor="true" tileVer="false">
    <Visual dynamicVisual="com.lachhhEngine.games.animation.Animation"/>
    <Collision>
      <Line x1="0" y1="0" x2="100" y2="0" canDrop="false" canWallKick="false"/>
    </Collision>
    <EventSwitch/>
  </Layer>
</Level>;

	static public var LEVEL_3_XML:XML = 
<Level levelEventId="com.homerun.levelEvent.LevelEvent3" Name="HB_Level2" visualStaticBack="">
  <startPos hero1="250~-440" cameraPos="450~-285~1150" cameraBounds="8~999999999999~-10000~88"/>
  <Layer Name="LayerBack2" z="-600" bDrawable="true" bActionLayer="false" compression="1" levelPartWidth="256" levelPartHeight="256" xOffset="-236" yOffset="-4335" fxVisual="" enemyVisual="" bTransparent="false" tileHor="true" tileVer="false">
    <Visual dynamicVisual="com.homerun.exported.LEVEL3BACK2"/>
    <Collision/>
    <EventSwitch/>
  </Layer>
  <Layer Name="LayerBack1" z="-450" bDrawable="true" bActionLayer="false" compression="1" levelPartWidth="256" levelPartHeight="256" xOffset="-872" yOffset="-208" fxVisual="" enemyVisual="" bTransparent="true" tileHor="true" tileVer="false">
    <Visual dynamicVisual="com.homerun.exported.LEVEL3BACK1"/>
    <Collision/>
    <EventSwitch/>
  </Layer>
  <Layer Name="LayerAction1" z="0" bDrawable="true" bActionLayer="true" compression="1" levelPartWidth="256" levelPartHeight="256" xOffset="0" yOffset="-1" fxVisual="" enemyVisual="" bTransparent="true" tileHor="true" tileVer="false">
    <Visual dynamicVisual="com.homerun.exported.LEVEL3ACTION"/>
    <Collision>
      <Line x1="0" y1="0" x2="100" y2="0" canDrop="false" canWallKick="false"/>
    </Collision>
    <EventSwitch/>
  </Layer>
   <Layer Name="LayerAction1" z="500" compression="1" levelPartWidth="256" levelPartHeight="256" xOffset="0" yOffset="-6" fxVisual="" enemyVisual="" bTransparent="true" tileHor="true" tileVer="false">
    <Visual dynamicVisual="com.lachhhEngine.games.animation.Animation"/>
    <Collision>
      <Line x1="0" y1="0" x2="100" y2="0" canDrop="false" canWallKick="false"/>
    </Collision>
    <EventSwitch/>
  </Layer>
</Level>;

	static public var LEVEL_4_XML:XML = 
<Level levelEventId="com.homerun.levelEvent.LevelEvent4" Name="HB_Level2" visualStaticBack="">
  <startPos hero1="250~-440" cameraPos="450~-285~1150" cameraBounds="8~999999999999~-10000~88"/>
  <Layer Name="LayerBack2" z="-600" bDrawable="true" bActionLayer="false" compression="1" levelPartWidth="256" levelPartHeight="256" xOffset="-236" yOffset="-4335" fxVisual="" enemyVisual="" bTransparent="false" tileHor="true" tileVer="false">
    <Visual dynamicVisual="com.homerun.exported.LEVEL4BACK2"/>
    <Collision/>
    <EventSwitch/>
  </Layer>
  <Layer Name="LayerBack1" z="-450" bDrawable="true" bActionLayer="false" compression="1" levelPartWidth="256" levelPartHeight="256" xOffset="-872" yOffset="-208" fxVisual="" enemyVisual="" bTransparent="true" tileHor="true" tileVer="false">
    <Visual dynamicVisual="com.homerun.exported.LEVEL4BACK1"/>
    <Collision/>
    <EventSwitch/>
  </Layer>
  <Layer Name="LayerAction1" z="0" bDrawable="true" bActionLayer="true" compression="1" levelPartWidth="256" levelPartHeight="256" xOffset="0" yOffset="-1" fxVisual="" enemyVisual="" bTransparent="true" tileHor="true" tileVer="false">
    <Visual dynamicVisual="com.homerun.exported.LEVEL4ACTION"/>
    <Collision>
      <Line x1="0" y1="0" x2="100" y2="0" canDrop="false" canWallKick="false"/>
    </Collision>
    <EventSwitch/>
  </Layer>
   <Layer Name="LayerAction1" z="500" compression="1" levelPartWidth="256" levelPartHeight="256" xOffset="0" yOffset="-16" fxVisual="" enemyVisual="" bTransparent="true" tileHor="true" tileVer="false">
    <Visual dynamicVisual="com.lachhhEngine.games.animation.Animation"/>
    <Collision>
      <Line x1="0" y1="0" x2="100" y2="0" canDrop="false" canWallKick="false"/>
    </Collision>
    <EventSwitch/>
  </Layer>
</Level>;
	}
}

