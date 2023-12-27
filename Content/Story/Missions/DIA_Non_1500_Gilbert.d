//poprawione i sprawdzone -  

// ********************************
// 				EXIT
// ********************************

instance DIA_Gilbert_EXIT (C_INFO)
{
	npc			= Non_1500_Gilbert;
	nr			= 999;
	condition	= DIA_Gilbert_EXIT_Condition;
	information	= DIA_Gilbert_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Gilbert_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_Gilbert_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

// ********************************
// 				First
// ********************************

instance DIA_Gilbert_First (C_INFO)
{
	npc			= Non_1500_Gilbert;
	nr			= 1;
	condition	= DIA_Gilbert_First_Condition;
	information	= DIA_Gilbert_First_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int DIA_Gilbert_First_Condition()
{
	if (Npc_GetDistToNpc(self,other) <= ZivilAnquatschDist)
	{
		return 1;
	};
};

FUNC VOID  DIA_Gilbert_First_Info()
{
	AI_Output (self, other,"DIA_Gilbert_First_04_00"); //Co tu robisz? Nie miewam tu zbyt czêsto goœci, he he!
	AI_Output (self, other,"DIA_Gilbert_First_04_01"); //Widzê, ¿e niez³y cwaniak z ciebie. Tak znaleŸæ moj¹ kryjówkê, no no!
	
	B_GiveXP(XP_GilbertFound);
};

// ********************************
// 				Hallo
// ********************************

instance DIA_Gilbert_Hallo (C_INFO)
{
	npc			= Non_1500_Gilbert;
	nr			= 1;
	condition	= DIA_Gilbert_Hallo_Condition;
	information	= DIA_Gilbert_Hallo_Info;
	permanent	= 0;
	description = "Co tu robisz?";
};                       

FUNC int DIA_Gilbert_Hallo_Condition()
{
	return 1;
};

FUNC VOID  DIA_Gilbert_Hallo_Info()
{
	AI_Output (other, self,"DIA_Gilbert_Hallo_15_00"); //Co tu robisz?
	AI_Output (self, other,"DIA_Gilbert_Hallo_04_01"); //Mia³em ju¿ doœæ Starego Obozu. Podpad³em paru ludziom Gomeza. To by³o dawno temu.
	AI_Output (self, other,"DIA_Gilbert_Hallo_04_02"); //Teraz pewnie nikt ju¿ o mnie nie pamiêta, ale ja siê st¹d nie ruszam. Jak na mój gust - w Starym Obozie wci¹¿ jest za du¿o têpych osi³ków.
};

///////////////////////////////////////////////////////////////////////////////////////////
// __MOD DIALOGS
//	////////  ////////
//  //        //    //
//  //////    //////
//  //        //   //
//  ///////// //    //
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> Kobieta
//========================================

INSTANCE DIA_Gilbert_Kobieta (C_INFO)
{
   npc          = Non_1500_Gilbert;
   nr           = 1;
   condition    = DIA_Gilbert_Kobieta_Condition;
   information  = DIA_Gilbert_Kobieta_Info;
   permanent	= FALSE;
   description	= "Co robi kobieta w twojej jaskini?";
};

FUNC INT DIA_Gilbert_Kobieta_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Gilbert_Kobieta_Info()
{
    AI_Output (other, self ,"DIA_Gilbert_Kobieta_15_01"); //Co robi kobieta w twojej jaskini?
    AI_Output (self, other ,"DIA_Gilbert_Kobieta_03_02"); //Uciek³a ze Starego Obozu. Spotka³em j¹ w okolicy. B³¹ka³a siê, szukaj¹c schronienia.
    AI_Output (other, self ,"DIA_Gilbert_Kobieta_15_03"); //Chyba nie jest zbyt rozmowna. 
    AI_Output (self, other ,"DIA_Gilbert_Kobieta_03_04"); //To tylko pozory. Jest dosyæ pyskata, jak siê oswoi. 
};

//========================================
//-----------------> Halasy
//========================================

INSTANCE DIA_Gilbert_Halasy (C_INFO)
{
   npc          = Non_1500_Gilbert;
   nr           = 2;
   condition    = DIA_Gilbert_Halasy_Condition;
   information  = DIA_Gilbert_Halasy_Info;
   permanent	= FALSE;
   description	= "Byliœcie ostatnio strasznie g³oœno.";
};

FUNC INT DIA_Gilbert_Halasy_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Firn_ThiefInCamp))
    && (!Npc_KnowsInfo (hero, DIA_Gilbert_HELLO2))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gilbert_Halasy_Info()
{
    AI_Output (other, self ,"DIA_Gilbert_Halasy_15_01"); //Byliœcie ostatnio strasznie g³oœno.
    AI_Output (self, other ,"DIA_Gilbert_Halasy_03_02"); //Co? O co ci chodzi? 
    AI_Output (other, self ,"DIA_Gilbert_Halasy_15_03"); //O nic. Po prostu widzê, ¿e dobrze siê trzymasz, staruszku.
    AI_Output (self, other ,"DIA_Gilbert_Halasy_03_04"); //Nie rozumiem.
	B_giveXP (100);
};

