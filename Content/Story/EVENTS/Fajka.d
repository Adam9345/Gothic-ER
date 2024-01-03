// *Script was make in Easy Dialog Maker (EDM)
func void Fajka_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	var C_NPC rock; rock = Hlp_GetNpc(PC_Rockefeller);
	
	//***ALT** if	(Hlp_GetInstanceID (self)== Hlp_GetInstanceID (Hero)) // MH: geändert, damit kontrollierte NSCs nicht schlafen können!
	if ( (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))||(Hlp_GetInstanceID(self)==Hlp_GetInstanceID(rock)) ) 
	{	
	    self.aivar[AIV_INVINCIBLE]=TRUE;
		PLAYER_MOBSI_PRODUCTION	=	MOBSI_SMOKE;
		Ai_ProcessInfos (her);
	};
};
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

func void Reset_Mobsi_Smoke() {
    PLAYER_MOBSI_PRODUCTION	=	MOBSI_NONE;
};

INSTANCE DIA_PC_Hero_Palenie_EXIT(C_INFO)
{
	npc             = PC_Hero;
	nr              = 999;
	condition		= DIA_PC_Hero_Palenie_EXIT_Condition;
	information		= DIA_PC_Hero_Palenie_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_PC_Hero_Palenie_EXIT_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMOKE)
	{
	return TRUE;
	};
};

FUNC VOID DIA_PC_Hero_Palenie_EXIT_Info()
{
	self.aivar[AIV_INVINCIBLE]=FALSE;
    PLAYER_MOBSI_PRODUCTION	=	MOBSI_NONE;
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Palenie
//========================================

INSTANCE DIA_PC_Hero_Palenie (C_INFO)
{
   npc          = PC_Hero;
   nr           = 1;
   condition    = DIA_PC_Hero_Palenie_Condition;
   information  = DIA_PC_Hero_Palenie_Info;
   permanent	= true;
   description	= "Zapal tytoñ";
};

FUNC INT DIA_PC_Hero_Palenie_Condition()
{
    if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMOKE)
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Hero_Palenie_Info()
{
    Info_ClearChoices		(DIA_PC_Hero_Palenie);
    Info_AddChoice		(DIA_PC_Hero_Palenie, "Zwyk³y jab³kowy", DIA_PC_Hero_Palenie_Tyton1);
    Info_AddChoice		(DIA_PC_Hero_Palenie, "Tytoñ miodowy", DIA_PC_Hero_Palenie_Tyton2);
    Info_AddChoice		(DIA_PC_Hero_Palenie, "Tytoñ zio³owy", DIA_PC_Hero_Palenie_Tyton3);
	Info_AddChoice		(DIA_PC_Hero_Palenie, "Tytoñ grzybowy", DIA_PC_Hero_Palenie_Tyton4);
	Info_AddChoice		(DIA_PC_Hero_Palenie, "Tytoñ zwyczajny", DIA_PC_Hero_Palenie_Tyton);
	Info_AddChoice		(DIA_PC_Hero_Palenie, DIALOG_BACK, DIA_PC_Hero_Palenie_BACK);
};
func void DIA_PC_Hero_Palenie_BACK ()
{
Info_ClearChoices		(DIA_PC_Hero_Palenie);
};
FUNC VOID DIA_PC_Hero_Palenie_Tyton1()
{
    if (Npc_HasItems (hero, ItMi_Tuton_1) >=1) 
    {
	Npc_RemoveInvItems (hero, ItMi_Tuton_1, 1);
	PrintScreen	("Tymczasowo zwiêkszona mana o 20", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
	hero.attribute[ATR_MANA_MAX] = hero.attribute[ATR_MANA_MAX] + 20;
	Pot_ManaTimeStart = 3 * 60;
    }
    else
    {
	PrintScreen	("Nie masz takiego tytoniu", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
    Reset_Mobsi_Smoke();
    AI_StopProcessInfos	(self);
    };
};
FUNC VOID DIA_PC_Hero_Palenie_Tyton2()
{
    if (Npc_HasItems (hero, ItMi_Tuton_2) >=1) 
    {
	Npc_RemoveInvItems (hero, ItMi_Tuton_2, 1);
	PrintScreen	("Tymczasowo zwiêkszone P¯ o 50", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
	hero.attribute[ATR_HITPOINTS_MAX] = hero.attribute[ATR_HITPOINTS_MAX] + 50;
	Pot_HPTimeStart = 2 * 60;	
    }
    else
    {
	PrintScreen	("Nie masz takiego tytoniu", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
    Reset_Mobsi_Smoke();
    AI_StopProcessInfos	(self);
    };
};
FUNC VOID DIA_PC_Hero_Palenie_Tyton3()
{
    if (Npc_HasItems (hero, ItMi_Tuton_3) >=1) 
    {
	Npc_RemoveInvItems (hero, ItMi_Tuton_2, 1);
	PrintScreen	("Tytoñ przyspiesza twój bieg", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
	Mdl_ApplyOverlayMDSTimed	(self, "HUMANS_SPRINT.MDS", Time_Haste1);
    }
    else
    {
	PrintScreen	("Nie masz takiego tytoniu", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
    Reset_Mobsi_Smoke();
    AI_StopProcessInfos	(self);
    };
};
FUNC VOID DIA_PC_Hero_Palenie_Tyton4()
{
    if (Npc_HasItems (hero, ItMi_Tuton_4) >=1) 
    {
	Npc_RemoveInvItems (hero, ItMi_Tuton_4, 1);
	
	PrintScreen	("Tymczasowo zwiêkszona si³a i zrêcznoœæ o 20", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
	hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] + 20;
	hero.attribute[ATR_DEXTERITY] = hero.attribute[ATR_DEXTERITY] + 20;	
	Pot_MasterTimeStart = 2 * 60;	
    }
    else
    {
	PrintScreen	("Nie masz takiego tytoniu", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
    Reset_Mobsi_Smoke();
    AI_StopProcessInfos	(self);
    };
};
FUNC VOID DIA_PC_Hero_Palenie_Tyton()
{
    if (Npc_HasItems (hero, ItMi_Tuton) >=1) 
    {
	Npc_RemoveInvItems (hero, ItMi_Tuton, 1);
	PrintScreen	("Zapali³eœ tytoñ", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
    }
    else
    {
	PrintScreen	("Nie masz takiego tytoniu", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
    Reset_Mobsi_Smoke();
    AI_StopProcessInfos	(self);
    };
};