/*************************************************************************
**	Dzik Prototype													**
*************************************************************************/

PROTOTYPE Mst_Default_Dzik(C_Npc)			
{
	name							=	"Dzik";
	guild							=	GIL_WOLF;
	aivar[AIV_MM_REAL_ID]			= 	ID_DZIK;
	level							=	Level_Keiler;
//-------------------------------------------------------------
	attribute	[ATR_STRENGTH]		=	70;
	attribute	[ATR_DEXTERITY]		=	70;
	
	attribute	[ATR_HITPOINTS_MAX]	=	90;
	attribute	[ATR_HITPOINTS]		=	90;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//-------------------------------------------------------------
	protection	[PROT_BLUNT]		=	50;
	protection	[PROT_EDGE]			=	50;
	protection	[PROT_POINT]		=	20;
	protection	[PROT_FIRE]			=	50;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	0;
//-------------------------------------------------------------
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;
//-------------------------------------------------------------
	fight_tactic							=	FAI_Wolf;
//-------------------------------------------------------------
	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 3000;

	aivar[AIV_MM_Behaviour]		= HUNTER;
	
	aivar[AIV_MM_PercRange]		= 1400;
	aivar[AIV_MM_DrohRange]		= 1300;
	aivar[AIV_MM_AttackRange]	= 700;
	aivar[AIV_MM_DrohTime]		= 5;
	aivar[AIV_MM_FollowTime]	= 10;
	aivar[AIV_MM_FollowInWater] = TRUE;
//---------------------------------------------------
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RoamStart] 	= OnlyRoutine;
};
//---------------------------------------------------
func void Set_Dzik_Visuals()
{
	Mdl_SetVisual			(self,	"Keiler.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Keiler_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


/*************************************************************************
**	Dzik    														**
*************************************************************************/

INSTANCE Dzik	(Mst_Default_Dzik)
{
	CreateInvItems (self, ItFoMuttonRaw, 2);
	Set_Dzik_Visuals();
	Npc_SetToFistMode(self);
};


