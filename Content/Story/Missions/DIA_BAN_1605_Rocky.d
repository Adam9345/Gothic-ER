//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Rocky_EXIT(C_INFO)
{
	npc             = BAN_1605_Rocky;
	nr              = 999;
	condition	= DIA_Rocky_EXIT_Condition;
	information	= DIA_Rocky_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Rocky_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Rocky_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> EqDoWalki
//========================================

INSTANCE DIA_Rocky_EqDoWalki (C_INFO)
{
   npc          = BAN_1605_Rocky;
   nr           = 1;
   condition    = DIA_Rocky_EqDoWalki_Condition;
   information  = DIA_Rocky_EqDoWalki_Info;
   permanent	= FALSE;
   description	= "Potrzebujemy ekwipunku.";
};

FUNC INT DIA_Rocky_EqDoWalki_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Quentin_nextWork22))
	&& (kapitel == 10)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rocky_EqDoWalki_Info()
{
    AI_Output (other, self ,"DIA_Rocky_EqDoWalki_15_01"); //Potrzebujemy ekwipunku.
    AI_Output (self, other ,"DIA_Rocky_EqDoWalki_03_02"); //S³ysza³em ju¿ o waszych ambitnych planach. Jak zwykle muszê zostaæ w Obozie.
    AI_Output (other, self ,"DIA_Rocky_EqDoWalki_15_03"); //Daj mi ten ekwipunek.
    AI_Output (self, other ,"DIA_Rocky_EqDoWalki_03_04"); //Nie tak prêdko. Myœlisz, ¿e w godzinê naprawiê 15 skórzanych pancerzy?!
    AI_Output (self, other ,"DIA_Rocky_EqDoWalki_03_05"); //Potrzebujê materia³ów.
    AI_Output (self, other ,"DIA_Rocky_EqDoWalki_03_06"); //Przynieœ mi 30 k³ów i 10 wilczych skór.
    AI_Output (self, other ,"DIA_Rocky_EqDoWalki_03_07"); //Tylko siê poœpiesz z tym wszystkim.
	
    MIS_materials4Rocky = LOG_RUNNING;

    Log_CreateTopic            (CH1_materials4Rocky, LOG_MISSION);
    Log_SetTopicStatus       (CH1_materials4Rocky, LOG_RUNNING);
    B_LogEntry                     (CH1_materials4Rocky,"Aby Rocky móg³ naprawiæ pancerze, potrzebuje 30 k³ów oraz 10 wilczych skór.");
};
//========================================
//-----------------> Towary
//========================================

INSTANCE DIA_Rocky_Towary (C_INFO)
{
   npc          = BAN_1605_Rocky;
   nr           = 1;
   condition    = DIA_Rocky_Towary_Condition;
   information  = DIA_Rocky_Towary_Info;
   permanent	= FALSE;
   description	= "Mam to, o co prosi³eœ.";
};

FUNC INT DIA_Rocky_Towary_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Rocky_EqDoWalki))
    && (Npc_HasItems (other, ItAt_Teeth_01) >=30)
    && (Npc_HasItems (other, ItAt_Wolf_01) >=10)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rocky_Towary_Info()
{
    AI_Output (other, self ,"DIA_Rocky_Towary_15_01"); //Mam to, o co prosi³eœ.
    AI_Output (self, other ,"DIA_Rocky_Towary_03_02"); //Œwietnie. Daj mi to.
    B_LogEntry                     (CH1_materials4Rocky,"Przynios³em Rockiemu materia³y potrzebne do naprawienia ekwipunku.");
    Log_SetTopicStatus       (CH1_materials4Rocky, LOG_SUCCESS);
    MIS_materials4Rocky = LOG_SUCCESS;
    B_GiveInvItems (other, self, ItAt_Wolf_01, 10);
    B_GiveInvItems (other, self, ItAt_Teeth_01, 30);


    B_GiveXP (300);
};

///////////////////////////////////////////////////////////////////////////////////////////
// Rocky
// Rozdzia³ 1
// Pogaduchy
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> POGADUCHY
//========================================

INSTANCE DIA_Rocky_POGADUCHY (C_INFO)
{
   npc          = BAN_1605_Rocky;
   nr           = 1;
   condition    = DIA_Rocky_POGADUCHY_Condition;
   information  = DIA_Rocky_POGADUCHY_Info;
   permanent	= FALSE;
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Rocky_POGADUCHY_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Rocky_POGADUCHY_Info()
{
    AI_Output (other, self ,"DIA_Rocky_POGADUCHY_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Rocky_POGADUCHY_03_02"); //Nazywam siê Rocky. By³em marynarzem, ale zszed³em na z³¹ drogê.
    AI_Output (self, other ,"DIA_Rocky_POGADUCHY_03_03"); //Tak czy inaczej, nie powinno ciê to obchodziæ.
};



//========================================
//-----------------> CHATA
//========================================

INSTANCE DIA_Rocky_CHATA (C_INFO)
{
   npc          = BAN_1605_Rocky;
   nr           = 1;
   condition    = DIA_Rocky_CHATA_Condition;
   information  = DIA_Rocky_CHATA_Info;
   permanent	= FALSE;
   description	= "Dlaczego dzielisz chatê z Quentinem?";
};

FUNC INT DIA_Rocky_CHATA_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Rocky_POGADUCHY))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rocky_CHATA_Info()
{
    AI_Output (other, self ,"DIA_Rocky_CHATA_15_01"); //Dlaczego dzielisz chatê z Quentinem?
    AI_Output (self, other ,"DIA_Rocky_CHATA_03_02"); //To proste - jesteœmy przyjació³mi. Pomog³em mu nie raz. Poza tym w Obozie jest zbyt ma³o miejsca na fanaberie.
    AI_Output (self, other ,"DIA_Rocky_CHATA_03_03"); //Quentin to rozumie, dlatego mieszkam u niego.
};




//========================================
//-----------------> GLUPIEC
//========================================

