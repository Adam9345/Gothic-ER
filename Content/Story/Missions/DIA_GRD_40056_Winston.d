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
    AI_Output (self, other ,"DIA_Winston_HELLO1_03_02"); //Nie widaæ? Frajerów wyczuwam na kilometr. Tak by³o poza barier¹ tak jest I tutaj. Zje¿d¿aj!
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
    AI_Output (self, other ,"DIA_Winston_Eliott_03_02"); //Czy ja siê przes³ysza³em? Jakiœ obsrajnoga œmia³ mi coœ sugerowaæ?
    AI_Output (other, self ,"DIA_Winston_Eliott_15_03"); //Licz siê ze s³owami. Tutaj ³atwo byæ katem dla innych, nie myœl, ¿e jesteœ jakiœ niezwyk³y w tym co robisz.
    AI_Output (self, other ,"DIA_Winston_Eliott_03_04"); //Hahahah... M¹drala. Pos³uchaj kmiocie, bêdê niszczy³ tego parcha Eliotta póki mi siê to nie znudzi albo on nie zakoñczy farsy, któr¹ jest jego daremny ¿ywot.
    AI_Output (self, other ,"DIA_Winston_Eliott_03_05"); //I jeszcze jedno! Jeszcze raz powiesz coœ co mi siê nie spodoba a zrobiê ci krzywdê! 
    AI_DrawWeapon (self);
    AI_Output (self, other ,"DIA_Winston_Eliott_03_06"); //Rozumiesz to dupku!
	B_LogEntry               (Oprawca,"Winston nie zamierza daæ spokoju Eliottowi tylko dlatego, ¿e siê za nim wstawi³em. Mog³em siê tego spodziewaæ. Chyba muszê pogadaæ z kimœ kto wie wiele z rzeczy, które dziej¹ siê w kopalni. Pomyœla³em o tutejszych handlarzach. ");
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
    AI_Output (self, other ,"DIA_Winston_Oprawca_Walka_03_01"); //Mam ciê ty oszczany œmierdzielu!
    AI_Output (self, other ,"DIA_Winston_Oprawca_Walka_03_02"); //Zadzieraj¹c ze mn¹, wiedzia³eœ na co siê piszesz.
    AI_Output (self, other ,"DIA_Winston_Oprawca_Walka_03_03"); //Mam nadzieje, ¿e chce ci siê spaæ. Bo zaraz zaœniesz wiecznym snem!
    AI_Output (other, self ,"DIA_Winston_Oprawca_Walka_15_04"); //Twoje niedoczekanie. Nie doœæ, ¿e jesteœ nadêtym kretynem to jeszcze zwyk³ym oszustem.
    AI_Output (self, other ,"DIA_Winston_Oprawca_Walka_03_05"); //Wyci¹gaj broñ gnido albo stawaj z go³ymi rêkami!
	Npc_SetTrueGuild (GRD_40056_Winston,GIL_ORCSCOUT);
	GRD_40056_Winston.guild = GIL_ORCSCOUT;
    AI_DrawWeapon (self);
    AI_StopProcessInfos	(self);
    Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");

};


