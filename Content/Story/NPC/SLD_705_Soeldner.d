instance SLD_705_Soeldner (Npc_Default)
{
	//-------- primary data --------
	
	name =					Name_Soeldner;
	Npctype =				NPCTYPE_GUARD;
	guild =					GIL_SLD;       
	level =					16;
	
	voice =					8;
	id =					705;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		75;
	attribute[ATR_DEXTERITY] =	    55;
	attribute[ATR_MANA_MAX] =		 0;
	attribute[ATR_MANA] =			 0;
	attribute[ATR_HITPOINTS_MAX] =	400;
	attribute[ATR_HITPOINTS] =		400;


	//-------- visuals --------
	//edit by Nocturn
	
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 1,"Hum_Head_Pony", 50, 2, SLD_ARMOR_L);
	
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

	daily_routine = Rtn_start_705;

};

FUNC VOID Rtn_start_705()
{
	TA_Smith_Sharp 	(08,00,00,00,"NC_HUT03_OUT_MOVEMENT");
	TA_Sleep		(00,00,08,00,"NC_HUT03_IN");
};
	






