// ************************ EXIT **************************

INSTANCE DIA_SLD_709_Cord_Exit (C_INFO)
{
	npc			= SLD_709_Cord;
	nr			= 999;
	condition	= DIA_SLD_709_Cord_Exit_Condition;
	information	= DIA_SLD_709_Cord_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_SLD_709_Cord_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_SLD_709_Cord_Exit_Info()
{
	AI_StopProcessInfos	( self );
};


//========================================
//-----------------> ZAJECIE
//========================================

INSTANCE DIA_Cord_ZAJECIE (C_INFO)
{
   npc          = SLD_709_Cord;
   nr           = 1;
   condition    = DIA_Cord_ZAJECIE_Condition;
   information  = DIA_Cord_ZAJECIE_Info;
   permanent	= FALSE;
   description	= "Czym siê tutaj zajmujesz poza trenowaniem Najemników?";
};

FUNC INT DIA_Cord_ZAJECIE_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Cord_ZAJECIE_Info()
{
    AI_Output (other, self ,"DIA_Cord_ZAJECIE_15_01"); //Czym siê tutaj zajmujesz poza trenowaniem Najemników?
    AI_Output (self, other ,"DIA_Cord_ZAJECIE_03_02"); //Có¿, jestem przywódc¹ prowizorycznej stra¿y. Zajmujemy siê w specjalnymi zadaniami zlecanych przez Lee. 
	AI_Output (self, other ,"DIA_Cord_ZAJECIE_03_03"); //Poza tym chroniê Magów Wody najlepiej jak mogê. Œwietnie siê dogadujemy i mam nadziejê, ¿e po upadku Bariery pomimo zakoñczenia umowy miêdzy Lee a Magami, bêdê mia³ mo¿liwoœæ dla nich pracowaæ.
    AI_Output (other, self ,"DIA_Cord_ZAJECIE_15_04"); //Rozumiem.
};


/*------------------------------------------------------------------------
						TRAIN ANGEBOT								
------------------------------------------------------------------------*/

instance  SLD_709_Cord_TRAINOFFER (C_INFO)
{
	npc				= SLD_709_Cord;
	condition		= SLD_709_Cord_TRAINOFFER_Condition;
	information		= SLD_709_Cord_TRAINOFFER_Info;
	important		= 0;
	permanent		= 0;
	description		= "Chcia³bym nauczyæ siê walki jednorêcznym orê¿em."; 
};

FUNC int  SLD_709_Cord_TRAINOFFER_Condition()
{	
		return TRUE;
};
FUNC void  SLD_709_Cord_TRAINOFFER_Info()
{
	AI_Output (other, self,"SLD_709_Cord_TRAINOFFER_Info_15_01"); //Chcia³bym nauczyæ siê walki jednorêcznym orê¿em.
	AI_Output (self, other,"SLD_709_Cord_TRAINOFFER_Info_14_02"); //Nie ma sprawy. Ale to ciê bêdzie kosztowa³o 30 bry³ek rudy. Mo¿e byæ?
	AI_Output (self, other,"SLD_709_Cord_TRAINOFFER_Info_14_03"); //Aha, szkolê tylko NASZYCH ludzi!

	Log_CreateTopic	(GE_TeacherNC,	LOG_NOTE);
	B_LogEntry		(GE_TeacherNC,	"Najemnik Cord mo¿e mnie nauczyæ walki jednorêcznym orê¿em o ile do³¹czê do Nowego Obozu. Za dnia mo¿na go znaleŸæ na kamienistej równinie, przy jeziorze.");
};  

// **************************************************
// 					START_TRAIN
// **************************************************

INSTANCE DIA_Cord_START_TRAIN (C_INFO)
{
	npc			= SLD_709_Cord;
	nr			= 10;
	condition	= DIA_Cord_START_TRAIN_Condition;
	information	= DIA_Cord_START_TRAIN_Info;
	permanent	= 1;
	description = "Zacznijmy trening.";
};                       

FUNC INT DIA_Cord_START_TRAIN_Condition()
{
	if (Npc_KnowsInfo(hero,SLD_709_Cord_TRAINOFFER)) && ((Npc_GetTrueGuild(hero) == GIL_SLD) || (Npc_GetTrueGuild(hero) == GIL_SFB) || (Npc_GetTrueGuild(hero) == GIL_ORG) || (Npc_GetTrueGuild(hero) == GIL_KDW) || (Npc_GetTrueGuild(hero) == GIL_DMB) || ( (Npc_GetTrueGuild(hero) == GIL_NONE) && (kapitel >= 4)  )  )
	{
		return 1;
	};
};

FUNC VOID DIA_Cord_START_TRAIN_Info()
{
	AI_Output (other,self,"DIA_Cord_START_TRAIN_15_00"); //Zacznijmy trening.
	AI_Output (self,other,"DIA_Cord_START_TRAIN_01_01"); //Do roboty!
	
	Info_ClearChoices(DIA_Cord_START_TRAIN);
	Info_AddChoice(DIA_Cord_START_TRAIN,"Wróæ",DIA_Cord_START_TRAIN_BACK);
	
	Info_AddChoice(DIA_Cord_START_TRAIN,B_BuildLearnString("Broñ jednorêczna +1",B_GetLearnCostTalent(other,NPC_TALENT_1H,1),0),DIA_Cord_START_TRAIN_1H_1);
	Info_AddChoice(DIA_Cord_START_TRAIN,B_BuildLearnString("Broñ jednorêczna +5",B_GetLearnCostTalent(other,NPC_TALENT_1H,5),0),DIA_Cord_START_TRAIN_1H_5);
	
	
};

func void DIA_Cord_START_TRAIN_1H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,100);
	Info_ClearChoices(DIA_Cord_START_TRAIN);
	Info_AddChoice(DIA_Cord_START_TRAIN,Dialog_Back,DIA_Cord_START_TRAIN_BACK);
	
	Info_AddChoice(DIA_Cord_START_TRAIN,B_BuildLearnString("Broñ jednorêczna +1",B_GetLearnCostTalent(other,NPC_TALENT_1H,1),0),DIA_Cord_START_TRAIN_1H_1);
	Info_AddChoice(DIA_Cord_START_TRAIN,B_BuildLearnString("Broñ jednorêczna +5",B_GetLearnCostTalent(other,NPC_TALENT_1H,5),0),DIA_Cord_START_TRAIN_1H_5);

};



