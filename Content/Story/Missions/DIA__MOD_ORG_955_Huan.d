//poprawione i sprawdzone -  

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Huan_EXIT(C_INFO)
{
	npc             = ORG_9550_Huan;
	nr              = 999;
	condition		= DIA_Huan_EXIT_Condition;
	information		= DIA_Huan_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Huan_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Huan_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Huan_HELLO1 (C_INFO)
{
   npc          = ORG_9550_Huan;
   nr           = 1;
   condition    = DIA_Huan_HELLO1_Condition;
   information  = DIA_Huan_HELLO1_Info;
   permanent	= FALSE;
   description	= "Jeste� kowalem?";
};

FUNC INT DIA_Huan_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Huan_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Huan_HELLO1_15_01"); //Jeste� kowalem?
    AI_Output (self, other ,"DIA_Huan_HELLO1_03_02"); //Tak! Wykonuj� proste bronie dla Szkodnik�w i nieco lepsze dla Najemnik�w.
    AI_Output (self, other ,"DIA_Huan_HELLO1_03_03"); //Mam sporo pracy. Ludzie Laresa w og�le nie szanuj� broni.
};

////////////////////////////////////////////
// 		FixMyAxe
////////////////////////////////////////////

INSTANCE DIA_Huan_FixMyAxe (C_INFO)
{
   npc          = ORG_9550_Huan;
   nr           = 1;
   condition    = DIA_Huan_FixMyAxe_Condition;
   information  = DIA_Huan_FixMyAxe_Info;
   permanent	= FALSE;
   description	= "Przysy�a mnie Torlof.";
};

FUNC INT DIA_Huan_FixMyAxe_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Torlof_PoparcieNajemnikow)) && (MIS_TorlofsAxe == LOG_RUNNING) && (Npc_HasItems (hero,Torlofs_Axt2) == 1)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Huan_FixMyAxe_Info()
{
    AI_Output (other, self ,"DIA_Huan_FixMyAxe_15_01"); //Przysy�a mnie Torlof. Mam tu jego top�r.
    AI_Output (self, other ,"DIA_Huan_FixMyAxe_03_02"); //Cholera! Mia�em nadziej�, �e zapomnia�.
	AI_Output (other, self ,"DIA_Huan_FixMyAxe_15_03"); //W czym problem?
    AI_Output (self, other ,"DIA_Huan_FixMyAxe_03_04"); //Ten top�r jest bardzo przestarza�y. Zosta� wykuty prawdopodobnie w czasach pierwszej wojny z orkami.
	AI_Output (self, other ,"DIA_Huan_FixMyAxe_03_05"); //C�, kowalstwo od tamtego czasu troch� si� zmieni�o. Opracowano nowsze metody odlewu stali.
	AI_Output (self, other ,"DIA_Huan_FixMyAxe_03_06"); //�eby naprawi� t� bro� musia�bym mie� sztabk� stali przygotowan� wed�ug starej metody.
	AI_Output (self, other ,"DIA_Huan_FixMyAxe_03_07"); //Od lat takiej nie widzia�em.
	AI_Output (other, self ,"DIA_Huan_FixMyAxe_15_08"); //Musz� do jutra zwr�ci� bro� Torlofowi.
	AI_Output (self, other ,"DIA_Huan_FixMyAxe_03_09"); //Czekaj, jest cie� szansy...
	AI_Output (self, other ,"DIA_Huan_FixMyAxe_03_10"); //Podobno w kolonii mieszka pewien nordmarski kowal. Jest pono� mistrzem w swoim fachu, lecz ma�o kto zagl�da do jego ku�ni.
	AI_Output (self, other ,"DIA_Huan_FixMyAxe_03_11"); //Jedynie najznamienitsi... Ale to chyba nasza jedyna nadzieja.
	AI_Output (self, other ,"DIA_Huan_FixMyAxe_03_12"); //By� mo�e on b�dzie mia� na stanie tak� stal. Powiniene� z nim porozmawia�.
	AI_Output (self, other ,"DIA_Huan_FixMyAxe_03_13"); //S�dz�, �e to nie b�dzie tania rzecz. A, kowal zajmuje star� wie�� w dolinie pomi�dzy Starym a Nowym Obozem.
	AI_Output (self, other ,"DIA_Huan_FixMyAxe_03_14"); //Z tego co mi wiadomo, obozuje tam niejaki Cavalorn. Dalej ju� sobie poradzisz.
	
	B_LogEntry               (CH1_TorlofsAxe,"Huan powiedzia� mi, �e top�r Torlofa jest bardzo stary i �eby go naprawi� b�dzie potrzebna sztabka stali wykonanej wed�ug starej metody. Je�li nie znajd� nigdzie takiej sztabki, b�d� musia� poprosi� o pomoc nordmarskiego kowala. ZNajd� go w starej wie�y, w dolinie, w kt�rej stacjonuje my�liwy Cavalorn.");
};

