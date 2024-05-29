//poprawione i sprawdzone -  

// ************************ EXIT **************************

instance  VLK_584_Snipes_Exit (C_INFO)
{
	npc			=  VLK_584_Snipes;
	nr			=  999;
	condition	=  VLK_584_Snipes_Exit_Condition;
	information	=  VLK_584_Snipes_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  VLK_584_Snipes_Exit_Condition()
{
	return 1;
};

FUNC VOID  VLK_584_Snipes_Exit_Info()
{
	AI_Output			(other, self,"Info_Exit_Info_15_001"); //Do zobaczenia nastêpnym razem!
	AI_Output			(self, other,"Info_Exit_Info_07_02"); //Jasne!
	
	AI_StopProcessInfos	( self );
};

// **************** Edycja Rozszerzona - nauka ************************
//========================================
//-----------------> ABOUT_TEACH
//========================================

INSTANCE DIA_Snipes_ABOUT_TEACH (C_INFO)
{
   npc          = VLK_584_Snipes;
   nr           = 2;
   condition    = DIA_Snipes_ABOUT_TEACH_Condition;
   information  = DIA_Snipes_ABOUT_TEACH_Info;
   permanent	= FALSE;
   description	= "Mo¿esz mnie czegoœ nauczyæ?";
};

FUNC INT DIA_Snipes_ABOUT_TEACH_Condition()
{
    return TRUE;
};


FUNC VOID DIA_Snipes_ABOUT_TEACH_Info()
{
    AI_Output (other, self ,"DIA_Snipes_ABOUT_TEACH_15_01"); //Mo¿esz mnie czegoœ nauczyæ?
    AI_Output (self, other ,"DIA_Snipes_ABOUT_TEACH_03_02"); //Ha! Dawno nikt mnie o to nie pyta³!
    AI_Output (self, other ,"DIA_Snipes_ABOUT_TEACH_03_03"); //Mogê nauczyæ ciê jak opró¿niaæ sakiewki i skrzynie.
	//notatka
	Log_CreateTopic   	(GE_TeacherOM,LOG_NOTE);
	B_LogEntry			(GE_TeacherOM,"Snipes mo¿e mnie nauczyæ okradania, skradania oraz otwierania zamków.");
};

// **************************************************
// 						 Lehrer
// **************************************************

INSTANCE DIA_Snipes_Lehrer (C_INFO)
{
	npc				= VLK_584_Snipes;
	nr				= 2;
	condition		= DIA_Snipes_Lehrer_Condition;
	information		= DIA_Snipes_Lehrer_Info;
	permanent		= 1;
	description		= "Czego mo¿esz mnie nauczyæ?"; 
};

FUNC INT DIA_Snipes_Lehrer_Condition()
{	
	if (Npc_KnowsInfo (hero,DIA_Snipes_ABOUT_TEACH))
	{
		return 1;	
	};
};

FUNC VOID DIA_Snipes_Lehrer_Info()
{
	AI_Output (other, self,"DIA_Snipes_Lehrer_15_00"); //Chcia³bym nauczyæ siê sztuki z³odziejskiej?
	AI_Output (self, other,"DIA_Snipes_Lehrer_05_01"); //A czego dok³adnie chcesz wiedzieæsiê nauczyæ?
	

	Info_ClearChoices	(DIA_Snipes_Lehrer );
	Info_AddChoice		(DIA_Snipes_Lehrer,DIALOG_BACK																,DIA_Snipes_Lehrer_BACK);
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKPOCKET) == 1) 
	{
		Info_AddChoice		(DIA_Snipes_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_2,LPCOST_TALENT_PICKPOCKET_2,500)		,DIA_Snipes_Lehrer_Pickpocket2);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKPOCKET) == 0) 
	{
		Info_AddChoice		(DIA_Snipes_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_1,LPCOST_TALENT_PICKPOCKET_1,250)		,DIA_Snipes_Lehrer_Pickpocket);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKLOCK) == 1) 
	{
		Info_AddChoice	(DIA_Snipes_Lehrer,B_BuildLearnString(NAME_LearnPicklock_2,	LPCOST_TALENT_PICKLOCK_2,600)		,DIA_Snipes_Lehrer_Lockpick2);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKLOCK) == 0) 
	{
		Info_AddChoice	(DIA_Snipes_Lehrer,B_BuildLearnString(NAME_LearnPicklock_1,	LPCOST_TALENT_PICKLOCK_1,300)		,DIA_Snipes_Lehrer_Lockpick);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_SNEAK) == 0) 
	{
		Info_AddChoice	(DIA_Snipes_Lehrer,B_BuildLearnString(NAME_LearnSneak, 		LPCOST_TALENT_SNEAK,200)			,DIA_Snipes_Lehrer_Schleichen);
	};
};


