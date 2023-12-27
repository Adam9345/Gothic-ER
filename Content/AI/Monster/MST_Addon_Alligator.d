//**********************
//	Alligator Prototype		
//**********************

PROTOTYPE Mst_Default_Addon_Alligator (C_Npc)			
{
	//----- Monster ----
	name							=	"Aligator";
	guild							=	GIL_SWAMPSHARK;
	aivar[AIV_MM_REAL_ID]			= 	ID_ALLIGATOR;
	level							=	Level_Alligator;
	
	//----- Attributes ----
	attribute	[ATR_STRENGTH]		=	70;
	attribute	[ATR_DEXTERITY]		=	70;
	attribute	[ATR_HITPOINTS_MAX]	=   200;
	attribute	[ATR_HITPOINTS]		=	200;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	//----- Protections ----
	protection	[PROT_BLUNT]		=	50;
	protection	[PROT_EDGE]			=	50;
	protection	[PROT_POINT]		=	50;
	protection	[PROT_FIRE]			=	30;
	protection	[PROT_FLY]			=	20;
	protection	[PROT_MAGIC]		=	10;
	
	//----- Damage Types ----
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf Taktik ----
	fight_tactic	=	FAI_WARAN;

	//----- Sense & Ranges ----
	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 3000;		// 30m

	aivar[AIV_MM_Behaviour]		= PASSIVE;
	
	aivar[AIV_MM_PercRange]		= 1200;
	aivar[AIV_MM_DrohRange]		= 1000;
	aivar[AIV_MM_AttackRange]	= 700;
	aivar[AIV_MM_DrohTime]		= 5;
	aivar[AIV_MM_FollowTime]	= 10;
	aivar[AIV_MM_FollowInWater] = FALSE;
	//---------------------------------------------------
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RoamStart] 	= OnlyRoutine;
};

//************
//	Visuals
//************

func void B_SetVisuals_Alligator ()
{
	Mdl_SetVisual			(self,	"Alligator.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"KRO_BODY",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


//**************
//	Alligator    	
//**************

INSTANCE Alligator	(Mst_Default_Addon_Alligator)
{
	B_SetVisuals_Alligator();
	Npc_SetToFistMode(self);
};

//**************
//	Dead Alligator (PortalTempel)
//**************

INSTANCE Alligator_PortalDead	(Mst_Default_Addon_Alligator)
{
	B_SetVisuals_Alligator();
	Npc_SetToFistMode(self);
};

//----------------------------------------------------------------1.6.1-------------------------------------------------------------------------
//Polowanie na Aligatory
//---------------

INSTANCE AlligatorPNA1	(Mst_Default_Addon_Alligator)
{
	B_SetVisuals_Alligator();
	Npc_SetToFistMode(self);
};

INSTANCE AlligatorPNA2	(Mst_Default_Addon_Alligator)
{
	B_SetVisuals_Alligator();
	Npc_SetToFistMode(self);
};

INSTANCE AlligatorPNA3	(Mst_Default_Addon_Alligator)
{
	B_SetVisuals_Alligator();
	Npc_SetToFistMode(self);
};

INSTANCE AlligatorPNA4	(Mst_Default_Addon_Alligator)
{
	B_SetVisuals_Alligator();
	Npc_SetToFistMode(self);
};

INSTANCE AlligatorPNA5	(Mst_Default_Addon_Alligator)
{
	B_SetVisuals_Alligator();
	Npc_SetToFistMode(self);
};

INSTANCE AlligatorPNA6	(Mst_Default_Addon_Alligator)
{
	B_SetVisuals_Alligator();
	Npc_SetToFistMode(self);
};

