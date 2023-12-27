//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Vincent_EXIT(C_INFO)
{
	npc             = ORG_956_Vincent;
	nr              = 999;
	condition	= DIA_Vincent_EXIT_Condition;
	information	= DIA_Vincent_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Vincent_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Vincent_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> THIEFF
//========================================

INSTANCE DIA_Vincent_THIEFF (C_INFO)
{
   npc          = ORG_956_Vincent;
   nr           = 1;
   condition    = DIA_Vincent_THIEFF_Condition;
   information  = DIA_Vincent_THIEFF_Info;
   permanent	= FALSE;
   description	= "No prosz�, co za wspania�a kryj�wka.";
};

FUNC INT DIA_Vincent_THIEFF_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Organisator_Fight))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Vincent_THIEFF_Info()
{
    AI_Output (other, self ,"DIA_Vincent_THIEFF_15_01"); //No prosz�, co za wspania�a kryj�wka. My�la�e�, �e jak wejdziesz za wodospad, to znikniesz w tajemniczych okoliczno�ciach?
    AI_Output (self, other ,"DIA_Vincent_THIEFF_03_02"); //Jak mnie znalaz�e�?
    AI_Output (other, self ,"DIA_Vincent_THIEFF_15_03"); //To nieistotne. Oddaj to co ukrad�e�.
    AI_Output (self, other ,"DIA_Vincent_THIEFF_03_04"); //Wi�c Cronos ci� tu przys�a�? W takim razie gi�!
	
	CreateInvItems (self, ItMi_CronosPrecious, 1);
	
    AI_StopProcessInfos	(self);
    Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
	
	
};



//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Vincent_HELLO1 (C_INFO)
{
   npc          = ORG_956_Vincent;
   nr           = 1;
   condition    = DIA_Vincent_HELLO1_Condition;
   information  = DIA_Vincent_HELLO1_Info;
   permanent	= FALSE;
   description	= "Kim jeste�?";
};

FUNC INT DIA_Vincent_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Vincent_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Vincent_HELLO1_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Vincent_HELLO1_03_02"); //Skaza�cem. 
    AI_Output (other, self ,"DIA_Vincent_HELLO1_15_03"); //Domy�li�em si�.
    AI_Output (self, other ,"DIA_Vincent_HELLO1_03_04"); //Wi�c domy�l si�, �e nie zamierzam z tob� rozmawia�.
    AI_Output (other, self ,"DIA_Vincent_HELLO1_15_05"); //Dlaczego? Chcia�em si� tylko czego� dowiedzie�.
    AI_Output (self, other ,"DIA_Vincent_HELLO1_03_06"); //Co to ksi��k� piszesz? M�g�bym si� ni� podetrze� i nie zamierzam ci nic ujawnia�.
    AI_Output (other, self ,"DIA_Vincent_HELLO1_15_07"); //Skoro tak stawiasz spraw� to nic nie wsk�ram.
};

