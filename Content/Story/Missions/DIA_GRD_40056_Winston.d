//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Winston_EXIT(C_INFO)
{
	npc             = GRD_40056_Winston;
	nr              = 999;
	condition		= DIA_Winston_EXIT_Condition;
	information		= DIA_Winston_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Winston_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Winston_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Winston_HELLO1 (C_INFO)
{
   npc          = GRD_40056_Winston;
   nr           = 1;
   condition    = DIA_Winston_HELLO1_Condition;
   information  = DIA_Winston_HELLO1_Info;
   permanent	= FALSE;
   description	= "Co robisz?";
};

FUNC INT DIA_Winston_HELLO1_Condition()
{
if (!Npc_KnowsInfo(hero,DIA_Winston_Eliott))
{
    return TRUE;
};
};
FUNC VOID DIA_Winston_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Winston_HELLO1_15_01"); //Co robisz?
    AI_Output (self, other ,"DIA_Winston_HELLO1_03_02"); //Nie wida�? Frajer�w wyczuwam na kilometr. Tak by�o poza barier� tak jest I tutaj. Zje�d�aj!
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Eliott
//========================================

INSTANCE DIA_Winston_Eliott (C_INFO)
{
   npc          = GRD_40056_Winston;
   nr           = 1;
   condition    = DIA_Winston_Eliott_Condition;
   information  = DIA_Winston_Eliott_Info;
   permanent	= FALSE;
   description	= "Zostaw Eliotta w spokoju!";
};

FUNC INT DIA_Winston_Eliott_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Eliott_HELLO3))
{
    return TRUE;
};
};
FUNC VOID DIA_Winston_Eliott_Info()
{
    AI_Output (other, self ,"DIA_Winston_Eliott_15_01"); //Zostaw Eliotta w spokoju!
    AI_Output (self, other ,"DIA_Winston_Eliott_03_02"); //Czy ja si� przes�ysza�em? Jaki� obsrajnoga �mia� mi co� sugerowa�?
    AI_Output (other, self ,"DIA_Winston_Eliott_15_03"); //Licz si� ze s�owami. Tutaj �atwo by� katem dla innych, nie my�l, �e jeste� jaki� niezwyk�y w tym co robisz.
    AI_Output (self, other ,"DIA_Winston_Eliott_03_04"); //Hahahah... M�drala. Pos�uchaj kmiocie, b�d� niszczy� tego parcha Eliotta p�ki mi si� to nie znudzi albo on nie zako�czy farsy, kt�r� jest jego daremny �ywot.
    AI_Output (self, other ,"DIA_Winston_Eliott_03_05"); //I jeszcze jedno! Jeszcze raz powiesz co� co mi si� nie spodoba a zrobi� ci krzywd�! 
    AI_DrawWeapon (self);
    AI_Output (self, other ,"DIA_Winston_Eliott_03_06"); //Rozumiesz to dupku!
	B_LogEntry               (Oprawca,"Winston nie zamierza da� spokoju Eliottowi tylko dlatego, �e si� za nim wstawi�em. Mog�em si� tego spodziewa�. Chyba musz� pogada� z kim� kto wie wiele z rzeczy, kt�re dziej� si� w kopalni. Pomy�la�em o tutejszych handlarzach. ");
    AI_Output (other, self ,"DIA_Winston_Eliott_15_07"); //Jeszcze zobaczymy...
    AI_RemoveWeapon (self);
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Oprawca_Walka
//========================================

INSTANCE DIA_Winston_Oprawca_Walka (C_INFO)
{
   npc          = GRD_40056_Winston;
   nr           = 1;
   condition    = DIA_Winston_Oprawca_Walka_Condition;
   information  = DIA_Winston_Oprawca_Walka_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Winston_Oprawca_Walka_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Asghan_Oprawca_Nagroda))
{
    return TRUE;
};
};
FUNC VOID DIA_Winston_Oprawca_Walka_Info()
{
    AI_Output (self, other ,"DIA_Winston_Oprawca_Walka_03_01"); //Mam ci� ty oszczany �mierdzielu!
    AI_Output (self, other ,"DIA_Winston_Oprawca_Walka_03_02"); //Zadzieraj�c ze mn�, wiedzia�e� na co si� piszesz.
    AI_Output (self, other ,"DIA_Winston_Oprawca_Walka_03_03"); //Mam nadzieje, �e chce ci si� spa�. Bo zaraz za�niesz wiecznym snem!
    AI_Output (other, self ,"DIA_Winston_Oprawca_Walka_15_04"); //Twoje niedoczekanie. Nie do��, �e jeste� nad�tym kretynem to jeszcze zwyk�ym oszustem.
    AI_Output (self, other ,"DIA_Winston_Oprawca_Walka_03_05"); //Wyci�gaj bro� gnido albo stawaj z go�ymi r�kami!
	Npc_SetTrueGuild (GRD_40056_Winston,GIL_ORCSCOUT);
	GRD_40056_Winston.guild = GIL_ORCSCOUT;
    AI_DrawWeapon (self);
    AI_StopProcessInfos	(self);
    Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");

};