func void DIA_Snipes_Lehrer_Schleichen()
{
	AI_Output (other, self,"DIA_Snipes_Lehrer_Schleichen_15_00"); //Chcia³bym nauczyæ siê poruszaæ bezszelestnie.
	if (Npc_HasItems (hero, itminugget) >=200)
		{
	if  (B_teachthieftalent(self,other,NPC_TALENT_SNEAK))
	{
		AI_Output (self, other,"DIA_Snipes_Lehrer_Schleichen_05_01"); //Grunt to zachowaæ równowagê. Oprócz tego musisz nauczyæ siê kontrolowaæ swój oddech.
		AI_Output (self, other,"DIA_Snipes_Lehrer_Schleichen_05_02"); //Przyjmij odpowiedni¹ postawê, a nikt nie us³yszy twoich kroków.
	};
	B_GiveInvItems (hero, self, itminugget, 200);
		Npc_RemoveInvItems (self, itminugget, 200);
		}
		else
		{
		AI_Output (self, other,"DIA_Snipes_Lehrer_NOORE"); //Nie ma nic za darmo!
		};
};

func void DIA_Snipes_Lehrer_Lockpick()
{
	AI_Output (other, self,"DIA_Snipes_Lehrer_Lockpick_15_00"); //Chcia³bym nauczyæ siê otwieraæ zamki.
	if (Npc_HasItems (hero, itminugget) >=300)
		{
	if (B_teachthieftalent(self,other,NPC_TALENT_PICKLOCK))
	{
		AI_Output (self, other,"DIA_Snipes_Lehrer_Lockpick_05_01"); //Nie w¹tpiê! Có¿... Pocz¹tki nie s¹ zbyt trudne.
		AI_Output (self, other,"DIA_Snipes_Lehrer_Lockpick_05_02"); //Przede wszystkim musisz uwa¿aæ, ¿eby nie z³amaæ wytrycha.
		AI_Output (self, other,"DIA_Snipes_Lehrer_Lockpick_05_03"); //B¹dŸ cierpliwy, a nie bêdziesz potrzebowa³ zbyt wiel wytrychów.
	};
	B_GiveInvItems (hero, self, itminugget, 300);
		Npc_RemoveInvItems (self, itminugget, 300);
		}
		else
		{
		AI_Output (self, other,"DIA_Snipes_Lehrer_NOORE"); //Nie ma nic za darmo!
		};
};

func void DIA_Snipes_Lehrer_Lockpick2()
{
	AI_Output (other, self,"DIA_Snipes_Lehrer_Lockpick2_15_00"); //Chcia³bym zostaæ ekspertem w otwieraniu zamków.
	if (Npc_HasItems (hero, itminugget) >=600)
		{
	if (B_teachthieftalent(self,other,NPC_TALENT_PICKLOCK))
	{
		AI_Output (self, other,"DIA_Snipes_Lehrer_Lockpick2_05_01"); //Gdy nabierzesz ju¿ trochê doœwiadczenia, nauczysz siê rozpoznawaæ dŸwiêk, jaki wydaje wytrych zanim pêknie.
		AI_Output (self, other,"DIA_Snipes_Lehrer_Lockpick2_05_02"); //To charakterystyczne trzeszczenie prê¿¹cego siê wytrychu. Ws³uchaj siê uwa¿nie w dŸwiêki jakie wydaje otwierany zamek, a liczba potzrebnych ci wytrychów bêdzie maleæ.
		AI_Output (self, other,"DIA_Snipes_Lehrer_Lockpick2_05_03"); //Prawdziwy mistrz w tym fachu potrafi otworzyæ ka¿d¹ skrzyniê nie ³ami¹c ani jednego wytrycha.
	};
	B_GiveInvItems (hero, self, itminugget, 600);
		Npc_RemoveInvItems (self, itminugget, 600);
		}
		else
		{
		AI_Output (self, other,"DIA_Snipes_Lehrer_NOORE"); //Nie ma nic za darmo!
		};
};

