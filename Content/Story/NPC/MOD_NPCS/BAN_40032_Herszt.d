instance BAN_40032_Herszt (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Herszt bandy";
	Npctype			=         NPCTYPE_MAIN;
	guild 		    =             GIL_NONE;
	level           =					30;

	
	voice =					11;
	id =					40032;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		80;
	attribute[ATR_DEXTERITY] =		80;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	250;
	attribute[ATR_HITPOINTS] =		250;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");

	//				body mesh,		head mesh,hairmesh,	face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",1, 1,"Hum_Head_Bald",16 ,  4, ORG_ARMOR_H);
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
	daily_routine = Rtn_start_40032;
	};

FUNC VOID Rtn_start_40032() //zanim zagada do bohatera
{
    TA_Stand		(13,00,14,00,"WP_TP_BAN1");	
    TA_Stand		(14,00,13,00,"WP_TP_BAN1");
};