//========================================
//-----------------> BANG
//========================================

INSTANCE DIA_Gilbert_BANG (C_INFO)
{
   npc          = Non_1500_Gilbert;
   nr           = 1;
   condition    = DIA_Gilbert_BANG_Condition;
   information  = DIA_Gilbert_BANG_Info;
   permanent	= FALSE;
   description	= "Podobno zrêczny z ciebie goœæ.";
};

FUNC INT DIA_Gilbert_BANG_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_osko_WhoJu))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gilbert_BANG_Info()
{
    AI_Output (other, self ,"DIA_Gilbert_BANG_15_01"); //Podobno zrêczny z ciebie goœæ.
    AI_Output (self, other ,"DIA_Gilbert_BANG_03_02"); //Hmm? Szukasz nauczyciela z³odziejskich sztuczek? Nie pomogê ci. Nie znam siê na tym.
    AI_Output (other, self ,"DIA_Gilbert_BANG_15_03"); //Nie o to mi chodzi. Jeden z ³owców orków stwierdzi³, ¿e potrafisz sprawnie poruszaæ siê po ska³ach.
    AI_Output (other, self ,"DIA_Gilbert_BANG_15_04"); //Nie ukrywam, ¿e to ciekawa umeijêtnoœæ.
    AI_Output (self, other ,"DIA_Gilbert_BANG_03_05"); //O to chodzi. Tak, znam siê trochê na tych sprawach. Potrafiê sprawnie balansowaæ cia³em.
    AI_Output (self, other ,"DIA_Gilbert_BANG_03_06"); //Mogê ciê tego nauczyæ, jednak bêdziesz musia³ mi coœ przynieœæ.
    AI_Output (other, self ,"DIA_Gilbert_BANG_15_07"); //Czego potrzebujesz? 
    AI_Output (self, other ,"DIA_Gilbert_BANG_03_08"); //Marzê o zjedzeniu solidnego kawa³ka szynki. Móg³byœ podwêdziæ dla mnie co nieco ze Starego Obozu?
    AI_Output (other, self ,"DIA_Gilbert_BANG_15_09"); //Mogê spróbowaæ. 
};

//========================================
//-----------------> MEAT
//========================================

INSTANCE DIA_Gilbert_MEAT (C_INFO)
{
   npc          = Non_1500_Gilbert;
   nr           = 2;
   condition    = DIA_Gilbert_MEAT_Condition;
   information  = DIA_Gilbert_MEAT_Info;
   permanent	= FALSE;
   description	= "Mam dla ciebie kawa³ek szynki.";
};

