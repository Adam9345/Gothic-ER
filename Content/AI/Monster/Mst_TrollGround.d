/*************************************************************************
**	TrollGround Prototype														**
*************************************************************************/

PROTOTYPE Mst_Default_TrollGround(C_Npc)			
{
	name							=	"Ziemny troll";
	guild							=	GIL_TROLL;
	aivar[AIV_MM_REAL_ID]			= 	ID_TROLLGROUND;
	level							=	Level_Trollground;
//------------------------------------------------------	
	attribute	[ATR_STRENGTH]		=	70;
	attribute	[ATR_DEXTERITY]		=	40;
	
	attribute	[ATR_HITPOINTS_MAX]	=	400;
	attribute	[ATR_HITPOINTS]		=	400;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//------------------------------------------------------	
	protection	[PROT_BLUNT]		=	60;
	protection	[PROT_EDGE]			=	60;
	protection	[PROT_POINT]		=	80;	// immun
	protection	[PROT_FIRE]			=	0;
	protection	[PROT_FLY]			=	20;	// immun
	protection	[PROT_MAGIC]		=	30;
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

func void Set_TrollGround_Visuals()
{
	Mdl_SetVisual			(self,	"Troll.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Tro_Body",		1,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
	Mdl_SetModelScale(self, 0.5, 0.5, 0.5);
};
func void Set_TrollGroundFe_Visuals()
{
	Mdl_SetVisual			(self,	"Troll.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Tro_Body",		1,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
	Mdl_SetModelScale(self, 0.7, 0.7, 0.7);
};
func void Set_TrollGroundCh_Visuals()
{
	Mdl_SetVisual			(self,	"Troll.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Tro_Body",		1,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
	Mdl_SetModelScale(self, 0.3, 0.3, 0.3);
};
/*************************************************************************
**	TrollGround    															**
*************************************************************************/
INSTANCE TrollGround	(Mst_Default_TrollGround)
{
	Set_TrollGround_Visuals();
	Npc_SetToFistMode(self);
};
INSTANCE TrollGroundFe	(Mst_Default_TrollGround)
{
	name							=	"Samica ziemnego trolla";
	level = 12;
		//------------------------------------------------------	
	attribute	[ATR_STRENGTH]			=	50;
	attribute	[ATR_DEXTERITY]			=	50;
	
	attribute	[ATR_HITPOINTS_MAX]	=	350;
	attribute	[ATR_HITPOINTS]			=	350;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 				=	0;
//------------------------------------------------------	
	protection	[PROT_BLUNT]			=	50;
	protection	[PROT_EDGE]			=	70;
	protection	[PROT_POINT]			=	85;	// immun
	protection	[PROT_FIRE]				=	0;
	protection	[PROT_FLY]				=	20;	
	protection	[PROT_MAGIC]			=	35;
//------------------------------------------------------	
	Set_TrollGroundFe_Visuals();
	Npc_SetToFistMode(self);
};
INSTANCE TrollGroundCh	(Mst_Default_TrollGround)
{
	name							=	"M³ody troll ziemny";
	level = 6;
	//------------------------------------------------------	
	attribute	[ATR_STRENGTH]		=	30;
	attribute	[ATR_DEXTERITY]		=	10;
	
	attribute	[ATR_HITPOINTS_MAX]	=	150;
	attribute	[ATR_HITPOINTS]		=	150;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//------------------------------------------------------	
	protection	[PROT_BLUNT]			=	20;
	protection	[PROT_EDGE]			    =	35;
	protection	[PROT_POINT]			=	50;	// immun
	protection	[PROT_FIRE]				=	0;
	protection	[PROT_FLY]				=	20;	
	protection	[PROT_MAGIC]			=	25;
//------------------------------------------------------	
	Set_TrollGroundCh_Visuals();
	Npc_SetToFistMode(self);

};