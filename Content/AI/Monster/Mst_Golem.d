/*************************************************************************
**	Golem Prototype														**
*************************************************************************/

PROTOTYPE Mst_Default_Golem(C_Npc)			
{
	name							=	"Golem";
	guild							=	GIL_GOLEM;
	// REAL_ID in Instanzen !!!
	level							=	Level_Golem;
//--------------------------------------------------------------
	attribute	[ATR_STRENGTH]		=	150;
	attribute	[ATR_DEXTERITY]		=	150;
	
	attribute	[ATR_HITPOINTS_MAX]	=	600;
	attribute	[ATR_HITPOINTS]		=	600;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//--------------------------------------------------------------
	protection	[PROT_BLUNT]		=	9999;
	protection	[PROT_EDGE]			=	9999;
	protection	[PROT_POINT]		=	9999;	// immun
	protection	[PROT_FIRE]			=	9999;	// immun
	protection	[PROT_FLY]			=	9999;	// immun
	protection	[PROT_MAGIC]		=	9999;
//--------------------------------------------------------------
	damagetype 						=	DAM_FLY;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;
//--------------------------------------------------------------
	fight_tactic					=	FAI_GOLEM;
//--------------------------------------------------------------
	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 2000;

	aivar[AIV_MM_Behaviour]		= PASSIVE;
	
	aivar[AIV_MM_PercRange]		= 1500;
	aivar[AIV_MM_DrohRange]		= 1500;
	aivar[AIV_MM_AttackRange]	= 1500;
	aivar[AIV_MM_DrohTime]		= 0;
	aivar[AIV_MM_FollowTime]	= 5;
	aivar[AIV_MM_FollowInWater] = TRUE;
//-------------------------------------------------------------
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};
//-------------------------------------------------------------
func void Set_StoneGolem_Visuals()
{
	Mdl_SetVisual			(self,	"Golem.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Gol_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};
//-------------------------------------------------------------
func void Set_FireGolem_Visuals()
{
	Mdl_SetVisual			(self,	"Golem.mds");
	Mdl_ApplyOverlayMds 	(self,	"Golem_Firegolem.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Gol_Fire_Body",DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};
//-------------------------------------------------------------
func void Set_IceGolem_Visuals()
{
	Mdl_SetVisual			(self,	"Golem.mds");
	Mdl_ApplyOverlayMds 	(self,	"Golem_Icegolem.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Gol_Ice_Body",	DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};
//-------------------------------------------------------------
func void Set_IceGolem2_Visuals()
{
	Mdl_SetVisual			(self,	"Golem.mds");
	Mdl_ApplyOverlayMds 	(self,	"Golem_Icegolem.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Gol_Ice_Body",	1,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};
//-------------------------------------------------------------
func void Set_DarkGolem_Visuals()
{
	Mdl_SetVisual			(self,	"Golem.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Gol_Body",		1,	1,	"",			DEFAULT,  	DEFAULT,	-1);
};
/*************************************************************************
**	Stone Golem   														**
*************************************************************************/

INSTANCE StoneGolem	(Mst_Default_Golem)
{
	name	=	"Kamienny Golem";
	aivar[AIV_MM_REAL_ID]			= 	ID_STONEGOLEM;
	protection	[PROT_BLUNT]		=	50;
//--------------------------------------------
	Set_StoneGolem_Visuals();
	CreateInvItem		(self, ItAt_StoneGolem_01);
	Npc_SetToFistMode	(self);
};

/*************************************************************************
**	Dark Golem   //1.3 ehanted edition														**
*************************************************************************/

INSTANCE DarkGolem	(Mst_Default_Golem)
{
	name	=	"Kamienny Golem";
	aivar[AIV_MM_REAL_ID]			= 	ID_STONEGOLEM;
	protection	[PROT_BLUNT]		=	50;
	protection	[PROT_EDGE]			=	100;
	protection	[PROT_POINT]		=	100; 
	protection	[PROT_FIRE]			=	100;
	protection	[PROT_FLY]			=	9999; 
	protection	[PROT_MAGIC]		=	50;  
//--------------------------------------------
	Set_DarkGolem_Visuals();
	Npc_SetToFistMode	(self);
};
/*************************************************************************
**	Summoned Stone Golem    											**
*************************************************************************/

INSTANCE SummonedByPC_StoneGolem (Mst_Default_Golem)
{
	//-------- general --------
	name	=	"Golem";
	aivar[AIV_MM_REAL_ID]			= 	ID_STONEGOLEM;

	//-------- visual --------
	Set_StoneGolem_Visuals();
	Npc_SetToFistMode(self);

	//-------- attributes --------
	protection	[PROT_EDGE]			=	100;
	protection	[PROT_BLUNT]		=	75;

	//-------- ai --------
	senses 							= SENSE_HEAR | SENSE_SEE;
	start_aistate					= ZS_MM_SummonedByPC;
	self.aivar[AIV_MM_DistToMaster] = 400;
	self.aivar[AIV_MM_TimeLooseHP] 	= 2;
	self.aivar[AIV_MM_PARTYMEMBER]  = TRUE;
};

INSTANCE SummonedByNPC_StoneGolem (Mst_Default_Golem)
{
	//-------- general --------
	name	=	"Kamienny Golem";
	aivar[AIV_MM_REAL_ID]			= 	ID_STONEGOLEM;

	//-------- visual --------
	Set_StoneGolem_Visuals();
	Npc_SetToFistMode(self);

	//-------- attributes --------
	protection	[PROT_BLUNT]		=	50;

	//-------- ai --------
	start_aistate					= ZS_MM_Summoned;
};


/*************************************************************************
**	Fire Golem   														**
*************************************************************************/
INSTANCE FireGolem	(Mst_Default_Golem)
{
	//-------- general --------
	name	=	"Ognisty Golem";
	aivar		[AIV_MM_REAL_ID]	= 	ID_FIREGOLEM;

	//-------- visual --------
	Set_FireGolem_Visuals();
	Npc_SetToFistMode(self);

	//-------- attributes --------
	attribute	[ATR_STRENGTH]		=	50;	// da Feuerschaden
	protection	[PROT_MAGIC]		=	0;	// betrifft im wesentlichen die Blitz- und Eiszauber
	attribute	[ATR_HITPOINTS_MAX]	=	150;// da er nur durch Blitz- und Eiszauber verwundbar ist, muß dieser Wert hier sehr viel niedriger sein 
	attribute	[ATR_HITPOINTS]		=	150;
	damagetype 						=	DAM_FIRE;

	//-------- inventory --------
	CreateInvItem		(self, ItAt_FireGolem_01);

	//-------- ai --------
};


/*************************************************************************
**	Ice Golem   														**
*************************************************************************/
INSTANCE IceGolem	(Mst_Default_Golem)
{
	//-------- general --------
	name	=	"Lodowy Golem";
	aivar[AIV_MM_REAL_ID]			= 	ID_ICEGOLEM;

	//-------- visual --------
	Set_IceGolem_Visuals();
//	Npc_SetToFistMode(self);

	//-------- attributes --------
	attribute	[ATR_MANA_MAX] 		=	500;
	attribute	[ATR_MANA] 			=	500;
	attribute	[ATR_HITPOINTS_MAX]	=	150;	// da er nur durch Feuerschaden verwundbar
	attribute	[ATR_HITPOINTS]		=	150;
	protection	[PROT_FIRE]			=	0;
	damagetype 						=	DAM_BLUNT;

	//-------- inventory --------
	CreateInvItem	(self, ItAt_IceGolem_01);
	CreateInvItem	(self, ItAt_IceGolem_02);

	//-------- ai --------
	fight_tactic					=	FAI_HUMAN_MAGE;		// damit der Golem eine "Icecube"-Attack einsetzen kann
};
/*************************************************************************
**	Water Golem   														**
*************************************************************************/
INSTANCE WaterGolem	(Mst_Default_Golem)
{
	//-------- general --------
	name	=	"Wodny Golem";
	level 	= 	30;
	aivar[AIV_MM_REAL_ID]			= 	ID_ICEGOLEM;

	//-------- visual --------
	Set_IceGolem2_Visuals();
	//	Npc_SetToFistMode(self);
	Mdl_SetModelScale(self, 0.6, 0.6, 0.6);
	//-------- attributes --------
	attribute	[ATR_MANA_MAX] 		=	100;
	attribute	[ATR_MANA] 			=	100;
	attribute	[ATR_HITPOINTS_MAX]	=	300;
	attribute	[ATR_HITPOINTS]		=	300;//+ 50
	protection	[PROT_BLUNT]		=	35;
	protection	[PROT_EDGE]			=	35;
	protection	[PROT_POINT]		=	35;
	protection	[PROT_FIRE]			=	0;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	10;
	
	damagetype 						=	DAM_BLUNT;

	//-------- inventory --------
	CreateInvItem	(self, ItArRuneThunderbolt);//-1
	//-------- ai --------
	fight_tactic					=	FAI_HUMAN_MAGE;		// damit der Golem eine "Icecube"-Attack einsetzen kann
};
/*************************************************************************
**	Bridge Golem   														**
*************************************************************************/
// bewacht die Brücke zur Bergfestung
// Hinweis im Spiel: sollte mit Keulenwaffen bezwungen werden!
INSTANCE BridgeGolem	(Mst_Default_Golem)
{
	//-------- general --------
	name	=	"Golem mostowy";
	level	=	50;

	//-------- visuals --------
	Set_StoneGolem_Visuals();
	//Mdl_SetModelScale(self, 0.8, 0.8, 0.8);
	Npc_SetToFistMode(self);

	//-------- attributes --------
	attribute	[ATR_STRENGTH]		=	100;
	attribute	[ATR_DEXTERITY]		=	100;
	
	attribute	[ATR_HITPOINTS_MAX]	=	250;
	attribute	[ATR_HITPOINTS]		=	250;

	protection	[PROT_BLUNT]		=	50;
};


PROTOTYPE Mst_Default_Addon_SwampGolem(C_Npc)			
{
	//----- Monster ----
	name							=	"Bagienny golem";
	guild							=	GIL_GOLEM;
	aivar[AIV_MM_REAL_ID]			= 	ID_STONEGOLEM;
	level							=	25;

	//----- Attribute ----
	attribute	[ATR_STRENGTH]		= 90;
	attribute	[ATR_DEXTERITY]		= 100;
	attribute	[ATR_HITPOINTS_MAX]	= 600;
	attribute	[ATR_HITPOINTS]		= 600;
	attribute	[ATR_MANA_MAX] 		= 0;
	attribute	[ATR_MANA] 			= 0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		= 90;
	protection	[PROT_EDGE]			= 90;
	protection	[PROT_POINT]		= 100;
	protection	[PROT_FIRE]			= 80;
	protection	[PROT_FLY]			= 80;	
	protection	[PROT_MAGIC]		= 80;
	
	//---- Damage Types ----
	damagetype 						=	DAM_FLY;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf-Taktik ----
	fight_tactic					=	FAI_GOLEM;
	
	//----- Senses & Ranges ----
senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 2000;

	aivar[AIV_MM_Behaviour]		= PASSIVE;
	
	aivar[AIV_MM_PercRange]		= 1500;
	aivar[AIV_MM_DrohRange]		= 1500;
	aivar[AIV_MM_AttackRange]	= 1500;
	aivar[AIV_MM_DrohTime]		= 0;
	aivar[AIV_MM_FollowTime]	= 5;
	aivar[AIV_MM_FollowInWater] = TRUE;
//-------------------------------------------------------------
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};

//-------------------------------------------------------------
func void B_SetVisuals_Swampgolem()
{
	Mdl_SetVisual			(self,	"SwampGolem.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Gol_Sumpf_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};
//FP_ROAM_OW_SWAMPGOLEM_UTURIEL/WP_SWAMPGOLEM_UTURIEL

//******************
//	Swampgolem
//******************

INSTANCE SwampGolem	(Mst_Default_Addon_SwampGolem)
{
	B_SetVisuals_Swampgolem();
	Npc_SetToFistMode	(self);
};

INSTANCE SwampGolemUturiel	(Mst_Default_Addon_SwampGolem)
{
	B_SetVisuals_Swampgolem();
	Npc_SetToFistMode	(self);
	CreateInvItem	(self, ItMi_UturielStone);
};
//---------------------------------------------------------
//
//---------------Bagienne golemy
//
//---------------------------------------------------------
INSTANCE SwampGolemBG1	(Mst_Default_Addon_SwampGolem)
{
guild							=	GIL_SWAMPSHARK;
	B_SetVisuals_Swampgolem();
	Npc_SetToFistMode	(self);
	
	CreateInvItem	(self, ItAt_SwampGolem_Heart);
};

INSTANCE SwampGolemBG2	(Mst_Default_Addon_SwampGolem)
{
guild							=	GIL_SWAMPSHARK;
	B_SetVisuals_Swampgolem();
	Npc_SetToFistMode	(self);
	CreateInvItem	(self, ItAt_SwampGolem_Heart);
};

INSTANCE SwampGolemBG3	(Mst_Default_Addon_SwampGolem)
{
guild							=	GIL_SWAMPSHARK;
	B_SetVisuals_Swampgolem();
	Npc_SetToFistMode	(self);
	CreateInvItem	(self, ItAt_SwampGolem_Heart);
};

INSTANCE SwampGolemBG4	(Mst_Default_Addon_SwampGolem)
{
guild							=	GIL_SWAMPSHARK;
	B_SetVisuals_Swampgolem();
	Npc_SetToFistMode	(self);
	CreateInvItem	(self, ItAt_SwampGolem_Heart);
};

INSTANCE SwampGolemBG5	(Mst_Default_Addon_SwampGolem)
{
guild							=	GIL_SWAMPSHARK;
	B_SetVisuals_Swampgolem();
	Npc_SetToFistMode	(self);
	CreateInvItem	(self, ItAt_SwampGolem_Heart);
};

INSTANCE SwampGolemBG6	(Mst_Default_Addon_SwampGolem)
{
guild							=	GIL_SWAMPSHARK;
	B_SetVisuals_Swampgolem();
	Npc_SetToFistMode	(self);
	CreateInvItem	(self, ItAt_SwampGolem_Heart);
};