FUNC INT DIA_Gilbert_MEAT_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Gilbert_BANG))
    && (Npc_HasItems (other, ItFo_mutton_01) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gilbert_MEAT_Info()
{
    AI_Output (other, self ,"DIA_Gilbert_MEAT_15_01"); //Mam dla ciebie kawa³ek szynki.
    B_GiveInvItems (other, self, ItFo_mutton_01, 1);
    AI_Output (self, other ,"DIA_Gilbert_MEAT_03_02"); //Dziêkujê. Ach... cudowny zapach. Teraz mogê ciê uczyæ.
    B_LogEntry		(GE_TeacherOW,"Gilbert mo¿e mnie uczyæ akrobatyki, poniewa¿ przynios³em mu kawa³ek szynki, o który mnie prosi³.");
	B_GiveXP (50);
};

//========================================
//-----------------> TEACH
//========================================

INSTANCE DIA_Gilbert_TEACH (C_INFO)
{
   npc          = Non_1500_Gilbert;
   nr           = 3;
   condition    = DIA_Gilbert_TEACH_Condition;
   information  = DIA_Gilbert_TEACH_Info;
   permanent	= 1;
   description	= B_BuildLearnString(NAME_LearnAcrobat, LPCOST_TALENT_ACROBAT,0);
};

FUNC INT DIA_Gilbert_TEACH_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Gilbert_MEAT))
    && (Npc_GetTalentSkill(other, NPC_TALENT_ACROBAT) == 0)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gilbert_TEACH_Info()
{
	if  (B_teachthieftalent(self,other,NPC_TALENT_ACROBAT))
	{
    AI_Output (other, self ,"DIA_Gilbert_TEACH_15_01"); //Naucz mnie akrobatyki. 
    AI_Output (self, other ,"DIA_Gilbert_TEACH_03_02"); //Jeœli bêdziesz odpowiednio balansowa³ cia³em, unikniesz upadku podczas wspinaczki.
    AI_Output (self, other ,"DIA_Gilbert_TEACH_03_03"); //Pamiêtaj, ¿eby dok³adnie obserwowaæ drogê po której chcesz siê wspinaæ. Zwracaj uwagê na s³absze fragmenty ska³, które mog¹ odpaœæ.
    AI_Output (self, other ,"DIA_Gilbert_TEACH_03_04"); //Nie ka¿dy fragment skalny jest w stanie wytrzymaæ twój ciê¿ar. 
	};		
};

/////////////////////////////////////////////////////////////
// NIEAKTYWNE DIALOGI
// BY£Y PO PROSTU Z£E
/////////////////////////////////////////////////////////////

//========================================
//-----------------> GoToTondral
//========================================

INSTANCE DIA_Gilbert_GoToTondral (C_INFO)
{
   npc          = Non_1500_Gilbert;
   nr           = 1;
   condition    = DIA_Gilbert_GoToTondral_Condition;
   information  = DIA_Gilbert_GoToTondral_Info;
   permanent	= FALSE;
   description	= "Mo¿e chcesz pójœæ ze mn¹ do Bractwa?";
};

FUNC INT DIA_Gilbert_GoToTondral_Condition()
{
    if (BaalTondral_GetNewGuy == LOG_RUNNING)
    && (Npc_KnowsInfo (hero, DIA_Gilbert_Hallo))

    {
    return FALSE;
    };
};


FUNC VOID DIA_Gilbert_GoToTondral_Info()
{
    AI_Output (other, self ,"DIA_Gilbert_GoToTondral_15_01"); //W Bractwie poszukuj¹ nowych wyznawców. Mo¿e chcesz pójœæ tam ze mn¹?
    AI_Output (self, other ,"DIA_Gilbert_GoToTondral_03_02"); //Czemu nie? Chyba czas ju¿ coœ zmieniæ w swoim ¿yciu. Od lat twkiê w tej jaskini. 
    AI_Output (self, other ,"DIA_Gilbert_GoToTondral_03_03"); //Rozumiem, ¿e mnie tam zaprowadzisz?
    AI_Output (other, self ,"DIA_Gilbert_GoToTondral_15_04"); //Jasne. Dam ci znak, gdy bêdê gotowy.
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Gilbert_HELLO2 (C_INFO)
{
   npc          = Non_1500_Gilbert;
   nr           = 2;
   condition    = DIA_Gilbert_HELLO2_Condition;
   information  = DIA_Gilbert_HELLO2_Info;
   permanent	= FALSE;
   description	= "Ruszajmy.";
};

FUNC INT DIA_Gilbert_HELLO2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Gilbert_GoToTondral))
    && (BaalTondral_GetNewGuy == LOG_RUNNING)
    {
    return FALSE;
    };
};


