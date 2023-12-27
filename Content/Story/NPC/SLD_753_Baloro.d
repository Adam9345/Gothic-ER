instance SLD_753_Baloro (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Baloro";
	Npctype =					    Npctype_Main;
	guild =							GIL_ORG;       
	level =							16;
	
	voice =							8;
	id =							753;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		75;
	attribute[ATR_DEXTERITY] =		55;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	400;
	attribute[ATR_HITPOINTS] =		400;

	//-------- visuals --------
	//edit by Nocturn
	
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 1,"Hum_Head_Fighter", 51, 2,SLD_ARMOR_L);
	
	B_Scale (self);
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_MASTER; 
	
	//-------- Talente --------
	
B_SetFightSkills(self,50);

	//-------- inventory --------                                    

	EquipItem (self, ItMw_1H_Mace_War_03);
    B_CreateAmbientInv (self);
	

	//-------------Daily Routine-------------

	daily_routine = Rtn_FMCstart_753;
	
	//------------- //MISSIONs------------------

};

FUNC VOID Rtn_FMCstart_753 ()
{
	TA_GuardPalisade	(01,00,13,00, "FMC_HUT07_OUT");
	TA_GuardPalisade	(13,00,01,00, "FMC_HUT07_OUT");
};