INSTANCE DIA_Rocky_GLUPIEC (C_INFO)
{
   npc          = BAN_1605_Rocky;
   nr           = 1;
   condition    = DIA_Rocky_GLUPIEC_Condition;
   information  = DIA_Rocky_GLUPIEC_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Rocky_GLUPIEC_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Quentin_WLADZA))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rocky_GLUPIEC_Info()
{
    AI_Output (self, other ,"DIA_Rocky_GLUPIEC_03_01"); //Do reszty zg³upia³eœ?
    AI_Output (self, other ,"DIA_Rocky_GLUPIEC_03_02"); //Tak siê nie gada z Quentinem. IdŸ do niego dopiero, gdy masz jakiœ wa¿ny powód. 
    AI_Output (self, other ,"DIA_Rocky_GLUPIEC_03_03"); //Lubi konkrety, nie lubi obcych. Kapujesz?
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> NAUKA
//========================================
var int log_rocky_nau;
INSTANCE DIA_Rocky_NAUKA (C_INFO)
{
   npc          = BAN_1605_Rocky;
   nr           = 3;
   condition    = DIA_Rocky_NAUKA_Condition;
   information  = DIA_Rocky_NAUKA_Info;
   permanent	= 1;
   description	= "Mo¿esz mnie czegoœ nauczyæ?";
};

FUNC INT DIA_Rocky_NAUKA_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Rocky_POGADUCHY))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rocky_NAUKA_Info()
{
    AI_Output (other, self ,"DIA_Rocky_NAUKA_15_01"); //Mo¿esz mnie czegoœ nauczyæ?
    AI_Output (self, other ,"DIA_Rocky_NAUKA_03_02"); //Poka¿ê ci, jak zwiêkszyæ si³ê i nauczê umiejêtnoœci z³odziejskich.
	if (log_rocky_nau == FALSE)
	{
		Log_CreateTopic (GE_TeacherBAN,LOG_NOTE);
		B_LogEntry		(GE_TeacherBAN,"Rocky mo¿e mi pomóc zwiêkszyæ si³ê oraz nauczyæ mnie umiejêtnoœci z³odziejskich.");
		log_rocky_nau = TRUE;
	};
    Info_ClearChoices		(DIA_Rocky_NAUKA);
	Info_AddChoice		(DIA_Rocky_NAUKA,DIALOG_BACK, DIA_Rocky_NAUKA_BACK);
	Info_AddChoice		(DIA_Rocky_NAUKA,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0),DIA_Rocky_NAUKA_STR5);
	Info_AddChoice		(DIA_Rocky_NAUKA,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),DIA_Rocky_NAUKA_STR1);
};

FUNC VOID DIA_Rocky_NAUKA_STR5()
{
	B_BuyAttributePoints(self,other,ATR_STRENGTH,5,T_VHIG);
    Info_ClearChoices		(DIA_Rocky_NAUKA);
	Info_AddChoice		(DIA_Rocky_NAUKA,DIALOG_BACK, DIA_Rocky_NAUKA_BACK);
	Info_AddChoice		(DIA_Rocky_NAUKA,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0),DIA_Rocky_NAUKA_STR5);
	Info_AddChoice		(DIA_Rocky_NAUKA,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),DIA_Rocky_NAUKA_STR1);
};

FUNC VOID DIA_Rocky_NAUKA_STR1()
{
	B_BuyAttributePoints(self,other,ATR_STRENGTH,1,T_VHIG);
    Info_ClearChoices		(DIA_Rocky_NAUKA);
	Info_AddChoice		(DIA_Rocky_NAUKA,DIALOG_BACK, DIA_Rocky_NAUKA_BACK);
	Info_AddChoice		(DIA_Rocky_NAUKA,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0),DIA_Rocky_NAUKA_STR5);
	Info_AddChoice		(DIA_Rocky_NAUKA,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),DIA_Rocky_NAUKA_STR1);
};

FUNC VOID DIA_Rocky_NAUKA_BACK()
{
    Info_ClearChoices	(DIA_Rocky_NAUKA);
};

// **************************************************
// 						 Lehrer
// **************************************************

INSTANCE DIA_Rocky_Lehrer (C_INFO)
{
	npc				= BAN_1605_Rocky;
	nr				= 2;
	condition		= DIA_Rocky_Lehrer_Condition;
	information		= DIA_Rocky_Lehrer_Info;
	permanent		= 1;
	description		= "Naucz mnie okradaæ."; 
};

FUNC INT DIA_Rocky_Lehrer_Condition()
{	
	if (Npc_KnowsInfo (hero, DIA_Rocky_POGADUCHY))
	{
		return 1;	
	};
};

FUNC VOID DIA_Rocky_Lehrer_Info()
{
	AI_Output (other, self,"DIA_Rocky_Lehrer_15_00"); //Naucz mnie okradaæ.
	AI_Output (self, other,"DIA_Rocky_Lehrer_05_02"); //Czego konkretnie chcia³byœ siê nauczyæ?



	Info_ClearChoices	(DIA_Rocky_Lehrer );
	Info_AddChoice		(DIA_Rocky_Lehrer,DIALOG_BACK																,DIA_Rocky_Lehrer_BACK);
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKPOCKET) == 1) 
	{
		Info_AddChoice		(DIA_Rocky_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_2,LPCOST_TALENT_PICKPOCKET_2,500)		,DIA_Rocky_Lehrer_Pickpocket2);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKPOCKET) == 0) 
	{
		Info_AddChoice		(DIA_Rocky_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_1,LPCOST_TALENT_PICKPOCKET_1,250)		,DIA_Rocky_Lehrer_Pickpocket);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKLOCK) == 1) 
	{
		Info_AddChoice	(DIA_Rocky_Lehrer,B_BuildLearnString(NAME_LearnPicklock_2,	LPCOST_TALENT_PICKLOCK_2,600)		,DIA_Rocky_Lehrer_Lockpick2);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKLOCK) == 0) 
	{
		Info_AddChoice	(DIA_Rocky_Lehrer,B_BuildLearnString(NAME_LearnPicklock_1,	LPCOST_TALENT_PICKLOCK_1,300)		,DIA_Rocky_Lehrer_Lockpick);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_SNEAK) == 0) 
	{
		Info_AddChoice	(DIA_Rocky_Lehrer,B_BuildLearnString(NAME_LearnSneak, 		LPCOST_TALENT_SNEAK,200)			,DIA_Rocky_Lehrer_Schleichen);
	};
};


func void DIA_Rocky_Lehrer_Schleichen()
{
	AI_Output (other, self,"DIA_Rocky_Lehrer_Schleichen_15_00"); //Chcia³bym nauczyæ siê poruszaæ bezszelestnie.
	if (Npc_HasItems (hero, itminugget) >=200)
		{
	if (Npc_GetTalentSkill(other, NPC_TALENT_SNEAK) == 0) 
	{
		AI_Output (self, other,"DIA_Rocky_Lehrer_Schleichen_05_01"); //Grunt to zachowaæ równowagê. Oprócz tego musisz nauczyæ siê kontrolowaæ swój oddech.
		AI_Output (self, other,"DIA_Rocky_Lehrer_Schleichen_05_02"); //Przyjmij odpowiedni¹ postawê, a nikt nie us³yszy twoich kroków.
		B_teachthieftalent(self,other,NPC_TALENT_SNEAK);
	};
	B_GiveInvItems (hero, self, itminugget, 200);
		Npc_RemoveInvItems (self, itminugget, 200);
		}
		else
		{
		AI_Output (self, other,"DIA_Rocky_Lehrer_NOORE"); //Nie ma nic za darmo!
		};
};

