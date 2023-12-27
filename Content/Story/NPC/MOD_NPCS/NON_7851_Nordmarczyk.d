instance NON_7851_Nordmarczyk (Npc_Default)
{

	name =					"Thongvor";
	npctype		=			npctype_main;
	guild 		=			GIL_NONE;      
	level =					50;
	voice =					10;
	id =					7851;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		120;
	attribute[ATR_DEXTERITY] =		60;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	480;
	attribute[ATR_HITPOINTS] =		480;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Bald", 120, 1, NORDMARIAN_ARMOR);

	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	//-------- Talente ----------

B_SetFightSkills(self,80);
	
	
	//-------- inventory --------   
	                                 
	CreateInvItems (self, ItKeLockpick,6);		
	CreateInvItems(self, ItMiNugget, 300);
	CreateInvItems (self, ItFoRice,5);
	CreateInvItems (self, ItFoBooze, 2);
	CreateInvItems (self, ItLsTorch, 2);
	CreateInvItems (self, ItFo_Potion_Health_01, 5);
	CreateInvItem (self, ItFoLoaf);
	CreateInvItem (self, ItAt_Claws_01);
 	EquipItem (self, ItMw_2H_Axe_Big_06);		
	EquipItem (self, ItRw_Bow_Long_05_Z);
	CreateInvItems (self, ItAmArrow, 60);
	//smith
	CreateInvItems	(self,	ItMiSwordRaw,		10);
	CreateInvItems	(self,	ItMiSwordRawHot,	10);
	CreateInvItems	(self,	ItMiSwordBladeHot,	10);
	CreateInvItems	(self,	ItMiSwordBlade,		10);
	CreateInvItems	(self,	Gold01,		5);

	daily_routine = Rtn_start_7851;
};

FUNC VOID Rtn_start_7851 ()
{
	TA_Sleep		(22,00,08,00,"KRYJOWKA2");
	
	TA_Smith_Fire	(08,00,08,10,"DP");
	TA_Smith_Anvil	(08,10,08,20,"DP");
	TA_Smith_Fire	(08,20,08,30,"DP");
	TA_Smith_Anvil	(08,30,08,40,"DP");
	TA_Smith_Cool	(08,40,08,50,"DP");
	TA_Smith_Anvil	(08,50,09,00,"DP");

	TA_Smith_Fire	(09,00,09,10,"DP");
	TA_Smith_Anvil	(09,10,09,20,"DP");
	TA_Smith_Fire	(09,20,09,30,"DP");
	TA_Smith_Anvil	(09,30,09,40,"DP");
	TA_Smith_Cool	(09,40,09,50,"DP");
	TA_Smith_Anvil	(09,50,10,00,"DP");

	TA_Smith_Fire	(10,00,10,10,"DP");
	TA_Smith_Anvil	(10,10,10,20,"DP");
	TA_Smith_Fire	(10,20,10,30,"DP");
	TA_Smith_Anvil	(10,30,10,40,"DP");
	TA_Smith_Cool	(10,40,10,50,"DP");
	TA_Smith_Anvil	(10,50,11,00,"DP");    
          
	TA_Smith_Fire	(11,00,11,10,"DP");
	TA_Smith_Anvil	(11,10,11,20,"DP");
	TA_Smith_Fire	(11,20,11,30,"DP");
	TA_Smith_Anvil	(11,30,11,40,"DP");
	TA_Smith_Cool	(11,40,11,50,"DP");
	TA_Smith_Anvil	(11,50,12,00,"DP");


	TA_Smith_Fire	(12,00,12,10,"DP");
	TA_Smith_Anvil	(12,10,12,20,"DP");
	TA_Smith_Fire	(12,20,12,30,"DP");
	TA_Smith_Anvil	(12,30,12,40,"DP");
	TA_Smith_Cool	(12,40,12,50,"DP");
	TA_Smith_Anvil	(12,50,13,00,"DP");
          
	TA_Smith_Fire	(13,00,13,10,"DP");
	TA_Smith_Anvil	(13,10,13,20,"DP");
	TA_Smith_Fire	(13,20,13,30,"DP");
	TA_Smith_Anvil	(13,30,13,40,"DP");
	TA_Smith_Cool	(13,40,13,50,"DP");
	TA_Smith_Anvil	(13,50,14,00,"DP");

	TA_Smith_Fire	(14,00,14,10,"DP");
	TA_Smith_Anvil	(14,10,14,20,"DP");
	TA_Smith_Fire	(14,20,14,30,"DP");
	TA_Smith_Anvil	(14,30,14,40,"DP");
	TA_Smith_Cool	(14,40,14,50,"DP");
	TA_Smith_Anvil	(14,50,15,00,"DP");

	TA_Smith_Fire	(15,00,15,10,"DP");
	TA_Smith_Anvil	(15,10,15,20,"DP");
	TA_Smith_Fire	(15,20,15,30,"DP");
	TA_Smith_Anvil	(15,30,15,40,"DP");
	TA_Smith_Cool	(15,40,15,50,"DP");
 	TA_Smith_Anvil	(15,50,16,00,"DP");

	TA_Smith_Fire	(16,00,16,10,"DP");
	TA_Smith_Anvil	(16,10,16,20,"DP");
	TA_Smith_Fire	(16,20,16,30,"DP");
	TA_Smith_Anvil	(16,30,16,40,"DP");
	TA_Smith_Cool	(16,40,16,50,"DP");
	TA_Smith_Anvil	(16,50,17,00,"DP");

	TA_Smith_Fire	(17,00,17,10,"DP");
	TA_Smith_Anvil	(17,10,17,20,"DP");
	TA_Smith_Fire	(17,20,17,30,"DP");
	TA_Smith_Anvil	(17,30,17,40,"DP");
	TA_Smith_Cool	(17,40,17,50,"DP");
	TA_Smith_Anvil	(17,50,18,00,"DP");

	TA_Smith_Fire	(18,00,18,10,"DP");
	TA_Smith_Anvil	(18,10,18,20,"DP");
	TA_Smith_Fire	(18,20,18,30,"DP");
	TA_Smith_Anvil	(18,30,18,40,"DP");
	TA_Smith_Cool	(18,40,18,50,"DP");
	TA_Smith_Anvil	(18,50,19,00,"DP");

	TA_Smith_Fire	(19,00,19,10,"DP");
	TA_Smith_Anvil	(19,10,19,20,"DP");
	TA_Smith_Fire	(19,20,19,30,"DP");
	TA_Smith_Anvil	(19,30,19,40,"DP");
	TA_Smith_Cool	(19,40,19,50,"DP");
	TA_Smith_Anvil	(19,50,20,00,"DP");

	TA_Smith_Fire	(20,00,20,10,"DP");
	TA_Smith_Anvil	(20,10,20,20,"DP");
	TA_Smith_Fire	(20,20,20,30,"DP");
	TA_Smith_Anvil	(20,30,20,40,"DP");
	TA_Smith_Cool	(20,40,20,50,"DP");
	TA_Smith_Anvil	(20,50,21,00,"DP");
	
	TA_Smith_Fire	(21,00,21,10,"DP");
	TA_Smith_Anvil	(21,10,21,20,"DP");
	TA_Smith_Fire	(21,20,21,30,"DP");
	TA_Smith_Anvil	(21,30,21,40,"DP");
	TA_Smith_Cool	(21,40,21,50,"DP");
	TA_Smith_Anvil	(21,50,22,00,"DP");
};