FUNC VOID DIA_Gilbert_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Gilbert_HELLO2_15_01"); //Ruszajmy.
    AI_Output (self, other ,"DIA_Gilbert_HELLO2_03_02"); //Dobrze. Tylko uwa¿aj na ska³y.
    	self.flags = NPC_FLAG_IMMORTAL;
self.aivar[AIV_PARTYMEMBER] = TRUE;
    Npc_ExchangeRoutine (self, "FOLLOW");
    B_LogEntry                     (CH1_RecruitDusty,"Postanowi³em, ¿e zaprowadzê Gilberta do Bractwa.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> KuŸnia Stone'a 
//========================================

INSTANCE DIA_Gilbert_Kuznia (C_INFO)
{
   npc          = Non_1500_Gilbert;
   nr           = 1;
   condition    = DIA_Gilbert_Kuznia_Condition;
   information  = DIA_Gilbert_Kuznia_Info;
   permanent	= FALSE;
   important    = TRUE;
};

FUNC INT DIA_Gilbert_Kuznia_Condition()
{
    if  (Kapitel == 3) 
	&& (!Jacko_KS_Dead == TRUE)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gilbert_Kuznia_Info()
{
    AI_Output (self, other ,"DIA_Gilbert_Kuznia_03_01");  //Hej ch³opczê mia³bym do ciebie sprawê.
    AI_Output (other, self ,"DIA_Gilbert_Kuznia_15_02");  //Jak¹?
    AI_Output (self, other ,"DIA_Gilbert_Kuznia_03_03");  //Jak wiesz by³em wczeœniej w Starym obozie. I dowiedzia³em siê paru wa¿nych rzeczy.
    AI_Output (self, other ,"DIA_Gilbert_Kuznia_03_04");  //Chocia¿by tego, ¿e w kuŸni kowala Stone’a znajduje siê co najmniej parê wartoœciowych rzeczy.
    AI_Output (self, other ,"DIA_Gilbert_Kuznia_03_05");  //Na przyk³ad pewien cenny medalion, wart wiele rudy.
    AI_Output (other, self ,"DIA_Gilbert_Kuznia_15_06");  //Mia³bym siê tam w³amaæ?
    AI_Output (self, other ,"DIA_Gilbert_Kuznia_03_07");  //To nie takie proste. Gdy by³em jeszcze w obozie niejaki Buster ukrad³ klucz do kuŸni.
    AI_Output (self, other ,"DIA_Gilbert_Kuznia_03_08");  //Ale nie wydaje mi siê by z niego skorzysta³. Najpewniej wci¹¿ go ma.
    AI_Output (other, self ,"DIA_Gilbert_Kuznia_15_09");  //Mam z nim o tym pomówiæ?
	AI_Output (self, other ,"DIA_Gilbert_Kuznia_03_10");  //Dok³adnie. Spróbuj wyci¹gn¹æ od niego ten klucz i przy sprzyjaj¹cej okazji dostañ siê do kuŸni.
    AI_Output (other, self ,"DIA_Gilbert_Kuznia_15_11");  //Mogê siê tym zaj¹æ.
    AI_Output (self, other ,"DIA_Gilbert_Kuznia_03_12");  //Na pewno ten cwaniak bêdzie czegoœ od ciebie chcia³ ale coœ mi mówi, ¿e dasz sobie z tym radê.
    AI_Output (other, self ,"DIA_Gilbert_Kuznia_15_13");  //Mam nadziejê.
	
	
  
	Log_CreateTopic   	(KuzniaStone,LOG_MISSION);
	Log_SetTopicStatus  (KuzniaStone,LOG_RUNNING);
	
	  B_LogEntry                     (KuzniaStone,"Gilbert chcia³by zdobyæ rzeczy ukryte w kuŸni Kowala Stone’a a zw³aszcza pewien medalion. Problem polega na tym, ¿e klucz do kuŸni ukrad³ Buster. Powinienem z nim o tym pomówiæ.");
};


//========================================
//-----------------> Medalion Gilberta 
//========================================

INSTANCE DIA_Gilbert_Medalion (C_INFO)
{
   npc          = Non_1500_Gilbert;
   nr           = 1;
   condition    = DIA_Gilbert_Medalion_Condition;
   information  = DIA_Gilbert_Medalion_Info;
   permanent	= FALSE;
   description  = "Mam twój medalion.";
};

FUNC INT DIA_Gilbert_Medalion_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Buster_Plants))
	&& (Npc_HasItems (other, Amulett_Stone) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gilbert_Medalion_Info()
{
    AI_Output (other, self ,"DIA_Gilbert_Medalion_15_01");  //Mam twój medalion.
    AI_Output (self, other ,"DIA_Gilbert_Medalion_03_02");  //Œwietnie m³ody. Wiedzia³em, ¿e podo³asz.
    AI_Output (self, other ,"DIA_Gilbert_Medalion_03_03");  //Daj mi go.
	B_GiveInvItems (other, self, Amulett_Stone, 1);
	Npc_RemoveInvItems (self, Amulett_Stone, 1);
    AI_Output (other, self ,"DIA_Gilbert_Medalion_15_04");   //Proszê.
    AI_Output (self, other ,"DIA_Gilbert_Medalion_03_05");   //Dziêki a ty weŸ tê rudê.
	B_GiveInvItems (self,other, itminugget, 60);
    AI_Output (self, other ,"DIA_Gilbert_Medalion_03_06");  //Myœlê, ¿e z korzyœci¹ dla nas dwóch dobiliœmy targu.
    AI_Output (other, self ,"DIA_Gilbert_Medalion_15_07");  //Nie zaprzeczê.
    AI_Output (self, other ,"DIA_Gilbert_Medalion_03_08");  //Jak dalej bêdziesz siê tak rozwija³ to zajdziesz daleko w tej Kolonii.
    AI_Output (other, self ,"DIA_Gilbert_Medalion_15_09");  //Byæ mo¿e. Na razie.
	AI_Output (self, other ,"DIA_Gilbert_Medalion_03_10");  //Do zobaczenia.
 
	B_GiveXP (110);
    B_LogEntry                     (KuzniaStone,"Przekaza³em medalion Gilbertowi. By³ ze mnie zadowolony i wyp³aci³ mi nagrodê.");
	Log_SetTopicStatus  (KuzniaStone,LOG_SUCCESS);
	AI_StopProcessInfos	( self );
};


//========================================
//-----------------> Medalion Gilberta 
//========================================

INSTANCE DIA_Gilbert_Zaczepka (C_INFO)
{
   npc          = Non_1500_Gilbert;
   nr           = 1;
   condition    = DIA_Gilbert_Zaczepka_Condition;
   information  = DIA_Gilbert_Zaczepka_Info;
   permanent	= FALSE;
   important    = TRUE;
};

FUNC INT DIA_Gilbert_Zaczepka_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Stone_Klucz))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gilbert_Zaczepka_Info()
{
    AI_Output (self, other ,"DIA_Gilbert_Zaczepka_03_01");  //Masz mój medalion?
    AI_Output (other, self ,"DIA_Gilbert_Zaczepka_15_02");  //Niestety nie.
    AI_Output (self, other ,"DIA_Gilbert_Zaczepka_03_03");  //Nie uda³o ci siê dostaæ do kuŸni Stone’a?
    AI_Output (other, self ,"DIA_Gilbert_Zaczepka_15_04");  //Nie. Gdyby by³o inaczej dosta³byœ swój medalion.
    AI_Output (self, other ,"DIA_Gilbert_Zaczepka_03_05");  //Rozumiem. Zatem mówi siê trudno ch³opczê.
    AI_Output (other, self ,"DIA_Gilbert_Zaczepka_15_06");  //No có¿...
   
    AI_StopProcessInfos	( self );
   
};


