/*************************************************************************
**	Wolf Prototype														**
*************************************************************************/

PROTOTYPE Mst_Default_Wolf(C_Npc)			
{
	name							=	"Wilk";
	guild							=	GIL_WOLF;
	aivar[AIV_MM_REAL_ID]			= 	ID_WOLF;
	level							=	Level_Wolf;//9
//-----------------------------------------------------------
	attribute	[ATR_STRENGTH]		=	45;
	attribute	[ATR_DEXTERITY]		=	45;
	
	attribute	[ATR_HITPOINTS_MAX]	=	120;
	attribute	[ATR_HITPOINTS]		=	120;//+20

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//-----------------------------------------------------------
	protection	[PROT_BLUNT]		=	20;
	protection	[PROT_EDGE]			=	20;
	protection	[PROT_POINT]		=	10;
	protection	[PROT_FIRE]			=	10;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	0;
//-----------------------------------------------------------
	damagetype 						=	DAM_EDGE;

//-----------------------------------------------------------
	fight_tactic					=	FAI_WOLF;
//-----------------------------------------------------------
	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 3000;		// 30m

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
func void Set_Wolf_Visuals()
{
	Mdl_SetVisual			(self,"Wolf.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Wol_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void Set_BlackWolf_Visuals()
{
	Mdl_SetVisual			(self,"Wolf.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Wol_Body",		2,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};
/*************************************************************************
**	Wolf    															**
*************************************************************************/

INSTANCE Wolf	(Mst_Default_Wolf)
{
	Set_Wolf_Visuals();
	Npc_SetToFistMode(self);
};

INSTANCE BlackWolf	(Mst_Default_Wolf)
{
name = "Czarny wilk";
level							=	8;//9
//-----------------------------------------------------------
	attribute	[ATR_STRENGTH]		=	90;
	attribute	[ATR_DEXTERITY]		=	90;
	
	attribute	[ATR_HITPOINTS_MAX]	=	230;
	attribute	[ATR_HITPOINTS]		=	230;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//-----------------------------------------------------------
	protection	[PROT_BLUNT]		=	50;
	protection	[PROT_EDGE]			=	50;
	protection	[PROT_POINT]		=	25;
	protection	[PROT_FIRE]			=	22;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	10;
	Set_BlackWolf_Visuals();
	Npc_SetToFistMode(self);
};


INSTANCE BlackWolf_ZL1	(Mst_Default_Wolf)
{
	Set_BlackWolf_Visuals();
	Npc_SetToFistMode(self);
	CreateInvItem (self, ItMi_ZL_WBlood);
};

INSTANCE BlackWolf_ZL2	(Mst_Default_Wolf)
{
	Set_BlackWolf_Visuals();
	Npc_SetToFistMode(self);
	CreateInvItem (self, ItMi_ZL_WBlood);
};
INSTANCE BlackWolf_ZL3	(Mst_Default_Wolf)
{
	Set_BlackWolf_Visuals();
	Npc_SetToFistMode(self);
	CreateInvItem (self, ItMi_ZL_WBlood);
};


INSTANCE TomDog	(Mst_Default_Wolf)
{
    name							=	NAME_TomDog;
    guild = GIL_NONE;
	Set_Wolf_Visuals();
	Npc_SetToFistMode(self);
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RoamStart] 	= OnlyRoutine;	
};
