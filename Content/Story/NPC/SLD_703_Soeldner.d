instance SLD_703_Soeldner (Npc_Default)
{
	//-------- primary data --------
	
	name =					Name_Soeldner;
	Npctype =				NPCTYPE_GUARD;
	guild =					GIL_SLD;       
	level =					18;
	
	voice =					11;
	id =					703;


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
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 1,"Hum_Head_Pony", 57,  1,SLD_ARMOR_M);
	
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

	daily_routine = Rtn_start_703;
};

FUNC VOID Rtn_start_703 ()
{
	TA_SitAround	(07,45,23,45,"NC_PLACE01");
	TA_Sleep		(23,45,07,45,"NC_HUT02_IN");
};
FUNC VOID Rtn_obrona_703 ()
{
	TA_Stand	(07,45,23,45,"SLD2");
	TA_Sleep		(23,45,07,45,"SLD2");
};
FUNC VOID Rtn_atak_703 ()
{
	TA_FollowPC	(07,45,23,45,"OW_MOLERAT_FORCAVE_SPAWN");
	TA_FollowPC	(23,45,07,45,"OW_MOLERAT_FORCAVE_SPAWN");
};