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
   description	= "Jesteœ kowalem?";
};

FUNC INT DIA_Huan_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Huan_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Huan_HELLO1_15_01"); //Jesteœ kowalem?
    AI_Output (self, other ,"DIA_Huan_HELLO1_03_02"); //Tak! Wykonujê proste bronie dla Szkodników i nieco lepsze dla Najemników.
    AI_Output (self, other ,"DIA_Huan_HELLO1_03_03"); //Mam sporo pracy. Ludzie Laresa w ogóle nie szanuj¹ broni.
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
   description	= "Przysy³a mnie Torlof.";
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
    AI_Output (other, self ,"DIA_Huan_FixMyAxe_15_01"); //Przysy³a mnie Torlof. Mam tu jego topór.
    AI_Output (self, other ,"DIA_Huan_FixMyAxe_03_02"); //Cholera! Mia³em nadziejê, ¿e zapomnia³.
	AI_Output (other, self ,"DIA_Huan_FixMyAxe_15_03"); //W czym problem?
    AI_Output (self, other ,"DIA_Huan_FixMyAxe_03_04"); //Ten topór jest bardzo przestarza³y. Zosta³ wykuty prawdopodobnie w czasach pierwszej wojny z orkami.
	AI_Output (self, other ,"DIA_Huan_FixMyAxe_03_05"); //Có¿, kowalstwo od tamtego czasu trochê siê zmieni³o. Opracowano nowsze metody odlewu stali.
	AI_Output (self, other ,"DIA_Huan_FixMyAxe_03_06"); //¯eby naprawiæ tê broñ musia³bym mieæ sztabkê stali przygotowan¹ wed³ug starej metody.
	AI_Output (self, other ,"DIA_Huan_FixMyAxe_03_07"); //Od lat takiej nie widzia³em.
	AI_Output (other, self ,"DIA_Huan_FixMyAxe_15_08"); //Muszê do jutra zwróciæ broñ Torlofowi.
	AI_Output (self, other ,"DIA_Huan_FixMyAxe_03_09"); //Czekaj, jest cieñ szansy...
	AI_Output (self, other ,"DIA_Huan_FixMyAxe_03_10"); //Podobno w kolonii mieszka pewien nordmarski kowal. Jest ponoæ mistrzem w swoim fachu, lecz ma³o kto zagl¹da do jego kuŸni.
	AI_Output (self, other ,"DIA_Huan_FixMyAxe_03_11"); //Jedynie najznamienitsi... Ale to chyba nasza jedyna nadzieja.
	AI_Output (self, other ,"DIA_Huan_FixMyAxe_03_12"); //Byæ mo¿e on bêdzie mia³ na stanie tak¹ stal. Powinieneœ z nim porozmawiaæ.
	AI_Output (self, other ,"DIA_Huan_FixMyAxe_03_13"); //S¹dzê, ¿e to nie bêdzie tania rzecz. A, kowal zajmuje star¹ wie¿ê w dolinie pomiêdzy Starym a Nowym Obozem.
	AI_Output (self, other ,"DIA_Huan_FixMyAxe_03_14"); //Z tego co mi wiadomo, obozuje tam niejaki Cavalorn. Dalej ju¿ sobie poradzisz.
	
	B_LogEntry               (CH1_TorlofsAxe,"Huan powiedzia³ mi, ¿e topór Torlofa jest bardzo stary i ¿eby go naprawiæ bêdzie potrzebna sztabka stali wykonanej wed³ug starej metody. Jeœli nie znajdê nigdzie takiej sztabki, bêdê musia³ poprosiæ o pomoc nordmarskiego kowala. ZNajdê go w starej wie¿y, w dolinie, w której stacjonuje myœliwy Cavalorn.");
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
   description	= "Mam sztabkê stali.";
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
    AI_Output (other, self ,"DIA_Huan_GetOreStab_15_01"); //Mam sztabkê stali.
    AI_Output (self, other ,"DIA_Huan_GetOreStab_03_02"); //A niech mnie! Uda³o ci siê j¹ znaleŸæ. Niesamowite. 
	AI_Output (other, self ,"DIA_Huan_GetOreStab_15_03"); //Mo¿esz ju¿ siê wzi¹æ do roboty. 
    AI_Output (self, other ,"DIA_Huan_GetOreStab_03_04"); //Jasne, to nie potrwa d³ugo.
	
	AI_GotoWp (self,"NO_KOWADLO");
	AI_UseMob (self,"BSANVIL",1);
	AI_UseMob (self,"BSANVIL",-1);
	AI_GotoNpc (self,hero);
	AI_Output (self, other ,"DIA_Huan_GetOreStab_03_05"); //Gotowe. Torlof powinien byæ usatysfakcjonowany. 
	
	B_LogEntry               (CH1_TorlofsAxe,"Przynios³em sztabkê stali Huanowi. Od rêki naprawi³ broñ Torlofa. Mogê ju¿ wróciæ do Najemnika z jego toporem.");
	
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
   description	= "Mo¿esz mi coœ sprzedaæ?";
};

