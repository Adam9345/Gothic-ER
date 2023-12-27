/*************************************************************************
**	Demon Prototype														**
*************************************************************************/

PROTOTYPE Mst_Default_Demon(C_Npc)			
{
	name							=	"Demon ognia";
	guild							=	GIL_DEMON;
	aivar[AIV_MM_REAL_ID]			= 	ID_DEMON;
	level							=	Level_Demon;
//--------------------------------------------------------	
	attribute	[ATR_STRENGTH]		=	105;
	attribute	[ATR_DEXTERITY]		=	105;
	
	attribute	[ATR_HITPOINTS_MAX]	=	600;
	attribute	[ATR_HITPOINTS]		=	600;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//--------------------------------------------------------
	protection	[PROT_BLUNT]		=	100;
	protection	[PROT_EDGE]			=	100;
	protection	[PROT_POINT]		=	35;
	protection	[PROT_FIRE]			=	500;
	protection	[PROT_FLY]			=	1000;
	protection	[PROT_MAGIC]		=	35;
//--------------------------------------------------------
	damagetype 						=	DAM_FIRE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;
//--------------------------------------------------------
	fight_tactic					=	FAI_DEMON;
	
//--------------------------------------------------------
	senses							=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range					=	3000;

	aivar[AIV_MM_Behaviour]			=	PASSIVE;
	
	aivar[AIV_MM_PercRange]			=	2800;
	aivar[AIV_MM_DrohRange]			=	2500;
	aivar[AIV_MM_AttackRange]		=	2000;
	aivar[AIV_MM_DrohTime]			=	3;
	aivar[AIV_MM_FollowTime]		=	10;
	aivar[AIV_MM_FollowInWater] 	=	TRUE;
	
//-------------------------------------------------------------
	start_aistate					=	ZS_MM_AllScheduler;

	//aivar[AIV_MM_RestStart] 		=	OnlyRoutine;
};
//-------------------------------------------------------------
func void Set_Demon_Visuals()
{
	Mdl_SetVisual			(self,	"Demon.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Dem_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};
func void Set_Demon2_Visuals()
{
	Mdl_SetVisual			(self,	"Demon.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Dem_Body",		1,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};
func void Set_DemonKastagir_Visuals()
{
	Mdl_SetVisual			(self,	"Demon.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Dem_Body",		2,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

/*************************************************************************
**	Demon    															**
*************************************************************************/

INSTANCE Demon (Mst_Default_Demon)
{
	Set_Demon_Visuals();
	Npc_SetToFistMode(self);
};


/*************************************************************************
**	Summoned Demon  													**
*************************************************************************/

INSTANCE SummonedByPC_Demon (Mst_Default_Demon)
{
	Set_Demon_Visuals();

	Npc_SetToFistMode(self);
	senses							= SENSE_HEAR | SENSE_SEE;
	start_aistate					= ZS_MM_SummonedByPC;
	self.aivar[AIV_MM_DistToMaster] = 400;
	self.aivar[AIV_MM_TimeLooseHP] 	= 1;
	self.aivar[AIV_MM_PARTYMEMBER]  = TRUE;
};

INSTANCE SummonedByNPC_Demon (Mst_Default_Demon)
{
	Set_Demon_Visuals();
	Npc_SetToFistMode(self);
//---------------------------------------
	start_aistate	=	ZS_MM_Summoned;
};



/*************************************************************************
**	Xardas' zahmer Dämon    															**
*************************************************************************/

INSTANCE XardasDemon (Mst_Default_Demon)
{
	flags 					= NPC_FLAG_IMMORTAL;
	npctype					= NPCTYPE_FRIEND;
	guild					= GIL_DEMON;
    //id = 40148;
	aivar[AIV_MM_REAL_ID]	= ID_DEMON;

	Set_Demon_Visuals();
	Npc_SetToFistMode(self);

	start_aistate	= ZS_XardasDemon;	
	
//Einsetzen bei WP "DT_E1_06"
};


/*************************************************************************
**	OTDemon    															**
*************************************************************************/

INSTANCE OTDemon (Mst_Default_Demon)
{
	name							=	"Pomniejszy demon";
	guild							=	GIL_DEMON;
	level							=	Level_SmallDemon;
//--------------------------------------------------------	
	attribute	[ATR_STRENGTH]		=	180;
	attribute	[ATR_DEXTERITY]		=	180;
	
	attribute	[ATR_HITPOINTS_MAX]	=	350;
	attribute	[ATR_HITPOINTS]		=	350;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//--------------------------------------------------------
	protection	[PROT_BLUNT]		=	100;
	protection	[PROT_EDGE]			=	100;
	protection	[PROT_POINT]		=	100;
	protection	[PROT_FIRE]			=	40;
	protection	[PROT_FLY]			=	100;
	protection	[PROT_MAGIC]		=	40;
//--------------------------------------------------------
	damagetype 						=	DAM_EDGE;

//--------------------------------------------------------
	Set_Demon_Visuals();
	Npc_SetToFistMode(self);
};

/*************************************************************************
**	Demon    															**
*************************************************************************/

INSTANCE DemonMine (Mst_Default_Demon)
{
	name							=	"Demon mœciciel";
	level							=	Level_SmallDemon;
//--------------------------------------------------------	
	attribute	[ATR_STRENGTH]		=	200;
	attribute	[ATR_DEXTERITY]		=	200;
	
	attribute	[ATR_HITPOINTS_MAX]	=	350;
	attribute	[ATR_HITPOINTS]		=	350;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//--------------------------------------------------------
	protection	[PROT_BLUNT]		=	90;
	protection	[PROT_EDGE]			=	90;
	protection	[PROT_POINT]		=	40;
	protection	[PROT_FIRE]			=	250;
	protection	[PROT_FLY]			=	1000;
	protection	[PROT_MAGIC]		=	40;
//--------------------------------------------------------
	damagetype 						=	DAM_MAGIC;
	Set_Demon2_Visuals();
	Npc_SetToFistMode(self);
};



/*************************************************************************
**	Demon  Kastagira  															**
*************************************************************************/

INSTANCE DemonKastagir (Mst_Default_Demon)
{
	name							=	"Demon";
	level							=	40;
//--------------------------------------------------------	
	attribute	[ATR_STRENGTH]		=	200;
	attribute	[ATR_DEXTERITY]		=	200;
	
	attribute	[ATR_HITPOINTS_MAX]	=	450;
	attribute	[ATR_HITPOINTS]		=	450;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//--------------------------------------------------------
	protection	[PROT_BLUNT]		=	90;
	protection	[PROT_EDGE]			=	90;
	protection	[PROT_POINT]		=	40;
	protection	[PROT_FIRE]			=	250;
	protection	[PROT_FLY]			=	1000;
	protection	[PROT_MAGIC]		=	40;
//--------------------------------------------------------
	damagetype 						=	DAM_MAGIC;
	Set_DemonKastagir_Visuals();
	Npc_SetToFistMode(self);
};