func void DIA_Snipes_Lehrer_Pickpocket()
{
	AI_Output (other, self,"DIA_Snipes_Lehrer_PICKPOCKET_15_00"); //Chcia³bym zostaæ zrêcznym kieszonkowcem!
	if (Npc_GetTalentSkill(other, NPC_TALENT_SNEAK) == 1)
	{
		if (Npc_HasItems (hero, itminugget) >=250)
		{
		if (B_teachthieftalent(self,other,NPC_TALENT_PICKPOCKET))
		{
			AI_Output (self, other,"DIA_Snipes_Lehrer_PICKPOCKET_05_01"); //Chcia³byœ odci¹¿yæ parê osób z ich dobytku, co? No dobra.
			AI_Output (self, other,"DIA_Snipes_Lehrer_PICKPOCKET_05_02"); //Poka¿ê ci na czym powinieneœ siê skoncentrowaæ, ale szanse, ¿e zostaniesz z³apany bêd¹ nadal znaczne.
			AI_Output (self, other,"DIA_Snipes_Lehrer_PICKPOCKET_05_03"); //Podejmuj ryzyko wy³¹cznie jeœli w pobli¿u ofiary nie ma osób trzecich.
			AI_Output (self, other,"DIA_Snipes_Lehrer_PICKPOCKET_05_04"); //Tylko prawdziwy mistrz potrafi ukraœæ coœ pozostaj¹c ca³kowicie niezauwa¿onym!
		};
		B_GiveInvItems (hero, self, itminugget, 250);
		Npc_RemoveInvItems (self, itminugget, 250);
		}
		else
		{
		AI_Output (self, other,"DIA_Snipes_Lehrer_NOORE"); //Nie ma nic za darmo!
		};
	}
	else
	{
		AI_Output (self, other,"DIA_Snipes_lehrer_Pickpocket_05_05"); //Nie ma o czym mówiæ! Nie bêdzie z ciebie z³odzieja, dopóki nie nauczysz siê skradaæ!
	};
};

func void DIA_Snipes_Lehrer_Pickpocket2()
{
	AI_Output (other, self,"DIA_Snipes_Lehrer_Pickpocket2_15_00"); //Chcia³bym zostaæ mistrzem kieszonkowców!
	if (Npc_HasItems (hero, itminugget) >=500)
	{
	if (B_teachthieftalent(self,other,NPC_TALENT_PICKPOCKET))
	{		
		AI_Output (self, other,"DIA_Snipes_Lehrer_Pickpocket2_05_01"); //Có¿, chyba rzeczywiœcie potrafisz ju¿ wystarczaj¹co du¿o, ¿eby opanowaæ zaawansowane sztuczki.
		AI_Output (self, other,"DIA_Snipes_Lehrer_Pickpocket2_05_02"); //Ale musisz pamiêtaæ, ¿e nawet mistrzowscy z³odzieje mog¹ zostaæ przy³apani.
		AI_Output (self, other,"DIA_Snipes_Lehrer_Pickpocket2_05_03"); //Uwa¿aj na siebie.
	};
		B_GiveInvItems (hero, self, itminugget, 500);
		Npc_RemoveInvItems (self, itminugget, 500);
		}
		else
		{
		AI_Output (self, other,"DIA_Snipes_Lehrer_NOORE"); //Nie ma nic za darmo!
		};
};

func VOID DIA_Snipes_Lehrer_BACK()
{
	Info_ClearChoices	( DIA_Snipes_Lehrer );
};
// ***************** Infos *****************************
instance  VLK_584_Snipes_DEAL (C_INFO)
{
	npc				= VLK_584_Snipes;
	condition		= VLK_584_Snipes_DEAL_Condition;
	information		= VLK_584_Snipes_DEAL_Info;
	important		= 0;
	permanent		= 0;
	description		= "Jak leci?"; 
};

FUNC int  VLK_584_Snipes_DEAL_Condition()
{
if  (kapitel < 4)
{
	return 1;
	};
};


FUNC void  VLK_584_Snipes_DEAL_Info()
{
	AI_Output			(other, self,"VLK_584_Snipes_DEAL_Info_15_01");//Jak leci?
	AI_Output			(self, other,"VLK_584_Snipes_DEAL_Info_07_02"); //Mam dla ciebie pewn¹ propozycjê.
	AI_Output			(self, other,"VLK_584_Snipes_DEAL_Info_07_03"); //Spraw, ¿eby Aaron odczepi³ siê od tej skrzyni, a zap³acê ci 10 bry³ek rudy.
	Snipes_Deal = LOG_RUNNING;

	Log_CreateTopic		(CH2_SnipesDeal,	LOG_MISSION);
	Log_SetTopicStatus	(CH2_SnipesDeal,	LOG_RUNNING);
	B_LogEntry		(CH2_SnipesDeal,	"Kopacz Snipes zaoferowa³ mi 10 bry³ek rudy w zamian za odci¹gniêcie Aarona od jego skrzyni.");
};
// ***************** Infos *****************************  
instance  VLK_584_Snipes_DEAL_RUN (C_INFO)
{
	npc				= VLK_584_Snipes;
	condition		= VLK_584_Snipes_DEAL_RUN_Condition;
	information		= VLK_584_Snipes_DEAL_RUN_Info;
	important		= 0;
	permanent		= 0;
	description		= "Nale¿y mi siê 10 bry³ek rudy!"; 
};

