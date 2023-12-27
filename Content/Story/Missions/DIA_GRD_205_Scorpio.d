//poprawione i sprawdzone - Reflide

// **************************************
//					EXIT 
// **************************************

instance DIA_Scorpio_Exit (C_INFO)
{
	npc			= GRD_205_Scorpio;
	nr			= 999;
	condition	= DIA_Scorpio_Exit_Condition;
	information	= DIA_Scorpio_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Scorpio_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Scorpio_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************
//			Was willst du hier?
// **************************************

instance DIA_Scorpio_Hello (C_INFO)
{
	npc			= GRD_205_Scorpio;
	nr			= 1;
	condition	= DIA_Scorpio_Hello_Condition;
	information	= DIA_Scorpio_Hello_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int DIA_Scorpio_Hello_Condition()
{	
	if	!C_NpcBelongsToOldcamp (other)
	&&	(Kapitel < 4)
	&& (Npc_GetDistToNpc(self, other) <= 1000)
	{
		return 1;
	};
};

FUNC VOID DIA_Scorpio_Hello_Info()
{
	AI_Output (self, other,"DIA_Scorpio_Hello_13_00"); //Kto ciê tu wpuœci³?
	AI_Output (other, self,"DIA_Scorpio_Hello_15_01"); //Thorus.
	AI_Output (self, other,"DIA_Scorpio_Hello_13_02"); //I czego tu szukasz?

	Info_ClearChoices 	(DIA_Scorpio_Hello);
	Info_Addchoice 		(DIA_Scorpio_Hello,"Chcia³em siê tylko trochê rozejrzeæ.",DIA_Scorpio_Hello_JustLooking);
	Info_Addchoice 		(DIA_Scorpio_Hello,"Mam wiadomoœæ dla magów.",DIA_Scorpio_Hello_Mages);
	if (Kalom_Krautbote == LOG_RUNNING)
	{
		Info_Addchoice 		(DIA_Scorpio_Hello,"Przynios³em bagienne ziele dla Gomeza.",DIA_Scorpio_Hello_Kraut);
	};
	if (Npc_KnowsInfo(hero, Info_Thorus_ReadyForGomez))
	{
		Info_Addchoice 		(DIA_Scorpio_Hello,"Idê zobaczyæ siê z Gomezem. Zamierzam do was do³¹czyæ.",DIA_Scorpio_Hello_Join);
	};
};

func void DIA_Scorpio_Hello_JustLooking()
{
	AI_Output (other, self,"DIA_Scorpio_Hello_JustLooking_15_00"); //Chcia³em siê tylko trochê rozejrzeæ.
	AI_Output (self, other,"DIA_Scorpio_Hello_JustLooking_13_01"); //Bardzo œmieszne.
	Info_ClearChoices 	(DIA_Scorpio_Hello);
};

func void DIA_Scorpio_Hello_Mages()
{
	AI_Output (other, self,"DIA_Scorpio_Hello_Mages_15_00"); //Mam wiadomoœæ dla magów.
	AI_Output (self, other,"DIA_Scorpio_Hello_Mages_13_01"); //Pracujesz dla magów? Nie chcê mieæ z nimi nic do czynienia!
	Info_ClearChoices 	(DIA_Scorpio_Hello);
};

func void DIA_Scorpio_Hello_Kraut()
{
	AI_Output (other, self,"DIA_Scorpio_Hello_Kraut_15_00"); //Przynios³em bagienne ziele dla Gomeza.
	AI_Output (self, other,"DIA_Scorpio_Hello_Kraut_13_01"); //To zanieœ je do tego domu, którego wejœcia broni dwóch Stra¿ników.
	Info_ClearChoices 	(DIA_Scorpio_Hello);
};

func void DIA_Scorpio_Hello_Join()
{
	AI_Output (other, self,"DIA_Scorpio_Hello_Join_15_00"); //Idê zobaczyæ siê z Gomezem. Zamierzam do was do³¹czyæ.
	AI_Output (self, other,"DIA_Scorpio_Hello_Join_13_01"); //Ty? A co z ciebie bêdzie za po¿ytek?
	AI_Output (other, self,"DIA_Scorpio_Hello_Join_15_02"); //Cienie na mnie nie narzeka³y.
	AI_Output (self, other,"DIA_Scorpio_Hello_Join_13_03"); //Ale my nie chcemy nawet s³yszeæ o Cieniach! To MY trzymamy rêkê na pulsie.
	Info_ClearChoices 	(DIA_Scorpio_Hello);
};

// **************************************
//			REFUSE TRAIN
// **************************************

instance DIA_Scorpio_REFUSETRAIN (C_INFO)
{
	npc			= GRD_205_Scorpio;
	nr			= 1;
	condition	= DIA_Scorpio_REFUSETRAIN_Condition;
	information	= DIA_Scorpio_REFUSETRAIN_Info;
	permanent	= 0;
	description = "Mo¿esz mnie nauczyæ lepiej walczyæ?";
};                       

FUNC int DIA_Scorpio_REFUSETRAIN_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Scorpio_Hello) && (Npc_GetTrueGuild (hero) != GIL_GRD) )
	{
		return 1;
	};
};

