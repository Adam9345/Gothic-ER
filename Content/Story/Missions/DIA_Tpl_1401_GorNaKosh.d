//poprawione i sprawdzone -  

// ************************ EXIT **************************

instance  Tpl_1401_GorNaKosh_Exit (C_INFO)
{
	npc			= Tpl_1401_GorNaKosh;
	nr			= 999;
	condition	= Tpl_1401_GorNaKosh_Exit_Condition;
	information	= Tpl_1401_GorNaKosh_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Tpl_1401_GorNaKosh_Exit_Condition()
{
	return 1;
};

FUNC VOID  Tpl_1401_GorNaKosh_Exit_Info()
{
	AI_Output			(self, other,"Tpl_1401_GorNaKosh_Exit_Info_13_02"); //Niech Œni¹cy zbudzi siê ku naszemu zbawieniu!
	AI_StopProcessInfos	( self );
};




// ***************** Infos *****************************

instance  Tpl_1401_GorNaKosh_SUGGEST (C_INFO)
{
	npc				= Tpl_1401_GorNaKosh;
	condition		= Tpl_1401_GorNaKosh_SUGGEST_Condition;
	information		= Tpl_1401_GorNaKosh_SUGGEST_Info;
	important		= 0;
	permanent		= 0;
	description		= "Wiem gdzie znajduje siê gniazdo pe³zaczy."; 
};

FUNC int  Tpl_1401_GorNaKosh_SUGGEST_Condition()
{	
	if	 Npc_KnowsInfo(hero, Grd_263_Asghan_OPEN)
	&&	!Npc_KnowsInfo(hero, Grd_263_Asghan_OPEN_NOW)
	{
		return TRUE;
	};
};


FUNC void  Tpl_1401_GorNaKosh_SUGGEST_Info()
{
	AI_Output			(other, self,"Tpl_1401_GorNaKosh_SUGGEST_Info_15_01"); //Wiem, gdzie znajduje siê gniazdo pe³zaczy. Muszê tam pójœæ, ¿eby zdobyæ coœ dla Cor Kaloma.
	AI_Output			(self, other,"Tpl_1401_GorNaKosh_SUGGEST_Info_13_02"); //Zatem przyda ci siê moja pomoc. Pójdê z tob¹.
	AI_Output			(other, self,"Tpl_1401_GorNaKosh_SUGGEST_Info_15_03"); //Dobrze. Spotkamy siê przy wielkim przejœciu.
	
	Npc_ExchangeRoutine (self,"GATE");
	Npc_SetPermAttitude (self,ATT_FRIENDLY); 
	B_GiveXP			(XP_HireGorNaKosh);
	B_LogEntry		(CH2_MCEggs,	"Przekona³em Gor Na Kosha, by do³¹czy³ do oddzia³u przy bramie Asghana.");	

	AI_StopProcessInfos	(self);
};

// ***************** Infos *****************************

instance  Tpl_1401_GorNaKosh_INFO (C_INFO)
{
	npc				= Tpl_1401_GorNaKosh;
	condition		= Tpl_1401_GorNaKosh_INFO_Condition;
	information		= Tpl_1401_GorNaKosh_INFO_Info;
	important		= 0;
	permanent		= 1;
	description		= "Co tu robisz?"; 
};

FUNC int  Tpl_1401_GorNaKosh_INFO_Condition()
{	
	if ! ( Npc_KnowsInfo (hero, Grd_263_Asghan_NEST ) )
	{
		return 1;
	};
};

FUNC void  Tpl_1401_GorNaKosh_INFO_Info()
{
	AI_Output			(other, self,"Tpl_1401_GorNaKosh_INFO_Info_15_01"); //Co tu robisz?
	AI_Output			(self, other,"Tpl_1401_GorNaKosh_INFO_Info_13_02"); //Polujê na pe³zacze.
	AI_Output			(other, self,"Tpl_1401_GorNaKosh_INFO_Info_15_03"); //Mo¿esz mi opowiedzieæ o sposobach polowania na pe³zacze?
	AI_Output			(self, other,"Tpl_1401_GorNaKosh_INFO_Info_13_04"); //Przy ³owach na pe³zacze obowi¹zuje tylko jedna zasada: gdy jakiegoœ zobaczysz, rzuæ siê na niego czym prêdzej i spróbuj go zabiæ pierwszym ciosem.
	AI_Output			(self, other,"Tpl_1401_GorNaKosh_INFO_Info_13_05"); //Walcz bez strachu i zabijaj bez litoœci.

	AI_StopProcessInfos(self);		// SN:nur für die Vermeidung des Bugs, dass der letzte Satz in roter Schrift erscheint, und der InfoManager danach defekt ist
};

//========================================
//-----------------> STRAZNICY
//========================================
//edit by  

INSTANCE DIA_GorNaKosh_STRAZNICY (C_INFO)
{
   npc          = Tpl_1401_GorNaKosh;
   nr           = 1;
   condition    = DIA_GorNaKosh_STRAZNICY_Condition;
   information  = DIA_GorNaKosh_STRAZNICY_Info;
   permanent	= FALSE;
   description	= "Co wiesz o waszej wspó³pracy ze Stra¿nikami?";
};

FUNC INT DIA_GorNaKosh_STRAZNICY_Condition()
{
    if (MIS_PSIcampWORK == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_GorNaKosh_STRAZNICY_Info()
{
    AI_Output (other, self ,"DIA_GorNaKosh_STRAZNICY_15_01"); //Co wiesz o waszej wspó³pracy ze Stra¿nikami?
    AI_Output (self, other ,"DIA_GorNaKosh_STRAZNICY_03_02"); //Uwierz mi, ¿e niewiele. Po prostu teraz nam pomagaj¹, jednak nie wiem, co dzieje siê na górze.
    AI_Output (self, other ,"DIA_GorNaKosh_STRAZNICY_03_03"); //Pogadaj z innymi Stra¿nikami Œwi¹tynnymi. Mo¿e oni coœ wiedz¹.
};



// ***************** Infos *****************************

instance  Tpl_1401_GorNaKosh_CRAWLER (C_INFO)
{
	npc				= Tpl_1401_GorNaKosh;
	condition		= Tpl_1401_GorNaKosh_CRAWLER_Condition;
	information		= Tpl_1401_GorNaKosh_CRAWLER_Info;
	important		= 0;
	permanent		= 1;
	description		= "Mo¿esz mi opowiedzieæ coœ jeszcze o tych pe³zaczach?"; 
};

FUNC int  Tpl_1401_GorNaKosh_CRAWLER_Condition()
{	
	if  ( Npc_KnowsInfo (hero, Tpl_1401_GorNaKosh_INFO) )
	{
		return 1;
	};
};

FUNC void  Tpl_1401_GorNaKosh_CRAWLER_Info()
{
	AI_Output			(other, self,"Tpl_1401_GorNaKosh_CRAWLER_Info_15_01"); //Mo¿esz mi opowiedzieæ coœ jeszcze o tych pe³zaczach?
	AI_Output			(self, other,"Tpl_1401_GorNaKosh_CRAWLER_Info_13_02"); //Te bestie dzia³aj¹ instynktownie. Próbuj¹ zabiæ wszystko co nie jest pe³zaczem.
	AI_Output			(self, other,"Tpl_1401_GorNaKosh_CRAWLER_Info_13_03"); //Wykorzystaj tê wiedzê w walce z tymi potworami.
}; 

// ***************************** Die Königin ist tot, lang lebe die Königin ****************************************//

instance  Tpl_1401_GorNaKosh_VICTORY (C_INFO)
{
	npc				= Tpl_1401_GorNaKosh;
	condition		= Tpl_1401_GorNaKosh_VICTORY_Condition;
	information		= Tpl_1401_GorNaKosh_VICTORY_Info;
	important		= 0;
	permanent		= 0;
	description		= "Znalaz³em gniazdo pe³zaczy!"; 
};

FUNC int  Tpl_1401_GorNaKosh_VICTORY_Condition()
{	
	if ( Npc_HasItems (hero,ItAt_Crawlerqueen) > 3 ) 
	{
		return TRUE;
	};

};
FUNC void  Tpl_1401_GorNaKosh_VICTORY_Info()
{
	AI_Output			(other, self,"Tpl_1401_GorNaKosh_VICTORY_Info_15_01"); //Znalaz³em gniazdo pe³zaczy!
	AI_Output			(self, other,"Tpl_1401_GorNaKosh_VICTORY_Info_13_02"); //Wspaniale! Wróæ do obozu i wype³nij rozkaz do koñca. Cor Kalom na pewno siê niecierpliwi!
	B_LogEntry			(CH2_MCEggs,	"Mam zanieœæ jaja pe³zaczy do laboratorium Cor Kaloma.");
};  
//========================================
//-----------------> Ocaleni
//========================================
//edit by  

INSTANCE DIA_GorNaKosh_Ocaleni (C_INFO)
{
   npc          = Tpl_1401_GorNaKosh;
   nr           = 1;
   condition    = DIA_GorNaKosh_Ocaleni_Condition;
   information  = DIA_GorNaKosh_Ocaleni_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_GorNaKosh_Ocaleni_Condition()
{
if (Kapitel >= 4)
{
    return TRUE;
};
};
FUNC VOID DIA_GorNaKosh_Ocaleni_Info()
{
    AI_Output (self, other ,"DIA_GorNaKosh_Ocaleni_03_01"); //Co tutaj robisz?
    AI_Output (other, self ,"DIA_GorNaKosh_Ocaleni_15_02"); //Artegor pozwoli³ mi was wypuœciæ.
    AI_Output (self, other ,"DIA_GorNaKosh_Ocaleni_03_03"); //Podobno dosz³o do jakiegoœ starcia.
    AI_Output (self, other ,"DIA_GorNaKosh_Ocaleni_03_04"); //Zobaczyliœmy tylko kilku Stra¿ników. Chwilê potem w powietrzu unosi³ siê tuman kurzu. 
    AI_Output (other, self ,"DIA_GorNaKosh_Ocaleni_15_05"); //Stra¿nicy pozabijali siê nawzajem. Tylko Artegor prze¿y³.
    AI_Output (self, other ,"DIA_GorNaKosh_Ocaleni_03_06"); //Co za g³upcy!
    AI_Output (self, other ,"DIA_GorNaKosh_Ocaleni_03_07"); //Wracaj¹c do naszego problemu.
    AI_Output (self, other ,"DIA_GorNaKosh_Ocaleni_03_08"); //Chcesz powiedzieæ, ¿e mo¿emy bezpiecznie opuœciæ obóz?
    AI_Output (other, self ,"DIA_GorNaKosh_Ocaleni_15_09"); //Tak.
    AI_Output (self, other ,"DIA_GorNaKosh_Ocaleni_03_17"); //Mo¿emy wróciæ do Obozu. Dziêki. 
    if (MIS_HelpBrothersBra == LOG_RUNNING)
    {
        B_LogEntry                     (CH1_HelpBrothersBra,"Dotar³em do Stra¿ników Œwi¹tynnych. ");
        B_GiveXP (300);
    };
    AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine			(TPL_1433_GorNaVid, "camp");
	Npc_ExchangeRoutine			(TPL_1400_GorNaBar, "camp");
	Npc_ExchangeRoutine			(TPL_1401_GorNaKosh, "camp");
};