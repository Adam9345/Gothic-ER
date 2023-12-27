/*************************************************************************
**	Snapper Prototype													**
*************************************************************************/

PROTOTYPE Mst_Default_HugeSnapper(C_Npc)			
{
	name							=	"Potwór";
	guild							=	GIL_SNAPPER;
	aivar[AIV_MM_REAL_ID]			= 	ID_SNAPPER;
	level							=	40;//22
//---------------------------------------------------------	
	attribute	[ATR_STRENGTH]		=	150;
	attribute	[ATR_DEXTERITY]		=	150;
	
	attribute	[ATR_HITPOINTS_MAX]	=	385;//+20
	attribute	[ATR_HITPOINTS]		=	385;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//---------------------------------------------------------	
	protection	[PROT_BLUNT]		=	60;
	protection	[PROT_EDGE]			=	60;
	protection	[PROT_POINT]		=	40;		
	protection	[PROT_FIRE]			=	40;
	protection	[PROT_FLY]			=	20;
	protection	[PROT_MAGIC]		=	0;
//---------------------------------------------------------	
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;
//---------------------------------------------------------	
	fight_tactic					=	FAI_SNAPPER;
//---------------------------------------------------------	
	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 3000;		// 30m

	aivar[AIV_MM_Behaviour]		= HUNTER;
	
	aivar[AIV_MM_PercRange]		= 2200;
	aivar[AIV_MM_DrohRange]		= 1800;
	aivar[AIV_MM_AttackRange]	= 1500;
	aivar[AIV_MM_DrohTime]		= 3;
	aivar[AIV_MM_FollowTime]	= 15;
	aivar[AIV_MM_FollowInWater] = TRUE;
//---------------------------------------------------------	
	start_aistate				= ZS_MM_AllScheduler;
	
	aivar[AIV_MM_RestStart]		= OnlyRoutine;
};
//---------------------------------------------------------	
func void Set_HugeSnapper_Visuals()
{


	Mdl_SetVisual			(self,	"Snapper.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetModelScale(self, 1.5, 1.5, 1.5);
	Mdl_SetVisualBody		(self,	"Sna_Body",		2,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};



/*************************************************************************
**	Snapper    															**
*************************************************************************/

INSTANCE HugeSnapper	(Mst_Default_HugeSnapper)
{
	Set_HugeSnapper_Visuals();
	Npc_SetToFistMode(self);

};

