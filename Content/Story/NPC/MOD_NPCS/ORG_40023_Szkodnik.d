instance ORG_40023_Szkodnik (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Szkodnik";
	Npctype =				NPCTYPE_MAIN;
	guild =					GIL_ORG;      
	level =					15;

	
	voice =					6;
	id =					40023;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		50;
	attribute[ATR_DEXTERITY] =		50;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	220;
	attribute[ATR_HITPOINTS] =		220;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 0,"Hum_Head_FatBald", 15, 1,ORG_ARMOR_L);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente ----------

B_SetFightSkills(self,50);


	//------- Inventory ---------
B_CreateAmbientInv (self);
CreateInvItems  (self,ItFoBeer,3);
	EquipItem		(self, ItMw_1H_Mace_03_z);
    EquipItem		(self, ItRw_Bow_Long_01);

	
	//-------------Daily Routine-------------
	
	daily_routine = Rtn_start_40023;
};

FUNC VOID Rtn_start_40023 () //Wache: Durchgang zu Lares
{
	TA_Stand	    (20,00,08,00,"WP_CK_ORG2");
	TA_Stand	(08,00,20,00,"WP_CK_ORG2");
};












