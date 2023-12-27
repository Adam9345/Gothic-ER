/*************************************************************************
**	Snapper Prototype													**
*************************************************************************/

PROTOTYPE Mst_Default_Snapper(C_Npc)			
{
	name							=	"Zêbacz";
	guild							=	GIL_SNAPPER;
	aivar[AIV_MM_REAL_ID]			= 	ID_SNAPPER;
	level							=	Level_Snapper;//22
//---------------------------------------------------------	
	attribute	[ATR_STRENGTH]		=	100;
	attribute	[ATR_DEXTERITY]		=	100;
	
	attribute	[ATR_HITPOINTS_MAX]	=	240;//+20
	attribute	[ATR_HITPOINTS]		=	240;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//---------------------------------------------------------	
	protection	[PROT_BLUNT]		=	40;
	protection	[PROT_EDGE]			=	40;
	protection	[PROT_POINT]		=	40;		
	protection	[PROT_FIRE]			=	30;
	protection	[PROT_FLY]			=	20;
	protection	[PROT_MAGIC]		=	0;
//---------------------------------------------------------	
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;
//---------------------------------------------------------	
	fight_tactic					=	FAI_SNAPPER;
//---------------------------------------------------------	
	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 3000;		// 30m

	aivar[AIV_MM_Behaviour]		= HUNTER;
	
	aivar[AIV_MM_PercRange]		= 2200;
	aivar[AIV_MM_DrohRange]		= 1800;
	aivar[AIV_MM_AttackRange]	= 1500;
	aivar[AIV_MM_DrohTime]		= 3;
	aivar[AIV_MM_FollowTime]	= 15;
	aivar[AIV_MM_FollowInWater] = TRUE;
//---------------------------------------------------------	
	start_aistate				= ZS_MM_AllScheduler;
	
	aivar[AIV_MM_RestStart]		= OnlyRoutine;
};
//---------------------------------------------------------	
func void Set_Snapper_Visuals()
{
	Mdl_SetVisual			(self,	"Snapper.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Sna_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


/*************************************************************************
**	Snapper    															**
*************************************************************************/

INSTANCE Snapper	(Mst_Default_Snapper)
{
	Set_Snapper_Visuals();
	Npc_SetToFistMode(self);

};

INSTANCE TwoLegsWaran	(Mst_Default_Snapper)
{
name = "Agresywny zêbacz";
level							=	22;//22
//---------------------------------------------------------	
	attribute	[ATR_STRENGTH]		=	130;
	attribute	[ATR_DEXTERITY]		=	130;
	
	attribute	[ATR_HITPOINTS_MAX]	=	300;//+20
	attribute	[ATR_HITPOINTS]		=	300;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//---------------------------------------------------------	
	protection	[PROT_BLUNT]		=	70;
	protection	[PROT_EDGE]			=	70;
	protection	[PROT_POINT]		=	30;		
	protection	[PROT_FIRE]			=	30;
	protection	[PROT_FLY]			=	30;
	protection	[PROT_MAGIC]		=	20;
	Set_Snapper_Visuals();
	Npc_SetToFistMode(self);

};

INSTANCE BigSnapper	(Mst_Default_Snapper)
{
	name							=	"Olbrzymi zêbacz";
	guild							=	GIL_SNAPPER;
	aivar[AIV_MM_REAL_ID]			= 	ID_SNAPPER;
	level							=	50;//22
//---------------------------------------------------------	
	attribute	[ATR_STRENGTH]		=	140;
	attribute	[ATR_DEXTERITY]		=	140;
	
	attribute	[ATR_HITPOINTS_MAX]	=	500;//+20
	attribute	[ATR_HITPOINTS]		=	500;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//---------------------------------------------------------	
	protection	[PROT_BLUNT]		=	75;
	protection	[PROT_EDGE]			=	65;
	protection	[PROT_POINT]		=	50;		
	protection	[PROT_FIRE]			=	45;
	protection	[PROT_FLY]			=	20;
	protection	[PROT_MAGIC]		=	20;
	Set_Snapper_Visuals();
	Npc_SetToFistMode(self);

};



INSTANCE Snapper_Kh	(Mst_Default_Snapper)
{
	name							=	"Olbrzymi zêbacz";
	guild							=	GIL_SNAPPER;
	aivar[AIV_MM_REAL_ID]			= 	ID_SNAPPER;
	level							=	50;//22
//---------------------------------------------------------	
	attribute	[ATR_STRENGTH]		=	140;
	attribute	[ATR_DEXTERITY]		=	140;
	
	attribute	[ATR_HITPOINTS_MAX]	=	520;//+20
	attribute	[ATR_HITPOINTS]		=	520;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//---------------------------------------------------------	
	protection	[PROT_BLUNT]		=	70;
	protection	[PROT_EDGE]			=	55;
	protection	[PROT_POINT]		=	50;		
	protection	[PROT_FIRE]			=	30;
	protection	[PROT_FLY]			=	20;
	protection	[PROT_MAGIC]		=	20;
	Set_Snapper_Visuals();
	Npc_SetToFistMode(self);
    Mdl_SetModelScale(self, 1.2, 1.2, 1.2);
	CreateInvItems (self, ITKE_KH_Tirrut, 1);
};

INSTANCE Snapper_ER	(Mst_Default_Snapper)
{
	name							=	"Olbrzymi zêbacz";
	guild							=	GIL_SNAPPER;
	aivar[AIV_MM_REAL_ID]			= 	ID_SNAPPER;
	level							=	300;//22
//---------------------------------------------------------	
	attribute	[ATR_STRENGTH]		=	100;
	attribute	[ATR_DEXTERITY]		=	100;
	
	attribute	[ATR_HITPOINTS_MAX]	=	420;//+20
	attribute	[ATR_HITPOINTS]		=	420;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//---------------------------------------------------------	
	protection	[PROT_BLUNT]		=	70;
	protection	[PROT_EDGE]			=	55;
	protection	[PROT_POINT]		=	50;		
	protection	[PROT_FIRE]			=	30;
	protection	[PROT_FLY]			=	20;
	protection	[PROT_MAGIC]		=	20;
	Set_Snapper_Visuals();
	Npc_SetToFistMode(self);
    Mdl_SetModelScale(self, 1.1, 1.1, 1.1);
	CreateInvItems (self, ITKE_ER_CHEST01, 1);
};