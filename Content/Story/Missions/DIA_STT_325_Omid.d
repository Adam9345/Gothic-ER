//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Omid_EXIT(C_INFO)
{
	npc             = STT_325_Omid;
	nr              = 999;
	condition		= DIA_Omid_EXIT_Condition;
	information		= DIA_Omid_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Omid_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Omid_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Omid_HELLO1 (C_INFO)
{
   npc          = STT_325_Omid;
   nr           = 1;
   condition    = DIA_Omid_HELLO1_Condition;
   information  = DIA_Omid_HELLO1_Info;
   permanent	= FALSE;
   description	= "Jak leci?";
};

FUNC INT DIA_Omid_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Omid_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Omid_HELLO1_15_01"); //Jak leci?
    AI_Output (self, other ,"DIA_Omid_HELLO1_03_02"); //Nie chc� by� niegrzeczny, ale nie mam czasu na pogaw�dki. Bartholo mi zagrozi�, �e jak nie ugotuj� dzi� gulaszu z k�sacza to wywlecze mnie z zamku i wyrzuci na Terytorium Ork�w.
    AI_Output (self, other ,"DIA_Omid_HELLO1_03_03"); //Widzia�em co si� sta�o z poprzednimi kucharzami, wi�c wol� nie ryzykowa�. Jak czego� potrzebujesz, to pogadaj z Balamem, jego Magnaci darz� wi�kszym szacunkiem.
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Omid_HELLO2 (C_INFO)
{
   npc          = STT_325_Omid;
   nr           = 2;
   condition    = DIA_Omid_HELLO2_Condition;
   information  = DIA_Omid_HELLO2_Info;
   permanent	= TRUE;
   description	= "Co tam gotujesz?";
};

FUNC INT DIA_Omid_HELLO2_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Omid_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Omid_HELLO2_15_01"); //Co tam gotujesz?
    AI_Output (self, other ,"DIA_Omid_HELLO2_03_02"); //Nie przeszkadzaj mi!
};

func void tmq_towerzom()
{
//--------------------------------------Resp eskorty i zmiana rutyny in�yniera-----------------------------------------------------------------

    Wld_InsertNpc                (GRD_40048_Straznik,"ESKORTA1");
    Wld_InsertNpc                (GRD_40049_Straznik,"PACHOL1");
    Wld_InsertNpc                (GRD_40050_Straznik,"PACHOL3");
    Wld_InsertNpc                (VLK_40044_Inzynier,"PACHOL3");
 
 
   

};
//========================================
//-----------------> TMQ_WHERE
//========================================

