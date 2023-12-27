/*************************************************************************
**	WaranJadowity Prototype														**
*************************************************************************/

PROTOTYPE Mst_Default_WaranJadowity(C_Npc)			
{
	name							=	"Jadowity jaszczur";
	guild							=	GIL_WARAN;
	aivar[AIV_MM_REAL_ID]			= 	ID_WARAN;
	level							=	Level_ToxicWaran;
//---------------------------------------------------
	attribute	[ATR_STRENGTH]		=	100;
	attribute	[ATR_DEXTERITY]		=	100;
	
	attribute	[ATR_HITPOINTS_MAX]	=	200;
	attribute	[ATR_HITPOINTS]		=	200;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//---------------------------------------------------
	protection	[PROT_BLUNT]		=	25;
	protection	[PROT_EDGE]			=	25;
	protection	[PROT_POINT]		=	15;
	protection	[PROT_FIRE]			=	15;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	0;
//---------------------------------------------------
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;
//---------------------------------------------------
	fight_tactic					=	FAI_WARAN;
//---------------------------------------------------
	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 3000;		// 30m

	aivar[AIV_MM_Behaviour]		= PASSIVE;
	
	aivar[AIV_MM_PercRange]		= 1400;
	aivar[AIV_MM_DrohRange]		= 1100;
	aivar[AIV_MM_AttackRange]	= 700;
	aivar[AIV_MM_DrohTime]		= 2;
	aivar[AIV_MM_FollowTime]	= 10;
	aivar[AIV_MM_FollowInWater] = TRUE;
//---------------------------------------------------
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RoamStart] 	= OnlyRoutine;
};
//---------------------------------------------------
func void Set_WaranJadowity_Visuals()
{
	Mdl_SetVisual			(self,	"Waran.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"War_Body",		1,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


/*************************************************************************
**	WaranJadowity    															**
*************************************************************************/

INSTANCE WaranJadowity	(Mst_Default_WaranJadowity)
{
	Set_WaranJadowity_Visuals();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItMi_TruciznaJaszczura, 1);
};


