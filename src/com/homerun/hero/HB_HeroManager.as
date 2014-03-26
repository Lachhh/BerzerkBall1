package com.homerun.hero {
	import com.homerun.factories.HB_AnimationFactory;
	import com.homerun.io.HB_GameProgress;
	import com.homerun.meta.HB_MetaFactory;
	import com.homerun.meta.HB_MetaManager;
	import com.homerun.meta.MetaHBGeek;
	import com.homerun.meta.MetaHBHero;
	import com.lachhhEngine.games.Game;
	import com.lachhhEngine.games.factory.ObjectFactory;
	import com.lachhhEngine.games.hero.HeroManager;

	/**
	 * @author Lachhh
	 */
	public class HB_HeroManager extends HeroManager {
		static private var _persoId:int = 0 ; 
		static public const PERSO_ETIENNE:int = _persoId++;
		static public const PERSO_LACHHH:int = _persoId++;
		static public const PERSO_MARC:int = _persoId++;
		static public const PERSO_VINCENT:int = _persoId++;
		static public const PERSO_MATHIEU:int = _persoId++;
		static public const PERSO_TITI:int = _persoId++;
		static public const PERSO_DENIZE:int = _persoId++;
		
		public function HB_HeroManager(context : Game, heroFactory : ObjectFactory) {
			super(context, heroFactory);
		}
		
		public function CreateMetaGeek():MetaHBGeek {
			var metaMkActor:MetaHBGeek = MetaHBGeek(HB_MetaManager.typedInstance.CreateCustomMetaMKActor(HB_MetaFactory.ID_META_MK_GEEK, HB_HeroFactory.ID_GEEK, 250, -440, 0, 0, context.teamFactory.ALLY1_TEAM, context.teamFactory.ENEMY1_TEAM, context.actionLayer.metaLayer, null));
			metaMkActor.animIdleId = HB_AnimationFactory.ID_GEEK_COMPUTER_IDLE;
			metaMkActor.animWalkId = HB_AnimationFactory.ID_GEEK_COMPUTER_WALK;
			metaMkActor.animAirIdle.push(HB_AnimationFactory.ID_GEEK_COMPUTER_HIT1);
			metaMkActor.animAirIdle.push(HB_AnimationFactory.ID_GEEK_COMPUTER_HIT2);
			metaMkActor.animAirIdle.push(HB_AnimationFactory.ID_GEEK_COMPUTER_HIT3);
			metaMkActor.animLanded = HB_AnimationFactory.ID_GEEK_COMPUTER_LANDED;
			metaMkActor.animFlyId = HB_AnimationFactory.ID_GEEK_COMPUTER_FLY;
			return metaMkActor;
		}
		
		public function CreateFromHeroProgress():Hero {
			switch(HB_GameProgress.gameProgress.metaProgress.lastSelected.id) {
				case PERSO_LACHHH : return Hero(CreateHero(CreateMetaLachhh())) ;
				case PERSO_ETIENNE : return Hero(CreateHero(CreateMetaEtienne())) ;
				case PERSO_MARC : return Hero(CreateHero(CreateMetaMarcus())) ;
				case PERSO_MATHIEU : return Hero(CreateHero(CreateMetaMathieu())) ;
				case PERSO_VINCENT : return Hero(CreateHero(CreateMetaBallon())) ;
				case PERSO_TITI : return Hero(CreateHero(CreateMetaComeau())) ;
				case PERSO_DENIZE : return Hero(CreateHero(CreateMetaDenize())) ;	
			}	
			return null;
		}
		private function CreateMetaHero():MetaHBHero {
			var metaMkActor:MetaHBHero = MetaHBHero(HB_MetaManager.typedInstance.CreateCustomMetaMKActor(HB_MetaFactory.ID_META_MK_HERO, HB_HeroFactory.ID_HERO, 150, -440, 0, 0, context.teamFactory.ALLY1_TEAM, context.teamFactory.ENEMY1_TEAM, context.actionLayer.metaLayer, null));
			metaMkActor.metaPerso = HB_GameProgress.gameProgress.metaProgress.lastSelected;
			return metaMkActor;
		}
		
		public function CreateMetaEtienne():MetaHBHero {
			var metaHero:MetaHBHero = CreateMetaHero();
			metaHero.animIdleId = HB_AnimationFactory.ID_ETIENNE_IDLE ;
			metaHero.animGatherInId = HB_AnimationFactory.ID_ETIENNE_GATHERIN ;
			metaHero.animGatherIdleId = HB_AnimationFactory.ID_ETIENNE_GATHERIDLE ;
			metaHero.animHitId = HB_AnimationFactory.ID_ETIENNE_HIT ;
			metaHero.animRunningGatherHitId = HB_AnimationFactory.ID_ETIENNE_RUNNING_HIT ;
			metaHero.animRunningGatherIdleId = HB_AnimationFactory.ID_ETIENNE_RUNNING_IDLE ;
			return metaHero;
		} 
		
		public function CreateMetaMarcus():MetaHBHero {
			var metaHero:MetaHBHero = CreateMetaHero();
			metaHero.animIdleId = HB_AnimationFactory.ID_MARCUS_IDLE ;
			metaHero.animGatherInId = HB_AnimationFactory.ID_MARCUS_GATHERIN ;
			metaHero.animGatherIdleId = HB_AnimationFactory.ID_MARCUS_GATHERIDLE ;
			metaHero.animHitId = HB_AnimationFactory.ID_MARCUS_HIT ;
			metaHero.animRunningGatherHitId = HB_AnimationFactory.ID_MARCUS_RUNNING_HIT ;
			metaHero.animRunningGatherIdleId = HB_AnimationFactory.ID_MARCUS_RUNNING_IDLE ;
			return metaHero;
		} 
		
		public function CreateMetaLachhh():MetaHBHero {
			var metaHero:MetaHBHero = CreateMetaHero();
			metaHero.animIdleId = HB_AnimationFactory.ID_LACHHH_IDLE ;
			metaHero.animGatherInId = HB_AnimationFactory.ID_LACHHH_GATHERIN ;
			metaHero.animGatherIdleId = HB_AnimationFactory.ID_LACHHH_GATHERIDLE ;
			metaHero.animHitId = HB_AnimationFactory.ID_LACHHH_HIT ;
			metaHero.animRunningGatherHitId = HB_AnimationFactory.ID_LACHHH_RUNNING_HIT ;
			metaHero.animRunningGatherIdleId = HB_AnimationFactory.ID_LACHHH_RUNNING_IDLE ;
			return metaHero;
		}
		
		public function CreateMetaBallon():MetaHBHero {
			var metaHero:MetaHBHero = CreateMetaHero();
			metaHero.animIdleId = HB_AnimationFactory.ID_BALLON_IDLE ;
			metaHero.animGatherInId = HB_AnimationFactory.ID_BALLON_GATHERIN ;
			metaHero.animGatherIdleId = HB_AnimationFactory.ID_BALLON_GATHERIDLE ;
			metaHero.animHitId = HB_AnimationFactory.ID_BALLON_HIT ;
			metaHero.animRunningGatherHitId = HB_AnimationFactory.ID_BALLON_RUNNING_HIT ;
			metaHero.animRunningGatherIdleId = HB_AnimationFactory.ID_BALLON_RUNNING_IDLE ;
			return metaHero;
		}  
		
		public function CreateMetaMathieu():MetaHBHero {
			var metaHero:MetaHBHero = CreateMetaHero();
			metaHero.animIdleId = HB_AnimationFactory.ID_MATHIEU_IDLE ;
			metaHero.animGatherInId = HB_AnimationFactory.ID_MATHIEU_GATHERIN ;
			metaHero.animGatherIdleId = HB_AnimationFactory.ID_MATHIEU_GATHERIDLE ;
			metaHero.animHitId = HB_AnimationFactory.ID_MATHIEU_HIT ;
			metaHero.animRunningGatherHitId = HB_AnimationFactory.ID_MATHIEU_RUNNING_HIT ;
			metaHero.animRunningGatherIdleId = HB_AnimationFactory.ID_MATHIEU_RUNNING_IDLE ;
			return metaHero;
		} 
		
		public function CreateMetaComeau():MetaHBHero {
			var metaHero:MetaHBHero = CreateMetaHero();
			metaHero.animIdleId = HB_AnimationFactory.ID_TITI_IDLE ;
			metaHero.animGatherInId = HB_AnimationFactory.ID_TITI_GATHERIN ;
			metaHero.animGatherIdleId = HB_AnimationFactory.ID_TITI_GATHERIDLE ;
			metaHero.animHitId = HB_AnimationFactory.ID_TITI_HIT ;
			metaHero.animRunningGatherHitId = HB_AnimationFactory.ID_TITI_RUNNING_HIT ;
			metaHero.animRunningGatherIdleId = HB_AnimationFactory.ID_TITI_RUNNING_IDLE ;
			return metaHero;
		} 
		
		public function CreateMetaDenize():MetaHBHero {
			var metaHero:MetaHBHero = CreateMetaHero();
			metaHero.animIdleId = HB_AnimationFactory.ID_DENIZE_IDLE ;
			metaHero.animGatherInId = HB_AnimationFactory.ID_DENIZE_GATHERIN ;
			metaHero.animGatherIdleId = HB_AnimationFactory.ID_DENIZE_GATHERIDLE ;
			metaHero.animHitId = HB_AnimationFactory.ID_DENIZE_HIT ;
			metaHero.animRunningGatherHitId = HB_AnimationFactory.ID_DENIZE_RUNNING_HIT ;
			metaHero.animRunningGatherIdleId = HB_AnimationFactory.ID_DENIZE_RUNNING_IDLE ;
			return metaHero;
		} 
	}
}
