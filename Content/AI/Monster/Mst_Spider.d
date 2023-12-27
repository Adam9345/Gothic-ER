/*************************************************************************
**	Spider Prototype												**
*************************************************************************/

PROTOTYPE Mst_Default_Spider(C_Npc)			
{
	name							=	"Paj¹k";
	guild							=	GIL_MINECRAWLER;
	aivar[AIV_MM_REAL_ID]			= 	ID_SPIDER;
	level							=	Level_Spider;//12
//------------------------------------------------------
	attribute	[ATR_STRENGTH]		=	75;
	attribute	[ATR_DEXTERITY]		=	40;
	
	attribute	[ATR_HITPOINTS_MAX]	=	170;//+40
	attribute	[ATR_HITPOINTS]		=	170;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//------------------------------------------------------
	protection	[PROT_BLUNT]		=	75;
	protection	[PROT_EDGE]			=	45;
	protection	[PROT_POINT]		=	5;
	protection	[PROT_FIRE]			=	5;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	0;
//------------------------------------------------------
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;
//------------------------------------------------------
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
//---------------------------------------------------
func void Set_Spider_Visuals()
{
	Mdl_SetVisual			(self,	"Crawler.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Crw_Body",		1,	1,	"",			DEFAULT,  	DEFAULT,	-1);
};


/*************************************************************************
**	Spider    														**
*************************************************************************/

INSTANCE Spider	(Mst_Default_Spider)
{
	Set_Spider_Visuals();
	Npc_SetToFistMode(self);
};


