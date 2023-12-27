//poprawione i sprawdzone -  
/*
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Poslaniec_EXIT(C_INFO)
{
	npc             = VLK_2010_Poslaniec;
	nr              = 999;
	condition	= DIA_Poslaniec_EXIT_Condition;
	information	= DIA_Poslaniec_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Poslaniec_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Poslaniec_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> MISSION
//========================================

INSTANCE DIA_Poslaniec_MISSION (C_INFO)
{
   npc          = VLK_2010_Poslaniec;
   nr           = 1;
   condition    = DIA_Poslaniec_MISSION_Condition;
   information  = DIA_Poslaniec_MISSION_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Poslaniec_MISSION_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Mordrag_QUENTIN))
    && (Problem_ZLY == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Poslaniec_MISSION_Info()
{
    B_UseFakeScroll ();
    AI_Output (other, self ,"DIA_Poslaniec_MISSION_15_01"); //Co tam czytasz?
    AI_Output (self, other ,"DIA_Poslaniec_MISSION_03_02"); //Eeee... co tu robisz? Nie zauwa¿y³em ciê.
    AI_Output (other, self ,"DIA_Poslaniec_MISSION_15_03"); //Badam to miejsce. Szukam dowodów na Z³ego.
    AI_Output (other, self ,"DIA_Poslaniec_MISSION_15_04"); //Powiedz, co czyta³eœ.
    AI_Output (self, other ,"DIA_Poslaniec_MISSION_03_05"); //Nie... nic.
    AI_Output (other, self ,"DIA_Poslaniec_MISSION_15_06"); //Gadaj!
    AI_Output (self, other ,"DIA_Poslaniec_MISSION_03_07"); //To wiadomoœæ.
    AI_Output (other, self ,"DIA_Poslaniec_MISSION_15_08"); //Kto ciê tu przys³a³?
    AI_Output (self, other ,"DIA_Poslaniec_MISSION_03_09"); //Mia³em odczytaæ wiadomoœæ i zanieœæ j¹ temu, który mi zap³aci³.
    AI_Output (other, self ,"DIA_Poslaniec_MISSION_15_10"); //Dla kogo pracujesz?
    AI_Output (self, other ,"DIA_Poslaniec_MISSION_03_11"); //Ja... ja nie mogê powiedzieæ.
    AI_Output (self, other ,"DIA_Poslaniec_MISSION_03_12"); //Gadaj, bo wyci¹gnê z ciebie informacje moim mieczem!
    AI_Output (other, self ,"DIA_Poslaniec_MISSION_15_13"); //To jaskinia Z³ego. Ja nic nie wiem.
	CreateInvItems (self, ItWr_Powiadomienie , 1);
    B_GiveInvItems (self, other, ItWr_Powiadomienie , 1);
//ucieczka
    B_LogEntry                     (CH1_Problem_ZLY,"W jaskini spotka³em pos³añca przys³anego przez jakichœ ludzi. Niestety nie wiem, kto wspó³pracuje ze Z³ym. Pewnie czegoœ wiêcej dowiem siê z notatki.");

    B_GiveXP (100);
    AI_StopProcessInfos	(self);
};*/