/*************************************************************************
**	Orc WARRIOR Prototype												**
*************************************************************************/

PROTOTYPE Mst_Default_OrcWarrior(C_Npc)			
{
	name							=	"Ork-¿o³nierz";
	guild							=	GIL_orcscout;
	npctype							=	NPCTYPE_MAIN;
	voice							=	17;
	level							=	Level_OrcSoldier;
//----------------------------------------------------------	
	attribute	[ATR_STRENGTH]		=	70;//+10
	attribute	[ATR_DEXTERITY]		=	70;
	
	attribute	[ATR_HITPOINTS_MAX]	=	300;//+50
	attribute	[ATR_HITPOINTS]		=	300;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//----------------------------------------------------------	
	protection	[PROT_BLUNT]		=	100;
	protection	[PROT_EDGE]			=	100;
	protection	[PROT_POINT]		=	100;
	protection	[PROT_FIRE]			=	55;
	protection	[PROT_FLY]			=	30;
	protection	[PROT_MAGIC]		=	30;
//----------------------------------------------------------	
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;
//---------------------------------------------------------
//---------------------------------------------------------
	fight_tactic					=	FAI_HUMAN_MASTER;
//---------------------------------------------------------
    senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 3000;

	aivar[AIV_MM_Behaviour]		= PACKHUNTER;
	
	aivar[AIV_MM_PercRange]		= 2000;
	aivar[AIV_MM_DrohRange]		= 1500;
	aivar[AIV_MM_AttackRange]	= 1500;
	aivar[AIV_MM_DrohTime]		= 0;
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_LONG;
	aivar[AIV_MM_FollowInWater] = FALSE;
//-------------------------------------------------------------
	start_aistate				= ZS_MM_AllScheduler;
};
//-------------------------------------------------------------
func void Set_OrcWarrior_Visuals()
{
	Mdl_SetVisual			(self,	"Orc.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Orc_BodyWarrior",DEFAULT,	DEFAULT,	"Orc_HeadWarrior",	DEFAULT,  	DEFAULT,	-1);
};




/*************************************************************************
**	Orc Warrior 1 - Fighter    														**
*************************************************************************/
INSTANCE OrcWarrior1	(Mst_Default_OrcWarrior)
{
	//-------- general --------
	name							=	"Ork-wojownik";
	level							=	Level_OrcWarrior;
    guild							=	GIL_ORCSCOUT;
	//-------- visual --------
	Set_OrcWarrior_Visuals();

	//-------- attributes --------
	attribute	[ATR_STRENGTH]		=	65;
	attribute	[ATR_HITPOINTS_MAX]	=	310;
	attribute	[ATR_HITPOINTS]		=	310;

	//-------- protection --------
	protection	[PROT_BLUNT]		=	80;
	protection	[PROT_EDGE]			=	80;
	protection	[PROT_POINT]		=	50;
	protection	[PROT_FIRE]			=	50;

	//-------- inventory --------
	EquipItem (self, ItMw2hOrcaxe01);
};

/*************************************************************************
**	Orc Warrior 2 - Warrior    														**
*************************************************************************/
INSTANCE OrcWarrior2	(Mst_Default_OrcWarrior)
{
	//-------- general --------
	name							=	"Ork-¿o³nierz";
	level							=	Level_OrcSoldier;
    guild							=	GIL_ORCSCOUT;
	//-------- visual --------
	Set_OrcWarrior_Visuals();

	//-------- attributes --------
	attribute	[ATR_STRENGTH]		=	75;
	attribute	[ATR_HITPOINTS_MAX]	=	450;
	attribute	[ATR_HITPOINTS]		=	450;

	//-------- protection --------
	protection	[PROT_BLUNT]		=	90;
	protection	[PROT_EDGE]			=	90;
	protection	[PROT_POINT]		=	55;
	protection	[PROT_FIRE]			=	55;

	//-------- inventory --------
	EquipItem (self, ItMw2hOrcaxe02);
};

/*************************************************************************
**	Orc Warrior 3 - Clan    														**
*************************************************************************/
INSTANCE OrcWarrior3	(Mst_Default_OrcWarrior)
{
	//-------- general --------
	name							=	"Ork-wiarus";
	level							=	Level_OrcShaman;
    guild							=	GIL_ORCSCOUT;
	//-------- visual --------
	Set_OrcWarrior_Visuals();

	//-------- attributes --------
	attribute	[ATR_STRENGTH]		=	90;
	attribute	[ATR_HITPOINTS_MAX]	=	450;
	attribute	[ATR_HITPOINTS]		=	450;

	//-------- protection --------
	protection	[PROT_BLUNT]		=	100;
	protection	[PROT_EDGE]			=	100;
	protection	[PROT_POINT]		=	70;
	protection	[PROT_FIRE]			=	70;

	//-------- inventory --------
	EquipItem (self, ItMw2hOrcaxe03);
};

/*************************************************************************
**	Orc Warrior 4 - Tempelkrieger										**
*************************************************************************/
INSTANCE OrcWarrior4	(Mst_Default_OrcWarrior)
{
	//-------- general --------
	name							=	"Ork-stra¿nik";
	level							=	Level_OrcElite;
	guild							=	GIL_ORCSCOUT;
	//-------- visual --------
	Set_OrcWarrior_Visuals();

	//-------- attributes --------
	attribute	[ATR_STRENGTH]		=	95;
	attribute	[ATR_HITPOINTS_MAX]	=	500;
	attribute	[ATR_HITPOINTS]		=	500;

	//-------- protection --------
	protection	[PROT_BLUNT]		=	110;
	protection	[PROT_EDGE]			=	110;
	protection	[PROT_POINT]		=	75;
	protection	[PROT_FIRE]			=	75;

	//-------- inventory --------
	EquipItem (self, ItMw2hOrcaxe04);
};