func void DIA_Cord_START_TRAIN_1H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,100);
	Info_ClearChoices(DIA_Cord_START_TRAIN);
	Info_AddChoice(DIA_Cord_START_TRAIN,Dialog_Back,DIA_Cord_START_TRAIN_BACK);

	Info_AddChoice(DIA_Cord_START_TRAIN,B_BuildLearnString("Broñ jednorêczna +1",B_GetLearnCostTalent(other,NPC_TALENT_1H,1),0),DIA_Cord_START_TRAIN_1H_1);
	Info_AddChoice(DIA_Cord_START_TRAIN,B_BuildLearnString("Broñ jednorêczna +5",B_GetLearnCostTalent(other,NPC_TALENT_1H,5),0),DIA_Cord_START_TRAIN_1H_5);


};

func void DIA_Cord_START_TRAIN_BACK()
{
	Info_ClearChoices(DIA_Cord_START_TRAIN);
};


//========================================
//-----------------> SpottedNearMine
//========================================

INSTANCE DIA_Cord_SpottedNearMine (C_INFO)
{
   npc          = SLD_709_Cord;
   nr           = 1;
   condition    = DIA_Cord_SpottedNearMine_Condition;
   information  = DIA_Cord_SpottedNearMine_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Cord_SpottedNearMine_Condition()
{
    if (MIS_SupportForQuentin == LOG_RUNNING)

    {
    return TRUE;
    };
};


FUNC VOID DIA_Cord_SpottedNearMine_Info()
{
    AI_GotoNpc(self,hero); 
    AI_Output (self, other ,"DIA_Cord_SpottedNearMine_03_01"); //No wreszcie jesteœ!
    AI_Output (other, self ,"DIA_Cord_SpottedNearMine_15_02"); //Jak sytuacja?
    AI_Output (self, other ,"DIA_Cord_SpottedNearMine_03_03"); //Przys³a³ nas Lee. W okolicy kopalni i na œcie¿kach krêci³o siê sporo Stra¿ników. Pozbyliœmy siê ich. Gdy usiedliœmy, by odpocz¹æ pojawili siê kolejni Stra¿nicy i o¿ywieñcy.
    AI_Output (other, self ,"DIA_Cord_SpottedNearMine_15_04"); //Byliœcie wewn¹trz kopalni?
    AI_Output (self, other ,"DIA_Cord_SpottedNearMine_03_05"); //Oszala³eœ?! Przecie¿ tam roi siê od tych piekielnych istot. Nawet Stra¿nicy zaczêli uciekaæ. Wpadli w nasz¹ zasadzkê... he he.
    AI_Output (self, other ,"DIA_Cord_SpottedNearMine_15_06"); //My zostaniemy tutaj i bêdziemy pilnowaæ wejœcia. W ka¿dej chwili mog¹ siê pojawiæ kolejni Stra¿nicy. Dopilnujemy, ¿eby nie zaszli ciê od ty³u.
 
	//zadanie - wpis
	B_LogEntry                     (CH4_SupportForQuentin,"Sytuacja nie wygl¹da za dobrze. W okolicy kopalni krêci siê sporo Stra¿ników. Bêdê musia³ zostawiæ Najemników i Bandytów na stra¿y, a do kopalni zejœæ sam.");
    
	//exp 
	B_GiveXP (300);
	
	
};

//========================================
//-----------------> IHaveStone
//========================================

INSTANCE DIA_Cord_IHaveStone (C_INFO)
{
   npc          = SLD_709_Cord;
   nr           = 2;
   condition    = DIA_Cord_IHaveStone_Condition;
   information  = DIA_Cord_IHaveStone_Info;
   permanent	= FALSE;
   description	= "By³em w kopalni.";
};

FUNC INT DIA_Cord_IHaveStone_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Cord_SpottedNearMine))
   	&& (Npc_HasItems (hero, ItMi_Black_Crystal_ABM) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Cord_IHaveStone_Info()
{
    AI_Output (other, self ,"DIA_Cord_IHaveStone_15_01"); //By³em w kopalni.
	AI_Output (self, other ,"DIA_Cord_IHaveStone_03_02"); //Rozumiem ¿e wewn¹trz jest ju¿ bezpiecznie? Doskona³a robota. IdŸ powiadomiæ o tym Lee.
	AI_Output (self, other ,"DIA_Cord_IHaveStone_03_03"); //My tu jeszcze trochê powêszymy.
	AI_Output (other, self ,"DIA_Cord_IHaveStone_03_04"); //W porz¹dku.
	
	//nowe zadanie 
	MIS_NC_Mine = LOG_RUNNING;

    Log_CreateTopic          (CH4_NC_Mine, LOG_MISSION);
    Log_SetTopicStatus       (CH4_NC_Mine, LOG_RUNNING);
    B_LogEntry               (CH4_NC_Mine,"Oczyœci³em kopalniê ze z³ych si³. Cord zaproponowa³, aby poddaæ Lee pomys³ na wznowienie wydobycia.");
	
	//stare zadanie z kopalni¹
	MIS_SupportForQuentin = LOG_SUCCESS;
    Log_SetTopicStatus       (CH4_SupportForQuentin, LOG_SUCCESS);
	B_LogEntry               (CH4_SupportForQuentin,"Moje zadanie dobieg³o koñca. Po kolejne instrukcje powinienem siê udaæ do Lee.");
	B_GiveXP (500); 
	
    AI_StopProcessInfos	(self);
	//Npc_ExchangeRoutine (SLD_737_Torlof,"start");
	Npc_ExchangeRoutine (SLD_728_Jarvis,"start");
	Npc_ExchangeRoutine (SLD_709_Cord,"start");
	Npc_ExchangeRoutine (BAN_1605_Rocky,"start");
   AI_StopProcessInfos	(self);
};


//------------------------------------------------------------------------------------1.6.1-------------------------------------------------------------------
//========================================
//-----------------> Obozowisko Moroka
//========================================

INSTANCE DIA_Cord_HELLO1233 (C_INFO)
{
   npc          = SLD_709_Cord;
   nr           = 1;
   condition    = DIA_Cord_HELLO1233_Condition;
   information  = DIA_Cord_HELLO1233_Info;
   permanent	= FALSE;
     description	= "Ruszamy przeciw stra¿nikom z obozu Moroka.";
};

FUNC INT DIA_Cord_HELLO1233_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Lee_OBOZ1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Cord_HELLO1233_Info()
{
    AI_Output (other, self ,"DIA_Cord_HELLO1233_15_00");   //Lee kaza³ zaj¹æ siê obozowiskiem stra¿ników ze Starego Obozu. Na ich czele stoi niejaki Morok.
    AI_Output (self, other ,"DIA_Cord_HELLO1233_03_01");   //Nareszcie. Te sukinsyny zabi³y i obrabowa³y wielu moich znajomych. Czas z tym skoñczyæ.
    AI_Output (other, self ,"DIA_Cord_HELLO1233_15_02");   //Dok³adnie. Jesteœ gotowy?
    AI_Output (self, other ,"DIA_Cord_HELLO1233_03_03");   //Pewnie. Nie musisz dwa razy tego powtarzaæ!
    B_LogEntry                     (Obozowisko,"Pogada³em z Cordem. Z entuzjazmem odnosi siê on do wyprawy na Moroka i jego ludzi.");
};


//========================================
//-----------------> Obozowisko Moroka
//========================================

INSTANCE DIA_Cord_AAA (C_INFO)
{
   npc          = SLD_709_Cord;
   nr           = 1;
   condition    = DIA_Cord_AAA_Condition;
   information  = DIA_Cord_AAA_Info;
   permanent	= FALSE;
   description	= "Ruszajmy.";
};

FUNC INT DIA_Cord_AAA_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Cord_HELLO1233))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Cord_AAA_Info()
{
    AI_Output (other, self ,"DIA_Cord_AAA_15_00");   //Ruszajmy.
    AI_Output (self, other ,"DIA_Cord_AAA_03_01");   //Jasna sprawa.
	SLD_709_Cord.aivar[AIV_PARTYMEMBER] = TRUE;
    Npc_ExchangeRoutine (SLD_709_Cord ,"droga1"); 
};