FUNC int  VLK_584_Snipes_DEAL_RUN_Condition()
{
	if (Snipes_deal == LOG_SUCCESS) && (kapitel < 4)
	{
		return TRUE;
	};
};

FUNC void  VLK_584_Snipes_DEAL_RUN_Info()
{
	AI_Output			(other, self,"VLK_584_Snipes_DEAL_RUN_Info_15_01"); //Nale¿y mi siê 10 bry³ek rudy!
	AI_Output			(self, other,"VLK_584_Snipes_DEAL_RUN_Info_07_02"); //Proszê, zas³u¿y³eœ na nie.
	AI_Output			(self, other,"VLK_584_Snipes_DEAL_RUN_Info_07_03"); //Ach, i jeszcze coœ: mam przy sobie klucz do tej skrzyni. Jak dla ciebie - 30 bry³ek.
	CreateInvItems		(self,ItMinugget,10);
	B_GiveInvItems      (self, other, ItMinugget,10);
	CreateInvItem 		(self,ItKe_OM_02);

	B_GiveXP			(XP_LureAaronAway);
	
	B_LogEntry		(CH2_SnipesDeal,	"Za kolejne 30 bry³ek Snipes zaoferowa³ mi klucz do skrzyni Aarona."); 
};  
// ***************** Infos *****************************
instance  VLK_584_Snipes_DEAL_2 (C_INFO)
{
	npc				= VLK_584_Snipes;
	condition		= VLK_584_Snipes_DEAL_2_Condition;
	information		= VLK_584_Snipes_DEAL_2_Info;
	important		= 0;
	permanent		= 1;
	description		= "(kup klucz)"; 
};

FUNC int  VLK_584_Snipes_DEAL_2_Condition()
{
	if ( Npc_KnowsInfo (hero, VLK_584_Snipes_DEAL_RUN) )
	&& (Npc_HasItems   (self,ItKe_OM_02)) && (kapitel < 4)
	{
	return 1;
	};
};


FUNC void  VLK_584_Snipes_DEAL_2_Info()
{
	
	if ( Npc_HasItems (hero, ItMinugget)  >= 30 ) 
	{
		AI_Output			(other, self,"VLK_584_Snipes_DEAL_2_Info_15_01");//Wezmê ten klucz.
		AI_Output			(self, other,"VLK_584_Snipes_DEAL_2_Info_07_02");//Trafi³a ci siê nie lada okazja.
		AI_Output			(other, self,"VLK_584_Snipes_DEAL_2_Info_15_03");//Zastanawiam siê co TY z tego masz.
		AI_Output			(self, other,"VLK_584_Snipes_DEAL_2_Info_07_04");//Zawsze siê cieszê, kiedy mogê daæ prztyczka w nos któremuœ ze Stra¿ników. Zreszt¹, gdyby znaleŸli przy mnie rzeczy z tej skrzyni, by³bym martwy.
		
		B_GiveInvItems 	(hero, self, ItMiNugget,30);
		B_GiveInvItems 	(self, hero, ItKe_OM_02, 1);
		VLK_584_Snipes_DEAL_2.permanent = 0;
	
		B_LogEntry		(CH2_SnipesDeal,	"Kupi³em od Snipesa klucz od skrzyni! Ciekawe, co zrobi Aaron, gdy mu o tym powiem?"); 
	}
	else
	{
		AI_Output			(self, other,"VLK_584_Snipes_DEAL_2_Info_07_05"); //Ma byæ 30 bry³ek! Daj mi rudê, to dostaniesz klucz.
	};
};  

//========================================
//-----------------> POGADUCHY_K4
//========================================

INSTANCE DIA_Snipes_POGADUCHY_K4 (C_INFO)
{
   npc          = VLK_584_Snipes;
   nr           = 1;
   condition    = DIA_Snipes_POGADUCHY_K4_Condition;
   information  = DIA_Snipes_POGADUCHY_K4_Info;
   permanent	= FALSE;
   description	= "Widzê, ¿e i tym razem uda³o ci siê wykiwaæ Stra¿ników!";
};

