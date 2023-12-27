
//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Shrike_HELLO1 (C_INFO)
{
   npc          = ORG_40141_Shrike;
   nr           = 1;
   condition    = DIA_Shrike_HELLO1_Condition;
   information  = DIA_Shrike_HELLO1_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Shrike_HELLO1_Condition()
{
  if ((Kapitel == 4) || (Kapitel == 5)) 
  && (Npc_GetDistToWP(hero,"NC_HUT01_IN")<100)
{
    return TRUE;
};
};
FUNC VOID DIA_Shrike_HELLO1_Info()
{
    AI_Output (self, other ,"DIA_Shrike_HELLO1_03_01"); //Ooo jeste� wreszcie, d�ugo na ciebie czeka�em...
    AI_Output (other, self ,"DIA_Shrike_HELLO1_15_02"); //Krzykacz? Wyno� sie z mojej chaty �achudro!
    AI_Output (self, other ,"DIA_Shrike_HELLO1_03_03"); //Nie nie nie... Tym razem to ty sie wyniesiesz.
	AI_DrawWeapon (self);
    AI_Output (self, other ,"DIA_Shrike_HELLO1_03_04"); //Ale na tamten �wiat gnido!
	AI_StopProcessInfos	(self);
	B_LogEntry			(CH1_ShrikesHut,	"Ten wariat Krzykacz nie by� mi w stanie odpu�ci�, zaczai� si� na mnie w chacie kt�r� mu odebra�em i mnie zaatakowa�.");
   
    Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
   
};

