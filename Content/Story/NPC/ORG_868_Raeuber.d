instance ORG_868_Raeuber (Npc_Default)
{
	//-------- primary data --------
	
	name =					Name_Raeuber;
	npctype		=	npctype_ambient;
	guild 		=	GIL_BAU;        
	level =						12;
	
	voice =						6;
	id =						868;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		60;
	attribute[ATR_DEXTERITY] =		30;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	184;
	attribute[ATR_HITPOINTS] =		184;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Bald",37 , 2, BAU_ARMOR_L);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);	
	
	fight_tactic	=	FAI_HUMAN_RANGED;	
	
	//-------- Talente ----------

B_SetFightSkills(self,30);

	//-------- inventory --------   
B_CreateAmbientInv (self);
	EquipItem (self, ItMw_1H_Mace_03);
	EquipItem (self, ItRw_Bow_Long_01);
	CreateInvItems (self, ItAmArrow, 20);
	

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_868;
};

FUNC VOID Rtn_start_868 ()
{
    TA_GuardPalisade		(13,00,14,00,"LOCATION_11_16");	
    TA_GuardPalisade		(14,00,13,00,"LOCATION_11_16");
};

FUNC VOID Rtn_OMFull_868 ()
{
	 TA_GuardPalisade		(13,00,14,00,"LOCATION_11_16");	
    TA_GuardPalisade		(14,00,13,00,"LOCATION_11_16");
};

FUNC VOID Rtn_FMTaken_868 () 
{
	 TA_GuardPalisade		(13,00,14,00,"LOCATION_11_16");	
    TA_GuardPalisade		(14,00,13,00,"LOCATION_11_16");
};

FUNC VOID Rtn_OrcAssault_868 () 
{
	 TA_GuardPalisade		(13,00,14,00,"LOCATION_11_16");	
    TA_GuardPalisade		(14,00,13,00,"LOCATION_11_16");
};












