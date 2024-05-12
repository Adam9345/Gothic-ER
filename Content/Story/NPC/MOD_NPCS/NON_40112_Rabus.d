instance NON_40112_Herszt (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Herszt bandy";
	Npctype			=       NPCTYPE_main;
	guild 		    =         GIL_BDT;        
	level           =					30;

	
	voice =					11;
	id =					40112;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		100;
	attribute[ATR_DEXTERITY] =		80;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	350;
	attribute[ATR_HITPOINTS] =		350;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");

	//				body mesh,		head mesh,hairmesh,	face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",1, 1,"Hum_Head_Bald",16 ,  4, ORG_ARMOR_M);
	B_Scale (self);	
	Mdl_SetModelFatness (self, 1);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	//-------- Talente ----------

B_SetFightSkills(self,70);
	
	//-------- inventory --------   
	B_CreateAmbientInv (self);
	EquipItem (self, ItRw_Bow_War_02_Z);
	EquipItem (self, ItMw_1H_Mace_03_Z);
	CreateInvItems (self, ItAmArrow, 20);

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_40112;
	};

FUNC VOID Rtn_start_40112() //zanim zagada do bohatera
{
    TA_Stand		(13,00,14,00,"WP_BG_B3");	
    TA_Stand		(14,00,13,00,"WP_BG_B3");
};

