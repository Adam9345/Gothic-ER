instance SLD_701_Orik (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Orik";
	Npctype =				NPCTYPE_MAIN;
	guild =					GIL_SLD;
	level =					18;
	
	voice =					8;
	id =					701;
    flags = 1;

	//-------- abilities --------

	attribute[ATR_STRENGTH] =		90;
	attribute[ATR_DEXTERITY] =		70;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	256;
	attribute[ATR_HITPOINTS] =		256;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");

	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 3,"Hum_Head_FatBald", 8, 0,SLD_ARMOR_H);
	
	B_Scale (self);
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_MASTER; 
	
	//-------- Talente --------
	
B_SetFightSkills(self,80);
	//-------- inventory --------                                    
	
	EquipItem (self, Oriks_Axt);
	EquipItem (self, ItRw_Bow_Long_01);
	CreateInvItems(self, ItAmArrow, 20);
B_CreateAmbientInv (self);
	
	
	//-------------Daily Routine-------------

	daily_routine = Rtn_start_701;

};

FUNC VOID Rtn_start_701 ()
{
	TA_Smalltalk   	(07,00,19,00,"NC_SMALL_CAVE_CENTER");
	TA_Boss			(19,00,00,00,"NC_HUT05_OUT");
	TA_Sleep		(00,00,07,00,"NC_HUT05_IN");	
};
func void rtn_wodospad_701 () //quest 
{
TA_GUIDEPC (07,00,16,00,"WODOSPAD");
TA_GuidePC (16,00,07,00,"WODOSPAD");
};

func void rtn_PZ_701 () //quest 
{
TA_Smalltalk (07,00,16,00,"NC_SMALL_CAVE_CENTER");
TA_Smalltalk (16,00,07,00,"NC_SMALL_CAVE_CENTER");
};
