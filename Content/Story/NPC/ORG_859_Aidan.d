instance ORG_859_Aidan (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Aidan";
	Npctype =				Npctype_Main;
	guild =					GIL_ORG;      
	level =					20;
	
	voice =					13;
	id =					859;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		50;
	attribute[ATR_DEXTERITY] =		50;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	200;
	attribute[ATR_HITPOINTS] =		200;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 2,"Hum_Head_Thief", 9,  1, ORG_ARMOR_M);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	//-------- Talente ----------
B_SetFightSkills(self,30);
	
	//-------- inventory --------   
	                                 
	B_CreateAmbientInv (self);
	EquipItem (self, ItMw_1H_Mace_03);
	EquipItem (self, ItRw_Bow_Long_01);
	CreateInvItems (self, ItAmArrow, 20);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_859;
};

FUNC VOID Rtn_start_859 ()
{
	TA_StandAround	(07,00,22,00,"OW_WOODRUIN_WOLF_SPAWN");
	TA_SitCampfire	(22,00,07,00,"OW_WOODRUIN_WOLF_SPAWN");
};

