//***************************
//	Shadowbeast Prototype	
//***************************

PROTOTYPE Mst_Default_StonePuma(C_Npc)			
{
	//----- Monster ----
	name							=	"Magiczna Pantera";
	guild							=	GIL_SKELETON;
	//aivar[AIV_MM_REAL_ID]			= 	ID_Gargoyle;
	level							=	20;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	100;
	attribute	[ATR_DEXTERITY]		=	100;
	attribute	[ATR_HITPOINTS_MAX]	=	500;
	attribute	[ATR_HITPOINTS]		=	500;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	//----- Protections ----
	protection	[PROT_BLUNT]		=	110;
	protection	[PROT_EDGE]			=	110;
	protection	[PROT_POINT]		=	110;
	protection	[PROT_FIRE]			=	60;
	protection	[PROT_FLY]			=	110;
	protection	[PROT_MAGIC]		=	60;

	//----- Damage Types ----
	damagetype 						=	DAM_EDGE|DAM_MAGIC;
//	damage		[DAM_INDEX_BLUNT]	=	0;
    damage		[DAM_INDEX_EDGE]	=	100;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
	damage		[DAM_INDEX_MAGIC]	=	30;

	//----- Kampf-Taktik ----
	fight_tactic				=	FAI_SHADOWBEAST;
  	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 3000;
	aivar[AIV_MM_Behaviour]		= HUNTER;
	
    aivar[AIV_MM_PercRange]		= 1500;
	aivar[AIV_MM_DrohRange]		= 1300;
	aivar[AIV_MM_AttackRange]	= 1200;
	aivar[AIV_MM_DrohTime]		= 4;
	aivar[AIV_MM_FollowTime]	= 10;
	aivar[AIV_MM_FollowInWater] = FALSE;
	
	
    start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RoamStart] 	= OnlyRoutine;
};


//***************
//	Visuals
//***************

func void B_SetVisuals_StonePuma()
{
	Mdl_SetVisual			(self,"StonePuma.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"StonePuma_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


//*******************
//	StonePuma    	
//*******************

INSTANCE StonePuma	(Mst_Default_StonePuma)
{
	B_SetVisuals_StonePuma();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItAt_Puma_Claws,2);
};





