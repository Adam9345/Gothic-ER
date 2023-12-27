instance SLD_736_Soeldner (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Soeldner;
	Npctype =						NPCTYPE_GUARD;
	guild =							GIL_SLD;       
	level =							11;
	
	voice =							11;
	id =							736;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		40;
	attribute[ATR_DEXTERITY] =		35;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	400;
	attribute[ATR_HITPOINTS] =		400;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 1,"Hum_Head_FatBald", 48 , 1, SLD_ARMOR_M);
	
	B_Scale (self);
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_STRONG; 
	
	//-------- Talente --------
	
B_SetFightSkills(self,50);
	//-------- inventory --------                                    

	EquipItem (self, ItMw_1H_Mace_War_02);
	EquipItem (self, ItRw_Bow_Long_01);
	CreateInvItems(self, ItAmArrow, 20);
B_CreateAmbientInv (self);
	

	//-------------Daily Routine-------------

	daily_routine = Rtn_start_736;

};

FUNC VOID Rtn_start_736 ()
{
	TA_Sleep		(20,50,07,10,"NC_HUT08_IN");
	TA_PracticeSword(07,10,20,50,"NC_WATERFALL_TOP02");
};

FUNC VOID Rtn_FMTaken_736 () 
{
	TA_Stay		(00,00,	23,00,"OW_PATH_075_GUARD");    
	TA_Stay		(23,00,	24,00,"OW_PATH_075_GUARD");     
};

//Gdy Gorn idzie na spotkanie.
FUNC VOID Rtn_FMDef_736 () 
{
	TA_GuardPassage	(01,00,13,00,	"FMC_PATH27");
	TA_GuardPassage	(13,00,01,00,	"FMC_PATH27");
};