FUNC VOID DIA_Scorpio_REFUSETRAIN_Info()
{
	AI_Output (other, self,"DIA_Scorpio_REFUSETRAIN_15_00"); //Mo¿esz mnie nauczyæ lepiej walczyæ?
	AI_Output (self, other,"DIA_Scorpio_REFUSETRAIN_13_01"); //Szkolê tylko Stra¿ników, wiêc dopóki Thorus nie przyjmie ciê w nasze szeregi, musisz poszukaæ sobie innego nauczyciela.
	
};

//*******************************
//*********°°°°°°°°°°°***********
//********* KAPITEL 3 ***********
//*********...........***********
//*******************************


/*------------------------------------------------------------------------
//							GARDIST GEWORDEN							//
------------------------------------------------------------------------*/
instance GRD_205_Scorpio_WELCOME (C_INFO)
{
	npc				= GRD_205_Scorpio;
	condition		= GRD_205_Scorpio_WELCOME_Condition;
	information		= GRD_205_Scorpio_WELCOME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  GRD_205_Scorpio_WELCOME_Condition()
{
	if (Npc_GetTrueGuild (hero) == GIL_GRD) 
	{
		return TRUE;
	};
};
func void  GRD_205_Scorpio_WELCOME_Info()
{
	
	AI_Output (self, other,"GRD_205_Scorpio_WELCOME_Info_13_01"); //Przejœcie do nas by³o najm¹drzejsz¹ decyzj¹ twojego ¿ycia!
	AI_StopProcessInfos	( self );
};

/*------------------------------------------------------------------------
							ARMBRUST TALK							
------------------------------------------------------------------------*/

instance  GRD_205_Scorpio_CROSSBOW (C_INFO)
{
	npc				= GRD_205_Scorpio;
	condition		= GRD_205_Scorpio_CROSSBOW_Condition;
	information		= GRD_205_Scorpio_CROSSBOW_Info;
	important		= 0;
	permanent		= 1;
	description		= "Mo¿esz mnie czegoœ nauczyæ?"; 
};

FUNC int  GRD_205_Scorpio_CROSSBOW_Condition()
{	
	if (Kapitel >= 4)
	|| (Npc_GetTrueGuild (hero) == GIL_GRD) 
	
	{
		return TRUE;
	};

};
FUNC void  GRD_205_Scorpio_CROSSBOW_Info()
{
	AI_Output (other, self,"GRD_205_Scorpio_CROSSBOW_Info_15_01"); //Mo¿esz mnie czegoœ nauczyæ?
	AI_Output (self, other,"GRD_205_Scorpio_CROSSBOW_Info_13_02"); //Jeœli masz doœæ rudy, poka¿ê ci jak pos³ugiwaæ siê kusz¹. To ciê bêdzie kosztowaæ jakieœ 200 bry³ek.
	if (log_scorpiocrossbow == FALSE)
	&& (Kapitel <= 4)
	{
		Log_CreateTopic   	(GE_TeacherOC,LOG_NOTE);
		B_LogEntry			(GE_TeacherOC,"Skorpion mo¿e mnie nauczyæ pos³ugiwaæ siê kusz¹.");
		log_scorpiocrossbow = TRUE;
	}
	else if (log_scorpiocrossbow == FALSE)
	&& (Kapitel > 4)
	{
		Log_CreateTopic   	(GE_TeacherOW,LOG_NOTE);
		B_LogEntry			(GE_TeacherOW,"Skorpion mo¿e mnie nauczyæ pos³ugiwaæ siê kusz¹.");
		log_scorpiocrossbow = TRUE;
	};
	

};  

//========================================
//-----------------> CROSSBOW_OK
//========================================

INSTANCE DIA_Scorpio_CROSSBOW_OK (C_INFO)
{
   npc          = GRD_205_Scorpio;
   nr           = 1;
   condition    = DIA_Scorpio_CROSSBOW_OK_Condition;
   information  = DIA_Scorpio_CROSSBOW_OK_Info;
   permanent	= FALSE;
   description	= "Oto ruda. (200 bry³ek)";
};

FUNC INT DIA_Scorpio_CROSSBOW_OK_Condition()
{
 if (Npc_HasItems (other, itminugget) >=200)
{
    return TRUE;
};
};
FUNC VOID DIA_Scorpio_CROSSBOW_OK_Info()
{
    AI_Output (other, self ,"DIA_Scorpio_CROSSBOW_OK_15_01"); //Oto ruda. (200 bry³ek)
    AI_Output (self,  other,"DIA_Scorpio_CROSSBOW_OK_15_02"); //Dobra. Bierzmy siê do roboty.
	B_GiveInvItems (other,self, itminugget, 200);	   

	
};
//========================================
//-----------------> CROSSBOW_OK
//========================================

INSTANCE DIA_Scorpio_CROSSBOW_OKLEARN (C_INFO)
{
   npc          = GRD_205_Scorpio;
   nr           = 1;
   condition    = DIA_Scorpio_CROSSBOW_OKLEARN_Condition;
   information  = DIA_Scorpio_CROSSBOW_OKLEARN_Info;
   permanent	= FALSE;
   description	= "Naucz mnie jak pos³ugiwaæ siê kusz¹.";
};

FUNC INT DIA_Scorpio_CROSSBOW_OKLEARN_Condition()
{
 if (Npc_KnowsInfo(hero,DIA_Scorpio_CROSSBOW_OK))
{
    return TRUE;
};
};
FUNC VOID DIA_Scorpio_CROSSBOW_OKLEARN_Info()
{
    AI_Output (other, self ,"DIA_Scorpio_CROSSBOW_OK_15_01"); //Naucz mnie jak pos³ugiwaæ siê kusz¹.
    AI_Output (self,  other,"DIA_Scorpio_CROSSBOW_OK_15_02"); //Dobra. Bierzmy siê do roboty.
	
    Info_ClearChoices(DIA_Scorpio_CROSSBOW_OKLEARN);
	Info_AddChoice(DIA_Scorpio_CROSSBOW_OKLEARN,DIALOG_BACK,DIA_Scorpio_CROSSBOW_BACK);
	Info_AddChoice(DIA_Scorpio_CROSSBOW_OKLEARN,B_BuildLearnString("Kusze +1",B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1),0),Dia_Scorpio_Teach_Crossbow_1);
	Info_AddChoice(DIA_Scorpio_CROSSBOW_OKLEARN,B_BuildLearnString("Kusze +5",B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5),0),Dia_Scorpio_Teach_Crossbow_5);
	
	
	
};


