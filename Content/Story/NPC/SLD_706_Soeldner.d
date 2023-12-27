instance SLD_706_Soeldner (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Soeldner;
	Npctype =						NpcType_Guard;
	guild =							GIL_SLD;       
	level =							18;
	
	voice =							11;
	id =							706;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		90;
	attribute[ATR_DEXTERITY] =		70;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	
	
	attribute[ATR_HITPOINTS_MAX] =	400;
	attribute[ATR_HITPOINTS] =		400;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1,"Hum_Head_Pony", 49, 1,SLD_ARMOR_H);
	
	B_Scale (self);
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_RANGED; 
	
	//-------- Talente --------
B_SetFightSkills(self,70);
	//-------- inventory --------                                    

	EquipItem (self, ItMw_1H_Mace_War_03);
	EquipItem (self, ItRw_Bow_Long_01);
	CreateInvItems(self, ItAmArrow, 20);
B_CreateAmbientInv (self);
		

	//-------------Daily Routine-------------

	daily_routine = Rtn_start_706;

};

FUNC VOID Rtn_start_706 ()
{
	TA_StandAround	(07,30,00,00,"NC_HUT02_OUT");
	TA_Sleep		(00,00,07,30,"NC_HUT02_IN");
};
FUNC VOID Rtn_obrona_706 ()
{
	TA_StandAround	(07,30,00,00,"SLD3");
	TA_Sleep		(00,00,07,30,"SLD3");
};
FUNC VOID Rtn_atak_706 ()
{
	TA_FollowPC	(07,30,00,00,"PATH_OC_NC_9");
	TA_FollowPC		(00,00,07,30,"PATH_OC_NC_9");
};








