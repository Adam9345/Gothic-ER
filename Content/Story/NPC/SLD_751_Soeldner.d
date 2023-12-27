instance SLD_751_Soeldner (Npc_Default)
{
	//-------- primary data --------
	
	name =					Name_Soeldner;
	Npctype =				NPCTYPE_MINE_GUARD;
	guild =					GIL_SLD;       
	level =					16;
	
	voice =					1;
	id =					751;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		75;
	attribute[ATR_DEXTERITY] =	    55;
	attribute[ATR_MANA_MAX] =		 0;
	attribute[ATR_MANA] =			 0;
	attribute[ATR_HITPOINTS_MAX] =	400;
	attribute[ATR_HITPOINTS] =		400;


	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 1,"Hum_Head_Pony", 50, 2, SLD_ARMOR_H);
	
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

	daily_routine = Rtn_FMCstart_751;

};

FUNC VOID Rtn_FMCstart_751()
{
	TA_Guard	(01,00,13,00,	"FMC_ENTRANCE");
	TA_Guard 	(13,00,01,00,	"FMC_ENTRANCE");
};