INSTANCE DIA_Omid_TMQ_WHERE (C_INFO)
{
   npc          = STT_325_Omid;
   nr           = 1;
   condition    = DIA_Omid_TMQ_WHERE_Condition;
   information  = DIA_Omid_TMQ_WHERE_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Omid_TMQ_WHERE_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Lee_TMQ_FLORIAN))
{
    return TRUE;
};
};
FUNC VOID DIA_Omid_TMQ_WHERE_Info()
{
    AI_Output (self, other ,"DIA_Omid_TMQ_WHERE_03_01"); //Sk�d si� tu wzi��e�?
    AI_Output (other, self ,"DIA_Omid_TMQ_WHERE_15_02"); //Nie wa�ne sk�d...
    AI_Output (self, other ,"DIA_Omid_TMQ_WHERE_03_03"); //Dobra ale radz� ci nie zbli�aj si� do zamkowych wie�.
    AI_Output (other, self ,"DIA_Omid_TMQ_WHERE_15_04"); //Niby dlaczego?
    AI_Output (self, other ,"DIA_Omid_TMQ_WHERE_03_05"); //Bo w wie�y rezyduje Mag i jego stra�... O�ywie�c�w...
    AI_Output (other, self ,"DIA_Omid_TMQ_WHERE_15_06"); //Przecie� Magowie Ognia nie �yj�.
    AI_Output (self, other ,"DIA_Omid_TMQ_WHERE_03_07"); //Tak. Ale Jim... On by� kurierem na ich us�ugach i czytywa� ich ksi�gi. Okaza� si� by� poj�tnym uczniem.
    AI_Output (self, other ,"DIA_Omid_TMQ_WHERE_03_08"); //Po zabiciu Mag�w poszed� na wsp�prace z Magnatami. I przywdzia� str�j Maga.
    AI_Output (other, self ,"DIA_Omid_TMQ_WHERE_15_09"); //W takim razie chyba pora go odwiedzi�...
    AI_Output (self, other ,"DIA_Omid_TMQ_WHERE_03_10"); //Oszala�e�? Tam jest pe�no tych cholernych umarlak�w!
    AI_Output (self, other ,"DIA_Omid_TMQ_WHERE_03_11"); //Tylko nie m�w, �e ci� nie ostrzega�em! Biedny szaleniec...
	B_LogEntry               (TajnaMisjaQuentina,"Teleportowa�em si� do Starego Obozu. Spotka� mnie kucharz Omid. Powiedzia�, �e tajemniczym Magiem jest dawny kurier Mag�w imieniem Jim. Czytywa� ich ksi�gi i sporo si� nauczy�. Teraz rezyduje w jednej z zamkowej wie�. Towarzysz� mu nieumarli. Musz� go niezw�ocznie wyeliminowa�.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> KS_FLOR
//========================================

INSTANCE DIA_Omid_KS_FLOR (C_INFO)
{
   npc          = STT_325_Omid;
   nr           = 1;
   condition    = DIA_Omid_KS_FLOR_Condition;
   information  = DIA_Omid_KS_FLOR_Info;
   permanent	= FALSE;
   description	= "Wiesz kto ustala sk�ad konwoj�w do Starej Kopalni?";
};

FUNC INT DIA_Omid_KS_FLOR_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Florian_KS_WHAT))
{
    return TRUE;
};
};
FUNC VOID DIA_Omid_KS_FLOR_Info()
{
    AI_Output (other, self ,"DIA_Omid_KS_FLOR_15_01"); //Wiesz kto ustala sk�ad konwoj�w do Starej Kopalni?
    AI_Output (self, other ,"DIA_Omid_KS_FLOR_03_02"); //Mo�e wiem a mo�e nie wiem.
    AI_Output (other, self ,"DIA_Omid_KS_FLOR_15_03"); //Pono� przewin��e� si� na naradzie Magnat�w.
    AI_Output (self, other ,"DIA_Omid_KS_FLOR_03_04"); //I co z tego?
    AI_Output (other, self ,"DIA_Omid_KS_FLOR_15_05"); //Mo�e co nieco us�ysza�e�?
    AI_Output (self, other ,"DIA_Omid_KS_FLOR_03_06"); //Teraz chc� us�ysze� brzd�k sakiewki pe�nej rudy.
    AI_Output (other, self ,"DIA_Omid_KS_FLOR_15_07"); //Ile chcesz za informacje?
    AI_Output (self, other ,"DIA_Omid_KS_FLOR_03_08"); //100 bry�ek rudy.
	B_LogEntry               (KuzniaStone,"Musz� zap�aci� Omidowi 100 bry�ek rudy za informacje.");
};

//========================================
//-----------------> KS_FLOR_TAKE
//========================================

INSTANCE DIA_Omid_KS_FLOR_TAKE (C_INFO)
{
   npc          = STT_325_Omid;
   nr           = 2;
   condition    = DIA_Omid_KS_FLOR_TAKE_Condition;
   information  = DIA_Omid_KS_FLOR_TAKE_Info;
   permanent	= FALSE;
   description	= "Masz.";
};

FUNC INT DIA_Omid_KS_FLOR_TAKE_Condition()
{
  if (Npc_KnowsInfo(hero,DIA_Omid_KS_FLOR))
  && (Npc_HasItems (other, ItMinugget) >=100)
{
    return TRUE;
};
};
FUNC VOID DIA_Omid_KS_FLOR_TAKE_Info()
{
    AI_Output (other, self ,"DIA_Omid_KS_FLOR_TAKE_15_01"); //Masz.
    AI_Output (self, other ,"DIA_Omid_KS_FLOR_TAKE_03_02"); //Gdy wszed�em rozmawiali o problemie napad�w na konwoje do kopalni. 
    AI_Output (self, other ,"DIA_Omid_KS_FLOR_TAKE_03_03"); //M�wili o dzia�alno�ci Szkodnik�w i Bandyt�w z g�r.
    AI_Output (self, other ,"DIA_Omid_KS_FLOR_TAKE_03_04"); //Tak�e o tym , �e Stra�nik John coraz cz�ciej musi dobiera� nowych ludzi bo ci do�wiadczeni gin� w zasadzkach w lesie id�c do Starej Kopalni.
    AI_Output (other, self ,"DIA_Omid_KS_FLOR_TAKE_15_05"); //I to chcia�em us�ysze�.
    AI_Output (self, other ,"DIA_Omid_KS_FLOR_TAKE_03_06"); //Zap�aci�e� to masz. Proste. Ja nie oszukuje ludzi... je�li nie musz�.
    AI_Output (other, self ,"DIA_Omid_KS_FLOR_TAKE_15_07"); //Na razie.
	B_GiveInvItems (other,self, itminugget, 100);
	B_LogEntry               (KuzniaStone,"Omid zdradzi� mi, �e to Stra�nik John dobiera ludzi do konwoj�w ze Starego Obozu. Teraz powinienem zaj�� si� spraw� ku�ni Stone�a. Ale mam wyb�r. Co b�dzie zale�y ode mnie.");
    AI_StopProcessInfos	(self);
};

