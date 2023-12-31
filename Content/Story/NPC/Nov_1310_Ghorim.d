instance NOV_1310_Ghorim (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Ghorim";
	Npctype	 	=		Npctype_Main;
	guild 		=		GIL_NOV;
	level 		=		9;

	voice 		=		2;
	id 			=		1310;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	15;
	attribute[ATR_DEXTERITY] 		=	15;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_MANA] 			=	0;
	attribute[ATR_HITPOINTS_MAX] 	=	148;
	attribute[ATR_HITPOINTS] 		=	148;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1 ,"Hum_Head_Psionic", 29,  1, NOV_ARMOR_M);

	B_Scale (self);
	Mdl_SetModelFatness(self,1);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente --------
		
B_SetFightSkills(self,30);		
	
	//-------- inventory --------

	EquipItem (self, ItMw_1H_Axe_Old_01);
	//CreateInvItem (self, ItFoSoup);
	//CreateInvItem (self, ItMiJoint);
 
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_PreStart_1310;
};

FUNC VOID Rtn_PreStart_1310 ()
{
	TA_HerbAlchemy 	(06,55,23,55,"PSI_HERB_PLACE_1");
    TA_Sleep 		(23,55,06,55,"PSI_6_HUT_IN_BED3");
};

func void Rtn_start_1310 ()
{
	TA_Sleep 		(06,55,23,55,"PSI_6_HUT_IN_BED3");
	TA_Sleep 		(23,55,06,55,"PSI_6_HUT_IN_BED3");
};
func void Rtn_Will_1310 ()
{
	TA_Lean 		(06,55,23,55,"WP_LEAN_GHORIM");
	TA_Lean 		(23,55,06,55,"WP_LEAN_GHORIM");
};
FUNC VOID Rtn_wait_1310 ()
{
   TA_Stand	(08,00,20,00,"SHRAT2");
   TA_Stay	(20,00,08,00,"SHRAT2");
};
FUNC VOID Rtn_follow2_1310 ()
{
   TA_FollowPC	(08,00,20,00,"OW_PATH_067");
   TA_FollowPC	(20,00,08,00,"OW_PATH_067");
};

func void Rtn_mine_1310 ()
{
	TA_PickOre	(23,00,16,00,"GOLDMINE_SHRAT");
	TA_PickOre	(16,00,23,00,"GOLDMINE_SHRAT");
};