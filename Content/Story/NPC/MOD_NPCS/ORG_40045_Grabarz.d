instance ORG_40045_Grabarz (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Grabarz";
	Npctype =				NPCTYPE_MAIN;
	guild =					GIL_ORG;      
	level =					15;

	
	voice =					6;
	id =					40045;


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
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 0,"Hum_Head_Pony", 10, 1,ORG_ARMOR_M);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente ----------

B_SetFightSkills(self,70);


	//------- Inventory ---------
B_CreateAmbientInv (self);
EquipItem		(self, ItMw_1H_Mace_03);
EquipItem		(self, ItRw_Bow_Long_01);

	
	//-------------Daily Routine-------------
	
	daily_routine = Rtn_start_40045;
};

FUNC VOID Rtn_start_40045 () //Wache: Durchgang zu Lares
{
	TA_Smoke	    (20,00,08,00,"WP_GRABARZ");
	TA_SitAround	(08,00,20,00,"WP_GRABARZ");
};

FUNC VOID Rtn_Brama_40045 () 
{
	TA_Smoke	(20,00,08,00,"WP_GRABARZ_BRAMA");
	TA_STand	(08,00,20,00,"WP_GRABARZ_BRAMA");
};
FUNC VOID Rtn_camp_40045 () 
{
	TA_STand	(06,00,13,00,"WP_GRABARZ_END");
	TA_Boss		(13,00,14,00,"WP_GRABARZ_END");

};