FUNC INT DIA_Snipes_POGADUCHY_K4_Condition()
{
    if (kapitel >= 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Snipes_POGADUCHY_K4_Info()
{
    AI_Output (other, self ,"DIA_Snipes_POGADUCHY_K4_15_01"); //Widzê, ¿e i tym razem uda³o ci siê wykiwaæ Stra¿ników!
    AI_Output (self, other ,"DIA_Snipes_POGADUCHY_K4_03_02"); //Hehe... Masz racjê. Choæ tym razem myœla³em, ¿e nam siê nie uda.
    AI_Output (self, other ,"DIA_Snipes_POGADUCHY_K4_03_03"); //Uciekliœmy dos³ownie w ostatniej chwili. Jak chcesz poznac szczegó³y, to pogadaj z Wê¿em.
};

//========================================
//-----------------> HOW_YOU_ARE_K4
//========================================

INSTANCE DIA_Snipes_HOW_YOU_ARE_K4 (C_INFO)
{
   npc          = VLK_584_Snipes;
   nr           = 2;
   condition    = DIA_Snipes_HOW_YOU_ARE_K4_Condition;
   information  = DIA_Snipes_HOW_YOU_ARE_K4_Info;
   permanent	= FALSE;
   description	= "Jak leci?";
};

FUNC INT DIA_Snipes_HOW_YOU_ARE_K4_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Snipes_POGADUCHY_K4))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Snipes_HOW_YOU_ARE_K4_Info()
{
    AI_Output (other, self ,"DIA_Snipes_HOW_YOU_ARE_K4_15_01"); //Jak leci?
    AI_Output (self, other ,"DIA_Snipes_HOW_YOU_ARE_K4_03_02"); //NieŸle. Nikt siê tu nie krêci poza kilkoma œcierwojadami, ale nimi siê akurat nie martwiê. Jest na co polowaæ.
    AI_Output (self, other ,"DIA_Snipes_HOW_YOU_ARE_K4_03_03"); //Poza tym jesteœmy tu bezpieczni. Stra¿nicy Gomeza raczej tu nie zagl¹daj¹, mimo i¿ krêc¹ siê w pobli¿u bram. 
    AI_Output (other, self ,"DIA_Snipes_HOW_YOU_ARE_K4_15_04"); //Gadaliœcie z nimi?
    AI_Output (self, other ,"DIA_Snipes_HOW_YOU_ARE_K4_03_05"); //Nie, na razie nas nie wykryli i lepiej ¿eby tak zosta³o.
};


//=====================================================================================================================================================================================


//========================================
//-----------------> OBITE PYSKI
//========================================

INSTANCE DIA_Snipes_OBITE_PYSKI (C_INFO)
{
   npc          = VLK_584_Snipes;
   nr           = 2;
   condition    = DIA_Snipes_OBITE_PYSKI_Condition;
   information  = DIA_Snipes_OBITE_PYSKI_Info;
   permanent	= FALSE;
   description	= "Chcia³bym siê czegoœ dowiedzieæ.";
};

FUNC INT DIA_Snipes_OBITE_PYSKI_Condition()
{
    if (Npc_KnowsInfo (hero, STT_301_IAN_OBITE_PYSKI1))
	
    {
    return TRUE;
    };
};


FUNC VOID DIA_Snipes_OBITE_PYSKI_Info()
{
    AI_Output (other, self ,"DIA_Snipes_OBITE_PYSKI_15_01"); //Chcia³bym siê czegoœ dowiedzieæ.
    AI_Output (self, other ,"DIA_Snipes_OBITE_PYSKI_03_02"); //Tego czy dobrze siê czuje? Tak, stary czuje siê œwietnie zw³aszcza jeœli masz dla mnie trochê rudy hehe...
	AI_Output (other, self ,"DIA_Snipes_OBITE_PYSKI_15_03"); //Ktoœ tu mnie nauczy³, ¿e: "Nie ma nic za darmo!" Dam ci parê bry³ek jeœli powiesz mi coœ wa¿nego.
    AI_Output (self, other ,"DIA_Snipes_OBITE_PYSKI_03_04"); //A co chcesz wiedzieæ? 
    AI_Output (other, self ,"DIA_Snipes_OBITE_PYSKI_15_05"); //Sk¹d bior¹ siê tajemnicze obra¿enia u czêœci Kopaczy?
    AI_Output (self, other ,"DIA_Snipes_OBITE_PYSKI_03_06"); //Znam kogoœ kto powinien umieæ ci to wyjaœniæ.
	AI_Output (other, self ,"DIA_Snipes_OBITE_PYSKI_15_07"); //Kto to jest?
	AI_Output (self, other ,"DIA_Snipes_OBITE_PYSKI_03_08"); //¯eby udzieliæ tej informacji potrzebuje sakiewki ze 100 bry³kami rudy w rêku, m³ody.
				    B_LogEntry               (ObitePyski,"Snipes chcê za fatygê 100 bry³ek rudy. Chyba bêdê je musia³ mu zap³aciæ, jeœli chce dowiedzieæ siê wiêcej.");

};