////////////////////////////////////////////
// 		GetOreStab
////////////////////////////////////////////

INSTANCE DIA_Huan_GetOreStab (C_INFO)
{
   npc          = ORG_9550_Huan;
   nr           = 1;
   condition    = DIA_Huan_GetOreStab_Condition;
   information  = DIA_Huan_GetOreStab_Info;
   permanent	= FALSE;
   description	= "Mam sztabk� stali.";
};

FUNC INT DIA_Huan_GetOreStab_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Huan_FixMyAxe)) && (MIS_TorlofsAxe == LOG_RUNNING) && (Npc_HasItems (hero,ItMi_OreStabOldMetode) == 1) && (Npc_HasItems (hero,Torlofs_Axt2) == 1)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Huan_GetOreStab_Info()
{
    AI_Output (other, self ,"DIA_Huan_GetOreStab_15_01"); //Mam sztabk� stali.
    AI_Output (self, other ,"DIA_Huan_GetOreStab_03_02"); //A niech mnie! Uda�o ci si� j� znale��. Niesamowite. 
	AI_Output (other, self ,"DIA_Huan_GetOreStab_15_03"); //Mo�esz ju� si� wzi�� do roboty. 
    AI_Output (self, other ,"DIA_Huan_GetOreStab_03_04"); //Jasne, to nie potrwa d�ugo.
	
	AI_GotoWp (self,"NO_KOWADLO");
	AI_UseMob (self,"BSANVIL",1);
	AI_UseMob (self,"BSANVIL",-1);
	AI_GotoNpc (self,hero);
	AI_Output (self, other ,"DIA_Huan_GetOreStab_03_05"); //Gotowe. Torlof powinien by� usatysfakcjonowany. 
	
	B_LogEntry               (CH1_TorlofsAxe,"Przynios�em sztabk� stali Huanowi. Od r�ki naprawi� bro� Torlofa. Mog� ju� wr�ci� do Najemnika z jego toporem.");
	
	B_GiveInvItems (hero,self,ItMi_OreStabOldMetode,1);
	Npc_RemoveInvItems (self,ItMi_OreStabOldMetode,1);
	B_GiveInvItems (hero,self,Torlofs_Axt2,1);
	Npc_RemoveInvItems (self,Torlofs_Axt2,1);
	CreateInvItem (self,Torlofs_Axt2_Fixed);
	B_GiveInvItems (self,hero,Torlofs_Axt2_Fixed,1);
};

//========================================
//-----------------> HELLO3
//========================================
var int knows_huantrade;
INSTANCE DIA_Huan_HELLO3 (C_INFO)
{
   npc          = ORG_9550_Huan;
   nr           = 3;
   condition    = DIA_Huan_HELLO3_Condition;
   information  = DIA_Huan_HELLO3_Info;
   permanent	= TRUE;
   trade        = TRUE;
   description	= "Mo�esz mi co� sprzeda�?";
};

FUNC INT DIA_Huan_HELLO3_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Huan_HELLO3_Info()
{
    AI_Output (other, self ,"DIA_Huan_HELLO3_15_01"); //Mo�esz mi co� sprzeda�?
    AI_Output (self, other ,"DIA_Huan_HELLO3_03_02"); //Mam co� na sk�adzie.
	B_ClearTreaderAmmo(self);
	if (knows_huantrade == false)
	{
	knows_huantrade = true;
	Log_CreateTopic (GE_TraderNC,LOG_NOTE);
	B_LogEntry                     (GE_TraderNC,"Huan jest kowalem i mo�e mi co� sprzeda�.");//fix
	};
};

//========================================
//-----------------> OLD_ARMOR_DEAL
//========================================