//========================================
//-----------------> Medalion Gilberta 
//========================================

INSTANCE DIA_Gilbert_Gaston (C_INFO)
{
   npc          = Non_1500_Gilbert;
   nr           = 1;
   condition    = DIA_Gilbert_Gaston_Condition;
   information  = DIA_Gilbert_Gaston_Info;
   permanent	= FALSE;
   description  = "Poszukuje niejakiego Gastona. Ponoæ to twój kuzyn.";
};

FUNC INT DIA_Gilbert_Gaston_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_BaalTondral_Zdrajca))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gilbert_Gaston_Info()
{
    AI_Output (other, self ,"DIA_Gilbert_Gaston_15_01");  //Poszukuje niejakiego Gastona. Ponoæ to twój kuzyn.
    AI_Output (self, other ,"DIA_Gilbert_Gaston_03_02");  //Garsona?? S³abo s³yszê...
    AI_Output (other, self ,"DIA_Gilbert_Gaston_15_03");  //Dobrze wiesz o kogo chodzi.
    AI_Output (self, other ,"DIA_Gilbert_Gaston_03_04");  //Nie wiem o czym mówisz.
    AI_Output (other, self ,"DIA_Gilbert_Gaston_15_05");  //O twoim kuzynie Gastonie, który do niedawna by³ obiecuj¹cym Nowicjuszem w bractwie.
    AI_Output (self, other ,"DIA_Gilbert_Gaston_03_06");  //Dalej nic nie rozumiem.
	AI_EquipBestMeleeWeapon	(other);
	AI_ReadyMeleeWeapon		(other);
	AI_Output (other, self ,"DIA_Gilbert_Gaston_15_07");  //Mo¿e teraz zrozumiesz?

    AI_Output (self, other ,"DIA_Gilbert_Gaston_03_08");  //Eeee... Dobrze ju¿. Schowaj tê broñ.
    AI_Output (other, self ,"DIA_Gilbert_Gaston_15_09");  //To zacznij w koñcu mówiæ.
    AI_Output (self, other ,"DIA_Gilbert_Gaston_03_10");  //No wiêc jakiœ czas temu by³ u mnie Gaston. Wygl¹da³ na zmêczonego i przestraszonego. Mówi³, ¿e uciek³ z bractwa i dowiedzia³ siê czegoœ wa¿nego.
 	
	Info_ClearChoices	(DIA_Gilbert_Gaston);
	Info_AddChoice		(DIA_Gilbert_Gaston, "Co to znaczy?", DIA_Gilbert_Gaston_Add_Choice);
	
};

