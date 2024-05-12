/*************************************************************************
**	Orc WARRIOR Prototype												**
*************************************************************************/


PROTOTYPE Mst_Default_OrcElite(C_Npc)			
{
	name							=	"Ork Elita";
	guild							=	GIL_ORCWARRIOR;
	npctype							=	NPCTYPE_GUARD;
	voice							=	18;
	level							=	Level_OrcElite;
//----------------------------------------------------------	
	attribute	[ATR_STRENGTH]		=	90;
	attribute	[ATR_DEXTERITY]		=	80;
	
	attribute	[ATR_HITPOINTS_MAX]	=	450;
	attribute	[ATR_HITPOINTS]		=	450;

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
//	damage		[DAM_INDEX_EDGE]	=	0;
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
	start_aistate				= ZS_Orc_Guard;
};
//-------------------------------------------------------------
func void Set_OrcElite_Visuals()
{
	Mdl_SetVisual			(self,	"Orc.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"ORC_BODYELITE",DEFAULT,	DEFAULT,	"Orc_HeadWarrior",	DEFAULT,  	DEFAULT,	-1);
};


/*************************************************************************
**	Orc Warrior 1 - Fighter    														**
*************************************************************************/
INSTANCE Orcelite_Rest	(Mst_Default_OrcElite)
{
	//-------- general --------
	name							=	"Ork Elita";
	level							=	Level_OrcElite;

	//-------- visual --------
	Set_OrcElite_Visuals();

//----------------------------------------------------------	
	attribute	[ATR_STRENGTH]		=	125;
	attribute	[ATR_DEXTERITY]		=	225;
	
	attribute	[ATR_HITPOINTS_MAX]	=	450;
	attribute	[ATR_HITPOINTS]		=	450;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//----------------------------------------------------------	
	protection	[PROT_BLUNT]		=	120;
	protection	[PROT_EDGE]			=	120;
	protection	[PROT_POINT]		=	55;
	protection	[PROT_FIRE]			=	50;
	protection	[PROT_FLY]			=	120;
	protection	[PROT_MAGIC]		=	45;

	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcSword_02); //Wenn ihr noch dass beiliegende Orkschwert eingefügt habt, müsst ihr die Instance "Itmw2hOrcaxe04" durch "ItMw_2H_OrcElite_Sword" ersetzen.
};

func void Set_OrcWarrior2Temple_Visuals()
{
	Mdl_SetVisual			(self,	"Orc.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Orc_BodyWarrior",1,	DEFAULT,	"Orc_HeadWarrior",	DEFAULT,  	DEFAULT,	-1);
};

INSTANCE Ur_Gran	(Mst_Default_OrcElite)
{
	//-------- general --------
	name							=	"Orkowy pu³kownik Ur-Gran";
	level							=	80;

	//-------- visual --------
	Set_OrcWarrior2Temple_Visuals();

	//-------- attributes --------
	attribute	[ATR_STRENGTH]		=	140;
	attribute	[ATR_DEXTERITY]		=	140;
	attribute	[ATR_HITPOINTS_MAX]	=	2000;
	attribute	[ATR_HITPOINTS]		=	2000;

	//-------- protection --------
	protection	[PROT_BLUNT]		=	90;
	protection	[PROT_EDGE]			=	90;
	protection	[PROT_POINT]		=	40;
	protection	[PROT_FIRE]			=	50;
	protection	[PROT_MAGIC]			=	35;
	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcSword_02); //Wenn ihr noch dass beiliegende Orkschwert eingefügt habt, müsst ihr die Instance "Itmw2hOrcaxe04" durch "ItMw_2H_OrcElite_Sword" ersetzen.
	CreateInvItem (self,Plan_Rapier); 

	//aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};


INSTANCE Ur_Na_Kurvok	(Mst_Default_OrcElite)
{
	//-------- general --------
	name							=	"Orkowy gladiator Ur-Na-Kvar";
	level							=	65;

	//-------- visual --------
	Set_OrcWarrior2Temple_Visuals();

	//-------- attributes --------
	attribute	[ATR_STRENGTH]		=	130;
	attribute	[ATR_DEXTERITY]		=	130;
	attribute	[ATR_HITPOINTS_MAX]	=	1700;
	attribute	[ATR_HITPOINTS]		=	1700;

	//-------- protection --------
	protection	[PROT_BLUNT]		=	90;
	protection	[PROT_EDGE]			=	90;
	protection	[PROT_POINT]		=	40;
	protection	[PROT_FIRE]			=	50;
	protection	[PROT_MAGIC]		=	35;

	//-------- inventory --------
	EquipItem (self, ItMw2hOrcaxe04); //Wenn ihr noch dass beiliegende Orkschwert eingefügt habt, müsst ihr die Instance "Itmw2hOrcaxe04" durch "ItMw_2H_OrcElite_Sword" ersetzen.
};

