instance ORG_844_Lefty (Npc_Default)
{
	//-------- primary data --------
	
	name =						"Lewus";
	Npctype =					NPCTYPE_MAIN;	
	guild =						GIL_ORG;      
	level =						10;
	voice =						7;
	id =						844;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		58;
	attribute[ATR_DEXTERITY] =		45;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	220;
	attribute[ATR_HITPOINTS] =		220;

	//protection	[PROT_BLUNT]		=	23;
	//protection	[PROT_EDGE]			=	23;
	
	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Bald", 37, 2, ORG_ARMOR_M);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);	
	
	fight_tactic	=	FAI_HUMAN_STRONG;	
	
	//-------- Talente ----------

B_SetFightSkills(self,50);

	//-------- inventory --------   
	                                 
	B_CreateAmbientInv (self);
	EquipItem (self, ItMw_1H_Mace_03_Z);
	EquipItem (self, ItRw_Bow_Long_01);
	CreateInvItems (self, ItAmArrow, 20);
	

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_844;
	senses = SENSE_SEE|SENSE_HEAR|SENSE_SMELL;
};

FUNC VOID Rtn_start_844 ()
{
	TA_SitCampfire 	(19,00,08,00,"NC_PATH86_MOVEMENT");
	TA_Smalltalk 	(08,00,19,00,"NC_PATH53");
};

// REBEL
FUNC VOID Rtn_rebel_844 ()
{
	TA_Smalltalk 	(19,00,08,00,"NC_PATH53");
	TA_Smalltalk 	(08,00,19,00,"NC_PATH53");
};