func void DIA_Rocky_Lehrer_Lockpick()
{
	AI_Output (other, self,"DIA_Rocky_Lehrer_Lockpick_15_00"); //Chcia³bym nauczyæ siê otwieraæ zamki.
	if (Npc_HasItems (hero, itminugget) >=300)
		{
	if (B_teachthieftalent(self,other,NPC_TALENT_PICKLOCK))
	{
		AI_Output (self, other,"DIA_Rocky_Lehrer_Lockpick_05_01"); //Nie w¹tpiê! Có¿... Pocz¹tki nie s¹ zbyt trudne.
		AI_Output (self, other,"DIA_Rocky_Lehrer_Lockpick_05_02"); //Przede wszystkim musisz uwa¿aæ, ¿eby nie z³amaæ wytrycha.
		AI_Output (self, other,"DIA_Rocky_Lehrer_Lockpick_05_03"); //Musisz byæ bardzo cierpliwy. Wtedy nie bêdziesz potrzebowa³ tylu wytrychów, he he!
	};
     	B_GiveInvItems (hero, self, itminugget, 300);
		Npc_RemoveInvItems (self, itminugget, 300);
		}
		else
		{
		AI_Output (self, other,"DIA_Rocky_Lehrer_NOORE"); //Nie ma nic za darmo!
		};
};

func void DIA_Rocky_Lehrer_Lockpick2()
{
	AI_Output (other, self,"DIA_Rocky_Lehrer_Lockpick2_15_00"); //Chcia³bym zostaæ ekspertem w otwieraniu zamków.
	if (Npc_HasItems (hero, itminugget) >=600)
		{
	if (B_teachthieftalent(self,other,NPC_TALENT_PICKLOCK))
	{
		AI_Output (self, other,"DIA_Rocky_Lehrer_Lockpick2_05_01"); //Gdy nabierzesz ju¿ trochê doœwiadczenia, nauczysz siê rozpoznawaæ dŸwiêk, jaki wydaje wytrych zanim pêknie.
		AI_Output (self, other,"DIA_Rocky_Lehrer_Lockpick2_05_02"); //Myœlê, ¿e powinieneœ sobie z tym poradziæ. Ws³uchaj siê uwa¿nie w dŸwiêki jakie wydaje otwierany zamek, a nie bêdziesz potrzebowa³ tylu wytrychów, he, he!
		AI_Output (self, other,"DIA_Rocky_Lehrer_Lockpick2_05_03"); //Prawdziwy mistrz w tym fachu potrafi otworzyæ ka¿d¹ skrzyniê nie ³ami¹c ani jednego wytrycha.
	};
	B_GiveInvItems (hero, self, itminugget, 600);
		Npc_RemoveInvItems (self, itminugget, 600);
		}
		else
		{
		AI_Output (self, other,"DIA_Rocky_Lehrer_NOORE"); //Nie ma nic za darmo!
		};
};

func void DIA_Rocky_Lehrer_Pickpocket()
{
	AI_Output (other, self,"DIA_Rocky_Lehrer_PICKPOCKET_15_00"); //Chcia³bym zostaæ zrêcznym kieszonkowcem!
	if (Npc_GetTalentSkill(other, NPC_TALENT_SNEAK) == 1)
	{
		if (Npc_HasItems (hero, itminugget) >=250)
		{
		if  (B_teachthieftalent(self,other,NPC_TALENT_PICKPOCKET))
		{
			AI_Output (self, other,"DIA_Rocky_Lehrer_PICKPOCKET_05_01"); //Chcia³byœ odci¹¿yæ parê osób z ich dobytku, co? No dobra.
			AI_Output (self, other,"DIA_Rocky_Lehrer_PICKPOCKET_05_02"); //Poka¿ê ci na czym powinieneœ siê skoncentrowaæ, ale szanse, ¿e zostaniesz z³apany bêd¹ nadal znaczne.
			AI_Output (self, other,"DIA_Rocky_Lehrer_PICKPOCKET_05_03"); //Podejmuj ryzyko wy³¹cznie jeœli w pobli¿u ofiary nie ma osób trzecich.
			AI_Output (self, other,"DIA_Rocky_Lehrer_PICKPOCKET_05_04"); //Tylko prawdziwy mistrz potrafi ukraœæ coœ pozostaj¹c ca³kowicie niezauwa¿onym!
		};
		B_GiveInvItems (hero, self, itminugget, 250);
		Npc_RemoveInvItems (self, itminugget, 250);
		}
		else
		{
		AI_Output (self, other,"DIA_Rocky_Lehrer_NOORE"); //Nie ma nic za darmo!
		};
	}
	else
	{
		AI_Output (self, other,"DIA_Rocky_lehrer_Pickpocket_05_05"); //Nie ma o czym mówiæ! Nie bêdzie z ciebie z³odzieja, dopóki nie nauczysz siê skradaæ!
	};
};

func void DIA_Rocky_Lehrer_Pickpocket2()
{
	AI_Output (other, self,"DIA_Rocky_Lehrer_Pickpocket2_15_00"); //Chcia³bym zostaæ mistrzem kieszonkowców!
	if (Npc_HasItems (hero, itminugget) >=500)
	{
	if (B_teachthieftalent(self,other,NPC_TALENT_PICKPOCKET))
	{		
		AI_Output (self, other,"DIA_Rocky_Lehrer_Pickpocket2_05_01"); //Có¿, chyba rzeczywiœcie potrafisz ju¿ wystarczaj¹co du¿o, ¿eby opanowaæ zaawansowane sztuczki.
		AI_Output (self, other,"DIA_Rocky_Lehrer_Pickpocket2_05_02"); //Ale musisz pamiêtaæ, ¿e nawet mistrzowie z³odziejscy od czasu do czasu zostaj¹ z³apani.
		AI_Output (self, other,"DIA_Rocky_Lehrer_Pickpocket2_05_03"); //Uwa¿aj na siebie.
	};
		B_GiveInvItems (hero, self, itminugget, 500);
		Npc_RemoveInvItems (self, itminugget, 500);
		}
		else
		{
		AI_Output (self, other,"DIA_Rocky_Lehrer_NOORE"); //Nie ma nic za darmo!
		};
};

func VOID DIA_Rocky_Lehrer_BACK()
{
	Info_ClearChoices	( DIA_Rocky_Lehrer );
};
///////////////////////////////////////////////////////////////////////////////////////////
// Quentin
// Rozdzia³ 1
// Zadania
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> RAYAN
//========================================

