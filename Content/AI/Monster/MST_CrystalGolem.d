//[Bisheriger Code von MST_StoneGolem.d]
// Folgenden Code in die vorhandene MST_StoneGolem.d einfügen und Werte nach belieben anpassen

func void B_SetVisuals_CrystalGolem()
{
	Mdl_SetVisual			(self,	"Golem.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Crystalgolem_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void B_SetVisuals_MISCrystalGolem()
{
	Mdl_SetVisual			(self,	"Golem.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"BLCrystalgolem_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

PROTOTYPE Mst_Default_CrystalGolem	(C_Npc)
{
	name							=	"Kryszta³owy Golem";
	guild							=	GIL_GOLEM;
	aivar[AIV_MM_REAL_ID]			= 	ID_STONEGOLEM;
	level							=	30;

	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	150;
	attribute	[ATR_DEXTERITY]		=	150;
	attribute	[ATR_HITPOINTS_MAX]	=	640;
	attribute	[ATR_HITPOINTS]		=	640;
	attribute	[ATR_MANA_MAX] 		=	100;
	attribute	[ATR_MANA] 			=	100;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	100;
	protection	[PROT_EDGE]			=	150;
	protection	[PROT_POINT]		=	500;
	protection	[PROT_FIRE]			=	300;
	protection	[PROT_FLY]			=	400;	
	protection	[PROT_MAGIC]		=	20;
	
	//---- Damage Types ----
	damagetype 						=	DAM_FLY;
    fight_tactic					=	FAI_GOLEM;
	B_SetVisuals_CrystalGolem();
	Npc_SetToFistMode	(self);
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


INSTANCE CrystalGolem	(Mst_Default_CrystalGolem)
{
	B_SetVisuals_CrystalGolem();
	Npc_SetToFistMode	(self);
	CreateInvItems (self, ItAt_CrystalGolem_Heart, 1);		
};

INSTANCE CrystalGolem_Misson1	(Mst_Default_CrystalGolem)
{
	B_SetVisuals_MISCrystalGolem();
	Npc_SetToFistMode	(self);
	CreateInvItem	(self, ItAt_CrystalGolem_Heart);
};