instance ORG_40141_Shrike (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Krzykacz";
	Npctype =				Npctype_Main;
	guild =					GIL_MEATBUG;      
	level =					40;
	
	voice =					7;
	id =					40141;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		95;
	attribute[ATR_DEXTERITY] =		120;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	850;
	attribute[ATR_HITPOINTS] =		850;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 2,"Hum_Head_Thief", 9,  1, ORG_ARMOR_M);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);		
	
	fight_tactic	=	FAI_HUMAN_MASTER;
	
	//-------- Talente ----------
B_SetFightSkills(self,70);
	
	
	//-------- inventory --------   
	                                 
	B_CreateAmbientInv (self);
	EquipItem (self, ItMw_DaggerOfMurder);		
	EquipItem (self, ItRw_Bow_Small_02);
	CreateInvItems (self, ItAmArrow, 20);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_PreStart_40141;
};

FUNC VOID Rtn_PreStart_40141 ()
{
	TA_Boss			(23,30,08,00,"WP_SHRIKE_HOSTILE");
	TA_Boss		    (08,00,23,30,"WP_SHRIKE_HOSTILE");
};

