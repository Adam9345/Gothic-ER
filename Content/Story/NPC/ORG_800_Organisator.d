instance ORG_800_Organisator (Npc_Default)
{
	//-------- primary data --------
	
	name =					Name_Organisator;
	Npctype =				Npctype_Ambient;
	guild =							GIL_ORG;      
	level =							15;
	
	voice =							13;
	id =							800;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		80;
	attribute[ATR_DEXTERITY] =		60;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	220;
	attribute[ATR_HITPOINTS] =		220;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	//
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 1,"Hum_Head_Fatbald", 128, 2,ORG_ARMOR_H);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);	
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	
	//-------- Talente ----------
B_SetFightSkills(self,70);

	//------- Inventory ---------

	B_CreateAmbientInv (self);
	EquipItem (self, ItMw_1H_Mace_War_02);
	EquipItem (self, ItRw_Bow_Long_01);
	CreateInvItems (self, ItAmArrow, 20);

	//-------------Daily Routine-------------

	daily_routine = Rtn_start_800;

};

FUNC VOID Rtn_start_800 ()
{
	TA_Sleep		(00,30,08,00,"NC_HUT26_IN");	
	TA_SitCampfire	(08,00,00,30,"NC_PATH17_MOVEMENT");	
};
//jest
FUNC VOID Rtn_handel_800 ()
{
	TA_Stand		(07,30,01,00,"OW_PATH_056");
	TA_Stand		(01,00,07,30,"OW_PATH_056");
};