//======================

INSTANCE DIA_Snipes_OBITE_PYSKI_RUDA (C_INFO)
{
   npc          = VLK_584_Snipes;
   nr           = 2;
   condition    = DIA_Snipes_OBITE_PYSKI_RUDA_Condition;
   information  = DIA_Snipes_OBITE_PYSKI_RUDA_Info;
   permanent	= FALSE;
   description	= "Oto 100 bry³ek rudy.";
};

FUNC INT DIA_Snipes_OBITE_PYSKI_RUDA_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Snipes_OBITE_PYSKI))
	&& ( Npc_HasItems (hero, ItMinugget) >= 100 ) 
    {
    return TRUE;
    };
};


FUNC VOID DIA_Snipes_OBITE_PYSKI_RUDA_Info()
{
    AI_Output (other, self ,"DIA_Snipes_OBITE_PYSKI_RUDA_15_01"); //Oto 100 bry³ek rudy.
    AI_Output (self, other ,"DIA_Snipes_OBITE_PYSKI_RUDA_03_02"); //O! I teraz siê wszystko siê zgadza. Zatem pogadaj z Eltonem, to m³ody Kopacz z rozkwaszonym nosem, hehe.
		B_GiveInvItems 	(hero, self, ItMiNugget,100);
  B_LogEntry               (ObitePyski,"Snipes twierdzi, ¿e m³ody Kopacz Elton mo¿e coœ wiedzieæ na temat ostatnich urazów i kontuzji wœród Kopaczy. Ponoæ sam jest poszkodowany. Pomówiê z nim.");
		
};



//========================================
//-----------------> Miecz Gor Boby
//========================================

INSTANCE DIA_Snipes_Grom_Info (C_INFO)
{
   npc          = VLK_584_Snipes;
   nr           = 2;
   condition    = DIA_Snipes_Grom_Info_Condition;
   information  = DIA_Snipes_Grom_Info_Info;
   permanent	= FALSE;
   description	= "Wiesz coœ na temat surowca zwanego srebrnym gromem?";
};

FUNC INT DIA_Snipes_Grom_Info_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Grimes_BOBA_SWORD_NUGGET))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Snipes_Grom_Info_Info()
{
    AI_Output (other, self ,"DIA_Snipes_Grom_Info_15_01"); //Wiesz coœ na temat surowca zwanego srebrnym gromem?
    AI_Output (self, other ,"DIA_Snipes_Grom_Info_03_02"); //Oprócz tego, ¿e jest rzadki jak gówno Gomeza?
	AI_Output (other, self ,"DIA_Snipes_Grom_Info_15_03"); //Có¿ za poetyckie porównanie.
    AI_Output (self, other ,"DIA_Snipes_Grom_Info_03_04"); //Mo¿e wiem. Mo¿e nie wiem. To zale¿y ile za to dostanê. Proste.
    AI_Output (other, self ,"DIA_Snipes_Grom_Info_15_05"); //Mo¿e 30 bry³ek rudy?
    AI_Output (self, other ,"DIA_Snipes_Grom_Info_03_06"); //Co najmniej 50.
	AI_Output (other, self ,"DIA_Snipes_Grom_Info_15_07"); //Mo¿e jednak 40?
	AI_Output (self, other ,"DIA_Snipes_Grom_Info_03_08"); //To ja powiem 51.
	AI_Output (other, self ,"DIA_Snipes_Grom_Info_15_09"); //W ostatecznoœci mo¿e byæ 50.
	AI_Output (self, other ,"DIA_Snipes_Grom_Info_03_10"); //No i nie mo¿na by³o tak od razu..?
				   
 B_LogEntry               (MieczGorBoby,"Rozmawia³em ze Snipsem. Sprzeda mi informacjê na temat posiadaczy ,,srebrnego gromu” w zamian za 50 bry³ek rudy.");
};



//========================================
//-----------------> Miecz Gor Boby
//========================================

INSTANCE DIA_Snipes_Grom_Info_Ore (C_INFO)
{
   npc          = VLK_584_Snipes;
   nr           = 2;
   condition    = DIA_Snipes_Grom_Info_Ore_Condition;
   information  = DIA_Snipes_Grom_Info_Ore_Info;
   permanent	= FALSE;
   description	= "Proszê.";
};

