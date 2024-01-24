/*************************************************************************
**	Troll Prototype														**
*************************************************************************/

PROTOTYPE Mst_Default_TrollBlack(C_Npc)			
{
	name							=	"Czarny troll";
	guild							=	GIL_TROLL;
	aivar[AIV_MM_REAL_ID]			= 	ID_TROLLBLACK;
	level							=	100;
//------------------------------------------------------	
	attribute	[ATR_STRENGTH]		=	300;
	attribute	[ATR_DEXTERITY]		=	300;
	
	attribute	[ATR_HITPOINTS_MAX]	=	1500;
	attribute	[ATR_HITPOINTS]		=	1500;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//------------------------------------------------------	
	protection	[PROT_BLUNT]		=	200;
	protection	[PROT_EDGE]			=	200;
	protection	[PROT_POINT]		=	200;	// immun
	protection	[PROT_FIRE]			=	150;
	protection	[PROT_FLY]			=	9999;	// immun
	protection	[PROT_MAGIC]		=	120;
//------------------------------------------------------	
	damagetype 						=	DAM_FLY;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;
//------------------------------------------------------	
	fight_tactic					=	FAI_TROLL;
//------------------------------------------------------	
	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 3000;

	aivar[AIV_MM_Behaviour]		= PASSIVE;
	
	aivar[AIV_MM_PercRange]		= 1500;
	aivar[AIV_MM_DrohRange]		= 1300;
	aivar[AIV_MM_AttackRange]	= 700;
	aivar[AIV_MM_DrohTime]		= 5;
	aivar[AIV_MM_FollowTime]	= 10;
	aivar[AIV_MM_FollowInWater] = FALSE;
//-------------------------------------------------------------
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};
//-------------------------------------------------------------

func void Set_TrollBlack_Visuals()
{
	Mdl_SetVisual			(self,	"Troll.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"TRO_Black_BODY",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


INSTANCE BlackTroll	(Mst_Default_TrollBlack)
{
	Set_TrollBlack_Visuals();
	Npc_SetToFistMode(self);
};