//========================================
//-----------------> Obozowisko Moroka
//========================================

INSTANCE DIA_Cord_HELLO1233S (C_INFO)
{
   npc          = SLD_709_Cord;
   nr           = 1;
   condition    = DIA_Cord_HELLO1233S_Condition;
   information  = DIA_Cord_HELLO1233S_Info;
   permanent	= FALSE;
   description	= "Odzyska³em zrabowane towary.";
};

FUNC INT DIA_Cord_HELLO1233S_Condition()
{
    if (Npc_HasItems (hero, ItMi_StolenGoodsSLD)>=3)
	&& (Npc_KnowsInfo(hero,DIA_Lee_OBOZ1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Cord_HELLO1233S_Info()
{
    AI_Output (other, self ,"DIA_Cord_HELLO1233S_15_00");   //Odzyska³em zrabowane towary.
    AI_Output (self, other ,"DIA_Cord_HELLO1233S_03_01");   //Œwietnie. Pomœciliœmy wszystkich, którzy polegli z ich r¹k. 
    AI_Output (self, other ,"DIA_Cord_HELLO1233S_03_02");   //Do tego mamy ich ³up.
    AI_Output (other, self ,"DIA_Cord_HELLO1233S_15_03");   //Wracajmy.
    B_LogEntry(Obozowisko,"Rozmawia³em z Cordem i zameldowa³em o znalezieniu skradzionych rzeczy. Teraz pora na powrót do obóz i z³o¿enie koñcowego raportu Lee.");
	SLD_709_Cord.aivar[AIV_PARTYMEMBER] = FALSE;
	SLD_737_Torlof.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(sld_737_Torlof, "start");
	Npc_ExchangeRoutine(sld_709_Cord, "start");
};

//========================================
//-----------------> Prawdziwy wojownik
//========================================

INSTANCE DIA_Cord_WOJOWNIK (C_INFO)
{
   npc          = SLD_709_Cord;
   nr           = 1;
   condition    = DIA_Cord_WOJOWNIK_Condition;
   information  = DIA_Cord_WOJOWNIK_Info;
   important    = TRUE;
    
};

FUNC INT DIA_Cord_WOJOWNIK_Condition()
{
    if (Npc_GetTrueGuild(hero) == GIL_SLD)
	
{
    return 1;
};
};


FUNC VOID DIA_Cord_WOJOWNIK_Info()
{
    AI_Output (self, other ,"DIA_Cord_WOJOWNIK_03_00");    //Gratuluje, jesteœ teraz jednym z nas.
    AI_Output (self, other ,"DIA_Cord_WOJOWNIK_15_02");    //Wiem, ¿e ju¿ wiele razy dowiod³eœ swej wartoœci. Co powiesz na ma³e polowanie?
    AI_Output (other, self ,"DIA_Cord_WOJOWNIK_03_03");    //Zale¿y na co.
	AI_Output (self, other ,"DIA_Cord_WOJOWNIK_15_04");    //Na Cieniostwora. Wiem gdzie przebywa jeden osobnik. We dwóch na pewno damy mu radê.
	AI_Output (self, other ,"DIA_Cord_WOJOWNIK_15_05");    //Poza tym ka¿dy wojownik, nawet najlepszy potrzebuje æwiczeñ by podtrzymaæ formê.
	AI_Output (other, self ,"DIA_Cord_WOJOWNIK_03_06");    //Niech ci bêdzie, mo¿emy zapolowaæ na tego cieniostwora.
	AI_Output (self, other ,"DIA_Cord_WOJOWNIK_15_07");    //W takim razie przyjdŸ wieczorem.

	
	
	
	Log_CreateTopic (PrawdziwyWojownik,LOG_MISSION);
	Log_SetTopicStatus (PrawdziwyWojownik,LOG_RUNNING);
    B_LogEntry(PrawdziwyWojownik,"Cord chce, byœmy urz¹dzili sobie polowanie. Jego celem ma byæ Cieniostwór. Pomogê mu, w koñcu nie zaszkodzi trochê ma³ej rozrywki. Mam do niego przyjœæ wieczorem.");
	
};


//========================================
//-----------------> GO_SHADOW
//========================================

INSTANCE DIA_Cord_GO_SHADOW (C_INFO)
{
   npc          = SLD_709_Cord;
   nr           = 1;
   condition    = DIA_Cord_GO_SHADOW_Condition;
   information  = DIA_Cord_GO_SHADOW_Info;
   permanent	= FALSE;
   description	= "ChodŸmy zapolowaæ na tego cieniostwora.";
};

FUNC INT DIA_Cord_GO_SHADOW_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Cord_WOJOWNIK))
	&& (Wld_IsTime(18,00,05,00))
	
{
    return TRUE;
};
};
FUNC VOID DIA_Cord_GO_SHADOW_Info()
{
    AI_Output (other, self ,"DIA_Cord_GO_SHADOW_15_01"); //ChodŸmy zapolowaæ na tego cieniostwora.
    AI_Output (self, other ,"DIA_Cord_GO_SHADOW_03_02"); //Dobrze, nie powinien tak szybko opuœciæ swojego ¿erowiska.
	AI_Output (self, other ,"DIA_Cord_GO_SHADOW_03_03"); //Pod¹¿aj za mn¹. 
	Npc_ExchangeRoutine (SLD_709_Cord ,"CIENIOSTWOR"); 
	SLD_709_Cord.aivar[AIV_PARTYMEMBER] = TRUE;	
	Wld_InsertNpc(ShadowbeastCord, "PTH9");
	Wld_InsertNpc 	(ORG_40166_Rozbojnik,          "WP_BDT_CENTRE");
  	Wld_InsertNpc 	(ORG_40163_Rozbojnik,          "WP_BDT_CENTRE");
  	Wld_InsertNpc 	(ORG_40164_Rozbojnik,          "WP_BDT_CENTRE");
  	Wld_InsertNpc 	(ORG_40165_Rozbojnik,          "WP_BDT_CENTRE");
  	Wld_InsertNpc 	(SLD_40167_Najemnik,           "WP_BDT_CENTRE");
};
//========================================
//-----------------> PW_SUKINSYNY
//========================================

