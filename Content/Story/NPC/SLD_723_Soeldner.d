instance SLD_723_Soeldner (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Soeldner;
	Npctype							= NPCTYPE_FRIEND;
	guild =							GIL_SLD;       
	level =							18;
	
	voice =							11;
	id =							723;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		90;
	attribute[ATR_DEXTERITY] =		70;
	attribute[ATR_MANA_MAX] =		10;
	attribute[ATR_MANA] =			10;
	attribute[ATR_HITPOINTS_MAX] =	400;
	attribute[ATR_HITPOINTS] =		400;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1,"Hum_Head_Pony", 48, 1,SLD_ARMOR_H);
	
	B_Scale (self);
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_STRONG; 
	
	//-------- Talente --------
	//-------- Talente --------
B_SetFightSkills(self,70);
	//-------- inventory --------                                    

	EquipItem (self, ItMw_1H_Mace_War_03);
	EquipItem (self, ItRw_Bow_Long_01);
	CreateInvItems(self, ItAmArrow, 20);
B_CreateAmbientInv (self);
		

	//-------------Daily Routine-------------

	daily_routine = Rtn_start_723;

};

FUNC VOID Rtn_start_723 ()
{
	TA_GuardPassage	(08,00,22,00,"NC_GUARD_MAGES_LEFT");
	TA_GuardPassage	(22,00,08,00,"NC_GUARD_MAGES_LEFT");
};










