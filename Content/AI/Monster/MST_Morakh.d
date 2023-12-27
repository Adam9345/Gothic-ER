//***************************
//	Morakh Prototype	
//***************************

PROTOTYPE Mst_Default_Morakh(C_Npc)			
{
	//----- Monster ----
	name							=	Name_Zarlokiel;
	guild							=	GIL_WOLF;
	aivar[AIV_MM_REAL_ID]			= 	ID_MORAKH;
	level							=	Level_Morakh;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	90;
	attribute	[ATR_DEXTERITY]		=	90;
	attribute	[ATR_HITPOINTS_MAX]	=	450;
	attribute	[ATR_HITPOINTS]		=	450;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	//----- Protections ----
	protection	[PROT_BLUNT]		=	52;
	protection	[PROT_EDGE]			=	52;
	protection	[PROT_POINT]		=	20;
	protection	[PROT_FIRE]			=	5;
	protection	[PROT_FLY]			=	125;
	protection	[PROT_MAGIC]		=	0;

	//----- Damage Types ----
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf-Taktik ----
	fight_tactic					=	FAI_SHADOWBEAST;

	//----- Senses & Ranges ----
	senses			= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	3000;
	
	//aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime]	= 10;
	aivar[AIV_MM_FollowInWater] = FALSE;
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_PercRange]		= 1500;
	aivar[AIV_MM_DrohRange]		= 1200;
	aivar[AIV_MM_AttackRange]	= 500;
	aivar[AIV_MM_DrohTime]		= 3;
	
	aivar[AIV_MM_SleepStart] 	= 20;	
	aivar[AIV_MM_SleepEnd]		= 8;
	aivar[AIV_MM_RoamStart]		= 8;
	aivar[AIV_MM_RoamEnd]		= 20;
};


//***************
//	Visuals
//***************

func void B_SetVisuals_Morakh()
{
	Mdl_SetVisual			(self,"BeastWolf.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"BeastWolf_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


//*******************
//	Morakh
//*******************

INSTANCE Morakh	(Mst_Default_Morakh)
{
	B_SetVisuals_Morakh();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 10);
	CreateInvItems (self, ItMis_MorakhClaws, 6);
	Mdl_SetModelScale		(self, 1.2, 1.2, 1.2);
	//CreateInvItems (self, Miecz1H13, 1);
};