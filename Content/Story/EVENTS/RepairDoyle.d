 func void Palisada_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	var C_NPC rock; rock = Hlp_GetNpc(PC_Rockefeller);
	
	//***ALT** if	(Hlp_GetInstanceID (self)== Hlp_GetInstanceID (Hero)) // MH: geändert, damit kontrollierte NSCs nicht schlafen können!
	if ( (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))||(Hlp_GetInstanceID(self)==Hlp_GetInstanceID(rock)) ) 
	{	
	PLAYER_MOBSI_PRODUCTION	=	MOBSI_DEFENDWALLBDT;
	//self.aivar[AIV_INVINCIBLE]=TRUE;
	Ai_ProcessInfos (her);
	};
};

 func void B_Palisada1_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	var C_NPC rock; rock = Hlp_GetNpc(PC_Rockefeller);
	
	//***ALT** if	(Hlp_GetInstanceID (self)== Hlp_GetInstanceID (Hero)) // MH: geändert, damit kontrollierte NSCs nicht schlafen können!
	if ( (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))||(Hlp_GetInstanceID(self)==Hlp_GetInstanceID(rock)) ) 
	{	
	//monolog = Palisada2;
	//print ("AAAAA");
	//self.aivar[AIV_INVINCIBLE]=TRUE;
	//Ai_ProcessInfos (her);
	if (Palisada == LOG_RUNNING)
	{
	naprawiono_P1 = true;
	
	PrintScreen	("Naprawiono fragment palisady", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
	};
};
 func void B_Palisada2_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	var C_NPC rock; rock = Hlp_GetNpc(PC_Rockefeller);
	
	//***ALT** if	(Hlp_GetInstanceID (self)== Hlp_GetInstanceID (Hero)) // MH: geändert, damit kontrollierte NSCs nicht schlafen können!
	if ( (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))||(Hlp_GetInstanceID(self)==Hlp_GetInstanceID(rock)) ) 
	{	
	//monolog = Palisada2;
	//print ("AAAAA");
	//self.aivar[AIV_INVINCIBLE]=TRUE;
	//Ai_ProcessInfos (her);
	if (Palisada == LOG_RUNNING)
	{
	naprawiono_P2 = true;
	
	PrintScreen	("Naprawiono fragment palisady", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
	};
};
 func void B_Palisada3_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	var C_NPC rock; rock = Hlp_GetNpc(PC_Rockefeller);
	
	//***ALT** if	(Hlp_GetInstanceID (self)== Hlp_GetInstanceID (Hero)) // MH: geändert, damit kontrollierte NSCs nicht schlafen können!
	if ( (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))||(Hlp_GetInstanceID(self)==Hlp_GetInstanceID(rock)) ) 
	{	
	//monolog = Palisada2;
	//print ("AAAAA");
	//self.aivar[AIV_INVINCIBLE]=TRUE;
	//Ai_ProcessInfos (her);
	if (Palisada == LOG_RUNNING)
	{
	naprawiono_P3 = true;
	
	PrintScreen	("Naprawiono fragment palisady", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};	
	};
};
 func void B_Palisada4_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	var C_NPC rock; rock = Hlp_GetNpc(PC_Rockefeller);
	
	//***ALT** if	(Hlp_GetInstanceID (self)== Hlp_GetInstanceID (Hero)) // MH: geändert, damit kontrollierte NSCs nicht schlafen können!
	if ( (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))||(Hlp_GetInstanceID(self)==Hlp_GetInstanceID(rock)) ) 
	{	
	//monolog = Palisada2;
	//self.aivar[AIV_INVINCIBLE]=TRUE;
	//Ai_ProcessInfos (her);
	if (Palisada == LOG_RUNNING)
	{
	naprawiono_P4 = true;
	
	PrintScreen	("Naprawiono fragment palisady", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};	
	};
};
 func void B_Palisada5_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	var C_NPC rock; rock = Hlp_GetNpc(PC_Rockefeller);
	
	//***ALT** if	(Hlp_GetInstanceID (self)== Hlp_GetInstanceID (Hero)) // MH: geändert, damit kontrollierte NSCs nicht schlafen können!
	if ( (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))||(Hlp_GetInstanceID(self)==Hlp_GetInstanceID(rock)) ) 
	{	
	//monolog = Palisada2;
	//self.aivar[AIV_INVINCIBLE]=TRUE;
	//Ai_ProcessInfos (her);
	if (Palisada == LOG_RUNNING)
	{
	naprawiono_P5 = true;
	
	PrintScreen	("Naprawiono fragment palisady", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};	
	};
};
// rutynadoylea LOCATION_11_12
//========================================
//-----------------> NoRepair
//========================================

INSTANCE DIA_PC_Hero_NoRepair (C_INFO)
{
   npc          = PC_Hero;
   nr           = 0;
   condition    = DIA_PC_Hero_NoRepair_Condition;
   information  = DIA_PC_Hero_NoRepair_Info;
   permanent	= true;
   description	= "ZAKOÑCZ";
};

FUNC INT DIA_PC_Hero_NoRepair_Condition()
{
    if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_DEFENDWALLBDT)
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Hero_NoRepair_Info()
{
    AI_StopProcessInfos	(self);
self.aivar[AIV_INVINCIBLE]=FALSE;
};

