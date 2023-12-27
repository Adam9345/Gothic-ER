instance GRD_40016_Straznik (Npc_Default)
{
	//-------- primary data --------
	
	name =							NAME_gardist;
	npctype =						npctype_ambient;
	guild =							GIL_NONE;      
	level =							30;
	
	
	voice =							4;
	id =							40016;


	//-------- abilities --------
	
	attribute[ATR_STRENGTH] =		75;
	attribute[ATR_DEXTERITY] =		10;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	376;
	attribute[ATR_HITPOINTS] =		376;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,1,"Hum_Head_Fighter", 70,  3, GRD_ARMOR_M);

	B_Scale (self); 
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_MASTER; 
	//-------- Talents  --------                                    

B_SetFightSkills(self,50);
	
	//-------- inventory --------                                    

	EquipItem (self, ItMw_1H_Sword_Long_01);	
    B_CreateAmbientInv (self);


	//-------------Daily Routine-------------
	daily_routine = Rtn_FMstart_40016;
};

FUNC VOID Rtn_FMstart_40016 ()	//FM
{
	TA_Stand		(00,00,23,00,"WP_STRAZ_CESAR2");
	TA_Stand		(23,00,24,00,"WP_STRAZ_CESAR2");
};
FUNC VOID Rtn_PIEC_40016 ()
{
	TA_Stand		(20,00,07,00,"OM_CAVE1_81");
	TA_Stand		(07,00,20,00,"OM_CAVE1_81");
};













