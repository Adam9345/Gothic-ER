/*************************************************************************
**	WhiteWolf Prototype														**
*************************************************************************/

PROTOTYPE Mst_Default_WhiteWolf(C_Npc)			
{
	name							=	"Bia³y wilk";
	guild							=	GIL_WOLF;
	aivar[AIV_MM_REAL_ID]			= 	ID_WHITEWOLF;
	level							=	Level_WhiteWolf;
//-----------------------------------------------------------
	attribute	[ATR_STRENGTH]		=	40;
	attribute	[ATR_DEXTERITY]		=	40;
	
	attribute	[ATR_HITPOINTS_MAX]	=	130;
	attribute	[ATR_HITPOINTS]		=	130;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//-----------------------------------------------------------
	protection	[PROT_BLUNT]		=	45;
	protection	[PROT_EDGE]			=	25;
	protection	[PROT_POINT]		=	5;
	protection	[PROT_FIRE]			=	0;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	0;
//-----------------------------------------------------------
	damagetype 						=	DAM_EDGE;
//-----------------------------------------------------------
	fight_tactic					=	FAI_WOLF;
//-----------------------------------------------------------
	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 1000;		// 30m

	aivar[AIV_MM_Behaviour]		= PACKHUNTER;
	
	aivar[AIV_MM_PercRange]		= 1500;
	aivar[AIV_MM_DrohRange]		= 1200;
	aivar[AIV_MM_AttackRange]	= 500;
	aivar[AIV_MM_DrohTime]		= 3;
	aivar[AIV_MM_FollowTime]	= 10;
	aivar[AIV_MM_FollowInWater] = TRUE;
//-----------------------------------------------------------
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RoamStart] 	= OnlyRoutine;	
};
//-----------------------------------------------------------
func void Set_WhiteWolf_Visuals()
{
	Mdl_SetVisual			(self,"Wolf.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"WHITE_WOL_BODY",		1,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


/*************************************************************************
**	WhiteWolf    															**
*************************************************************************/

INSTANCE WhiteWolf	(Mst_Default_WhiteWolf)
{
	Set_WhiteWolf_Visuals();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItMi_WhiteWolfBlood, 1);
};