func void Dia_Scorpio_Teach_Crossbow_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,1,60);
	Info_ClearChoices(DIA_Scorpio_CROSSBOW_OKLEARN);
	Info_AddChoice(DIA_Scorpio_CROSSBOW_OKLEARN,Dialog_Back,DIA_Scorpio_CROSSBOW_BACK);
	
	Info_AddChoice(DIA_Scorpio_CROSSBOW_OKLEARN,B_BuildLearnString("Kusze +1",B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1),0),Dia_Scorpio_Teach_Crossbow_1);
	Info_AddChoice(DIA_Scorpio_CROSSBOW_OKLEARN,B_BuildLearnString("Kusze +5",B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5),0),Dia_Scorpio_Teach_Crossbow_5);
};

func void Dia_Scorpio_Teach_Crossbow_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,5,60);
	Info_ClearChoices(DIA_Scorpio_CROSSBOW_OKLEARN);
	Info_AddChoice(DIA_Scorpio_CROSSBOW_OKLEARN,Dialog_Back,DIA_Scorpio_CROSSBOW_BACK);
	
	Info_AddChoice(DIA_Scorpio_CROSSBOW_OKLEARN,B_BuildLearnString("Kusze +1",B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1),0),Dia_Scorpio_Teach_Crossbow_1);
	Info_AddChoice(DIA_Scorpio_CROSSBOW_OKLEARN,B_BuildLearnString("Kusze +5",B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5),0),Dia_Scorpio_Teach_Crossbow_5);
};
func void DIA_Scorpio_CROSSBOW_BACK()
{
	Info_ClearChoices(DIA_Scorpio_CROSSBOW_OKLEARN);
};