FUNC VOID DIA_Gilbert_Gaston_Add_Choice()
{
    AI_Output (other, self ,"DIA_Gilbert_Gaston_Add_Choice_15_01"); //Co to znaczy?
    AI_Output (self, other ,"DIA_Gilbert_Gaston_Add_Choice_03_02"); //Nie powiem ci póki mi nie pomo¿esz.
    AI_Output (other, self ,"DIA_Gilbert_Gaston_Add_Choice_15_03"); //Ehh... W czym?
    AI_Output (self, other ,"DIA_Gilbert_Gaston_Add_Choice_03_04"); //Ja tak¿e mam problem z przesz³oœci¹. Jakiœ czas temu przez przypadek widzia³ mnie stra¿nik Pacho. Potem doniós³ o wszystkim Bloodwynowi.
    AI_Output (self, other ,"DIA_Gilbert_Gaston_Add_Choice_03_05"); //Ten przypomnia³ sobie o moich d³ugach w op³atach za ochronê i postanowi³ schwytaæ.
    AI_Output (self, other ,"DIA_Gilbert_Gaston_Add_Choice_03_06"); //Jednoczeœnie Guy, który jako jedyny zna³ miejsce mojego ukrycia, odwiedzi³ mnie.
    AI_Output (self, other ,"DIA_Gilbert_Gaston_Add_Choice_03_07"); //Za¿¹da³ rudy w zamian za milczenie przed Bloodywnem. Akurat mia³em jeszcze trochê rudy i zap³aci³em mu.
    AI_Output (self, other ,"DIA_Gilbert_Gaston_Add_Choice_03_08");  //Ale kolejnym razem ju¿ nie i zagrozi³, ¿e wszystko powie stra¿nikom. Boje siê, ¿e przyjd¹ i ukatrupi¹ mnie a tak¿e skrzywdz¹ Angelinê.
    AI_Output (other, self ,"DIA_Gilbert_Gaston_Add_Choice_15_09"); //Nie stanie siê tak. Porozmawiam z Guyem.
    AI_Output (self, other ,"DIA_Gilbert_Gaston_Add_Choice_03_10"); //Powodzenia.
    AI_Output (other, self ,"DIA_Gilbert_Gaston_Add_Choice_15_11"); //Do zobaczenia.
    B_LogEntry               (PSI_Zdrajca,"Gilbert po usilnych namowach powie mi coœ istotnego na temat Gastona. Jednak wpierw muszê rozwi¹zaæ jego problem. Kopacz Guy szanta¿uje go wydaniem mjejsca jego kryjówki, muszê go jakoœ przekonaæ ¿eby zostawi³ Gilberta w spokoju.");
    AI_StopProcessInfos	( self );

};

