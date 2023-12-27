// ******************************************************
// B_ClearJunkTradeInv
// --------------------
// Löscht alle slftems aus dem Inventory der Händler
// bei einem Kapitelwechsel wird in B_GiveTradeInv_<slf> 
// aufgerufen
// ******************************************************

func void B_ClearJunkTradeInv (var C_NPC slf) 
{
	if (Hlp_IsValidNpc(slf)) 
	{
// Waffen	
		Npc_RemoveInvItems	(slf ,ItMw2hOrcSword01  	, Npc_HasItems (slf, ItMw2hOrcSword01      ));
		Npc_RemoveInvItems	(slf ,ItMw2hOrcAxe01    	, Npc_HasItems (slf, ItMw2hOrcAxe01        ));
		Npc_RemoveInvItems	(slf ,ItMw2hOrcAxe02 	    , Npc_HasItems (slf, ItMw2hOrcAxe02        ));
		Npc_RemoveInvItems	(slf ,ItMw2hOrcAxe03     	, Npc_HasItems (slf, ItMw2hOrcAxe03        ));
		Npc_RemoveInvItems	(slf ,ItMw2hOrcAxe04 	    , Npc_HasItems (slf, ItMw2hOrcAxe04        ));
		Npc_RemoveInvItems	(slf ,ItMw2hOrcMace01    	, Npc_HasItems (slf, ItMw2hOrcMace01       ));
		Npc_RemoveInvItems	(slf ,ItRwOrcstaff 	        , Npc_HasItems (slf, ItRwOrcstaff          ));
		Npc_RemoveInvItems	(slf ,ItRwUdOrcstaff     	, Npc_HasItems (slf, ItRwUdOrcstaff        ));
		Npc_RemoveInvItems	(slf ,ItMw_2H_OrcSword_02 	, Npc_HasItems (slf, ItMw_2H_OrcSword_02   ));

	
// Animaltrophies
		Npc_RemoveInvItems	(slf ,ItAt_Teeth_01 	, Npc_HasItems (slf, ItAt_Teeth_01         ));
		Npc_RemoveInvItems	(slf ,ItAt_Wolf_01   	, Npc_HasItems (slf, ItAt_Wolf_01          ));
		Npc_RemoveInvItems	(slf ,ItAt_Wolf_02 	    , Npc_HasItems (slf, ItAt_Wolf_02          ));
		Npc_RemoveInvItems	(slf ,ItAt_Dzik_01   	, Npc_HasItems (slf, ItAt_Dzik_01          ));
		Npc_RemoveInvItems	(slf ,ItAt_Waran_01 	, Npc_HasItems (slf, ItAt_Waran_01         ));
		Npc_RemoveInvItems	(slf ,ItAt_Claws_01 	, Npc_HasItems (slf, ItAt_Claws_01         ));
		Npc_RemoveInvItems	(slf ,ItAt_Crawler_02 	, Npc_HasItems (slf, ItAt_Crawler_02       ));
		
		Npc_RemoveInvItems	(slf ,ItAt_Crawler_01   , Npc_HasItems (slf, ItAt_Crawler_01       ));
		Npc_RemoveInvItems	(slf ,ItAt_Shadow_01 	, Npc_HasItems (slf, ItAt_Shadow_01        ));
		Npc_RemoveInvItems	(slf ,ItAt_Shadow_02 	, Npc_HasItems (slf, ItAt_Shadow_02        ));
		Npc_RemoveInvItems	(slf ,ItAt_Lurker_01 	, Npc_HasItems (slf, ItAt_Lurker_01        ));
		Npc_RemoveInvItems	(slf ,ItAt_Lurker_02 	, Npc_HasItems (slf, ItAt_Lurker_02        ));
		Npc_RemoveInvItems	(slf ,ItAt_Troll_02 	, Npc_HasItems (slf, ItAt_Troll_02         ));
		Npc_RemoveInvItems	(slf ,ItAt_Troll_01 	, Npc_HasItems (slf, ItAt_Troll_01         ));
		
		Npc_RemoveInvItems	(slf ,ItAt_Swampshark_01	, Npc_HasItems (slf, ItAt_Swampshark_01 ));
		Npc_RemoveInvItems	(slf ,ItAt_Swampshark_02 	, Npc_HasItems (slf, ItAt_Swampshark_02 ));
		Npc_RemoveInvItems	(slf ,ItAt_Bloodfly_01 		, Npc_HasItems (slf, ItAt_Bloodfly_01   ));
		
		Npc_RemoveInvItems	(slf ,ItAt_Bloodfly_02 		, Npc_HasItems (slf, ItAt_Bloodfly_02    ));
		Npc_RemoveInvItems	(slf ,ItAt_WhiteWolf_01 	, Npc_HasItems (slf, ItAt_WhiteWolf_01   ));
		Npc_RemoveInvItems	(slf ,ItAt_Claws_02 	    , Npc_HasItems (slf, ItAt_Claws_02       ));
		Npc_RemoveInvItems	(slf ,ItAt_WolfWhite_01 	, Npc_HasItems (slf, ItAt_WolfWhite_01   ));
		Npc_RemoveInvItems	(slf ,ItAt_TrollFur 		, Npc_HasItems (slf, ItAt_TrollFur       ));
		Npc_RemoveInvItems	(slf ,ItAt_Alligator_Skin 	, Npc_HasItems (slf, ItAt_Alligator_Skin ));
		Npc_RemoveInvItems	(slf ,ItAt_Waran_Skin 		, Npc_HasItems (slf, ItAt_Waran_Skin     ));
		Npc_RemoveInvItems	(slf ,ItAt_Snapper_Skin 	, Npc_HasItems (slf, ItAt_Snapper_Skin   ));
								
// Food
		Npc_RemoveInvItems	(slf ,ItFoApple 			, Npc_HasItems (slf, ItFoApple ));
		Npc_RemoveInvItems	(slf ,ItFoCheese 			, Npc_HasItems (slf, ItFoCheese ));
		Npc_RemoveInvItems	(slf ,ItFo_mutton_01 		, Npc_HasItems (slf, ItFo_mutton_01 ));
		Npc_RemoveInvItems	(slf ,ItFoLoaf 			    , Npc_HasItems (slf, ItFoLoaf ));
		Npc_RemoveInvItems	(slf ,ItFo_Fish 			, Npc_HasItems (slf, ItFo_Fish ));
		Npc_RemoveInvItems	(slf ,ItFoMuttonRaw 		, Npc_HasItems (slf, ItFoMuttonRaw ));
		Npc_RemoveInvItems	(slf ,ItFoMutton 			, Npc_HasItems (slf, ItFoMutton ));
		Npc_RemoveInvItems	(slf ,ItFoRice 			    , Npc_HasItems (slf, ItFoRice ));
		Npc_RemoveInvItems	(slf ,ItFoSoup      		, Npc_HasItems (slf, ItFoSoup ));
		Npc_RemoveInvItems	(slf ,ItFo_Sausage 			, Npc_HasItems (slf, ItFo_Sausage ));
		Npc_RemoveInvItems	(slf ,ItFo_Honey 			, Npc_HasItems (slf, ItFo_Honey ));
		
		Npc_RemoveInvItems	(slf ,ItFo_Potion_Water_01  , Npc_HasItems (slf, ItFo_Potion_Water_01 ));
		Npc_RemoveInvItems	(slf ,ItFoBeer 		    	, Npc_HasItems (slf, ItFoBeer ));
		Npc_RemoveInvItems	(slf ,ItFoBooze 			, Npc_HasItems (slf, ItFoBooze ));
		Npc_RemoveInvItems	(slf ,ItFoWine 		    	, Npc_HasItems (slf, ItFoWine ));
		Npc_RemoveInvItems	(slf ,ItFo_Milk 			, Npc_HasItems (slf, ItFo_Milk ));
		
// Misc
	//	Npc_RemoveInvItems	(slf ,ItMi_Stomper 			, Npc_HasItems (slf, ItMi_Stomper ));
		Npc_RemoveInvItems	(slf ,ItMiHammer 			, Npc_HasItems (slf, ItMiHammer ));
		Npc_RemoveInvItems	(slf ,ItMiScoop 			, Npc_HasItems (slf, ItMiScoop ));
	//	Npc_RemoveInvItems	(slf ,ItMi_Rake 			, Npc_HasItems (slf, ItMi_Rake ));
	//	Npc_RemoveInvItems	(slf ,ItMi_Broom 			, Npc_HasItems (slf, ItMi_Broom ));
		Npc_RemoveInvItems	(slf ,ItMiLute 		    	, Npc_HasItems (slf, ItMiLute ));
	//	Npc_RemoveInvItems	(slf ,ItMi_Brush 			, Npc_HasItems (slf, ItMi_Brush ));
		//Npc_RemoveInvItems	(slf ,ItMi_Joint 			, Npc_HasItems (slf, ItMi_Joint ));
		//Npc_RemoveInvItems	(slf ,ItMi_Alarmhorn 		, Npc_HasItems (slf, ItMi_Alarmhorn ));
		
		//Npc_RemoveInvItems	(slf ,ItMiOldCoin 			, Npc_HasItems (slf, ItMiOldCoin ));
		Npc_RemoveInvItems	(slf ,ItMi_GoldCandleHolder	, Npc_HasItems (slf, ItMi_GoldCandleHolder ));
	//	Npc_RemoveInvItems	(slf ,ItMi_GoldNecklace 	, Npc_HasItems (slf, ItMi_GoldNecklace ));
		
		Npc_RemoveInvItems	(slf ,ItMi_SilverRing 			, Npc_HasItems (slf, ItMi_SilverRing ));
//		Npc_RemoveInvItems	(slf ,ItMi_SilverNecklace 		, Npc_HasItems (slf, ItMi_SilverNecklace ));
		Npc_RemoveInvItems	(slf ,ItMi_SilverCandleHolder 	, Npc_HasItems (slf, ItMi_SilverCandleHolder ));
		Npc_RemoveInvItems	(slf ,ItMi_SilverPlate 			, Npc_HasItems (slf, ItMi_SilverPlate ));
		Npc_RemoveInvItems	(slf ,ItMi_SilverCup 			, Npc_HasItems (slf, ItMi_SilverCup ));
	//	Npc_RemoveInvItems	(slf ,ItMi_SilverChalice 		, Npc_HasItems (slf, ItMi_SilverChalice ));  
		
		Npc_RemoveInvItems	(slf ,ItMi_GoldRing 			, Npc_HasItems (slf, ItMi_GoldRing ));  
//		Npc_RemoveInvItems	(slf ,ItMi_GoldNecklace 		, Npc_HasItems (slf, ItMi_GoldNecklace ));  
		Npc_RemoveInvItems	(slf ,ItMi_GoldCandleHolder 	, Npc_HasItems (slf, ItMi_GoldCandleHolder ));  
		Npc_RemoveInvItems	(slf ,ItMi_GoldCup 				, Npc_HasItems (slf, ItMi_GoldCup ));  
	//	Npc_RemoveInvItems	(slf ,ItMi_GoldChest 			, Npc_HasItems (slf, ItMi_GoldChest ));  
		//Npc_RemoveInvItems	(slf ,ItMi_JeweleryChest 		, Npc_HasItems (slf, ItMi_JeweleryChest ));  
		
		//Npc_RemoveInvItems	(slf ,ItMi_InnosStatue 			, Npc_HasItems (slf, ItMi_InnosStatue ));  
		//Npc_RemoveInvItems	(slf ,ItMi_Sextant 				, Npc_HasItems (slf, ItMi_Sextant ));  

// Pflanzen
/*
		Npc_RemoveInvItems	(slf ,ItPl_Beet 			, Npc_HasItems (slf, ItPl_Beet ));
		Npc_RemoveInvItems	(slf ,ItPl_SwampHerb 		, Npc_HasItems (slf, ItPl_SwampHerb ));
		Npc_RemoveInvItems	(slf ,ItPl_Mushroom_01 		, Npc_HasItems (slf, ItPl_Mushroom_01 ));
		Npc_RemoveInvItems	(slf ,ItPl_Mushroom_02 		, Npc_HasItems (slf, ItPl_Mushroom_02 ));
		Npc_RemoveInvItems	(slf ,ItPl_Blueplant 		, Npc_HasItems (slf, ItPl_Blueplant ));
		Npc_RemoveInvItems	(slf ,ItPl_Forestberry 		, Npc_HasItems (slf, ItPl_Forestberry ));
		Npc_RemoveInvItems	(slf ,ItPl_Planeberry 		, Npc_HasItems (slf, ItPl_Planeberry ));
*/	
// Ranged Weapons

	};	
};
	
	