/*---------------------------------------------------------------------
Ab Kapitel 4 steht Scorpio draussen, damit der Spieler bei ihm noch lernen kann								
------------------------------------------------------------------------*/
/*------------------------------------------------------------------------
//							hey PC!								//
------------------------------------------------------------------------*/
instance GRD_205_Scorpio_HeyPC (C_INFO)
{
	npc				= GRD_205_Scorpio;
	condition		= GRD_205_Scorpio_HeyPC_Condition;
	information		= GRD_205_Scorpio_HeyPC_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  GRD_205_Scorpio_HeyPC_Condition()
{	
	if (kapitel >= 4)
	&& (Npc_GetDistToNpc (hero,self) < 1000)
	{
		return TRUE;
	};
};
func void  GRD_205_Scorpio_HeyPC_Info()
{
	AI_Output (self, other,"GRD_205_Scorpio_HeyPC_Info_13_01"); //Nie bój siê, cz³owieku! ChodŸ no tutaj!
};

/*------------------------------------------------------------------------
//							Scorpio ist abgehauen								//
------------------------------------------------------------------------*/
instance  GRD_205_Scorpio_BANISHED (C_INFO)
{
	npc				= GRD_205_Scorpio;
	condition		= GRD_205_Scorpio_BANISHED_Condition;
	information		= GRD_205_Scorpio_BANISHED_Info;
	important		= 0;
	permanent		= 0;
	description		= "Wszystko w porz¹dku?"; 
};

FUNC int  GRD_205_Scorpio_BANISHED_Condition()
{	
	if (Npc_KnowsInfo (hero,GRD_205_Scorpio_HeyPC))
	{
		return TRUE;
	};

};
FUNC void  GRD_205_Scorpio_BANISHED_Info()
{
	AI_Output (other, self,"GRD_205_Scorpio_BANISHED_Info_15_01"); //Wszystko w porz¹dku?
	AI_Output (self, other,"GRD_205_Scorpio_BANISHED_Info_13_02"); //Ukrywam siê. Mam ju¿ doœæ machlojek Stra¿ników.
	AI_Output (self, other,"GRD_205_Scorpio_BANISHED_Info_13_03"); //Ale zabra³em kilka niez³ych cacek ze zbrojowni. Gdybyœ potrzebowa³ broni - zg³oœ siê do mnie.
	if (Scorpio_Exile == FALSE)
	{
	Log_CreateTopic   	(GE_TraderOW,LOG_NOTE);
	B_LogEntry		(GE_TraderOW,   "Skorpion opuœci³ Stary Obóz i wraz z Cavalornem mieszka teraz w myœliwskiej chacie na drodze do Nowego Obozu.");
	Scorpio_Exile = TRUE;
	};
};  

/*------------------------------------------------------------------------
							TRADE								
------------------------------------------------------------------------*/

instance  GRD_205_Scorpio_TRADE (C_INFO)
{
	npc				= GRD_205_Scorpio;
	condition		= GRD_205_Scorpio_TRADE_Condition;
	information		= GRD_205_Scorpio_TRADE_Info;
	important		= 0;
	permanent		= 1;
	description		= "Poka¿, co tam masz."; 
	trade			= 1;
};

FUNC int  GRD_205_Scorpio_TRADE_Condition()
{	
	if( Npc_KnowsInfo (hero,GRD_205_Scorpio_BANISHED))
	{
		return TRUE;
	};

};
FUNC void  GRD_205_Scorpio_TRADE_Info()
{
	AI_Output (other, self,"GRD_205_Scorpio_TRADE_Info_15_01"); //Poka¿, co tam masz.
	B_ClearTreaderAmmo(self);
};  
//========================================
//-----------------> GetInfos
//========================================

INSTANCE DIA_Scorpio_GetInfos (C_INFO)
{
   npc          = GRD_205_Scorpio;
   nr           = 1;
   condition    = DIA_Scorpio_GetInfos_Condition;
   information  = DIA_Scorpio_GetInfos_Info;
   permanent	= FALSE;
   description	= "Móg³byœ przekazaæ pewn¹ informacjê Stra¿nikom?";
};

FUNC INT DIA_Scorpio_GetInfos_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Quentin_TalkAboutMine)) || (Npc_KnowsInfo (hero, DIA_Martin_Trueasd))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Scorpio_GetInfos_Info()
{
    AI_Output (other, self ,"DIA_Scorpio_GetInfos_15_01"); //Móg³byœ przekazaæ pewn¹ informacjê Stra¿nikom?
    AI_Output (self, other ,"DIA_Scorpio_GetInfos_03_02"); //Informacjê? Stra¿nikom?
    AI_Output (self, other ,"DIA_Scorpio_GetInfos_03_03"); //Przecie¿ uciek³em ze Starego Obozu.
    AI_Output (other, self ,"DIA_Scorpio_GetInfos_15_04"); //Stra¿nicy z obozu przy Starej Kopalni siê zbuntowali.
    AI_Output (other, self ,"DIA_Scorpio_GetInfos_15_05"); //Postanowili staæ siê niezale¿ni.
    AI_Output (other, self ,"DIA_Scorpio_GetInfos_15_06"); //Za wszelk¹ cenê chcemy, by Gomez siê o tym dowiedzia³.
    AI_Output (self, other ,"DIA_Scorpio_GetInfos_03_07"); //Za wszelk¹ cenê, powiadasz?
    AI_Output (self, other ,"DIA_Scorpio_GetInfos_03_08"); //No dobrze. Zrobiê to za 1700 bry³ek rudy.
    AI_Output (other, self ,"DIA_Scorpio_GetInfos_15_09"); //Dlaczego tak drogo?
    AI_Output (self, other ,"DIA_Scorpio_GetInfos_03_10"); //To niebezpieczne zadanie. Nie wnikaj.
	if (MIS_BackToOldMine == LOG_RUNNING)
	{
    B_LogEntry                     (CH4_BackToOldMine,"Za 1700 bry³ek rudy Skorpion zaniesie informacjê Gomezowi.");
	};
	if (MIS_HelpBrothersBra == LOG_RUNNING)
	{
    B_LogEntry                     (CH1_HelpBrothersBra,"Za 1700 bry³ek rudy Skorpion zaniesie informacjê Gomezowi.");
	};
    //B_GiveXP (350);
};