FUNC INT DIA_Snipes_Grom_Info_Ore_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Snipes_Grom_Info)) && (Npc_HasItems (other, ItMiNugget) >=50)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Snipes_Grom_Info_Ore_Info()
{
    AI_Output (other, self ,"DIA_Snipes_Grom_Info_Ore_15_01"); //Proszê.
	B_GiveInvItems (other,self, itminugget, 50);
    AI_Output (self, other ,"DIA_Snipes_Grom_Info_Ore_03_02"); //Dziêki. Wiem o dwóch ludziach, którzy mielibyli w posiadaniu tego surowca. Jeden to Grimes.
	AI_Output (other, self ,"DIA_Snipes_Grom_Info_Ore_15_03"); //Ju¿ z nim rozmawia³em.
    AI_Output (self, other ,"DIA_Snipes_Grom_Info_Ore_03_04"); //A drugi to Glen.
    AI_Output (other, self ,"DIA_Snipes_Grom_Info_Ore_15_05"); //O! A to przydatna informacja...
    AI_Output (self, other ,"DIA_Snipes_Grom_Info_Ore_03_06"); //No widzisz, interesy ze mn¹ to przyjemnoœæ dla obu stron.
	AI_Output (other, self ,"DIA_Snipes_Grom_Info_Ore_15_07"); //Dobra. Dziêki za informacje.
	AI_Output (self, other ,"DIA_Snipes_Grom_Info_Ore_03_08"); //Na razie, przyjacielu.
	
				     B_LogEntry               (MieczGorBoby,"Snipes powiedzia³, ¿e Glen by³ w posiadaniu ,,srebrnego gromu”, muszê siê zatem do niego udaæ.");

};



//========================================
//-----------------> Oprawca
//========================================

INSTANCE DIA_Snipes_Oprawca (C_INFO)
{
   npc          = VLK_584_Snipes;
   nr           = 1;
   condition    = DIA_Snipes_Oprawca_Condition;
   information  = DIA_Snipes_Oprawca_Info;
   permanent	= FALSE;
   description	= "Mam dla ciebie robotê.";
};

FUNC INT DIA_Snipes_Oprawca_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Huno_Oprawca))
&& !(Npc_KnowsInfo(hero,DIA_Asghan_Oprawca))
{
    return TRUE;
};
};
FUNC VOID DIA_Snipes_Oprawca_Info()
{
    AI_Output (other, self ,"DIA_Snipes_Oprawca_15_01"); //Mam dla ciebie robotê.
    AI_Output (self, other ,"DIA_Snipes_Oprawca_03_02"); //Jeœli nie jest p³atna to daruj sobie.
    AI_Output (other, self ,"DIA_Snipes_Oprawca_15_03"); //Dam ci 50 bry³ek rudy. Musisz okraœæ stra¿nika Winstona.
    AI_Output (other, self ,"DIA_Snipes_Oprawca_15_04"); //Potrzebny mi jego osobisty dziennik.
    AI_Output (self, other ,"DIA_Snipes_Oprawca_03_05"); //Facet lubi sobie goln¹æ. Skroiæ go to jak oszukaæ dzieciaka - ³atwizna.
    AI_Output (self, other ,"DIA_Snipes_Oprawca_03_06"); //Ale najpierw ruda, nie dam siê wyrolowaæ.
     B_LogEntry               (Oprawca,"Rozmawia³em ze Snipesem. Zaproponowa³em mu 50 bry³ek rudy za okradzenie Winstona. Przysta³ na moj¹ propozycjê.");
};

//========================================
//-----------------> Oprawca_Ruda
//========================================

INSTANCE DIA_Snipes_Oprawca_Ruda (C_INFO)
{
   npc          = VLK_584_Snipes;
   nr           = 2;
   condition    = DIA_Snipes_Oprawca_Ruda_Condition;
   information  = DIA_Snipes_Oprawca_Ruda_Info;
   permanent	= FALSE;
   description	= "Masz.";
};

FUNC INT DIA_Snipes_Oprawca_Ruda_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Snipes_Oprawca))
&& (Npc_HasItems (other, itminugget) >=50)
{
    return TRUE;
};
};
FUNC VOID DIA_Snipes_Oprawca_Ruda_Info()
{
    AI_Output (other, self ,"DIA_Snipes_Oprawca_Ruda_15_01"); //Masz.
	OP_SnipesWins_Day = Wld_GetDay();
    AI_Output (self, other ,"DIA_Snipes_Oprawca_Ruda_03_02"); //Dziêki, wpadnij jutro do tego czasu postaram siê oskubaæ tego jelenia.
    B_GiveInvItems (other, self, itminugget, 50);
	  B_LogEntry               (Oprawca,"Snipes wzi¹³ ode mnie 50 bry³ek rudy, teraz ma skroiæ Winstona i nastêpnego dnia powinien ju¿ mieæ jego dziennik.");
};


//========================================
//-----------------> Oprawca_Dziennik
//========================================

