//*************************
//	Giant_Rat Prototype		
//*************************

PROTOTYPE Mst_Default_Giant_Rat(C_Npc)			
{
	//----- Monster ----
	name							=	"Olbrzymi szczur";
	
//	aivar[AIV_MM_REAL_ID]			= 	ID_Giant_Rat;
	level							=	4;
    guild							=	GIL_SCAVENGER;
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	15;
	attribute	[ATR_DEXTERITY]		=	15;
	attribute	[ATR_HITPOINTS_MAX]	=	60;
	attribute	[ATR_HITPOINTS]		=	60;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	10;
	protection	[PROT_EDGE]			=	10;
	protection	[PROT_POINT]		=	10;
	protection	[PROT_FIRE]			=	5;
	protection	[PROT_FLY]			=	10;
	protection	[PROT_MAGIC]		=	0;
	
	//----- Damage TYpes ----
	damagetype 						=	DAM_EDGE;


	//----- Kampf-Taktik ----
	fight_tactic					=	FAI_MINECRAWLER;
//------------------------------------------------------
	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 3000;

	aivar[AIV_MM_Behaviour]		= PACKHUNTER;
	
	aivar[AIV_MM_PercRange]		= 1200;
	aivar[AIV_MM_DrohRange]		= 1200;
	aivar[AIV_MM_AttackRange]	= 1000;
	aivar[AIV_MM_DrohTime]		= 2;
	aivar[AIV_MM_FollowTime]	= 10;
	aivar[AIV_MM_FollowInWater] = FALSE;
//---------------------------------------------------
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_WuselStart] 	= OnlyRoutine;
};


//************
//	Visuals
//************

func void B_SetVisuals_Giant_Rat()
{
	Mdl_SetVisual			(self,	"Giant_Rat.mds");
	//								Body-Mesh			Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Giant_Rat_Body",	DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_Giant_Rat_P()
{
	Mdl_SetVisual			(self,	"Giant_Rat.mds");
	//								Body-Mesh			Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Giant_Rat_Body",	DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
	Mdl_SetModelScale(self, 0.8, 0.8, 0.8);
};

//***************
//	Giant_Rat    
//***************

INSTANCE Giant_Rat	(Mst_Default_Giant_Rat)
{
	B_SetVisuals_Giant_Rat();
	Npc_SetToFistMode(self);
    CreateInvItems (self, ItFoMuttonRaw, 2);
};

//------------------PLAGA------------------



INSTANCE Giant_Rat_P1	(Mst_Default_Giant_Rat)
{
 guild							=	GIL_MEATBUG;
	B_SetVisuals_Giant_Rat_P();
	Npc_SetToFistMode(self);

};

INSTANCE Giant_Rat_P2	(Mst_Default_Giant_Rat)
{
	B_SetVisuals_Giant_Rat_P();
	Npc_SetToFistMode(self);
guild							=	GIL_MEATBUG;
};

INSTANCE Giant_Rat_P3	(Mst_Default_Giant_Rat)
{
	B_SetVisuals_Giant_Rat_P();
	Npc_SetToFistMode(self);
guild							=	GIL_MEATBUG;
};


INSTANCE Giant_Rat_P4	(Mst_Default_Giant_Rat)
{
	B_SetVisuals_Giant_Rat_P();
	Npc_SetToFistMode(self);
guild							=	GIL_MEATBUG;
};

INSTANCE Giant_Rat_P5	(Mst_Default_Giant_Rat)
{
	B_SetVisuals_Giant_Rat_P();
	Npc_SetToFistMode(self);
guild							=	GIL_MEATBUG;
};













