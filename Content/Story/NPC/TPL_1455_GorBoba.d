instance TPL_1455_GorBoba (Npc_Default)
{
	//-------- primary data --------
	name 	=	"Gor Boba";
	npctype	=	npctype_main;
	guild 	=	GIL_GUR;//pozostawione bez zmian, zmienia si� w dialogu
	level 	=	50;
	
	voice 	=	8;
	id 		=	1455;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] =		70;
	attribute[ATR_DEXTERITY] =		65;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	250;
	attribute[ATR_HITPOINTS] =		250;
	
	//------ Protection -------
	protection	[PROT_BLUNT]		=	90;
	protection	[PROT_EDGE]			=	90;
	protection	[PROT_POINT]		=	140;
	protection	[PROT_FIRE]			=	50;
	protection	[PROT_FLY]			=	80;
	protection	[PROT_MAGIC]		=	75;
	
	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1 ,"Hum_Head_Bald", 117,  2, TPL_ARMOR_H);

	B_Scale (self);
	Mdl_SetModelFatness(self,1);
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	//-------- Talente -------- 
   B_SetFightSkills(self,80);
	//-------- inventory --------
	
	CreateInvItem (self, ItMw_2H_Sword_Light_02);
B_CreateAmbientInv (self);
	CreateInvItem (self, ItMi_GoldMedallion);
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_OT_1455;
};

FUNC VOID Rtn_start_1455 ()
{
    	TA_Guard	(09,00,21,00,"TPL_408");
    	TA_Guard	(21,00,09,00,"TPL_408");	
};

FUNC VOID Rtn_OT_1455 ()
{
    	TA_AlignGuard	(09,00,21,00,"TPL_110");
    	TA_AlignGuard	(21,00,09,00,"TPL_110");	
};

FUNC VOID Rtn_flee_1455 ()
{
    	TA_Stay	(09,00,21,00,"");
    	TA_Stay	(21,00,09,00,"");	
};