INSTANCE DIA_Snipes_Oprawca_Dziennik (C_INFO)
{
   npc          = VLK_584_Snipes;
   nr           = 3;
   condition    = DIA_Snipes_Oprawca_Dziennik_Condition;
   information  = DIA_Snipes_Oprawca_Dziennik_Info;
   permanent	= FALSE;
   description	= "No i jak tam? Masz dziennik Winstona?";
};

FUNC INT DIA_Snipes_Oprawca_Dziennik_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Snipes_Oprawca_Ruda))
&& (OP_SnipesWins_Day != Wld_GetDay())
{
    return TRUE;
};
};
FUNC VOID DIA_Snipes_Oprawca_Dziennik_Info()
{
    AI_Output (other, self ,"DIA_Snipes_Oprawca_Dziennik_15_01"); //No i jak tam? Masz dziennik Winstona?
    AI_Output (self, other ,"DIA_Snipes_Oprawca_Dziennik_03_02"); //No pytasz dzika czy sra w lesie. Pewnie, ¿e mam.
    AI_Output (other, self ,"DIA_Snipes_Oprawca_Dziennik_15_03"); //No to dawaj.
    AI_Output (self, other ,"DIA_Snipes_Oprawca_Dziennik_03_04"); //Trzymaj. Widzê, ¿e idziesz na wojnê z tym zabijak¹, ryzykowna gra. Ale mo¿e jak ja te¿ lubisz ryzykowaæ?
	B_GiveInvItems (self,other, ItWr_WinstonBook, 1);
    AI_Output (other, self ,"DIA_Snipes_Oprawca_Dziennik_15_05"); //Nie tolerujê niesprawiedliwoœci.
    AI_Output (self, other ,"DIA_Snipes_Oprawca_Dziennik_03_06"); //Byleby ta tolerancja nie kosztowa³a ciê kilku zêbów...
    AI_Output (other, self ,"DIA_Snipes_Oprawca_Dziennik_15_07"); //Nie musisz siê o to martwiæ.
    AI_Output (other, self ,"DIA_Snipes_Oprawca_Dziennik_15_08"); //Trzymaj siê.
    AI_Output (self, other ,"DIA_Snipes_Oprawca_Dziennik_03_09"); //Do zobaczyska.
	  B_LogEntry               (Oprawca,"Snipes da³ mi dziennik Winstona. Zatem mam obci¹¿aj¹cy go dowód. Powinienem pomówiæ z Asghanem.");
};
//========================================
//-----------------> DWMN
//========================================

INSTANCE DIA_Snipes_DWMN (C_INFO)
{
   npc          = VLK_584_Snipes;
   nr           = 1;
   condition    = DIA_Snipes_DWMN_Condition;
   information  = DIA_Snipes_DWMN_Info;
   permanent	= FALSE;
   description	= "S³ysza³eœ nowinê?";
};

FUNC INT DIA_Snipes_DWMN_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Robin_DWNM))
{
    return TRUE;
};
};
FUNC VOID DIA_Snipes_DWMN_Info()
{
    AI_Output (other, self ,"DIA_Snipes_DWMN_15_01"); //S³ysza³eœ nowinê?
    AI_Output (self, other ,"DIA_Snipes_DWMN_03_02"); //Jak¹?
    AI_Output (other, self ,"DIA_Snipes_DWMN_15_03"); //Przygotowuj¹ specjaln¹ dostawê rudy do obozu. Gomez bêdzie zadowolony.
    AI_Output (self, other ,"DIA_Snipes_DWMN_03_04"); //Ta chciwa kanalia mog³aby braæ k¹piele w rudzie a jeszcze jej ma³o...
    AI_Output (self, other ,"DIA_Snipes_DWMN_03_05"); //Dziêki za informacjê.
    AI_Output (other, self ,"DIA_Snipes_DWMN_15_06"); //Nie ma sprawy.
};

instance dia_snipes_pickpocket(c_info) {
    npc = vlk_584_snipes;
    nr = 900;
    condition = dia_snipes_pickpocket_condition;
    information = dia_snipes_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_snipes_pickpocket_condition() {
	e_beklauen(baseThfChanceVLK, 20);
};

func void dia_snipes_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_snipes_pickpocket);
	info_addchoice(dia_snipes_pickpocket, dialog_back, dia_snipes_pickpocket_back);
	info_addchoice(dia_snipes_pickpocket, dialog_pickpocket, dia_snipes_pickpocket_doit);
};

func void dia_snipes_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_snipes_pickpocket);
};

func void dia_snipes_pickpocket_back() {
    info_clearchoices(dia_snipes_pickpocket);
};