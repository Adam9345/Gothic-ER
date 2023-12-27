instance ORG_873_Cipher (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Cipher";
	Npctype =				Npctype_Main;
	guild =					GIL_ORG;      
	level =					8;
	flags =                 NPC_FLAG_IMMORTAL;
	voice =					12;
	id =					873;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		60;
	attribute[ATR_DEXTERITY] =		30;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	460;
	attribute[ATR_HITPOINTS] =		460;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				32hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 0, "Hum_Head_FatBald", 95, 2, ORG_ARMOR_H);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	//-------- Talente ----------
B_SetFightSkills(self,30);

	//-------- inventory --------   		
	CreateInvItems(self, ItMiNugget, 500);

	CreateInvItem (self, ItMi_Stuff_Plate_01);
	CreateInvItem (self, ItMi_Stuff_Barbknife_01);
	CreateInvItem (self, ItMi_Stuff_Cup_01);
	CreateInvItem (self, ItAm_Quiver);
	
	EquipItem (self, ItMw_1H_Mace_03);
	EquipItem (self, ItRw_Bow_Long_01);
	CreateInvItems (self, ItAmArrow,20);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_873;
};

FUNC VOID Rtn_start_873 ()
{
    TA_Sleep		(03,05,08,00,"NC_HUT24_IN");
    TA_StandAround	(08,00,03,05,"NC_TAVERN_BAR");
};

FUNC VOID Rtn_konwoj_873 ()
{
	TA_StandAround		(01,00,07,30,"BANDYTA_RESP1");
	TA_StandAround   	(07,30,01,00,"BANDYTA_RESP1");
};












