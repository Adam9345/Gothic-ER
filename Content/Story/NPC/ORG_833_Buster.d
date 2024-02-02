instance ORG_833_Buster (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Buster";
	Npctype =						Npctype_Main;
	guild =							GIL_ORG;      
	level =							4;
	
	voice =							2;
	id =							833;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		40;
	attribute[ATR_DEXTERITY] =		15;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	88;
	attribute[ATR_HITPOINTS] =		88;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 1,"Hum_Head_FatBald", 39, 2, ORG_ARMOR_H);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);	
	
	self.aivar[AIV_IMPORTANT] = TRUE;
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente --------                                    
B_SetFightSkills(self,30);
	
	
	//-------- inventory --------   
	B_CreateAmbientInv (self);
	EquipItem (self, ItMw_1H_Mace_02);
	EquipItem (self, ItRw_Bow_Small_01);
	CreateInvItems (self, ItAmArrow, 10);
	
	//-------------Daily Routine-------------

	daily_routine = Rtn_Start_833;

};

FUNC VOID Rtn_Start_833 ()
{
    TA_Sleep		(01,00,07,30,"NC_HUT30_IN");
    TA_SitAround	(07,30,01,00,"NC_HUT30_OUT");
};










