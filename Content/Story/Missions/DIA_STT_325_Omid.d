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
    AI_Output (self, other ,"DIA_Omid_HELLO1_03_02"); //Nie chcê byæ niegrzeczny, ale nie mam czasu na pogawêdki. Bartholo mi zagrozi³, ¿e jak nie ugotujê dziœ gulaszu z k¹sacza to wywlecze mnie z zamku i wyrzuci na Terytorium Orków.
    AI_Output (self, other ,"DIA_Omid_HELLO1_03_03"); //Widzia³em co siê sta³o z poprzednimi kucharzami, wiêc wolê nie ryzykowaæ. Jak czegoœ potrzebujesz, to pogadaj z Balamem, jego Magnaci darz¹ wiêkszym szacunkiem.
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
//--------------------------------------Resp eskorty i zmiana rutyny in¿yniera-----------------------------------------------------------------

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
    AI_Output (self, other ,"DIA_Omid_TMQ_WHERE_03_01"); //Sk¹d siê tu wzi¹³eœ?
    AI_Output (other, self ,"DIA_Omid_TMQ_WHERE_15_02"); //Nie wa¿ne sk¹d...
    AI_Output (self, other ,"DIA_Omid_TMQ_WHERE_03_03"); //Dobra ale radzê ci nie zbli¿aj siê do zamkowych wie¿.
    AI_Output (other, self ,"DIA_Omid_TMQ_WHERE_15_04"); //Niby dlaczego?
    AI_Output (self, other ,"DIA_Omid_TMQ_WHERE_03_05"); //Bo w wie¿y rezyduje Mag i jego stra¿... O¿ywieñców...
    AI_Output (other, self ,"DIA_Omid_TMQ_WHERE_15_06"); //Przecie¿ Magowie Ognia nie ¿yj¹.
    AI_Output (self, other ,"DIA_Omid_TMQ_WHERE_03_07"); //Tak. Ale Jim... On by³ kurierem na ich us³ugach i czytywa³ ich ksiêgi. Okaza³ siê byæ pojêtnym uczniem.
    AI_Output (self, other ,"DIA_Omid_TMQ_WHERE_03_08"); //Po zabiciu Magów poszed³ na wspó³prace z Magnatami. I przywdzia³ strój Maga.
    AI_Output (other, self ,"DIA_Omid_TMQ_WHERE_15_09"); //W takim razie chyba pora go odwiedziæ...
    AI_Output (self, other ,"DIA_Omid_TMQ_WHERE_03_10"); //Oszala³eœ? Tam jest pe³no tych cholernych umarlaków!
    AI_Output (self, other ,"DIA_Omid_TMQ_WHERE_03_11"); //Tylko nie mów, ¿e ciê nie ostrzega³em! Biedny szaleniec...
	B_LogEntry               (TajnaMisjaQuentina,"Teleportowa³em siê do Starego Obozu. Spotka³ mnie kucharz Omid. Powiedzia³, ¿e tajemniczym Magiem jest dawny kurier Magów imieniem Jim. Czytywa³ ich ksiêgi i sporo siê nauczy³. Teraz rezyduje w jednej z zamkowej wie¿. Towarzysz¹ mu nieumarli. Muszê go niezw³ocznie wyeliminowaæ.");
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
   description	= "Wiesz kto ustala sk³ad konwojów do Starej Kopalni?";
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
    AI_Output (other, self ,"DIA_Omid_KS_FLOR_15_01"); //Wiesz kto ustala sk³ad konwojów do Starej Kopalni?
    AI_Output (self, other ,"DIA_Omid_KS_FLOR_03_02"); //Mo¿e wiem a mo¿e nie wiem.
    AI_Output (other, self ,"DIA_Omid_KS_FLOR_15_03"); //Ponoæ przewin¹³eœ siê na naradzie Magnatów.
    AI_Output (self, other ,"DIA_Omid_KS_FLOR_03_04"); //I co z tego?
    AI_Output (other, self ,"DIA_Omid_KS_FLOR_15_05"); //Mo¿e co nieco us³ysza³eœ?
    AI_Output (self, other ,"DIA_Omid_KS_FLOR_03_06"); //Teraz chcê us³yszeæ brzdêk sakiewki pe³nej rudy.
    AI_Output (other, self ,"DIA_Omid_KS_FLOR_15_07"); //Ile chcesz za informacje?
    AI_Output (self, other ,"DIA_Omid_KS_FLOR_03_08"); //100 bry³ek rudy.
	B_LogEntry               (KuzniaStone,"Muszê zap³aciæ Omidowi 100 bry³ek rudy za informacje.");
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
    AI_Output (self, other ,"DIA_Omid_KS_FLOR_TAKE_03_02"); //Gdy wszed³em rozmawiali o problemie napadów na konwoje do kopalni. 
    AI_Output (self, other ,"DIA_Omid_KS_FLOR_TAKE_03_03"); //Mówili o dzia³alnoœci Szkodników i Bandytów z gór.
    AI_Output (self, other ,"DIA_Omid_KS_FLOR_TAKE_03_04"); //Tak¿e o tym , ¿e Stra¿nik John coraz czêœciej musi dobieraæ nowych ludzi bo ci doœwiadczeni gin¹ w zasadzkach w lesie id¹c do Starej Kopalni.
    AI_Output (other, self ,"DIA_Omid_KS_FLOR_TAKE_15_05"); //I to chcia³em us³yszeæ.
    AI_Output (self, other ,"DIA_Omid_KS_FLOR_TAKE_03_06"); //Zap³aci³eœ to masz. Proste. Ja nie oszukuje ludzi... jeœli nie muszê.
    AI_Output (other, self ,"DIA_Omid_KS_FLOR_TAKE_15_07"); //Na razie.
	B_GiveInvItems (other,self, itminugget, 100);
	B_LogEntry               (KuzniaStone,"Omid zdradzi³ mi, ¿e to Stra¿nik John dobiera ludzi do konwojów ze Starego Obozu. Teraz powinienem zaj¹æ siê spraw¹ kuŸni Stone’a. Ale mam wybór. Co bêdzie zale¿y ode mnie.");
    AI_StopProcessInfos	(self);
};