INSTANCE DIA_Cord_PW_SUKINSYNY (C_INFO)
{
   npc          = SLD_709_Cord;
   nr           = 1;
   condition    = DIA_Cord_PW_SUKINSYNY_Condition;
   information  = DIA_Cord_PW_SUKINSYNY_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Cord_PW_SUKINSYNY_Condition()
{
    if(Npc_KnowsInfo(hero,DIA_RozbojnikPW_HELLO1))
    && (Npc_IsDead (ORG_40166_Rozbojnik))
    && (Npc_IsDead (ORG_40165_Rozbojnik))
    && (Npc_IsDead (ORG_40164_Rozbojnik))
    && (Npc_IsDead (ORG_40163_Rozbojnik))
{
    return TRUE;
};
};
FUNC VOID DIA_Cord_PW_SUKINSYNY_Info()
{
    AI_Output (self, other ,"DIA_Cord_PW_SUKINSYNY_03_01"); //Nêdzne sukinsyny.
   
    AI_Output (self, other ,"DIA_Cord_PW_SUKINSYNY_03_02"); //Widaæ, ¿e ten Najemnik nieŸle oberwa³. Daj mu ten napój udrawiaj¹cy.
    AI_Output (other, self ,"DIA_Cord_PW_SUKINSYNY_15_03"); //W porz¹dku.
    AI_Output (self, other ,"DIA_Cord_PW_SUKINSYNY_03_04"); //Potem bêdziemy mogli ruszaæ dalej.
    CreateInvItems (self, ItFo_Potion_Health_01, 1);
    B_GiveInvItems (self, other, ItFo_Potion_Health_01, 1);
};

//========================================
//-----------------> PW_SLD
//========================================

INSTANCE DIA_Cord_PW_SLD (C_INFO)
{
   npc          = SLD_709_Cord;
   nr           = 2;
   condition    = DIA_Cord_PW_SLD_Condition;
   information  = DIA_Cord_PW_SLD_Info;
   permanent	= FALSE;
   description	= "Za³atwione.";
};

FUNC INT DIA_Cord_PW_SLD_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Najemnik_HELLO1))
{
    return TRUE;
};
};
FUNC VOID DIA_Cord_PW_SLD_Info()
{
    AI_Output (other, self ,"DIA_Cord_PW_SLD_15_01"); //Za³atwione.
    AI_Output (self, other ,"DIA_Cord_PW_SLD_03_02"); //To dobrze. Trzeba byæ solidarnym wobec swoich towarzyszy.
    AI_Output (other, self ,"DIA_Cord_PW_SLD_15_03"); //Mo¿emy ruszaæ? 
    AI_Output (self, other ,"DIA_Cord_PW_SLD_03_04"); //Oczywiœcie.
	Npc_ExchangeRoutine (SLD_709_Cord ,"CIENIOSTWOR2"); 
	B_LogEntry(PrawdziwyWojownik,"Ocaliliœmy Najemnika w potrzebie i daliœmy ³upnia zbójom. Pobity towarzysz dosta³ ode mnie napój uzdrawiaj¹cy. Teraz mo¿emy iœæ dalej w kierunku rewiru Cieniostwora, którego upatrzy³ sobie Cord.");
};
//========================================
//-----------------> Prawdziwy wojownik
//========================================

