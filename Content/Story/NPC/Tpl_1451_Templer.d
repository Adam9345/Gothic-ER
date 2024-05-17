instance TPL_1451_Templer (Npc_Default)
{
	//-------- primary data --------
	name 	=	NAME_MadTemplar2;
	npctype =	NPCTYPE_GUARD;
	guild 	=	GIL_BDT;//dawniej gil_gur, ale teraz guru mo¿e byæ player
	level 	=	100;
	
	voice 	=	8;
	id 		=	1451;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] =		70;
	attribute[ATR_DEXTERITY] =		65;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	250;
	attribute[ATR_HITPOINTS] =		250;
	
	//------ Protection -------
	protection	[PROT_BLUNT]		=	1000;
	protection	[PROT_EDGE]			=	1000;
	protection	[PROT_POINT]		=	1000;
	protection	[PROT_FIRE]			=	80;
	protection	[PROT_FLY]			=	80;
	protection	[PROT_MAGIC]		=	70;
	
	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1 ,"Hum_Head_Bald", 117,  2, DarkTempler_Armor_H);

	B_Scale (self);
	Mdl_SetModelFatness(self,1);
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	//-------- Talente -------- 
   B_SetFightSkills(self,50);
	//-------- inventory --------
	
	CreateInvItem (self, ItMw_2H_Sword_Light_02);
B_CreateAmbientInv (self);
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_OT_1451;
};

FUNC VOID Rtn_start_1451 ()
{
     	TA_HostileGuard	(00,00,21,00,"TPL_408");	
    	TA_HostileGuard	(21,00,24,00,"TPL_408");
};

FUNC VOID Rtn_OT_1451 ()
{
     	TA_HostileGuard	(00,00,21,00,"TPL_382");	
    	TA_HostileGuard	(21,00,24,00,"TPL_382");
};