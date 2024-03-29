/*************************************************************************
**	BlackGobbo Prototype												**
*************************************************************************/

PROTOTYPE Mst_Default_BlackGobbo(C_NPC)			
{
	name							=	"Czarny goblin";
	guild							=	GIL_GOBBO;
	aivar[AIV_MM_REAL_ID]			= 	ID_BLACKGOBBO;
	level							=	Level_BlackGobbo;
//------------------------------------------------------------------
	attribute	[ATR_STRENGTH]		=	20;
	attribute	[ATR_DEXTERITY]		=	20;
	
	attribute	[ATR_HITPOINTS_MAX]	=	80;
	attribute	[ATR_HITPOINTS]		=	80;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//------------------------------------------------------------------
	protection	[PROT_BLUNT]		=	40;
	protection	[PROT_EDGE]			=	40;
	protection	[PROT_POINT]		=	40;
	protection	[PROT_FIRE]			=	20;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	0;
//------------------------------------------------------------------
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;
//------------------------------------------------------------------
	fight_tactic	=	FAI_GOBBO;
//------------------------------------------------------------------
	senses			=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	3000;		// 30m

	aivar[AIV_MM_Behaviour]		= PACKHUNTER;
	
	aivar[AIV_MM_PercRange]		= 1500;
	aivar[AIV_MM_DrohRange]		= 1200;
	aivar[AIV_MM_AttackRange]	= 700;
	aivar[AIV_MM_DrohTime]		= 4;
	aivar[AIV_MM_FollowTime]	= 10;
	aivar[AIV_MM_FollowInWater] = FALSE;
//------------------------------------------------------------------
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;	
};
//------------------------------------------------------------------
func void Set_BlackGobbo_Visuals()
{
	Mdl_SetVisual			(self,	"Gobbo.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Gob_Body",		1,			DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void Set_BlackGobbo2_Visuals()
{
	Mdl_SetVisual			(self,	"Gobbo.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Gob_Body",		2,			DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void Set_BlackGobbo3_Visuals()
{
	Mdl_SetVisual			(self,	"Gobbo.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Gob_Body",		3,			DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};
/*************************************************************************
**	Black Gobbo Mace   														**
*************************************************************************/

INSTANCE BlackGobboMace	(Mst_Default_BlackGobbo)
{
	Set_BlackGobbo_Visuals();
	Npc_SetToFightMode (self, ItMw_1H_Nailmace_01); 
	attribute[ATR_STRENGTH] = attribute	[ATR_STRENGTH] + 35; // da technisch im Faustkampf
};
/*************************************************************************
**	Black Gobbo Warrior   														**
*************************************************************************/

INSTANCE BlackGobboWarrior	(Mst_Default_BlackGobbo)
{
	level							=	15;

	Set_BlackGobbo2_Visuals();
	Npc_SetToFightMode (self, ItMw_1H_Mace_01_Z);
	
	attribute	[ATR_STRENGTH]		=	 60+30; //da Gobbos technisch im Faustkampf
	
	attribute	[ATR_HITPOINTS_MAX]	=	105;
	attribute	[ATR_HITPOINTS]		=	105;
	
	protection	[PROT_BLUNT]		=	50;
	protection	[PROT_EDGE]			=	50;
	
	name							=	"Goblin berserk";
	
};

/*************************************************************************
**	Black Gobbo Warrior   														**
*************************************************************************/

INSTANCE Gol_Umik	(Mst_Default_BlackGobbo)
{
	level							=	40;
	name							=	"Herszt goblin�w Gol-Umik ";
	Set_BlackGobbo3_Visuals();
	Npc_SetToFightMode (self, ItMw_1H_Mace_04);
	
	attribute	[ATR_STRENGTH]		=	 120; //da Gobbos technisch im Faustkampf
	
	attribute	[ATR_HITPOINTS_MAX]	=	800;
	attribute	[ATR_HITPOINTS]		=	800;
	
	protection	[PROT_BLUNT]		=	90;
	protection	[PROT_EDGE]			=	90;
	Mdl_SetModelScale(self, 1.3, 1.3, 1.3);
};