INSTANCE DIA_Cord_BESTIA (C_INFO)
{
   npc          = SLD_709_Cord;
   nr           = 1;
   condition    = DIA_Cord_BESTIA_Condition;
   information  = DIA_Cord_BESTIA_Info;
   important = 1;
    
};

FUNC INT DIA_Cord_BESTIA_Condition()
{
    if (Npc_IsDead (ShadowbeastCord))	
	&& (npc_knowsinfo (other,DIA_Cord_GO_SHADOW))
    {
    return 1;
    };
};


FUNC VOID DIA_Cord_BESTIA_Info()
{
    AI_Output (self, other ,"DIA_Cord_BESTIA_03_00");    //Twarda bestia.
    AI_Output (other, self ,"DIA_Cord_BESTIA_03_01");    //Tak, ale to zawsze wiêksza satysfakcja.
    AI_Output (self, other ,"DIA_Cord_BESTIA_15_02");    //Kolejny raz udowodni³eœ, ¿e œwietny z ciebie wojownik. Jako nagrodê weŸ trofeum z Cieniostora, i te 100 bry³ek rudy.
    AI_Output (other, self ,"DIA_Cord_BESTIA_03_03");    //Dziêki.
	AI_Output (self, other ,"DIA_Cord_BESTIA_15_04");    //Do zobaczenia w Obozie.
	AI_Output (other, self ,"DIA_Cord_BESTIA_03_05");    //Trzymaj siê.
	
	Npc_ExchangeRoutine (SLD_709_Cord ,"start"); 
	SLD_709_Cord.aivar[AIV_PARTYMEMBER] = FALSE;	
	Log_SetTopicStatus (PrawdziwyWojownik,LOG_SUCCESS);
    B_LogEntry(PrawdziwyWojownik,"Cieniostwór nie ¿yje. Cord jest zadowolony i wyp³aci³ mi nawet trochê rudy. Warto by³o siê trochê pomêczyæ a poza tym to dobre æwiczenie zdolnoœci bojowych.");	
    B_GiveXP (150);
};

instance dia_cord_pickpocket(c_info) {
    npc = sld_709_cord;
    nr = 900;
    condition = dia_cord_pickpocket_condition;
    information = dia_cord_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_cord_pickpocket_condition() {
	e_beklauen(baseThfChanceSLD, 30);
};

func void dia_cord_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_cord_pickpocket);
	info_addchoice(dia_cord_pickpocket, dialog_back, dia_cord_pickpocket_back);
	info_addchoice(dia_cord_pickpocket, dialog_pickpocket, dia_cord_pickpocket_doit);
};

func void dia_cord_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_cord_pickpocket);
};

func void dia_cord_pickpocket_back() {
    info_clearchoices(dia_cord_pickpocket);
};



