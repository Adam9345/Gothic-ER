/*************************************************************************
**	Bloodfly Prototype														**
*************************************************************************/

PROTOTYPE Mst_Default_BloodflySakhar(C_Npc)			
{
	name							=	"Agresywny krwiopijca";
	guild							=	GIL_BLOODFLY;
	aivar[AIV_MM_REAL_ID]			= 	ID_BLOODFLY_POISON;
	level							=	15;
//---------------------------------------------------------------	
	attribute	[ATR_STRENGTH]		=	30;
	attribute	[ATR_DEXTERITY]		=	80;
	
	attribute	[ATR_HITPOINTS_MAX]	=	160;//+10
	attribute	[ATR_HITPOINTS]		=	160;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//---------------------------------------------------------------	
	protection	[PROT_BLUNT]		=	24;//+2
	protection	[PROT_EDGE]			=	24;
	protection	[PROT_POINT]		=	25;
	protection	[PROT_FIRE]			=	25;
	protection	[PROT_FLY]			=	999;
	protection	[PROT_MAGIC]		=	1;
//---------------------------------------------------------------	
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;
//---------------------------------------------------------------	
	fight_tactic				= FAI_BLOODFLY;
//---------------------------------------------------------------	
	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 1500;

	aivar[AIV_MM_Behaviour]		= PASSIVE;
	
	aivar[AIV_MM_PercRange]		= 1200;
	aivar[AIV_MM_DrohRange]		= 1000;
	aivar[AIV_MM_AttackRange]	= 700;
	aivar[AIV_MM_DrohTime]		= 5;
	aivar[AIV_MM_FollowTime]	= 5;
	aivar[AIV_MM_FollowInWater] = TRUE;
//---------------------------------------------------------------	
	start_aistate				= ZS_MM_AllScheduler;
	
	aivar[AIV_MM_WuselStart] 	= OnlyRoutine;	
};
//---------------------------------------------------------------
func void Set_BloodflySakhar_Visuals()
{
	Mdl_SetVisual			(self,	"Bloodfly.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"RED_BLO_BODY.ASC",		0,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


/*************************************************************************
**	Bloodfly    														**
*************************************************************************/
INSTANCE BloodflySakhar	(Mst_Default_BloodflySakhar)
{
	Set_BloodflySakhar_Visuals();
	Npc_SetToFistMode(self);
	
	CreateInvItems (self, ItAt_Bloodfly_01, 2);	// 2 Flügel
};

INSTANCE BloodflySakhar1	(Mst_Default_BloodflySakhar)
{
	Set_BloodflySakhar_Visuals();
	Npc_SetToFistMode(self);
	
	CreateInvItems (self, ItAt_Bloodfly_01, 2);	// 2 Flügel
};


INSTANCE BloodflySakhar2	(Mst_Default_BloodflySakhar)
{
	Set_BloodflySakhar_Visuals();
	Npc_SetToFistMode(self);
	
	CreateInvItems (self, ItAt_Bloodfly_01, 2);	// 2 Flügel
};


INSTANCE BloodflySakhar3	(Mst_Default_BloodflySakhar)
{
	Set_BloodflySakhar_Visuals();
	Npc_SetToFistMode(self);
	
	CreateInvItems (self, ItAt_Bloodfly_01, 2);	// 2 Flügel
};

INSTANCE BloodflySakhar4	(Mst_Default_BloodflySakhar)
{
	Set_BloodflySakhar_Visuals();
	Npc_SetToFistMode(self);
	
	CreateInvItems (self, ItAt_Bloodfly_01, 2);	// 2 Flügel
};

INSTANCE BloodflySakhar5	(Mst_Default_BloodflySakhar)
{
	Set_BloodflySakhar_Visuals();
	Npc_SetToFistMode(self);
	
	CreateInvItems (self, ItAt_Bloodfly_01, 2);	// 2 Flügel
};

