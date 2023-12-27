instance ORG_841_Silas (Npc_Default)
// hat den mittleren Organistor-Dress und Bogen3, weil er Attentäter ist
{
	//-------- primary data --------
	
	name =					"Silas";
	Npctype =				Npctype_Main;
	guild =					GIL_ORG;      
	level =					15;
	flags       =   NPC_FLAG_IMMORTAL;
	voice =					6;
	id =					841;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		80;
	attribute[ATR_DEXTERITY] =		60;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	520;
	attribute[ATR_HITPOINTS] =		520;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 3,"Hum_Head_FatBald", 5, 1,ORG_ARMOR_H);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	//-------- Talente ----------
B_SetFightSkills(self,70);
	//------- Inventory ---------
    B_GiveTradeInv_Silas1();
	B_CreateAmbientInv (self);
	EquipItem (self, Silas_Axt);
	EquipItem (self, ItRw_Bow_Long_01);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_841;
};

FUNC VOID Rtn_start_841 ()
{
    TA_Boss			(08,00,24,00,"NC_TAVERN_ROOM04");
	TA_Sleep		(24,00,08,00,"NC_TAVERN_BACKROOM09");
};













