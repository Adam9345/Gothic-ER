instance ORG_801_Lares (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Lares";
	Npctype =				Npctype_Main;
	guild =					GIL_ORG;      
	level =					15;
	flags = 1;
	voice =					11;
	id =					801;


	//-------- abilities --------
	attribute[ATR_STRENGTH] =		80;
	attribute[ATR_DEXTERITY] =		60;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	460;
	attribute[ATR_HITPOINTS] =		460;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 1 ,"Hum_Head_Pony", 87, 4,ORG_ARMOR_H);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);		
	
	fight_tactic	=	FAI_HUMAN_MASTER;		
	
	//-------- Talente ----------
B_SetFightSkills(self,70);
	//------- Inventory ---------

	B_CreateAmbientInv (self);
	EquipItem (self, Lares_Axt);
	EquipItem (self, ItRw_Bow_Long_01);
	CreateInvItems (self, ItAmArrow, 20);
	

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_801;
	
	aivar[AIV_ITEMSCHWEIN] = TRUE;
};

FUNC VOID Rtn_start_801 ()
{
	TA_Sleep		(01,00,07,00,"NC_HUT22_IN");
	TA_StandAround	(07,00,01,00,"NC_HUT22_IN_MOVEMENT2");
};








