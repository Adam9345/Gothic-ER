//*************************
//	BlackGobbo Prototype	
//*************************

PROTOTYPE Mst_Default_Gobbo_Warrior (C_NPC)			
{
	//----- Monster ----
	name							=	"Gobliñski wojownik";
	guild							=	GIL_GOBBO;
	aivar[AIV_MM_REAL_ID]			= 	ID_BLACKGOBBO;
	level							=	15;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	70;
	attribute	[ATR_DEXTERITY]		=	70;
	attribute	[ATR_HITPOINTS_MAX]	=	100;
	attribute	[ATR_HITPOINTS]		=	100;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	75;
	protection	[PROT_EDGE]			=	75;
	protection	[PROT_POINT]		=	55;
	protection	[PROT_FIRE]			=	55;
	protection	[PROT_FLY]			=	55;
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
	fight_tactic	=	FAI_GOBBO;
	
	//----- Senses & Ranges ----
	senses			=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	3000;		// 30m

	aivar[AIV_MM_Behaviour]		= PACKHUNTER;
	
	aivar[AIV_MM_PercRange]		= 1500;
	aivar[AIV_MM_DrohRange]		= 1200;
	aivar[AIV_MM_AttackRange]	= 700;
	aivar[AIV_MM_DrohTime]		= 4;
	aivar[AIV_MM_FollowTime]	= 10;
	aivar[AIV_MM_FollowInWater] = FALSE;
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;	
};


//***************
//	Visuals
//***************

func void B_SetVisuals_Gobbo_Warrior ()
{
	Mdl_SetVisual			(self,	"Gobbo.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Gob_Body",		2,			DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

//***************
//	Visuals
//***************

func void B_SetVisuals_Gobbo_Warrior_Visir ()
{
	Mdl_SetVisual			(self,	"Gobbo.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Gob_Body",		3,			DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

// ***********
// Black Gobbo   	
// ***********

INSTANCE Gobbo_Warrior (Mst_Default_Gobbo_Warrior)
{
	B_SetVisuals_Gobbo_Warrior();
	
	Npc_SetToFightMode (self, ItMw_1H_Mace_01); //Waffe ist nur Optik - Schaden wird NUR über STR bestimmt (Gobbo ist als Monster im Fistmode)
	Mdl_SetModelScale(self, 1.15, 1.15, 1.15);
};
// ***********
// Black Gobbo   	
// ***********

INSTANCE Gobbo_Warrior_Visir (Mst_Default_Gobbo_Warrior)
{
	B_SetVisuals_Gobbo_Warrior_Visir();
	
	Npc_SetToFightMode (self, ItMw_1H_Mace_01); //Waffe ist nur Optik - Schaden wird NUR über STR bestimmt (Gobbo ist als Monster im Fistmode)
	Mdl_SetModelScale(self, 1.15, 1.15, 1.15);
};

INSTANCE Gobbo_Warrior_US (Mst_Default_Gobbo_Warrior)
{
	B_SetVisuals_Gobbo_Warrior();
	Npc_SetToFightMode (self, ItMw_1H_Mace_01); //Waffe ist nur Optik - Schaden wird NUR über STR bestimmt (Gobbo ist als Monster im Fistmode)
	CreateInvItem (self, ItKe_US_GOBBO); 
};
