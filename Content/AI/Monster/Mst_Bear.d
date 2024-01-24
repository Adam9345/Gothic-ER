/*************************************************************************
**	Bear Prototype												**
*************************************************************************/

PROTOTYPE Mst_Default_Bear(C_Npc)			
{
	name							=	"Niedüwiedü";
	guild							=	GIL_SHADOWBEAST;
	aivar[AIV_MM_REAL_ID]			= 	ID_BEAR;
	level							=	Level_Shadowbeast;
	attribute	[ATR_STRENGTH]		=	120;
	attribute	[ATR_DEXTERITY]		=	120;
	
	attribute	[ATR_HITPOINTS_MAX]	=	600;
	attribute	[ATR_HITPOINTS]		=	600;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//---------------------------------------------------------
	protection	[PROT_BLUNT]		=	80;
	protection	[PROT_EDGE]			=	80;
	protection	[PROT_POINT]		=	80;
	protection	[PROT_FIRE]			=	45;
	protection	[PROT_FLY]			=	80;
	protection	[PROT_MAGIC]		=	40;
//---------------------------------------------------------
	damagetype 						=	DAM_EDGE;

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
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_LONG;
	aivar[AIV_MM_FollowInWater] = FALSE;
//-------------------------------------------------------------
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RoamStart] 	= OnlyRoutine;
};
//-------------------------------------------------------------
func void B_SetVisuals_Bear()
{
	Mdl_SetVisual			(self,"Bear.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"BEAR_BODY",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};
//-------------------------------------------------------------

/*************************************************************************
**	Shadowbeast    														**
*************************************************************************/

INSTANCE Bear	(Mst_Default_Bear)
{
	B_SetVisuals_Bear();
	//Mdl_SetModelScale(self, 1.0, 1.1, 1.1);
	Npc_SetToFistMode(self);
	CreateInvItems (self,ItFoMuttonRaw,4);
};


INSTANCE BearArnold1	(Mst_Default_Bear)
{
	B_SetVisuals_Bear();
	Mdl_SetModelScale(self, 1.1, 1.1, 1.1);
	Npc_SetToFistMode(self);
	CreateInvItems (self,ItFoMuttonRaw,4);
};
INSTANCE BearArnold2	(Mst_Default_Bear)
{
	B_SetVisuals_Bear();
	//Mdl_SetModelScale(self, 1.0, 1.1, 1.1);
	Npc_SetToFistMode(self);
	CreateInvItems (self,ItFoMuttonRaw,4);
};
