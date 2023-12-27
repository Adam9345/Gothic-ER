instance SLD_752_Okyl (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Okyl";
	Npctype =						NpcType_Main;
	guild =							GIL_SLD;       
	level =							18;
	
	voice =							11;
	id =							752;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		105;
	attribute[ATR_DEXTERITY] =		70;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	
	
	attribute[ATR_HITPOINTS_MAX] =	526;
	attribute[ATR_HITPOINTS] =		526;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1,"Hum_Head_Pony", 45, 1,SLD_ARMOR_H);
	
	B_Scale (self);
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_RANGED; 
	
	//-------- Talente --------

B_SetFightSkills(self,70);

	//-------- inventory --------                                    

	EquipItem (self, ItMw_2H_Axe_Heavy_02);
	EquipItem (self, ItRw_Bow_Long_05);
	CreateInvItems (self, ItFoRice,12);
	CreateInvItems (self, ItFoLoaf,6);
	CreateInvItems (self, ItFoMutton,4);
	CreateInvItems(self, ItMiNugget, 100);
	CreateInvItems (self, ItFoBooze,4);
	CreateInvItems (self, ItLsTorch,5);
	CreateInvItems (self, ItMi_Alchemy_Moleratlubric_01,5);
	CreateInvItems (self, ItMi_Alchemy_Salt_01,20);
    CreateInvItems (self, ItMwPickaxe,5);

	CreateInvItem	(self,ItMi_Stuff_OldCoin_02);	

	//-------------Daily Routine-------------

	daily_routine = Rtn_FMCstart_752;

};

FUNC VOID Rtn_FMCstart_752 ()
{
	TA_GuardPalisade	(01,00,13,00, "FMC_PATH07");
	TA_GuardPalisade	(13,00,01,00, "FMC_PATH07");
};