INSTANCE DIA_Rocky_RAYAN (C_INFO)
{
   npc          = BAN_1605_Rocky;
   nr           = 1;
   condition    = DIA_Rocky_RAYAN_Condition;
   information  = DIA_Rocky_RAYAN_Info;
   permanent	= FALSE;
   description	= "Co wiesz o œmierci Rayana?";
};

FUNC INT DIA_Rocky_RAYAN_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Jens_TalkWithSmith))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rocky_RAYAN_Info()
{
    AI_Output (other, self ,"DIA_Rocky_RAYAN_15_01"); //Co wiesz o œmierci Rayana?
    AI_Output (self, other ,"DIA_Rocky_RAYAN_03_02"); //Poza tym, ¿e to mi Quentin kaza³ wykopaæ grób to niezbyt wiele. Okolicznoœci chyba nie zosta³y wyjaœnione. 
	AI_Output (self, other ,"DIA_Rocky_RAYAN_03_03"); //Moim zdaniem napad³a go grupa goblinów. To by by³o logiczne. Gobliny przecie¿ nie ¿rej¹ ludzi, wiêc obrabowa³y cia³o i je zostawi³y. 
};

///////////////////////////////////////////////////////////////////////////////////////////
// Quentin
// Rozdzia³ 1
// Zadanie z napadem
///////////////////////////////////////////////////////////////////////////////////////////
func void HeroWaitingWRocky (var int t)
{
	AI_StopProcessInfos(self);		// [SK] ->muss hier stehen um das update zu gewährleisten
	self.aivar[AIV_INVINCIBLE]=FALSE;
	if	(Wld_IsTime(00,00,t,00))	
	{
		Wld_SetTime	(t,00);
	}
	else
	{
		t = t + 24;
		Wld_SetTime	(t,00);
	};

Wld_SetTime	(t,12);

};
//========================================
//-----------------> QUEST1
//========================================

INSTANCE DIA_Rocky_QUEST1 (C_INFO)
{
   npc          = BAN_1605_Rocky;
   nr           = 4;
   condition    = DIA_Rocky_QUEST1_Condition;
   information  = DIA_Rocky_QUEST1_Info;
   permanent	= FALSE;
   description	= "Podobno szykuje siê napad...";
};

FUNC INT DIA_Rocky_QUEST1_Condition()
{
    if (MIS_CH1ConvoyAttack == LOG_RUNNING) && (Npc_KnowsInfo (hero, DIA_Rocky_POGADUCHY))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rocky_QUEST1_Info()
{
    AI_Output (other, self ,"DIA_Rocky_QUEST1_15_01"); //Podobno szykuje siê napad...
    AI_Output (self, other ,"DIA_Rocky_QUEST1_03_02"); //Pora siê przyzwyczaiæ. To jednak bêdzie coœ ma³ego, bardziej dyskretnego. 
    AI_Output (self, other ,"DIA_Rocky_QUEST1_03_03"); //Dobra, do rzeczy! Mamy zaatakowaæ transport towarów do Starej Kopalni. Ian od czasu do czasu wysy³a listê rzeczy potrzebnych w kopalni. 
    AI_Output (self, other ,"DIA_Rocky_QUEST1_03_04"); //Wszystko o co poprosi trafia do kopalni. Najbli¿sza dostawa ma byæ wyj¹tkowo obfita. To szansa dla nas.
    AI_Output (other, self ,"DIA_Rocky_QUEST1_15_05"); //O której zaczynamy?
    AI_Output (self, other ,"DIA_Rocky_QUEST1_03_06"); //PrzyjdŸ tutaj w po³udnie. Konwój wyrusza kilka minut wczeœniej. Nie bêdziemy musieli czekaæ.
    AI_Output (other, self ,"DIA_Rocky_QUEST1_15_07"); //Dobra. Wkrótce siê pojawiê.
    B_LogEntry                     (CH1_ConvoyAttack,"Mam zjawiæ siê u Rockiego oko³o po³udnia, wtedy te¿ zaczniemy.");
	
	if !(Wld_IsTime     (12,00,13,00))
	{
	Info_ClearChoices	(DIA_Rocky_QUEST1);
	Info_AddChoice		(DIA_Rocky_QUEST1, "(Poczekaj do po³udnia)", Dia_Rocky_Q1_CONTINUE);
	};
};
Func void Dia_Rocky_Q1_CONTINUE()
{
    
    AI_Output (other, self ,"DIA_Rocky_QUEST1_15_01"); //Zaczekam z tob¹.
	Wld_PlayEffect("SLOW_BLITZ_FADE_IN_SLOW_OUT",hero,hero,0,0,0,FALSE);
	//PC_Rest (12);
	HeroWaitingWRocky(12);
	//Info_ClearChoices	(Dia_Rocky_Q1_CONTINUE);
	 AI_StopProcessInfos	(self);
  //  AI_Output (self, other ,"DIA_Rocky_QUEST1_03_02"); //Pora siê przyzwyczaiæ. To jednak bêdzie coœ ma³ego, bardziej dyskretnego. 


};
//========================================
//-----------------> ROZPIERDUCHA
//========================================

INSTANCE DIA_Rocky_ROZPIERDUCHA (C_INFO)
{
   npc          		= BAN_1605_Rocky;
   nr           		= 5;
   condition    	    = DIA_Rocky_ROZPIERDUCHA_Condition;
   information  	    = DIA_Rocky_ROZPIERDUCHA_Info;
   permanent	        = FALSE;
   description	        = "Ju¿ czas.";
};

FUNC INT DIA_Rocky_ROZPIERDUCHA_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Rocky_QUEST1))
    && (Wld_IsTime     (12,00,13,00))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rocky_ROZPIERDUCHA_Info()
{
    AI_Output (other, self ,"DIA_Rocky_ROZPIERDUCHA_15_01"); //Ju¿ czas.
    AI_Output (self, other ,"DIA_Rocky_ROZPIERDUCHA_03_02"); //Przygotuj broñ i chodŸ za mn¹.
      self.aivar[AIV_PARTYMEMBER] = TRUE;
      Npc_ExchangeRoutine (self,"atak");
	  Npc_ExchangeRoutine (GRD_5054_Gardist,"las");
	  B_ChangeGuild    (GRD_5054_Gardist,GIL_DMB);
	  Npc_ExchangeRoutine (GRD_5053_Gardist,"las");
	  B_ChangeGuild    (GRD_5053_Gardist,GIL_DMB);
	  Npc_ExchangeRoutine (GRD_5055_Eskorta,"las");
	  B_ChangeGuild    (GRD_5055_Eskorta,GIL_DMB);
	  Npc_ExchangeRoutine (VLK_5089_Tragaz,"las");
	  CreateInvItems (VLK_5089_Tragaz, eq_z_napadu3, 1);
	  B_ChangeGuild    (VLK_5089_Tragaz,GIL_DMB);
	  Npc_ExchangeRoutine (VLK_5090_Tragaz,"las");
	  CreateInvItems (VLK_5090_Tragaz, eq_z_napadu2, 1);
	   B_ChangeGuild    (VLK_5090_Tragaz,GIL_DMB);
	  Npc_ExchangeRoutine (VLK_5088_Tragaz,"las"); //1.24
	  CreateInvItems (VLK_5088_Tragaz, eq_z_napadu1, 1); //poprawiony bug 1.4.5.
	  B_ChangeGuild    (VLK_5088_Tragaz,GIL_DMB);

      AI_StopProcessInfos	(self);
};