//========================================
//-----------------> REPAIR1
//========================================

INSTANCE DIA_PC_Hero_REPAIR1 (C_INFO)
{
   npc          = PC_Hero;
   nr           = 1;
   condition    = DIA_PC_Hero_REPAIR1_Condition;
   information  = DIA_PC_Hero_REPAIR1_Info;
   permanent	= false;
   description	= "Naprawiaj...";
};

FUNC INT DIA_PC_Hero_REPAIR1_Condition()
{
    if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_DEFENDWALLBDT)
	&& (robotaPALISADA==true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Hero_REPAIR1_Info()
{
PrintScreen ("Ukoñczono 1/6",-1,1,"font_old_10_white.tga",1);
};

//========================================
//-----------------> REPAIR2
//========================================

INSTANCE DIA_PC_Hero_REPAIR2 (C_INFO)
{
   npc          = PC_Hero;
   nr           = 2;
   condition    = DIA_PC_Hero_REPAIR2_Condition;
   information  = DIA_PC_Hero_REPAIR2_Info;
   permanent	= FALSE;
   description	= "Naprawiaj...";
};

FUNC INT DIA_PC_Hero_REPAIR2_Condition()
{
    if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_DEFENDWALLBDT)
    && (Npc_KnowsInfo (other, DIA_PC_Hero_REPAIR1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Hero_REPAIR2_Info()
{
PrintScreen ("Ukoñczono 2/6",-1,1,"font_old_10_white.tga",1);
Wld_InsertNpc (Molerat,"OW_PATH_188");
};

//========================================
//-----------------> REPAIR3
//========================================

INSTANCE DIA_PC_Hero_REPAIR3 (C_INFO)
{
   npc          = PC_Hero;
   nr           = 3;
   condition    = DIA_PC_Hero_REPAIR3_Condition;
   information  = DIA_PC_Hero_REPAIR3_Info;
   permanent	= FALSE;
   description	= "Naprawiaj...";
};

FUNC INT DIA_PC_Hero_REPAIR3_Condition()
{
   if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_DEFENDWALLBDT)
    && (Npc_KnowsInfo (other, DIA_PC_Hero_REPAIR2))
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Hero_REPAIR3_Info()
{
PrintScreen ("Ukoñczono 3/6",-1,1,"font_old_10_white.tga",1);
Wld_InsertNpc (Molerat,"OW_PATH_188");
Wld_InsertNpc (Molerat,"OW_PATH_188");
Wld_InsertNpc (GreenGobboSword,"OW_PATH_188");
};

//========================================
//-----------------> REPAIR4
//========================================

INSTANCE DIA_PC_Hero_REPAIR4 (C_INFO)
{
   npc          = PC_Hero;
   nr           = 4;
   condition    = DIA_PC_Hero_REPAIR4_Condition;
   information  = DIA_PC_Hero_REPAIR4_Info;
   permanent	= FALSE;
   description	= "Naprawiaj...";
};

FUNC INT DIA_PC_Hero_REPAIR4_Condition()
{
   if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_DEFENDWALLBDT)
    && (Npc_KnowsInfo (other, DIA_PC_Hero_REPAIR3))
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Hero_REPAIR4_Info()
{
PrintScreen ("Ukoñczono 4/6",-1,1,"font_old_10_white.tga",1);
Wld_InsertNpc (Molerat,"OW_PATH_187");
};

//========================================
//-----------------> REPAIR5
//========================================

INSTANCE DIA_PC_Hero_REPAIR5 (C_INFO)
{
   npc          = PC_Hero;
   nr           = 5;
   condition    = DIA_PC_Hero_REPAIR5_Condition;
   information  = DIA_PC_Hero_REPAIR5_Info;
   permanent	= FALSE;
   description	= "Naprawiaj...";
};

FUNC INT DIA_PC_Hero_REPAIR5_Condition()
{
    if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_DEFENDWALLBDT)
    && (Npc_KnowsInfo (other, DIA_PC_Hero_REPAIR4))
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Hero_REPAIR5_Info()
{
PrintScreen ("Ukoñczono 5/6",-1,1,"font_old_10_white.tga",1);
};

//========================================
//-----------------> REPAIR6
//========================================

INSTANCE DIA_PC_Hero_REPAIR6 (C_INFO)
{
   npc          = PC_Hero;
   nr           = 6;
   condition    = DIA_PC_Hero_REPAIR6_Condition;
   information  = DIA_PC_Hero_REPAIR6_Info;
   permanent	= FALSE;
   description	= "Naprawiaj...";
};

FUNC INT DIA_PC_Hero_REPAIR6_Condition()
{
    if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_DEFENDWALLBDT)
    && (other.attribute[ATR_HITPOINTS] >= 2)
    && (Npc_KnowsInfo (other, DIA_PC_Hero_REPAIR5))
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Hero_REPAIR6_Info()
{
PrintScreen ("Ukoñczono 6/6",-1,1,"font_old_10_white.tga",1);
Print ("Robota skoñczona");
Wld_InsertNpc (Molerat,"OW_PATH_188");
Wld_InsertNpc (Molerat,"OW_PATH_187");
Wld_InsertNpc (Molerat,"OW_PATH_188");
Wld_InsertNpc (Scavenger,"OW_PATH_187");
};

