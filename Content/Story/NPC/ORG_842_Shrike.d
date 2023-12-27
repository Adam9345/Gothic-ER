instance ORG_842_Shrike (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Krzykacz";
	Npctype =				Npctype_Main;
	guild =					GIL_ORG;      
	level =					6;
	
	voice =					7;
	id =					842;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		30;
	attribute[ATR_DEXTERITY] =		30;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	136;
	attribute[ATR_HITPOINTS] =		136;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 2,"Hum_Head_Thief", 9,  1, ORG_ARMOR_L);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	//-------- Talente ----------
B_SetFightSkills(self,30);
	//-------- inventory --------   
	                                 
	B_CreateAmbientInv (self);
	EquipItem (self, ItMw_1H_Mace_02);
	EquipItem (self, ItRw_Bow_Small_02);
	CreateInvItems (self, ItAmArrow, 20);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_PreStart_842;
};

FUNC VOID Rtn_PreStart_842 ()
{
	TA_Sleep			(23,30,08,00,"NC_HUT01_IN");
	TA_RepairHut		(08,00,23,30,"NC_HUT01_OUT");
};

FUNC VOID Rtn_Start_842 ()
{
	TA_Smalltalk		(20,30,23,30,"KRZYKACZ_KARCZMA");
	TA_StandDrunk		(23,30,02,30,"KRZYKACZ_KARCZMA");
	TA_Sleep			(02,30,08,00,"NC_HUT18_IN");
	TA_Smoke			(08,00,20,30,"NC_PATH09");  //auf Stand-FP
};


FUNC VOID Rtn_CH4_842 ()
{ 
	TA_Smoke		    (20,30,23,30,"WP_KRZYKACZ_CH4");
	TA_Smoke	     	(23,30,02,30,"WP_KRZYKACZ_CH4");
	TA_Smoke			(02,30,08,00,"WP_KRZYKACZ_CH4");
	TA_Smoke			(08,00,20,30,"WP_KRZYKACZ_CH4");  //auf Stand-FP
};