//========================================
//-----------------> DOTARLI
//========================================

INSTANCE DIA_Rocky_DOTARLI (C_INFO)
{
   npc          = BAN_1605_Rocky;
   nr           = 6;
   condition    = DIA_Rocky_DOTARLI_Condition;
   information  = DIA_Rocky_DOTARLI_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Rocky_DOTARLI_Condition()
{
    if (Npc_GetDistToWP (self, "ATAK009") < 1000)
    && (Npc_KnowsInfo (hero, DIA_Rocky_ROZPIERDUCHA))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rocky_DOTARLI_Info()
{
    AI_Output (self, other ,"DIA_Rocky_DOTARLI_03_01"); //Jesteœmy. Zobacz, stoj¹ tam. Pewnie boj¹ siê wilków.
    AI_Output (self, other ,"DIA_Rocky_DOTARLI_03_02"); //Przypuszczam, ¿e siê naradzaj¹.
    AI_Output (other, self ,"DIA_Rocky_DOTARLI_15_03"); //Co mamy teraz robiæ?
    AI_Output (self, other ,"DIA_Rocky_DOTARLI_03_04"); //Jak to co, na nich!
    //self.aivar[AIV_PARTYMEMBER] = TRUE;
BAN_1605_Rocky.attribute[ATR_HITPOINTS] = 1000;
BAN_1605_Rocky.attribute[ATR_HITPOINTS_MAX] = 1000;
Npc_ExchangeRoutine (BAN_1605_Rocky,"atak2");

    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> WIN_O
//========================================

INSTANCE DIA_Rocky_WIN_O (C_INFO)
{
   npc          = BAN_1605_Rocky;
   nr           = 7;
   condition    = DIA_Rocky_WIN_O_Condition;
   information  = DIA_Rocky_WIN_O_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Rocky_WIN_O_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Rocky_DOTARLI))
    && (Npc_IsDead(GRD_5055_Eskorta))
    && (Npc_IsDead(GRD_5054_Gardist))
    && (Npc_IsDead(GRD_5053_Gardist))
	&& (Npc_IsDead(VLK_5089_Tragaz))
    && (Npc_IsDead(VLK_5090_Tragaz))
    && (Npc_IsDead(VLK_5088_Tragaz))
//dopisaæ tragarzy      //**** fix 6 sierpieñ 2012
{
    return TRUE;
    };
};


FUNC VOID DIA_Rocky_WIN_O_Info()
{
    AI_GotoNpc			(self,hero);
    AI_Output (self, other ,"DIA_Rocky_WIN_O_03_01"); //Œwietna robota, ch³opcze. Zabierz wszystko i wracamy.
    self.aivar[AIV_PARTYMEMBER] = FALSE;
    Npc_ExchangeRoutine (self,"start");
    AI_StopProcessInfos	(self);
    B_LogEntry                     (CH1_ConvoyAttack,"Uda³o nam siê. Rozgromiliœmy Stra¿ników. Pora wracaæ do Quentina.");

    B_GiveXP (XP_AtakNaKonwoj);
};

//========================================
//-----------------> GivEq
//========================================

INSTANCE DIA_Rocky_GivEq (C_INFO)
{
   npc          = BAN_1605_Rocky;
   nr           = 1;
   condition    = DIA_Rocky_GivEq_Condition;
   information  = DIA_Rocky_GivEq_Info;
   permanent	= FALSE;
   description	= "Rozdaæ ekwipunek Bandytom?";
};

FUNC INT DIA_Rocky_GivEq_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Rocky_Towary))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rocky_GivEq_Info()
{
    AI_Output (other, self ,"DIA_Rocky_GivEq_15_01"); //Rozdaæ ekwipunek Bandytom?
    AI_Output (self, other ,"DIA_Rocky_GivEq_03_02"); //Nie, sam to zrobiê. IdŸ do Quentina i powiedz, ¿e wszystko ju¿ zrobione.
};

///////////////////////////////////////////////////////////////////////////////////////////
// Rocky
// Rozdzia³ 4
// Odbijanie obozu
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> WtfRozwalaWobozie
//========================================

