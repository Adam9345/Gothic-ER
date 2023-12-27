instance SLD_765_Soeldner (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Soeldner;
	Npctype =						NpcType_MINE_Guard;
	guild =							GIL_SLD;       
	level =							16;
	
	voice =							11;
	id =							765;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		75;
	attribute[ATR_DEXTERITY] =		55;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	400;
	attribute[ATR_HITPOINTS] =		400;


	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 1,"Hum_Head_FatBald", 49, 1,SLD_ARMOR_M);
	
	B_Scale (self);
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_RANGED; 
	
	//-------- Talente --------
	
B_SetFightSkills(self,30);

	//-------- inventory --------                                    

	EquipItem (self, ItMw_1H_Mace_War_03);
	EquipItem (self, ItRw_Bow_Long_01);
	CreateInvItems(self, ItAmArrow, 20);
B_CreateAmbientInv (self);
	
	
	//-------------Daily Routine-------------

	daily_routine = Rtn_FMCstart_765;

};

FUNC VOID Rtn_FMCstart_765 ()
{
	TA_GuardPalisade	(01,00,13,00,	"FMC_HUT10_OUT");
	TA_GuardPalisade	(13,00,01,00,	"FMC_HUT10_OUT");
};