INSTANCE DIA_Huan_OLD_ARMOR_DEAL (C_INFO)
{
   npc          = ORG_9550_Huan;
   nr           = 1;
   condition    = DIA_Huan_OLD_ARMOR_DEAL_Condition;
   information  = DIA_Huan_OLD_ARMOR_DEAL_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Huan_OLD_ARMOR_DEAL_Condition()
{
    if (Npc_HasItems (other, OldArmor) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Huan_OLD_ARMOR_DEAL_Info()
{
    AI_Output (self, other ,"DIA_Huan_OLD_ARMOR_DEAL_03_01"); //Hej, przyjacielu! Zaczekaj!
    AI_Output (other, self ,"DIA_Huan_OLD_ARMOR_DEAL_15_02"); //O co chodzi?
    AI_Output (self, other ,"DIA_Huan_OLD_ARMOR_DEAL_03_03"); //Widz�, �e masz przy sobie interesuj�c� zbroj�. M�g�bym j� zobaczy�?
    AI_Output (other, self ,"DIA_Huan_OLD_ARMOR_DEAL_15_04"); //W sumie... czemu nie?
    AI_Output (self, other ,"DIA_Huan_OLD_ARMOR_DEAL_03_05"); //Ta zbroja jest we wspania�ym stanie! Takie pancerze nosili stra�nicy kr�lewscy w czasach pierwszych wojen myrta�skich.
    AI_Output (self, other ,"DIA_Huan_OLD_ARMOR_DEAL_03_06"); //Ten pancerz to UNIKAT!
    AI_Output (self, other ,"DIA_Huan_OLD_ARMOR_DEAL_03_07"); //Gdzie znalaz�e� to cude�ko?
    AI_Output (other, self ,"DIA_Huan_OLD_ARMOR_DEAL_15_08"); //Ja? C�, le�a�o w jaskini.
    AI_Output (self, other ,"DIA_Huan_OLD_ARMOR_DEAL_03_09"); //Te zbroje potrafi�y przetrwa� wieki. Wspania�y kunszt.
    AI_Output (self, other ,"DIA_Huan_OLD_ARMOR_DEAL_03_10"); //Nie chcia�by� jej sprzeda�? Zaoferuj� ci 500 bry�ek rudy. �aden inny kupiec tyle nie zap�aci.
    AI_Output (other, self ,"DIA_Huan_OLD_ARMOR_DEAL_15_11"); //C�...

    Info_ClearChoices		(DIA_Huan_OLD_ARMOR_DEAL);
    Info_AddChoice		(DIA_Huan_OLD_ARMOR_DEAL, "Nie chc� jej sprzeda�!", DIA_Huan_OLD_ARMOR_DEAL_NOT_SELL);
    Info_AddChoice		(DIA_Huan_OLD_ARMOR_DEAL, "Umowa stoi. 500 bry�ek rudy to uczciwa cena.", DIA_Huan_OLD_ARMOR_DEAL_SELL_500);
    Info_AddChoice		(DIA_Huan_OLD_ARMOR_DEAL, "Daj 750 bry�ek i jest twoja. ", DIA_Huan_OLD_ARMOR_DEAL_GIVE_MORE);
    Info_AddChoice		(DIA_Huan_OLD_ARMOR_DEAL, "1000 bry�ek rudy, albo nie mamy o czym rozmawia�.", DIA_Huan_OLD_ARMOR_DEAL_MASTER_OF_TRADE);
};

FUNC VOID DIA_Huan_OLD_ARMOR_DEAL_NOT_SELL()
{
    AI_Output (other, self ,"DIA_Huan_OLD_ARMOR_DEAL_NOT_SELL_15_01"); //Nie chc� jej sprzeda�!
    AI_Output (self, other ,"DIA_Huan_OLD_ARMOR_DEAL_NOT_SELL_03_02"); //No szkoda, szkoda. Wiedz, �e robisz b��d. Ta zbroja wkr�tce ci si� nie przyda. Nie jest tak mocna, jak nowe pancerze.
    Info_ClearChoices		(DIA_Huan_OLD_ARMOR_DEAL);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Huan_OLD_ARMOR_DEAL_SELL_500()
{
    AI_Output (other, self ,"DIA_Huan_OLD_ARMOR_DEAL_SELL_500_15_01"); //Umowa stoi. 500 bry�ek rudy to uczciwa cena.
    AI_Output (self, other ,"DIA_Huan_OLD_ARMOR_DEAL_SELL_500_03_02"); //Mi�o si� robi z tob� interesy. Zaopiekuj� si� t� zbroj� jak w�asn� matk�.
	B_GiveInvItems      (hero, self, OldArmor, 1);
    CreateInvItems (self, ItMiNugget, 500);
    B_GiveInvItems (self, other, ItMiNugget, 500);
    Info_ClearChoices		(DIA_Huan_OLD_ARMOR_DEAL);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Huan_OLD_ARMOR_DEAL_GIVE_MORE()
{
    AI_Output (other, self ,"DIA_Huan_OLD_ARMOR_DEAL_GIVE_MORE_15_01"); //Daj 750 bry�ek i jest twoja. 
    AI_Output (self, other ,"DIA_Huan_OLD_ARMOR_DEAL_GIVE_MORE_03_02"); //Twardy z ciebie negocjator. No dobra. Niech strac�.
    CreateInvItems (self, ItMiNugget, 750);
    B_GiveInvItems (self, other, ItMiNugget, 750);
	B_GiveInvItems      (hero, self, OldArmor, 1);
    Info_ClearChoices		(DIA_Huan_OLD_ARMOR_DEAL);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Huan_OLD_ARMOR_DEAL_MASTER_OF_TRADE()
{
    AI_Output (other, self ,"DIA_Huan_OLD_ARMOR_DEAL_MASTER_OF_TRADE_15_01"); //1000 bry�ek rudy, albo nie mamy o czym rozmawia�.
    AI_Output (self, other ,"DIA_Huan_OLD_ARMOR_DEAL_MASTER_OF_TRADE_03_02"); //Nie przesadzasz troch�? Mog� ci da� co najwy�ej 700 bry�ek.
	Info_ClearChoices		(DIA_Huan_OLD_ARMOR_DEAL);
    Info_AddChoice		(DIA_Huan_OLD_ARMOR_DEAL, "Do�� st�wk� i mo�esz j� bra�.", DIA_Huan_OLD_ARMOR_DEAL_MASTER_OF_TRADE_SUCCESS);
    Info_AddChoice		(DIA_Huan_OLD_ARMOR_DEAL, "Wypchaj si�.", DIA_Huan_OLD_ARMOR_DEAL_MASTER_OF_TRADE_FAIL);
};

FUNC VOID DIA_Huan_OLD_ARMOR_DEAL_MASTER_OF_TRADE_SUCCESS()
{
    AI_Output (other, self ,"DIA_Huan_OLD_ARMOR_DEAL_MASTER_OF_TRADE_SUCCESS_15_01"); //Do�� st�wk� i mo�esz j� bra�.
    AI_Output (self, other ,"DIA_Huan_OLD_ARMOR_DEAL_MASTER_OF_TRADE_SUCCESS_03_02"); //Cholera... No, ale niech ci b�dzie. 
	CreateInvItems (self, ItMiNugget, 800);
    B_GiveInvItems (self, other, ItMiNugget, 800);
    B_GiveInvItems      (hero, self, OldArmor, 1);
	Info_ClearChoices		(DIA_Huan_OLD_ARMOR_DEAL);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Huan_OLD_ARMOR_DEAL_MASTER_OF_TRADE_FAIL()
{
    AI_Output (other, self ,"DIA_Huan_OLD_ARMOR_DEAL_MASTER_OF_TRADE_FAIL_15_01"); //Wypchaj si�.
    AI_Output (self, other ,"DIA_Huan_OLD_ARMOR_DEAL_MASTER_OF_TRADE_FAIL_03_02"); //Pajac.
	Info_ClearChoices		(DIA_Huan_OLD_ARMOR_DEAL);
    AI_StopProcessInfos	(self);
};
//****************************************************************1.6.1-----------------------------------------------------------------------------------------------
//========================================
//-----------------> LearningS
//========================================

INSTANCE DIA_Huan_LearningS (C_INFO)
{
   npc          = ORG_9550_Huan;
   nr           = 1;
   condition    = DIA_Huan_LearningS_Condition;
   information  = DIA_Huan_LearningS_Info;
   permanent	= FALSE;
   description	= "Mo�esz mnie czego� nauczy�?";
};

FUNC INT DIA_Huan_LearningS_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Huan_HELLO1))
{
    return TRUE;
};
};
FUNC VOID DIA_Huan_LearningS_Info()
{
    AI_Output (other, self ,"DIA_Huan_LearningS_15_01"); //Mo�esz mnie czego� nauczy�?
    AI_Output (self, other ,"DIA_Huan_LearningS_03_02"); //Tak mog� ci pokaza� jak wyku� dobry i prosty miecz.
};


//========================================
//-----------------> LearnSmith_01
//========================================

INSTANCE DIA_Huan_LearnSmith_01 (C_INFO)
{
   npc          = ORG_9550_Huan;
   nr           = 1;
   condition    = DIA_Huan_LearnSmith_01_Condition;
   information  = DIA_Huan_LearnSmith_01_Info;
   permanent	= TRUE;
   description	= "Naucz mnie jak wyku� miecz. (Kowalstwo poz.1/3 - 5 PN)";
};

FUNC INT DIA_Huan_LearnSmith_01_Condition()
{
 if (NPC_TALENT_SMITH == 0) && (Npc_KnowsInfo(hero,DIA_Huan_LearningS))
{
    return TRUE;
};
};
FUNC VOID DIA_Huan_LearnSmith_01_Info()
{

    if  (hero.lp >= 5) 
	{
    AI_Output (other, self ,"DIA_Huan_LearnSmith_01_15_01"); //Naucz mnie jak wyku� miecz. 
    AI_Output (self, other ,"DIA_Huan_LearnSmith_01_03_02"); //To do�� proste. Znajd� sobie plan oraz kawa�ek surowej stali i rozgrzej go w ogniu, a� zacznie si� �arzy�.
    AI_Output (self, other ,"DIA_Huan_LearnSmith_01_03_03"); //Potem wykuj na kowadle ostrze.
    AI_Output (self, other ,"DIA_Huan_LearnSmith_01_03_04"); //Najwa�niejsze, �eby� pilnowa�, czy ostrze nie wystyg�o. Masz tylko kilka minut, �eby zrobi� bro�...
    AI_Output (self, other ,"DIA_Huan_LearnSmith_01_03_05"); //Reszty dowiesz si� sam. To kwestia praktyki. 
	PrintScreen ("Nauka kowalstwo",2, 62, "FONT_OLD_10_WHITE.TGA", 2);
	NPC_TALENT_SMITH = 1;
	Hero.lp -= 5;
	}
	else 
	{
	AI_Output (self,other ,"DIA_Huan_LearnSmith_01_03_06"); //Brak ci do�wiadczenia.
	PrintS_Ext  ("Brak ci do�wiadczenia!", COL_RED);
	};
	
};



//========================================
//-----------------> LearnSmith_01
//========================================

INSTANCE DIA_Huan_LearnSmith_02 (C_INFO)
{
   npc          = ORG_9550_Huan;
   nr           = 1;
   condition    = DIA_Huan_LearnSmith_02_Condition;
   information  = DIA_Huan_LearnSmith_02_Info;
   permanent	= TRUE;
   description	= "Naucz mnie jak wyku� miecz. (Kowalstwo poz.2/3 - 10 PN)";
};

FUNC INT DIA_Huan_LearnSmith_02_Condition()
{
 if (NPC_TALENT_SMITH == 1) && (Npc_KnowsInfo(hero,DIA_Huan_LearningS))
{
    return TRUE;
};
};
FUNC VOID DIA_Huan_LearnSmith_02_Info()
{

    if  (hero.lp >= 10) 
	{
    AI_Output (other, self ,"DIA_Huan_LearnSmith_02_15_01"); //Naucz mnie jak wyku� dobry miecz. 
    AI_Output (self, other ,"DIA_Huan_LearnSmith_02_03_02"); //Podstawy ju� znasz, teraz czas na co� trudniejszego...
    AI_Output (self, other ,"DIA_Huan_LearnSmith_02_03_03"); //Gdy uderzasz w gor�c� stal staraj si� robi� to z wyczuciem i nie b�d� spi�ty.
    AI_Output (self, other ,"DIA_Huan_LearnSmith_02_03_04"); //Najwa�niejsze, jest to by� nie uderza� zbyt mocno, albo za lekko...
    AI_Output (self, other ,"DIA_Huan_LearnSmith_02_03_05"); //Poza tym, wszystko zale�y od ciebie i rodzaju broni, jak� chcesz wykona�.
	PrintScreen ("Nauka kowalstwo",2, 62, "FONT_OLD_10_WHITE.TGA", 2);
	NPC_TALENT_SMITH = 2;
	Hero.lp -= 10;
	}
	else 
	{
	AI_Output (self,other ,"DIA_Huan_LearnSmith_02_03_06"); //Brak ci do�wiadczenia.
	PrintS_Ext  ("Brak ci do�wiadczenia!", COL_RED);
	};
	
};