INSTANCE Orcelite_ArenaGuardian	(Mst_Default_OrcElite)
{
	//-------- general --------
	name							=	"Orkowy Stra¿nik Areny";
	level							=	30;

	//-------- visual --------
	Set_OrcElite_Visuals();

	//-------- attributes --------
	attribute	[ATR_STRENGTH]		=	100;
	attribute	[ATR_DEXTERITY]		=	150;
	attribute	[ATR_HITPOINTS_MAX]	=	450;
	attribute	[ATR_HITPOINTS]		=	450;

	//-------- protection --------
	protection	[PROT_BLUNT]		=	90;
	protection	[PROT_EDGE]			=	90;
	protection	[PROT_POINT]		=	40;
	protection	[PROT_FIRE]			=	50;
	protection	[PROT_MAGIC]			=	35;

	//-------- inventory --------
	EquipItem (self, ItMw2hOrcaxe04); //Wenn ihr noch dass beiliegende Orkschwert eingefügt habt, müsst ihr die Instance "Itmw2hOrcaxe04" durch "ItMw_2H_OrcElite_Sword" ersetzen.
};

INSTANCE Orcelite_EnterGuardian	(Mst_Default_OrcElite)
{
	//-------- general --------
	name							=	"Orkowy Stra¿nik Wejœcia";
	level							=	30;

	//-------- visual --------
	Set_OrcElite_Visuals();

	//-------- attributes --------
	attribute	[ATR_STRENGTH]		=	100;
	attribute	[ATR_DEXTERITY]		=	150;
	attribute	[ATR_HITPOINTS_MAX]	=	450;
	attribute	[ATR_HITPOINTS]		=	450;

	//-------- protection --------
	protection	[PROT_BLUNT]		=	90;
	protection	[PROT_EDGE]			=	90;
	protection	[PROT_POINT]		=	40;
	protection	[PROT_FIRE]			=	50;
	protection	[PROT_MAGIC]			=	35;

	//-------- inventory --------
	EquipItem (self, ItMw2hOrcaxe04); //Wenn ihr noch dass beiliegende Orkschwert eingefügt habt, müsst ihr die Instance "Itmw2hOrcaxe04" durch "ItMw_2H_OrcElite_Sword" ersetzen.
};

INSTANCE Orcelite_TreasureGuardian	(Mst_Default_OrcElite)
{
	//-------- general --------
	name							=	"Orkowy Stra¿nik Skarbu";
	level							=	45;

	//-------- visual --------
	Set_OrcElite_Visuals();

	//-------- attributes --------
	attribute	[ATR_STRENGTH]		=	125;
	attribute	[ATR_DEXTERITY]		=	225;
	attribute	[ATR_HITPOINTS_MAX]	=	550;
	attribute	[ATR_HITPOINTS]		=	550;

	//-------- protection --------
	protection	[PROT_BLUNT]		=	90;
	protection	[PROT_EDGE]			=	90;
	protection	[PROT_POINT]		=	40;
	protection	[PROT_FIRE]			=	50;
	protection	[PROT_MAGIC]		=	35;

	//-------- inventory --------
	EquipItem (self, ItMw2hOrcaxe04); //Wenn ihr noch dass beiliegende Orkschwert eingefügt habt, müsst ihr die Instance "Itmw2hOrcaxe04" durch "ItMw_2H_OrcElite_Sword" ersetzen.
};

INSTANCE Orc_ELite_TWO	(Mst_Default_OrcElite)
{
	//-------- general --------
	name							=	"Ork-Elta";
	level							=	45;

	//-------- visual --------
	Set_OrcElite_Visuals();

	//-------- attributes --------
	attribute	[ATR_STRENGTH]		=	100;
	attribute	[ATR_DEXTERITY]		=	100;
	attribute	[ATR_HITPOINTS_MAX]	=	650;
	attribute	[ATR_HITPOINTS]		=	650;

	//-------- protection --------
	protection	[PROT_BLUNT]		=	120;
	protection	[PROT_EDGE]			=	120;
	protection	[PROT_POINT]		=	55;
	protection	[PROT_FIRE]			=	50;
	protection	[PROT_FLY]			=	120;
	protection	[PROT_MAGIC]		=	45;

	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcSword_02); //Wenn ihr noch dass beiliegende Orkschwert eingefügt habt, müsst ihr die Instance "Itmw2hOrcaxe04" durch "ItMw_2H_OrcElite_Sword" ersetzen.
};
