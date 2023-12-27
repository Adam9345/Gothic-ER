instance SLD_758_Soeldner (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Soeldner;
	Npctype =						NPCTYPE_MINE_GUARD;
	guild =							GIL_SLD;       
	level =							12;
	
	voice =							11;
	id =							758;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		70;
	attribute[ATR_DEXTERITY] =		70;
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
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1,"Hum_Head_Pony", 53, 1,SLD_ARMOR_L);
	
	B_Scale (self);
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_RANGED; 
	
	//-------- Talente --------
	//-------- Talente --------

B_SetFightSkills(self,50);	

	//-------- inventory --------                                    

	EquipItem (self, ItMw_1H_Mace_War_03);
	EquipItem (self, ItRw_Bow_Long_01);
	CreateInvItems(self, ItAmArrow, 20);
B_CreateAmbientInv (self);
		

	//-------------Daily Routine-------------

	daily_routine = Rtn_FMCstart_758;

};

FUNC VOID Rtn_FMCstart_758 ()
{
	TA_GuardPalisade	(01,00,13,00,	"FMC_PATH06");
	TA_GuardPalisade 	(13,00,01,00,	"FMC_PATH06");
};