//========================================
//-----------------> GiveSomeOrexD
//========================================

INSTANCE DIA_Scorpio_GiveSomeOrexD (C_INFO)
{
   npc          = GRD_205_Scorpio;
   nr           = 2;
   condition    = DIA_Scorpio_GiveSomeOrexD_Condition;
   information  = DIA_Scorpio_GiveSomeOrexD_Info;
   permanent	= FALSE;
   description	= "Niech stracê. (zap³aæ 1700 bry³ek)";
};

FUNC INT DIA_Scorpio_GiveSomeOrexD_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Scorpio_GetInfos))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Scorpio_GiveSomeOrexD_Info()
{
    AI_Output (other, self ,"DIA_Scorpio_GiveSomeOrexD_15_01"); //Niech stracê.
    if (Npc_HasItems (hero, ItMiNugget)>=1700)
    {
        AI_Output (other, self ,"DIA_Scorpio_GiveSomeOrexD_15_02"); //Proszê, oto twoja ruda.
        AI_Output (self, other ,"DIA_Scorpio_GiveSomeOrexD_03_03"); //Dziêki. Zajmê siê tym. Nie ma obawy.
        B_GiveInvItems (other, self, ItMiNugget, 1700);
	if (MIS_BackToOldMine == LOG_RUNNING)
	{
	B_LogEntry                     (CH4_BackToOldMine,"Zap³aci³em Skorpionowi za zaniesienie informacji do Starego Obozu. Mogê wróciæ do Quentina.");
	};
	if (MIS_HelpBrothersBra == LOG_RUNNING)
	{
    B_LogEntry                     (CH1_HelpBrothersBra,"Zap³aci³em Skorpionowi za zaniesienie informacji do Starego Obozu. Bandyci powinni byæ zadowoleni.");
	};
    //B_GiveXP (350);
	przekupionyGRD = true;
    }
    else
    {
        AI_Output (self, other ,"DIA_Scorpio_GiveSomeOrexD_03_04"); //Nie masz przy sobie tyle rudy!
        DIA_Scorpio_GiveSomeOrexD.permanent = true;
		przekupionyGRD = false;
    };
};