//========================================
//-----------------> Medalion Gilberta 
//========================================

INSTANCE DIA_Gilbert_Guy_Spokoj (C_INFO)
{
   npc          = Non_1500_Gilbert;
   nr           = 1;
   condition    = DIA_Gilbert_Guy_Spokoj_Condition;
   information  = DIA_Gilbert_Guy_Spokoj_Info;
   permanent	= FALSE;
   description    = "Guy da ci spokój.";
};

FUNC INT DIA_Gilbert_Guy_Spokoj_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Guy_Nugget_FGilbert))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gilbert_Guy_Spokoj_Info()
{
    AI_Output (other, self ,"DIA_Gilbert_Guy_Spokoj_15_01");  //Guy da ci spokój.
    AI_Output (self, other ,"DIA_Gilbert_Guy_Spokoj_03_02");  //Wspaniale. Wreszcie ja i Angela bêdziemy bezpieczni.
    AI_Output (other, self ,"DIA_Gilbert_Guy_Spokoj_15_03");  //Teraz opowiedz mi o tym jak Gaston do ciebie wróci³.
    AI_Output (self, other ,"DIA_Gilbert_Guy_Spokoj_03_04");  //To ju¿ nie by³ Gaston Nowicjusz z bagna.
    AI_Output (other, self ,"DIA_Gilbert_Guy_Spokoj_15_05");  //A kto?
    AI_Output (self, other ,"DIA_Gilbert_Guy_Spokoj_03_06");  //To by³ myœliwy Arnold. Takie imiê przyj¹³ odk¹d do nich przysta³.
    AI_Output (other, self ,"DIA_Gilbert_Guy_Spokoj_15_07");  //Wspaniale. Teraz ju¿ wiem gdzie go szukaæ.
    AI_Output (self, other ,"DIA_Gilbert_Guy_Spokoj_03_08");  //Tylko nie rób mu krzywdy!
    AI_Output (other, self ,"DIA_Gilbert_Guy_Spokoj_15_09");  //Tego nie mogê obiecaæ. 
    AI_Output (other, self ,"DIA_Gilbert_Guy_Spokoj_15_10");  //Do zobaczenia.
	CreateInvItems (NON_40034_Arnold, ItMi_Tondrall_Slab,5);
    AI_StopProcessInfos	( self );
    B_LogEntry                     (PSI_Zdrajca,"Okazjue siê, ¿e jakiœ czas temu Gaston przysta³ do myœliwych i przyj¹ imie Arnold. Wygl¹da na to, ¿e uda³o mi siê go zlokalizowaæ. Muszê go teraz jakoœ wywabiæ z obozu myœliwych.");
};

instance dia_gilbert_pickpocket(c_info) {
    npc = non_1500_gilbert;
    nr = 900;
    condition = dia_gilbert_pickpocket_condition;
    information = dia_gilbert_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_gilbert_pickpocket_condition() {
	e_beklauen(baseThfChanceNON, 25);
};

func void dia_gilbert_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_gilbert_pickpocket);
	info_addchoice(dia_gilbert_pickpocket, dialog_back, dia_gilbert_pickpocket_back);
	info_addchoice(dia_gilbert_pickpocket, dialog_pickpocket, dia_gilbert_pickpocket_doit);
};

func void dia_gilbert_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_gilbert_pickpocket);
};

func void dia_gilbert_pickpocket_back() {
    info_clearchoices(dia_gilbert_pickpocket);
};