INSTANCE DIA_Rocky_WtfRozwalaWobozie (C_INFO)
{
   npc          = BAN_1605_Rocky;
   nr           = 1;
   condition    = DIA_Rocky_WtfRozwalaWobozie_Condition;
   information  = DIA_Rocky_WtfRozwalaWobozie_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Rocky_WtfRozwalaWobozie_Condition()
{
    if (MIS_GardistsCheckpoints == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rocky_WtfRozwalaWobozie_Info()
{
   // AI_Output (other, self ,"DIA_Rocky_WtfRozwalaWobozie_15_01"); //Co ci siê do cholery sta³o?
    AI_Output (self, other ,"DIA_Rocky_WtfRozwalaWobozie_03_01"); //Nawet nie wiesz, jak siê cieszê, ¿e widzê was w jednym kawa³ku. 
    AI_Output (other, self ,"DIA_Rocky_WtfRozwalaWobozie_15_02"); //Móg³byœ mi wyjaœniæ ca³¹ tê sprawê?
    AI_Output (self, other ,"DIA_Rocky_WtfRozwalaWobozie_03_03"); //Stra¿nicy znaleŸli Obóz! Ot co siê sta³o!
	AI_Output (other, self ,"DIA_Rocky_WtfRozwalaWobozie_15_04"); //Jak do tego dosz³o?
    AI_Output (self, other ,"DIA_Rocky_WtfRozwalaWobozie_03_05"); //Albo zauwa¿yli was, gdy schodziliœcie z gór, albo ktoœ nas zdradzi³...
    AI_Output (other, self ,"DIA_Rocky_WtfRozwalaWobozie_15_06"); //Nie ma teraz czasu szukaæ winnych.
    AI_Output (other, self ,"DIA_Rocky_WtfRozwalaWobozie_15_07"); //Jak du¿o Stra¿ników znajduje siê w Obozie?
    AI_Output (self, other ,"DIA_Rocky_WtfRozwalaWobozie_03_08"); //Ciê¿ko mi powiedzieæ... Musia³em szybko uciekaæ. Nie mia³em czasu na zwiady. Myœlê, ¿e jest tam kilkunastu dobrze wyszkolonych ¿o³nierzy. 
    AI_Output (other, self ,"DIA_Rocky_WtfRozwalaWobozie_15_09"); //Jakiœ plan?
    AI_Output (self, other ,"DIA_Rocky_WtfRozwalaWobozie_03_10"); //Z mojej strony nic... Pogadaj z Quentinem.
	
	MIS_GardistsInBC = LOG_RUNNING;

    Log_CreateTopic          (CH4_GardistsInBC, LOG_MISSION);
    Log_SetTopicStatus       (CH4_GardistsInBC, LOG_RUNNING);
    B_LogEntry               (CH4_GardistsInBC,"Obóz Bandytów zosta³ odnaleziony przez Stra¿ników. Na szczêœcie Rocky'emu uda³o siê w porê uciec i zd¹¿y³ nas ostrzec. Muszê porozmawiaæ z Quentinem o naszych kolejnych krokach.");
};

///////////////////////////////////////////////////////////////////////////////////////////
// Rocky
// Rozdzia³ 4
// Kopalnia
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> GoToMine
//========================================

INSTANCE DIA_Rocky_GoToMine (C_INFO)
{
   npc          = BAN_1605_Rocky;
   nr           = 1;
   condition    = DIA_Rocky_GoToMine_Condition;
   information  = DIA_Rocky_GoToMine_Info;
   permanent	= FALSE;
   description	= "Idziesz ze mn¹ do kopalni?";
};

FUNC INT DIA_Rocky_GoToMine_Condition()
{
    if (MIS_BanditsInAbadonedMine == LOG_RUNNING) && (Npc_KnowsInfo (hero, DIA_Raeuber_GoL))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rocky_GoToMine_Info()
{
    AI_Output (other, self ,"DIA_Rocky_GoToMine_15_01"); //Idziesz ze mn¹ do kopalni?
    AI_Output (self, other ,"DIA_Rocky_GoToMine_03_02"); //No jasne. Tylko potrzebujê jakiegoœ pancerza.
	AI_Output (self, other ,"DIA_Rocky_GoToMine_03_03"); //Skombinuj mi coœ, to pogadamy.
	//CreateInvItems  (self,BAU_ARMOR_H,1);
	//self.aivar[AIV_PARTYMEMBER] = TRUE;
	//Npc_ExchangeRoutine (self,"pomoc");
	//AI_StopProcessInfos	(self);
	MIS_RockyArmor = LOG_RUNNING;

    Log_CreateTopic      (CH4_RockyArmor, LOG_MISSION);
    Log_SetTopicStatus   (CH4_RockyArmor, LOG_RUNNING);
    B_LogEntry       	 (CH4_RockyArmor,"Je¿eli chcê, aby Rocky poszed³ ze mn¹ do kopalni, muszê za³atwiæ mu nowy pancerz.");

};
//========================================
//-----------------> AddArmor
//========================================

INSTANCE DIA_Rocky_AddArmor (C_INFO)
{
   npc          = BAN_1605_Rocky;
   nr           = 1;
   condition    = DIA_Rocky_AddArmor_Condition;
   information  = DIA_Rocky_AddArmor_Info;
   permanent	= 1;
   description	= "Mam dla ciebie pancerz...";
};

FUNC INT DIA_Rocky_AddArmor_Condition()
{
    if (MIS_RockyArmor == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rocky_AddArmor_Info()
{
    AI_Output (other, self ,"DIA_Rocky_AddArmor_15_01"); //Mam dla ciebie pancerz...
    AI_Output (self, other ,"DIA_Rocky_AddArmor_03_02"); //Œwietnie. Co dla mnie masz?

    Info_ClearChoices		(DIA_Rocky_AddArmor);
	Info_AddChoice		(DIA_Rocky_AddArmor, DIALOG_BACK, DIA_Quentin_DOOBOZU_BACK);
	if (Npc_HasItems (other, BAU_ARMOR_H) >=1)
    {	
    Info_AddChoice		(DIA_Rocky_AddArmor, "ODDAJ: ciê¿ka zbroja Bandyty", DIA_Quentin_DOOBOZU_BANDITOSMID);
	};
	
	if (Npc_HasItems (other, PiratArmor) >=1)
    {		
    Info_AddChoice		(DIA_Rocky_AddArmor, "ODDAJ: strój pirata", DIA_Quentin_DOOBOZU_PIRAT);
	};

};

FUNC VOID DIA_Quentin_DOOBOZU_BACK ()
{
	Info_ClearChoices		(DIA_Rocky_AddArmor);
};


FUNC VOID DIA_Quentin_DOOBOZU_BANDITOSMID()
{
    AI_Output (other, self ,"DIA_Quentin_DOOBOZU_BANDITOSMID_15_01"); //Oto moja stara zbroja.
    AI_Output (self, other ,"DIA_Quentin_DOOBOZU_BANDITOSMID_03_02"); //Wprawdzie to nic nadzwyczajnego, ale dziêki.
    AI_Output (self, other ,"DIA_Quentin_DOOBOZU_BANDITOSMID_03_03"); //Œwietna robota.
	B_giveXP (300);
	MIS_RockyArmor = LOG_SUCCESS;
    Log_SetTopicStatus       (CH4_RockyArmor, LOG_SUCCESS);
    B_LogEntry       (CH4_RockyArmor,"Da³em Rockiemu moj¹ star¹ zbrojê. Jest gotowy ¿eby wyruszyæ.");
	B_GiveInvItems      (hero, self, BAU_ARMOR_H, 1);
    Info_ClearChoices		(DIA_Rocky_AddArmor);
	DIA_Rocky_AddArmor.permanent	= 0;
	AI_EquipBestArmor	(self); 
    //AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Quentin_DOOBOZU_PIRAT()
{
    AI_Output (other, self ,"DIA_Quentin_DOOBOZU_PIRAT_15_01"); //Oto strój pirata.
    AI_Output (self, other ,"DIA_Quentin_DOOBOZU_PIRAT_03_02"); //Pirata? Wygl¹da fajnie, ale nie jest to raczej prawdziwy pancerz.
    AI_Output (self, other ,"DIA_Quentin_DOOBOZU_PIRAT_03_03"); //Wola³bym coœ mocniejszego, ale skoro nie masz nic innego. Dziêki.
	B_giveXP (300);
	MIS_RockyArmor = LOG_SUCCESS;
    Log_SetTopicStatus       (CH4_RockyArmor, LOG_SUCCESS);
    B_LogEntry       (CH4_RockyArmor,"Da³em Rockiemu strój pirata. Jest gotowy ¿eby wyruszyæ.");
	B_GiveInvItems      (hero, self, PiratArmor, 1);
    Info_ClearChoices		(DIA_Rocky_AddArmor);
	DIA_Rocky_AddArmor.permanent	= 0;
	AI_EquipBestArmor	(self); 
    //AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Follow
//========================================

INSTANCE DIA_Rocky_Follow (C_INFO)
{
   npc          = BAN_1605_Rocky;
   nr           = 1;
   condition    = DIA_Rocky_Follow_Condition;
   information  = DIA_Rocky_Follow_Info;
   permanent	= FALSE;
   description	= "ChodŸ za mn¹.";
};

FUNC INT DIA_Rocky_Follow_Condition()
{
    if (MIS_RockyArmor == LOG_SUCCESS) 
    {
    return TRUE;
    };
};

FUNC VOID DIA_Rocky_Follow_Info()
{
    AI_Output (other, self ,"DIA_Rocky_Follow_15_01"); //ChodŸ za mn¹.
    AI_Output (self, other ,"DIA_Rocky_Follow_03_02"); //Jasne!
    self.aivar[AIV_PARTYMEMBER] = TRUE;
    Npc_ExchangeRoutine (BAN_1605_Rocky,"odb");
	AI_StopProcessInfos	(self);
	
	//co to za syf?
    RockyRobiZaDoyle  = false;
};


//========================================
//-----------------> BackFromMine
//========================================

INSTANCE DIA_Rocky_BackFromMine (C_INFO)
{
   npc          = BAN_1605_Rocky;
   nr           = 1;
   condition    = DIA_Rocky_BackFromMine_Condition;
   information  = DIA_Rocky_BackFromMine_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Rocky_BackFromMine_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Raeuber_NoNareszcie))
    && (Npc_GetDistToWP (self, "CAMP01") < 1000)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rocky_BackFromMine_Info()
{
    Ai_GotoNpc(Self,hero);
    AI_Output (self, other ,"DIA_Rocky_BackFromMine_03_01"); //Nareszcie wróci³eœ! Co z kopalni¹?
    AI_Output (other, self ,"DIA_Rocky_BackFromMine_15_02"); //Zosta³a zajêta przez o¿ywieñców, których najprawdopodobniej przywo³uje jakiœ magiczny artefakt. 
    if (Npc_HasItems (other, Focus_Corristo) >=1)
    {
        AI_Output (other, self ,"DIA_Rocky_BackFromMine_15_03"); //Mam go przy sobie. Pozby³em siê te¿ pozosta³ych niedobitków. Mo¿na teraz bezpiecznie zejœæ do szybu.
        AI_Output (self, other ,"DIA_Rocky_BackFromMine_03_04"); //To ju¿ robota nie dla mnie.
    }
    else
    {
        AI_Output (self, other ,"DIA_Rocky_BackFromMine_03_05"); //I co teraz zrobisz?
        AI_Output (other, self ,"DIA_Rocky_BackFromMine_15_06"); //Muszê odszukaæ ten artefakt i coœ z nim zrobiæ.
    };
    AI_StopProcessInfos	(self);
};

///////////////////////////////////////////
// INNE GILDIE - NIE BANDYTA
// WTEDY ROCKY ROBI ZA DOYLE'A
// NIE WIEM PO CHUJ, ALE ROBI
//////////////////////////////////////////


//========================================
//-----------------> THX_ZA_ROBOTE
//========================================

INSTANCE DIA_Rocky_THX_ZA_ROBOTE (C_INFO)
{
   npc          = BAN_1605_Rocky;
   nr           = 1;
   condition    = DIA_Rocky_THX_ZA_ROBOTE_Condition;
   information  = DIA_Rocky_THX_ZA_ROBOTE_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Rocky_THX_ZA_ROBOTE_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Cord_IHaveStone))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rocky_THX_ZA_ROBOTE_Info()
{
    Ai_GotoNpc(self,hero);
    AI_Output (self, other ,"DIA_Rocky_THX_ZA_ROBOTE_03_01"); //Stary, kolejny raz ratujesz nam ty³ek. Odda³eœ niecenion¹ pomoc Bandytom.
    AI_Output (self, other ,"DIA_Rocky_THX_ZA_ROBOTE_03_02"); //Wielkie dziêki. Kopalnia jest nasza: Bandytów i Najemników, nie Gomeza. Dobra robota. 
    AI_Output (self, other ,"DIA_Rocky_THX_ZA_ROBOTE_03_03"); //Masz tu trochê rudy.
    CreateInvItems (self, ItMiNugget, 100);
    B_GiveInvItems (self, other,ItMiNugget, 100);
    AI_StopProcessInfos	(self);
};
//---------------------------------------------------------------------ER+

//========================================
//-----------------> TMQ_MISSION
//========================================

INSTANCE DIA_Rocky_TMQ_MISSION (C_INFO)
{
   npc          = BAN_1605_Rocky;
   nr           = 1;
   condition    = DIA_Rocky_TMQ_MISSION_Condition;
   information  = DIA_Rocky_TMQ_MISSION_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Rocky_TMQ_MISSION_Condition()
{
if (Kapitel == 5)
&& (Npc_GetTrueGuild(hero) == GIL_BAU)
&& (Npc_HasItems(hero,ItarRuneTeleport1) >=1)
{
    return TRUE;
};
};
FUNC VOID DIA_Rocky_TMQ_MISSION_Info()
{
    AI_Output (self, other ,"DIA_Rocky_TMQ_MISSION_03_01"); //Hej, muszê z tob¹ bardzo powa¿nie porozmawiaæ.
    AI_Output (other, self ,"DIA_Rocky_TMQ_MISSION_15_02"); //O co chodzi?
    AI_Output (self, other ,"DIA_Rocky_TMQ_MISSION_03_03"); //O Quentina. Co rusz wspomina, ¿e wkrótce wyruszy gdzieœ a w czasie tej misji ja i ty bêdziemy go zastêpowaæ...
    AI_Output (other, self ,"DIA_Rocky_TMQ_MISSION_15_04"); //Co to za misja?
    AI_Output (self, other ,"DIA_Rocky_TMQ_MISSION_03_05"); //Tego jeszcze nie zdradzi³. Pogadaj z nim, mo¿e tobie uda siê to z niego wydobyæ.
    AI_Output (other, self ,"DIA_Rocky_TMQ_MISSION_15_06"); //Tak zrobiê.
	Log_CreateTopic		(TajnaMisjaQuentina,	LOG_MISSION);
	Log_SetTopicStatus	(TajnaMisjaQuentina,	LOG_RUNNING);
	B_LogEntry          (TajnaMisjaQuentina,"Rocky wspomina³, ¿e Quentin wspomina coœ o swojej tajnej misji. Muszê siê dowiedzieæ o co w tym chodzi.");
};

//========================================
//-----------------> TMQ_GRD
//========================================

INSTANCE DIA_Rocky_TMQ_GRD (C_INFO)
{
   npc          = BAN_1605_Rocky;
   nr           = 1;
   condition    = DIA_Rocky_TMQ_GRD_Condition;
   information  = DIA_Rocky_TMQ_GRD_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Rocky_TMQ_GRD_Condition()
{ 
if  (Quentin_TMQ_Day != Wld_GetDay())
&&  (Npc_KnowsInfo(hero,DIA_Quentin_TMQ_LO))
{
    return TRUE;
};
};
FUNC VOID DIA_Rocky_TMQ_GRD_Info()
{
    AI_Output (self, other ,"DIA_Rocky_TMQ_GRD_03_01"); //Stra¿nicy pojmali Quentina!
    AI_Output (other, self ,"DIA_Rocky_TMQ_GRD_15_02"); //Co takiego?! Sk¹d niby o tym wiesz?
    AI_Output (self, other ,"DIA_Rocky_TMQ_GRD_03_03"); //Ujêto go w pobli¿u Nowego Obozu. Doniós³ nam o tym jeden ze szkodników Laresa... Nazywa³ siê chyba Aidan.
    AI_Output (other, self ,"DIA_Rocky_TMQ_GRD_15_04"); //Co jeszcze wiadomo?
    AI_Output (self, other ,"DIA_Rocky_TMQ_GRD_03_05"); //Nic. Dlatego trzeba siê tam szybko udaæ.
    AI_Output (other, self ,"DIA_Rocky_TMQ_GRD_15_06"); //ChodŸmy tam!
    AI_Output (self, other ,"DIA_Rocky_TMQ_GRD_03_07"); //Za³atwi³em ju¿ zastêpstwo na czas gdy nas nie bêdzie.
	B_LogEntry          (TajnaMisjaQuentina,"Rocky przekaza³ mi wstrz¹saj¹ce wieœci. Ponoæ Quentin zosta³ pojmany przez Stra¿ników nieopodal Nowego Obozu, doniós³ o tym myœliwy Aidan. Musimy ruszyæ mu na ratunek, wpierw móg³bym jednak dok³adnie wypytaæ myœliwego o to zajœcie...");
};

//========================================
//-----------------> TMQ_PATH
//========================================

INSTANCE DIA_Rocky_TMQ_PATH (C_INFO)
{
   npc          = BAN_1605_Rocky;
   nr           = 2;
   condition    = DIA_Rocky_TMQ_PATH_Condition;
   information  = DIA_Rocky_TMQ_PATH_Info;
   permanent	= FALSE;
   description	= "W drogê!";
};

FUNC INT DIA_Rocky_TMQ_PATH_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Rocky_TMQ_GRD))
{
    return TRUE;
};
};
FUNC VOID DIA_Rocky_TMQ_PATH_Info()
{
    AI_Output (other, self ,"DIA_Rocky_TMQ_PATH_15_01"); //W drogê!
    AI_Output (self, other ,"DIA_Rocky_TMQ_PATH_03_02"); //Pod¹¿aj za mn¹.
	BAN_1605_Rocky.aivar[AIV_PARTYMEMBER] = TRUE;
	
	//AI_StopProcessInfos	(self);
    Info_ClearChoices	(DIA_Rocky_TMQ_PATH);
    Info_AddChoice		(DIA_Rocky_TMQ_PATH, "(Szybka podró¿)", DIA_Rocky_TMQ_FastTravel);
};

FUNC VOID DIA_Rocky_TMQ_FastTravel()
{
 
	Wld_PlayEffect("SLOW_BLITZ_FADE_IN_SLOW_OUT",hero,hero,0,0,0,FALSE);
    Npc_ExchangeRoutine (BAN_1605_Rocky,"TMQPTH");

   
    AI_StopProcessInfos	(self);
	AI_Teleport(BAN_1605_Rocky,"PATH_OC_NC_14");
	AI_Teleport(hero,"PATH_OC_NC_14");
//hero.aivar[AIV_INVINCIBLE]=FALSE;
};
//========================================
//-----------------> TMQ_PATHTWO
//========================================

INSTANCE DIA_Rocky_TMQ_PATHTWO (C_INFO)
{
   npc          = BAN_1605_Rocky;
   nr           = 1;
   condition    = DIA_Rocky_TMQ_PATHTWO_Condition;
   information  = DIA_Rocky_TMQ_PATHTWO_Info;
   permanent	= FALSE;
   description	= "Ruszajmy dalej.";
};

FUNC INT DIA_Rocky_TMQ_PATHTWO_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Aidan_TMQ_BOSS))
{
    return TRUE;
};
};
FUNC VOID DIA_Rocky_TMQ_PATHTWO_Info()
{
    AI_Output (other, self ,"DIA_Rocky_TMQ_PATHTWO_15_01"); //Ruszajmy dalej.
    AI_Output (self, other ,"DIA_Rocky_TMQ_PATHTWO_03_02"); //Jasne.
    Npc_ExchangeRoutine (BAN_1605_Rocky,"TMQPTHTWO");
    Npc_SetPermAttitude (Ban_1610_Quentin, ATT_FRIENDLY);
    B_ChangeGuild    (Ban_1610_Quentin,GIL_MEATBUG);
	Ban_1610_Quentin.guild = GIL_MEATBUG;
    AI_StopProcessInfos	(self);
};

instance dia_rocky_pickpocket(c_info) {
    npc = ban_1605_rocky;
    nr = 900;
    condition = dia_rocky_pickpocket_condition;
    information = dia_rocky_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_rocky_pickpocket_condition() 
{
	e_beklauen(baseThfChanceORG,30);
};

func void dia_rocky_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_rocky_pickpocket);
	info_addchoice(dia_rocky_pickpocket, dialog_back, dia_rocky_pickpocket_back);
	info_addchoice(dia_rocky_pickpocket, dialog_pickpocket, dia_rocky_pickpocket_doit);
};

func void dia_rocky_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_rocky_pickpocket);
};

func void dia_rocky_pickpocket_back() {
    info_clearchoices(dia_rocky_pickpocket);
};