//========================================
//-----------------> Blachostka
//========================================

INSTANCE DIA_Scorpio_Blachostka (C_INFO)
{
   npc          = GRD_205_Scorpio;
   nr           = 1;
   condition    = DIA_Scorpio_Blachostka_Condition;
   information  = DIA_Scorpio_Blachostka_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Scorpio_Blachostka_Condition()
{
if (Npc_KnowsInfo(hero,DIA_John_B_Zaklecie))
{
    return TRUE;
};
};
FUNC VOID DIA_Scorpio_Blachostka_Info()
{
    AI_Output (self, other ,"DIA_Scorpio_Blachostka_03_01"); //Widzê, ¿e robisz interesy z Johnem. To dziwne, ¿e ktoœ taki jak ty je z nim robi.
    AI_Output (other, self ,"DIA_Scorpio_Blachostka_15_02"); //Co masz na myœli?
    AI_Output (self, other ,"DIA_Scorpio_Blachostka_03_03"); //Taki nowicjusz jak ty.
    AI_Output (other, self ,"DIA_Scorpio_Blachostka_15_04"); //Ka¿dy kiedyœ zaczyna³?
    AI_Output (self, other ,"DIA_Scorpio_Blachostka_03_05"); //Chyba nie wiesz ch³opcze z kim mia³eœ do czynienia. John to stary wyga.
    AI_Output (self, other ,"DIA_Scorpio_Blachostka_03_06"); //Dosyæ podejrzany typ. Kiedyœ pods³ucha³em rozmowê pewnego podpitego Stra¿nika.
    AI_Output (self, other ,"DIA_Scorpio_Blachostka_03_07"); //Mówi³, ¿e rzekomo John wykonuje tajne misje dla Magnatów.
    AI_Output (other, self ,"DIA_Scorpio_Blachostka_15_08"); //To nie brzmi dobrze. Muszê siê z tego jakoœ wypl¹taæ.
    AI_Output (self, other ,"DIA_Scorpio_Blachostka_03_09"); //Mo¿e ju¿ byæ za póŸno.
    AI_Output (other, self ,"DIA_Scorpio_Blachostka_15_10"); //Ehh... Dziêki za informacjê.
	
	B_Milten_CDay<=(Wld_GetDay()-3); 
	B_LogEntry               (Blachostka,"Skorpion powiedzia³ , ¿e John wykonuje podejrzane misje dla Magnatów. Dziwi³ siê  ,¿e poszed³ na wspó³pracê z takim ¿ó³todziobem jak ja. Wyczuwam k³opoty.");
};

instance dia_scorpio_pickpocket(c_info) {
    npc = grd_205_scorpio;
    nr = 900;
    condition = dia_scorpio_pickpocket_condition;
    information = dia_scorpio_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_scorpio_pickpocket_condition() {
	e_beklauen(baseThfChanceGRD, 30);
};

func void dia_scorpio_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_scorpio_pickpocket);
	info_addchoice(dia_scorpio_pickpocket, dialog_back, dia_scorpio_pickpocket_back);
	info_addchoice(dia_scorpio_pickpocket, dialog_pickpocket, dia_scorpio_pickpocket_doit);
};

func void dia_scorpio_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_scorpio_pickpocket);
};

func void dia_scorpio_pickpocket_back() {
    info_clearchoices(dia_scorpio_pickpocket);
};

