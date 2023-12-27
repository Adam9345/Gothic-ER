/*************************************************************************
**	marineSha Prototype												**
*************************************************************************/

PROTOTYPE Mst_Default_Marineshark(C_Npc)			
{
	name							=	"Potwór morski";
	guild							=	GIL_SWAMPSHARK;
	aivar[AIV_MM_REAL_ID]			= 	ID_SWAMPSHARK;
	level							=	40;
//---------------------------------------------------------------
	attribute	[ATR_STRENGTH]		=	460;
	attribute	[ATR_DEXTERITY]		=	460;
	
	attribute	[ATR_HITPOINTS_MAX]	=	1400;
	attribute	[ATR_HITPOINTS]		=	1400;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//---------------------------------------------------------------
	protection	[PROT_BLUNT]		=	60;
	protection	[PROT_EDGE]			=	60;
	protection	[PROT_POINT]		=	10;
	protection	[PROT_FIRE]			=	10;
	protection	[PROT_FLY]			=	9999;
	protection	[PROT_MAGIC]		=	40;
//---------------------------------------------------------------
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;
//---------------------------------------------------------------
	fight_tactic							=	FAI_SWAMPSHARK;
//---------------------------------------------------------------
	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 5000;

	aivar[AIV_MM_Behaviour]		= HUNTER;
	
	aivar[AIV_MM_PercRange]		= 1500;
	aivar[AIV_MM_DrohRange]		= 1300;
	aivar[AIV_MM_AttackRange]	= 1000;
	aivar[AIV_MM_DrohTime]		= 5;
	aivar[AIV_MM_FollowTime]	= 10;
	aivar[AIV_MM_FollowInWater] = TRUE;
//-------------------------------------------------------------
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RoamStart] 	= OnlyRoutine;
};
//-------------------------------------------------------------
func void Set_Marineshark_Visuals()
{
	Mdl_SetVisual			(self,	"Swampshark.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Swa_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
	Mdl_SetModelScale (self, 4.0, 4.0, 4.0);
};


/*************************************************************************
**	Marineshark  														**
*************************************************************************/

INSTANCE Marineshark	(Mst_Default_Marineshark)
{
	Set_Marineshark_Visuals();
	Npc_SetToFistMode(self);
};


