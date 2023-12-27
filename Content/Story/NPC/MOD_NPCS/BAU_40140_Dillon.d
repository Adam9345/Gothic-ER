instance BAU_40140_Dillon (Npc_Default)
{
	//-------- primary data --------
	
	name =			"Dillon";
	npctype		=	npctype_ambient;
	guild 		=	GIL_BAU;      
	level =					12;
	
	voice =					13;
	id =					40140;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		60;
	attribute[ATR_DEXTERITY] =		30;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	324;
	attribute[ATR_HITPOINTS] =		324;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Thief", 35, 2, BAU_ARMOR_M);

	B_Scale (self);	
	Mdl_SetModelFatness (self, 1);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	//-------- Talente ----------
B_SetFightSkills(self,50);
	
	//-------- inventory --------   
	                                 
	B_CreateAmbientInv (self);
 	EquipItem (self, ItMw_1H_Mace_03);		
	EquipItem (self, ItRw_Bow_Long_01);
	CreateInvItems (self, ItAmArrow, 20);

	//-------------Daily Routine-------------

	daily_routine = Rtn_start_40140;
};

FUNC VOID Rtn_start_40140 ()
{
    TA_Lean          (06,00,11,20,"WP_LEAN_DILION");
	TA_Lean		     (11,20,14,00,"WP_LEAN_DILION");
	TA_Lean		     (14,00,06,00,"WP_LEAN_DILION");
};











