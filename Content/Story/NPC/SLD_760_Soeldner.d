instance SLD_760_Soeldner (Npc_Default)
{
	//-------- primary data --------
	
	name =					Name_Soeldner;
	Npctype =				NPCTYPE_MINE_GUARD;
	guild =					GIL_SLD;       
	level =					18;
	
	voice =					13;
	id =					760;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		 90;
	attribute[ATR_DEXTERITY] =		 70;
	attribute[ATR_MANA_MAX] =		  0;
	attribute[ATR_MANA] =			  0;
	attribute[ATR_HITPOINTS_MAX] =	400;
	attribute[ATR_HITPOINTS] =		400;

	//-------- visuals --------
	//edit by Nocturn
	
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//				body mesh,				head mesh,			53	hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 1,"Hum_Head_Pony", 104,  1,SLD_ARMOR_L);
	
	B_Scale (self);
	Mdl_SetModelFatness (self, 0);

	
	fight_tactic	=	FAI_HUMAN_STRONG; 
	
	//-------- Talente --------

B_SetFightSkills(self,50);

	//-------- inventory --------                                    

	EquipItem (self, ItMw_1H_Mace_War_03);
	EquipItem (self, ItRw_Bow_Long_01);
	CreateInvItems(self, ItAmArrow, 20);
B_CreateAmbientInv (self);
		
	//-------------Daily Routine-------------

	daily_routine = Rtn_FMCstart_760;
	
	//-------------Misions-------------------

};

FUNC VOID Rtn_FMCstart_760 ()
{
	TA_GuardPassage	(01,00,13,00,	"FMC_PATH25");
	TA_GuardPassage	(13,00,01,00,	"FMC_PATH25");
};










