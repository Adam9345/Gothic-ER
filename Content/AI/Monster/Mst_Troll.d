/*************************************************************************
**	Troll Prototype														**
*************************************************************************/

PROTOTYPE Mst_Default_Troll(C_Npc)			
{
	name							=	"Troll";
	guild							=	GIL_TROLL;
	aivar[AIV_MM_REAL_ID]			= 	ID_TROLL;
	level							=	Level_Troll;
//------------------------------------------------------	
	attribute	[ATR_STRENGTH]		=	250;
	attribute	[ATR_DEXTERITY]		=	20;
	
	attribute	[ATR_HITPOINTS_MAX]	=	1000;
	attribute	[ATR_HITPOINTS]		=	1000;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//------------------------------------------------------	
	protection	[PROT_BLUNT]		=	170;
	protection	[PROT_EDGE]			=	150;
	protection	[PROT_POINT]		=	170;	// immun
	protection	[PROT_FIRE]			=	110;
	protection	[PROT_FLY]			=	9999;	// immun
	protection	[PROT_MAGIC]		=	100;
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

func void Set_Troll_Visuals()
{
	Mdl_SetVisual			(self,	"Troll.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Tro_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};func void Set_MadTroll_Visuals()
{
	Mdl_SetVisual			(self,	"Troll.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Tro_MadBody",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

/*************************************************************************
**	Black Troll    															**
*************************************************************************/
INSTANCE AlexTroll	(Mst_Default_Troll)
{
	Set_Troll_Visuals();
	Npc_SetToFistMode(self);
	Mdl_SetModelScale(self, 1.2, 1.2, 1.2);
	level							=	75;
//------------------------------------------------------	
	attribute	[ATR_STRENGTH]		=	240;
	attribute	[ATR_DEXTERITY]		=	20;
	
	attribute	[ATR_HITPOINTS_MAX]	=	2400;
	attribute	[ATR_HITPOINTS]		=	2400;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//------------------------------------------------------	
	protection	[PROT_BLUNT]		=	80;
	protection	[PROT_EDGE]			=	80;
	protection	[PROT_POINT]		=	90;	// immun
	protection	[PROT_FIRE]			=	50;
	protection	[PROT_FLY]			=	9999;	// immun
	protection	[PROT_MAGIC]		=	50;
};

INSTANCE MadTroll	(Mst_Default_Troll)
{
	name = "Troll z kanionu";
	Set_MadTroll_Visuals();
	Npc_SetToFistMode(self);
	level							=	60;
//------------------------------------------------------	
	attribute	[ATR_STRENGTH]		=	200;
	attribute	[ATR_DEXTERITY]		=	20;
	
	attribute	[ATR_HITPOINTS_MAX]	=	1500;
	attribute	[ATR_HITPOINTS]		=	1500;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//------------------------------------------------------	
	protection	[PROT_BLUNT]		=	200;
	protection	[PROT_EDGE]			=	200;
	protection	[PROT_POINT]		=	200;	// immun
	protection	[PROT_FIRE]			=	50;
	protection	[PROT_FLY]			=	9999;	// immun
	protection	[PROT_MAGIC]		=	50;
	CreateInvItem (self, ItMw_1h_ShineRevenge);
};

/*************************************************************************
**	Troll    															**
*************************************************************************/
INSTANCE Troll	(Mst_Default_Troll)
{
	Set_Troll_Visuals();
	Npc_SetToFistMode(self);
};

/*************************************************************************
**	junger Troll    													**
*************************************************************************/

INSTANCE YoungTroll	(Mst_Default_Troll)
{
	//-------- general data --------
	name							=	"M�ody troll";
	guild							=	GIL_TROLL;
	aivar[AIV_MM_REAL_ID]			= 	ID_TROLL;
	level							=	Level_YoungTroll;
	ID								=	MID_YOUNGTROLL;
	
	//-------- visuals --------
	Set_Troll_Visuals();
	Mdl_SetModelScale(self, 0.7, 0.7, 0.7);

	//-------- attributes --------
	attribute	[ATR_STRENGTH]		=	120;
	attribute	[ATR_DEXTERITY]		=	30;
	
	attribute	[ATR_HITPOINTS_MAX]	=	600;
	attribute	[ATR_HITPOINTS]		=	600;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	protection	[PROT_BLUNT]		=	120;
	protection	[PROT_EDGE]			=	120;
	protection	[PROT_POINT]		=	130;	// immun
	protection	[PROT_FIRE]			=	9999;	// immun
	protection	[PROT_FLY]			=	9999;	// immun
	protection	[PROT_MAGIC]		=	9999;	// immun

	//-------- combat --------
	Npc_SetToFistMode(self);

	fight_tactic					=	FAI_TROLL;

	damagetype 						=	DAM_FLY;

	//-------- ai --------
	senses							=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range					=	4000;

	aivar[AIV_MM_Behaviour]			= PASSIVE;
	
	aivar[AIV_MM_PercRange]			= 3000;
	aivar[AIV_MM_DrohRange]			= 2500;
	aivar[AIV_MM_AttackRange]		= 2000;
	aivar[AIV_MM_DrohTime]			= 5;
	aivar[AIV_MM_FollowTime]		= 10;
	aivar[AIV_MM_FollowInWater]		= FALSE;

	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};