FUNC INT DIA_Huan_HELLO3_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Huan_HELLO3_Info()
{
    AI_Output (other, self ,"DIA_Huan_HELLO3_15_01"); //Mo¿esz mi coœ sprzedaæ?
    AI_Output (self, other ,"DIA_Huan_HELLO3_03_02"); //Mam coœ na sk³adzie.
	B_ClearTreaderAmmo(self);
	if (knows_huantrade == false)
	{
	knows_huantrade = true;
	Log_CreateTopic (GE_TraderNC,LOG_NOTE);
	B_LogEntry                     (GE_TraderNC,"Huan jest kowalem i mo¿e mi coœ sprzedaæ.");//fix
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
    AI_Output (self, other ,"DIA_Huan_OLD_ARMOR_DEAL_03_03"); //Widzê, ¿e masz przy sobie interesuj¹c¹ zbrojê. Móg³bym j¹ zobaczyæ?
    AI_Output (other, self ,"DIA_Huan_OLD_ARMOR_DEAL_15_04"); //W sumie... czemu nie?
    AI_Output (self, other ,"DIA_Huan_OLD_ARMOR_DEAL_03_05"); //Ta zbroja jest we wspania³ym stanie! Takie pancerze nosili stra¿nicy królewscy w czasach pierwszych wojen myrtañskich.
    AI_Output (self, other ,"DIA_Huan_OLD_ARMOR_DEAL_03_06"); //Ten pancerz to UNIKAT!
    AI_Output (self, other ,"DIA_Huan_OLD_ARMOR_DEAL_03_07"); //Gdzie znalaz³eœ to cudeñko?
    AI_Output (other, self ,"DIA_Huan_OLD_ARMOR_DEAL_15_08"); //Ja? Có¿, le¿a³o w jaskini.
    AI_Output (self, other ,"DIA_Huan_OLD_ARMOR_DEAL_03_09"); //Te zbroje potrafi³y przetrwaæ wieki. Wspania³y kunszt.
    AI_Output (self, other ,"DIA_Huan_OLD_ARMOR_DEAL_03_10"); //Nie chcia³byœ jej sprzedaæ? Zaoferujê ci 500 bry³ek rudy. ¯aden inny kupiec tyle nie zap³aci.
    AI_Output (other, self ,"DIA_Huan_OLD_ARMOR_DEAL_15_11"); //Có¿...

    Info_ClearChoices		(DIA_Huan_OLD_ARMOR_DEAL);
    Info_AddChoice		(DIA_Huan_OLD_ARMOR_DEAL, "Nie chcê jej sprzedaæ!", DIA_Huan_OLD_ARMOR_DEAL_NOT_SELL);
    Info_AddChoice		(DIA_Huan_OLD_ARMOR_DEAL, "Umowa stoi. 500 bry³ek rudy to uczciwa cena.", DIA_Huan_OLD_ARMOR_DEAL_SELL_500);
    Info_AddChoice		(DIA_Huan_OLD_ARMOR_DEAL, "Daj 750 bry³ek i jest twoja. ", DIA_Huan_OLD_ARMOR_DEAL_GIVE_MORE);
    Info_AddChoice		(DIA_Huan_OLD_ARMOR_DEAL, "1000 bry³ek rudy, albo nie mamy o czym rozmawiaæ.", DIA_Huan_OLD_ARMOR_DEAL_MASTER_OF_TRADE);
};

FUNC VOID DIA_Huan_OLD_ARMOR_DEAL_NOT_SELL()
{
    AI_Output (other, self ,"DIA_Huan_OLD_ARMOR_DEAL_NOT_SELL_15_01"); //Nie chcê jej sprzedaæ!
    AI_Output (self, other ,"DIA_Huan_OLD_ARMOR_DEAL_NOT_SELL_03_02"); //No szkoda, szkoda. Wiedz, ¿e robisz b³¹d. Ta zbroja wkrótce ci siê nie przyda. Nie jest tak mocna, jak nowe pancerze.
    Info_ClearChoices		(DIA_Huan_OLD_ARMOR_DEAL);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Huan_OLD_ARMOR_DEAL_SELL_500()
{
    AI_Output (other, self ,"DIA_Huan_OLD_ARMOR_DEAL_SELL_500_15_01"); //Umowa stoi. 500 bry³ek rudy to uczciwa cena.
    AI_Output (self, other ,"DIA_Huan_OLD_ARMOR_DEAL_SELL_500_03_02"); //Mi³o siê robi z tob¹ interesy. Zaopiekujê siê t¹ zbroj¹ jak w³asn¹ matk¹.
	B_GiveInvItems      (hero, self, OldArmor, 1);
    CreateInvItems (self, ItMiNugget, 500);
    B_GiveInvItems (self, other, ItMiNugget, 500);
    Info_ClearChoices		(DIA_Huan_OLD_ARMOR_DEAL);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Huan_OLD_ARMOR_DEAL_GIVE_MORE()
{
    AI_Output (other, self ,"DIA_Huan_OLD_ARMOR_DEAL_GIVE_MORE_15_01"); //Daj 750 bry³ek i jest twoja. 
    AI_Output (self, other ,"DIA_Huan_OLD_ARMOR_DEAL_GIVE_MORE_03_02"); //Twardy z ciebie negocjator. No dobra. Niech stracê.
    CreateInvItems (self, ItMiNugget, 750);
    B_GiveInvItems (self, other, ItMiNugget, 750);
	B_GiveInvItems      (hero, self, OldArmor, 1);
    Info_ClearChoices		(DIA_Huan_OLD_ARMOR_DEAL);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Huan_OLD_ARMOR_DEAL_MASTER_OF_TRADE()
{
    AI_Output (other, self ,"DIA_Huan_OLD_ARMOR_DEAL_MASTER_OF_TRADE_15_01"); //1000 bry³ek rudy, albo nie mamy o czym rozmawiaæ.
    AI_Output (self, other ,"DIA_Huan_OLD_ARMOR_DEAL_MASTER_OF_TRADE_03_02"); //Nie przesadzasz trochê? Mogê ci daæ co najwy¿ej 700 bry³ek.
	Info_ClearChoices		(DIA_Huan_OLD_ARMOR_DEAL);
    Info_AddChoice		(DIA_Huan_OLD_ARMOR_DEAL, "Do³ó¿ stówkê i mo¿esz j¹ braæ.", DIA_Huan_OLD_ARMOR_DEAL_MASTER_OF_TRADE_SUCCESS);
    Info_AddChoice		(DIA_Huan_OLD_ARMOR_DEAL, "Wypchaj siê.", DIA_Huan_OLD_ARMOR_DEAL_MASTER_OF_TRADE_FAIL);
};

FUNC VOID DIA_Huan_OLD_ARMOR_DEAL_MASTER_OF_TRADE_SUCCESS()
{
    AI_Output (other, self ,"DIA_Huan_OLD_ARMOR_DEAL_MASTER_OF_TRADE_SUCCESS_15_01"); //Do³ó¿ stówkê i mo¿esz j¹ braæ.
    AI_Output (self, other ,"DIA_Huan_OLD_ARMOR_DEAL_MASTER_OF_TRADE_SUCCESS_03_02"); //Cholera... No, ale niech ci bêdzie. 
	CreateInvItems (self, ItMiNugget, 800);
    B_GiveInvItems (self, other, ItMiNugget, 800);
    B_GiveInvItems      (hero, self, OldArmor, 1);
	Info_ClearChoices		(DIA_Huan_OLD_ARMOR_DEAL);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Huan_OLD_ARMOR_DEAL_MASTER_OF_TRADE_FAIL()
{
    AI_Output (other, self ,"DIA_Huan_OLD_ARMOR_DEAL_MASTER_OF_TRADE_FAIL_15_01"); //Wypchaj siê.
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
   description	= "Mo¿esz mnie czegoœ nauczyæ?";
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
    AI_Output (other, self ,"DIA_Huan_LearningS_15_01"); //Mo¿esz mnie czegoœ nauczyæ?
    AI_Output (self, other ,"DIA_Huan_LearningS_03_02"); //Tak mogê ci pokazaæ jak wykuæ dobry i prosty miecz.
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
   description	= "Naucz mnie jak wykuæ miecz. (Kowalstwo poz.1/3 - 5 PN)";
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
    AI_Output (other, self ,"DIA_Huan_LearnSmith_01_15_01"); //Naucz mnie jak wykuæ miecz. 
    AI_Output (self, other ,"DIA_Huan_LearnSmith_01_03_02"); //To doœæ proste. ZnajdŸ sobie plan oraz kawa³ek surowej stali i rozgrzej go w ogniu, a¿ zacznie siê ¿arzyæ.
    AI_Output (self, other ,"DIA_Huan_LearnSmith_01_03_03"); //Potem wykuj na kowadle ostrze.
    AI_Output (self, other ,"DIA_Huan_LearnSmith_01_03_04"); //Najwa¿niejsze, ¿ebyœ pilnowa³, czy ostrze nie wystyg³o. Masz tylko kilka minut, ¿eby zrobiæ broñ...
    AI_Output (self, other ,"DIA_Huan_LearnSmith_01_03_05"); //Reszty dowiesz siê sam. To kwestia praktyki. 
	PrintScreen ("Nauka kowalstwo",2, 62, "FONT_OLD_10_WHITE.TGA", 2);
	NPC_TALENT_SMITH = 1;
	Hero.lp -= 5;
	}
	else 
	{
	AI_Output (self,other ,"DIA_Huan_LearnSmith_01_03_06"); //Brak ci doœwiadczenia.
	PrintS_Ext  ("Brak ci doœwiadczenia!", COL_RED);
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
   description	= "Naucz mnie jak wykuæ miecz. (Kowalstwo poz.2/3 - 10 PN)";
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
    AI_Output (other, self ,"DIA_Huan_LearnSmith_02_15_01"); //Naucz mnie jak wykuæ dobry miecz. 
    AI_Output (self, other ,"DIA_Huan_LearnSmith_02_03_02"); //Podstawy ju¿ znasz, teraz czas na coœ trudniejszego...
    AI_Output (self, other ,"DIA_Huan_LearnSmith_02_03_03"); //Gdy uderzasz w gor¹c¹ stal staraj siê robiæ to z wyczuciem i nie b¹dŸ spiêty.
    AI_Output (self, other ,"DIA_Huan_LearnSmith_02_03_04"); //Najwa¿niejsze, jest to byœ nie uderza³ zbyt mocno, albo za lekko...
    AI_Output (self, other ,"DIA_Huan_LearnSmith_02_03_05"); //Poza tym, wszystko zale¿y od ciebie i rodzaju broni, jak¹ chcesz wykonaæ.
	PrintScreen ("Nauka kowalstwo",2, 62, "FONT_OLD_10_WHITE.TGA", 2);
	NPC_TALENT_SMITH = 2;
	Hero.lp -= 10;
	}
	else 
	{
	AI_Output (self,other ,"DIA_Huan_LearnSmith_02_03_06"); //Brak ci doœwiadczenia.
	PrintS_Ext  ("Brak ci doœwiadczenia!", COL_RED);
	};
	
};

