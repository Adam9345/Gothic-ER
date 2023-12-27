func void Mod_BonusStr1_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	var C_NPC rock; rock = Hlp_GetNpc(PC_Rockefeller);
	if ( (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))||(Hlp_GetInstanceID(self)==Hlp_GetInstanceID(rock)) ) 
	{	
	var int bonus;
	if bonus == false
	{
	bonus = true;
	B_RaiseAttribute	(ATR_STRENGTH,	1);
	Snd_Play		("Harp02");
	};
	};
};

func void Mod_BonusStr2_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	var C_NPC rock; rock = Hlp_GetNpc(PC_Rockefeller);
	if ( (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))||(Hlp_GetInstanceID(self)==Hlp_GetInstanceID(rock)) ) 
	{	
	var int bonus;
	if bonus == false
	{
	bonus = true;
	B_RaiseAttribute	(ATR_STRENGTH,	1);
	Snd_Play		("Harp02");
	};
	};
};

func void Mod_BonusDex1_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	var C_NPC rock; rock = Hlp_GetNpc(PC_Rockefeller);
	if ( (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))||(Hlp_GetInstanceID(self)==Hlp_GetInstanceID(rock)) ) 
	{	
	var int bonus;
	if bonus == false
	{
	bonus = true;
	B_RaiseAttribute	(ATR_DEXTERITY,	1);
	Snd_Play		("Harp02");
	};
	};
};

func void Mod_BonusDex2_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	var C_NPC rock; rock = Hlp_GetNpc(PC_Rockefeller);
	if ( (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))||(Hlp_GetInstanceID(self)==Hlp_GetInstanceID(rock)) ) 
	{	
	var int bonus;
	if bonus == false
	{
	bonus = true;
	B_RaiseAttribute	(ATR_DEXTERITY,	4);
	Snd_Play		("Harp02");
	};
	};
};

func void Mod_BonusHP1_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	var C_NPC rock; rock = Hlp_GetNpc(PC_Rockefeller);
	if ( (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))||(Hlp_GetInstanceID(self)==Hlp_GetInstanceID(rock)) ) 
	{	
	var int bonus;
	if bonus == false
	{
	bonus = true;
	B_RaiseAttribute	(ATR_HITPOINTS_MAX, 2);
	Snd_Play		("Harp02");
	};
	};
};

func void Mod_BonusHP2_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	var C_NPC rock; rock = Hlp_GetNpc(PC_Rockefeller);
	if ( (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))||(Hlp_GetInstanceID(self)==Hlp_GetInstanceID(rock)) ) 
	{	
	var int bonus;
	if bonus == false
	{
	bonus = true;
	B_RaiseAttribute	(ATR_HITPOINTS_MAX, 10);
	Snd_Play		("Harp02");
	};
	};
};

func void Mod_BonusHP3_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	var C_NPC rock; rock = Hlp_GetNpc(PC_Rockefeller);
	if ( (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))||(Hlp_GetInstanceID(self)==Hlp_GetInstanceID(rock)) ) 
	{	
	var int bonus;
	if bonus == false
	{
	bonus = true;
	B_RaiseAttribute	(ATR_HITPOINTS_MAX, 5);
	Snd_Play		("Harp02");
	};
	};
};

func void Mod_BonusHP4_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	var C_NPC rock; rock = Hlp_GetNpc(PC_Rockefeller);
	if ( (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))||(Hlp_GetInstanceID(self)==Hlp_GetInstanceID(rock)) ) 
	{	
	var int bonus;
	if bonus == false
	{
	bonus = true;
	B_RaiseAttribute	(ATR_HITPOINTS_MAX, 6);
	Snd_Play		("Harp02");
	};
	};
};

func void Mod_BonusMana1_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	var C_NPC rock; rock = Hlp_GetNpc(PC_Rockefeller);
	if ( (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))||(Hlp_GetInstanceID(self)==Hlp_GetInstanceID(rock)) ) 
	{	
	var int bonus;
	if bonus == false
	{
	bonus = true;
	B_RaiseAttribute	(ATR_MANA_MAX, 3);
	Snd_Play		("Harp02");
	};
	};
};

func void Mod_BonusMana2_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	var C_NPC rock; rock = Hlp_GetNpc(PC_Rockefeller);
	if ( (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))||(Hlp_GetInstanceID(self)==Hlp_GetInstanceID(rock)) ) 
	{	
	var int bonus;
	if bonus == false
	{
	bonus = true;
	B_RaiseAttribute	(ATR_MANA_MAX, 5);
	Snd_Play		("Harp02");
	};
	};
};

func void Mod_BonusMana3_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	var C_NPC rock; rock = Hlp_GetNpc(PC_Rockefeller);
	if ( (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))||(Hlp_GetInstanceID(self)==Hlp_GetInstanceID(rock)) ) 
	{	
	var int bonus;
	if bonus == false
	{
	bonus = true;
	B_RaiseAttribute	(ATR_MANA_MAX, 1);
	Snd_Play		("Harp02");
	};
	};
};

func void Mod_BonusSpeed5min_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	var C_NPC rock; rock = Hlp_GetNpc(PC_Rockefeller);
	if ( (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))||(Hlp_GetInstanceID(self)==Hlp_GetInstanceID(rock)) ) 
	{	
	var int bonus;
	if bonus == false
	{
	bonus = true;
	Mdl_ApplyOverlayMDSTimed	(self, "HUMANS_SPRINT.MDS", 300000);
	Snd_Play		("Harp02");
	PrintS_Ext ("Mo¿esz szybciej biegaæ przez 5 minut!",COL_WHITE);
	};
	};
};

func void Mod_BonusSTR3min_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	var C_NPC rock; rock = Hlp_GetNpc(PC_Rockefeller);
	if ( (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))||(Hlp_GetInstanceID(self)==Hlp_GetInstanceID(rock)) ) 
	{	
	var int bonus;
	if bonus == false
	{
	bonus = true;
	B_RaiseAttribute	(ATR_STRENGTH,	20);
 	Pot_StrenghtTimeStart = 3 * 60;
	Snd_Play		("Harp02");
	};
	};
};
