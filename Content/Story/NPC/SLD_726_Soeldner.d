instance SLD_726_Soeldner (Npc_Default)
{
	//-------- primary data --------
	
	name =					Name_Soeldner;
	Npctype =				NPCTYPE_GUARD;
	guild =					GIL_SLD;       
	level =					18;
	
	voice =					11;
	id =					726;


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
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 1,"Hum_Head_Pony", 53,  1,SLD_ARMOR_H);
	
	B_Scale (self);
	Mdl_SetModelFatness (self, 0);

	
	fight_tactic	=	FAI_HUMAN_STRONG; 
	
	//-------- Talente --------
B_SetFightSkills(self,70);
	//-------- inventory --------                                    

	EquipItem (self, ItMw_1H_Mace_War_03);
	EquipItem (self, ItRw_Bow_Long_01);
	CreateInvItems(self, ItAmArrow, 20);
B_CreateAmbientInv (self);
		
	//-------------Daily Routine-------------

	daily_routine = Rtn_start_726;
};

FUNC VOID Rtn_start_726 () //Vor Erzhaufen
{
	TA_GuardPassage		(23,00,07,00,"NC_PATH40_GUARD2");
	TA_GuardPassage		(07,00,23,00,"NC_PATH40_GUARD2");
};

FUNC VOID Rtn_loadsword_726 () 
{
	TA_Guard		(23,00,07,00,"NC_PLACE02");
	TA_Guard		(07,00,23,00,"NC_PLACE02");
};








