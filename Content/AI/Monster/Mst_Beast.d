/*************************************************************************
**	Mod Beast Prototype												**
*************************************************************************/

PROTOTYPE Mst_Default_Beast(C_Npc)			
{
	name							=	"Bestia";
	guild							=	GIL_SHADOWBEAST;
	aivar[AIV_MM_REAL_ID]			= 	ID_DEMON;
	level							=	Level_Shadowbeast;
//---------------------------------------------------------
	attribute	[ATR_STRENGTH]		=	60;
	attribute	[ATR_DEXTERITY]		=	60;
	
	attribute	[ATR_HITPOINTS_MAX]	=	900;
	attribute	[ATR_HITPOINTS]		=	900;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//---------------------------------------------------------
	protection	[PROT_BLUNT]		=	80;
	protection	[PROT_EDGE]			=	80;
	protection	[PROT_POINT]		=	40;
	protection	[PROT_FIRE]			=	45;
	protection	[PROT_FLY]			=	150;
	protection	[PROT_MAGIC]		=	45;
//---------------------------------------------------------
	damagetype 						=	DAM_EDGE|DAM_FLY;
//	damage		[DAM_INDEX_POINT]	=	0;
	damage		[DAM_INDEX_BLUNT]	=	200;
	damage		[DAM_INDEX_EDGE]	=	200;
//	damage		[DAM_INDEX_FIRE]	=	0;
	damage		[DAM_INDEX_FLY]		=	40;
//	damage		[DAM_INDEX_MAGIC]	=	0;
//---------------------------------------------------------
//---------------------------------------------------------
	fight_tactic					=	FAI_SHADOWBEAST;
//---------------------------------------------------------
	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 3000;

	aivar[AIV_MM_Behaviour]		= HUNTER;
	
	aivar[AIV_MM_PercRange]		= 1500;
	aivar[AIV_MM_DrohRange]		= 1300;
	aivar[AIV_MM_AttackRange]	= 700;
	aivar[AIV_MM_DrohTime]		= 4;
	aivar[AIV_MM_FollowTime]	= 10;
	aivar[AIV_MM_FollowInWater] = FALSE;
//-------------------------------------------------------------
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RoamStart] 	= OnlyRoutine;
};
//-------------------------------------------------------------
func void Set_Beast_Visuals()
{
	Mdl_SetVisual			(self,"Shadow.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Sha_Body",		3,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

/*************************************************************************
**	Beasts    														**
*************************************************************************/

INSTANCE Beast_Cliff	(Mst_Default_Beast)
{
	Set_Beast_Visuals();
	Npc_SetToFistMode(self);
	CreateInvItems (self,ItFo_Mod_WolfBerrys,1);
};
//***//
INSTANCE Beast_OrcTower	(Mst_Default_Beast)
{
	Set_Beast_Visuals();
	Npc_SetToFistMode(self);
	CreateInvItems (self,ItFo_Mod_Sage,1);
};
//***//
INSTANCE Beast_Citadel	(Mst_Default_Beast)
{
	Set_Beast_Visuals();
	Npc_SetToFistMode(self);
	CreateInvItems (self,itFo_Mod_LightMushroom,1);
};
