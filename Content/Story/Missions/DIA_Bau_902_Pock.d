//poprawione i sprawdzone - Reflide

// ************************************************************
// 			  				   EXIT 
// ************************************************************
	var int Pock_ForgetAll;
// ************************************************************

INSTANCE DIA_Pock_EXIT (C_INFO)
{
	npc			= Bau_902_Pock;
	nr			= 999;
	condition	= DIA_Pock_EXIT_Condition;
	information	= DIA_Pock_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Pock_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_Pock_EXIT_Info()
{	
	Pock_ForgetAll = TRUE;
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									WASSER
// *************************************************************************

INSTANCE Info_Pock_Wasser(C_INFO) // E1
{
	npc			= Bau_902_Pock;
	nr			= 800;
	condition	= Info_Pock_Wasser_Condition;
	information	= Info_Pock_Wasser_Info;
	permanent	= 1;
	description = "Przysy³a mnie Lewus. Mam dla ciebie trochê wody.";
};                       

FUNC INT Info_Pock_Wasser_Condition()
{
	if	((Lefty_Mission==LOG_RUNNING) || ((Lefty_Mission==LOG_SUCCESS) && Npc_HasItems(other, ItFo_Potion_Water_01)))
	&&	(self.aivar[AIV_DEALDAY] <= Wld_GetDay())
	&& 	(MIS_BuntZbieraczy != LOG_SUCCESS)
	{
		return 1;
	};
};

FUNC VOID Info_Pock_Wasser_Info()
{
	AI_Output(other,self,"Info_Pock_Wasser_15_00"); //Przysy³a mnie Lewus. Mam dla ciebie trochê wody.
	if (Npc_HasItems(other, ItFo_Potion_Water_01)>=1)
	{
		B_GiveInvItems(other,self,ItFo_Potion_Water_01,1);
		if ( C_BodystateContains(self, BS_SIT) )
		{
			AI_StandUp		(self);
			AI_TurnToNpc	(self, hero);
		};
		AI_UseItem(self, ItFo_Potion_Water_01);
		AI_Output(self,other,"Info_Pock_Wasser_04_01"); //Dziêki, ch³opcze. Piêkne dziêki.
		An_Bauern_verteilt = An_Bauern_verteilt+1;
		if (An_Bauern_verteilt>=DurstigeBauern)
		{
			Lefty_Mission = LOG_SUCCESS;
		};
		self.aivar[AIV_DEALDAY] = Wld_GetDay()+1;
	}
	else
	{
		AI_Output(self,other,"Info_Pock_Wasser_NOWATER_04_00"); //Ale nic ci ju¿ nie zosta³o! Trudno, wezmê trochê od pozosta³ych.
	};
};

// ************************************************************
// 						Hallo
// ************************************************************

INSTANCE DIA_Pock_Hello (C_INFO)
{
	npc			= Bau_902_Pock;
	nr			= 1;
	condition	= DIA_Pock_Hello_Condition;
	information	= DIA_Pock_Hello_Info;
	permanent	= 0;
	description	= "Czeœæ! Jestem tu nowy.";
};                       

FUNC INT DIA_Pock_Hello_Condition()
{
	if (Pock_ForgetAll == FALSE)
	{
		return 1;
	};
};

FUNC VOID DIA_Pock_Hello_Info()
{	
	AI_Output (other, self,"DIA_Pock_Hello_15_00"); //Czeœæ! Jestem tu nowy.
	AI_Output (self, other,"DIA_Pock_Hello_04_01"); //Mi³o zobaczyæ now¹ twarz.
	AI_Output (other, self,"DIA_Pock_Hello_15_02"); //Pewnie jesteœ tu ju¿ od dawna?
	AI_Output (self, other,"DIA_Pock_Hello_04_03"); //Œwiêta racja, ch³opcze. By³em jednym z pierwszych, którzy tu trafili.
};

// ************************************************************
// 						Weißt ne Menge
// ************************************************************

INSTANCE DIA_Pock_KnowMuch (C_INFO)
{
	npc			= Bau_902_Pock;
	nr			= 1;
	condition	= DIA_Pock_KnowMuch_Condition;
	information	= DIA_Pock_KnowMuch_Info;
	permanent	= 0;
	description	= "W takim razie na pewno du¿o wiesz o tym miejscu?";
};                       

FUNC INT DIA_Pock_KnowMuch_Condition()
{
	if ( (Pock_ForgetAll==FALSE) && Npc_KnowsInfo(hero,DIA_Pock_Hello) )
	{
		return 1;
	};
};

FUNC VOID DIA_Pock_KnowMuch_Info()
{	
	AI_Output (other, self,"DIA_Pock_KnowMuch_15_00"); //W takim razie na pewno du¿o wiesz o tym miejscu?
	AI_Output (self, other,"DIA_Pock_KnowMuch_04_01"); //Co nieco. Wiêkszoœæ czasu spêdzam tutaj - na polu.
	AI_Output (self, other,"DIA_Pock_KnowMuch_04_02"); //Pewnie dlatego uda³o mi siê tak d³ugo prze¿yæ. Dostajemy sporo ry¿u i trochê gorza³ki. Mo¿e nie jest to wiele, ale mi wystarczy.
};

// ************************************************************
// 							Warum hier?
// ************************************************************

INSTANCE DIA_Pock_WhyJail (C_INFO)
{
	npc			= Bau_902_Pock;
	nr			= 2;
	condition	= DIA_Pock_WhyJail_Condition;
	information	= DIA_Pock_WhyJail_Info;
	permanent	= 0;
	description	= "Dlaczego tu trafi³eœ?";
};                       

FUNC INT DIA_Pock_WhyJail_Condition()
{
	if ( (Pock_ForgetAll==FALSE) && Npc_KnowsInfo(hero,DIA_Pock_Hello) )
	{
		return 1;
	};
};

FUNC VOID DIA_Pock_WhyJail_Info()
{	
	AI_Output (other, self,"DIA_Pock_WhyJail_15_00"); //Dlaczego tu trafi³eœ?
	AI_Output (self, other,"DIA_Pock_WhyJail_04_01"); //Podatki, ch³opcze. Podatki! Moja chata by³a równie pusta jak mój ¿o³¹dek i po prostu nie mog³em d³u¿ej p³aciæ!
	AI_Output (self, other,"DIA_Pock_WhyJail_04_02"); //No i pewnego dnia schwytali mnie królewscy ¿o³nierze i przywlekli mnie tutaj. Prawdê mówi¹c, na zewn¹trz wcale nie by³o mi lepiej. Tutaj przynajmniej nie g³odujê.
	AI_Output (self, other,"DIA_Pock_WhyJail_04_03"); //Wczeœniej zawsze p³aci³em podatki - przez ca³e ¿ycie! Ale dla tego sukinsyna w koronie to nie by³ ¿aden argument!
};

// ************************************************************
// 						PERM (Forget)
// ************************************************************

INSTANCE DIA_Pock_ForgotAll (C_INFO)
{
	npc			= Bau_902_Pock;
	nr			= 1;
	condition	= DIA_Pock_ForgotAll_Condition;
	information	= DIA_Pock_ForgotAll_Info;
	permanent	= 1;
	description	= "Wszystko w porz¹dku?";
};                       

FUNC INT DIA_Pock_ForgotAll_Condition()
{
	if (Pock_ForgetAll == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Pock_ForgotAll_Info()
{	
	AI_Output (other, self,"DIA_Pock_ForgotAll_15_00"); //Wszystko w porz¹dku?
	AI_Output (self, other,"DIA_Pock_ForgotAll_04_01"); //Mi³o zobaczyæ now¹ twarz.
	AI_Output (other, self,"DIA_Pock_ForgotAll_15_02"); //Czekaj! My ju¿ kiedyœ rozmawialiœmy!
	AI_Output (self, other,"DIA_Pock_ForgotAll_04_03"); //Nie! To niemo¿liwe. Widzê ciê pierwszy raz w ¿yciu!
	AI_Output (other, self,"DIA_Pock_ForgotAll_15_04"); //Jasne...
};

///////////////////////////////////////////////////
//	Gift
///////////////////////////////////////////////////

INSTANCE DIA_Pock_Gift (C_INFO)
{
	npc			= Bau_902_Pock;
	nr			= 1;
	condition	= DIA_Pock_Gift_Condition;
	information	= DIA_Pock_Gift_Info;
	permanent	= 0;
	description	= "Mam dla ciebie prezent.";
};                       

FUNC INT DIA_Pock_Gift_Condition()
{
	if (Quest_StealRing == LOG_RUNNING) && (Npc_HasItems (hero,ItMi_RicelordRing) == 1)
	{
		return 1;
	};
};

FUNC VOID DIA_Pock_Gift_Info()
{	
	AI_Output (other, self,"DIA_Pock_Gift_15_00"); //Mam dla ciebie prezent od Lewusa.
	AI_Output (self, other,"DIA_Pock_Gift_04_01"); //Co? Poka¿ mi to.
	AI_Output (other, self,"DIA_Pock_Gift_15_02"); //To wyraz jego wdziêcznoœci za wsparcie i agitacjê czêœci Zbieraczy.
	AI_Output (self, other,"DIA_Pock_Gift_04_03"); //Ca³kiem ³adna b³yskotka. Dziêki!
	
	B_GiveInvItems (hero, self, ItMi_RicelordRing,1);
	
	Quest_StealRing = LOG_SUCCESS;
	
	B_LogEntry                     (CH1_BuntZbieraczy,"Da³em pierœcieñ Pock'owi. Teraz czas powiedzieæ o wszystkim Ry¿owemu Ksiêciu.");
};

//---------------------------------------------------------------1.6.1-----------------------------------------------------------


//========================================
//-----------------> Plaga
//========================================

INSTANCE DIA_Pock_Plaga (C_INFO)
{
   npc          = Bau_902_Pock;
   nr           = 1;
   condition    = DIA_Pock_Plaga_Condition;
   information  = DIA_Pock_Plaga_Info;
   permanent	= FALSE;
   description	= "Ry¿owy Ksi¹¿e, potrzebuje cz³owieka, który pilnowa³by magazynu...";
};

FUNC INT DIA_Pock_Plaga_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Ricelord_POTION_P))
{
    return TRUE;
};
};
FUNC VOID DIA_Pock_Plaga_Info()
{
    AI_Output (other, self ,"DIA_Pock_Plaga_15_01"); //Ry¿owy Ksi¹¿e, potrzebuje cz³owieka, który pilnowa³by magazynu przed szczurami.
    AI_Output (self, other ,"DIA_Pock_Plaga_03_02"); //A to ³achudra. Nic nie jest w stanie zrobiæ dobrze.
    AI_Output (other, self ,"DIA_Pock_Plaga_15_03"); //Nie chcia³byœ zaj¹æ siê tym magazynem?
    AI_Output (self, other ,"DIA_Pock_Plaga_03_04"); //Wolê ju¿ pracê tutaj ni¿ brudne szczury.
    AI_Output (other, self ,"DIA_Pock_Plaga_15_05"); //Ry¿owy Ksi¹¿e na pewno ci zap³aci.
	Pock_Paga_Guard = TRUE;
    AI_Output (self, other ,"DIA_Pock_Plaga_03_06"); //Hmm... W sumie nudzi mnie ju¿ praca na polu ry¿u. Zap³ata te¿ nie najlepsza.
    AI_Output (self, other ,"DIA_Pock_Plaga_03_07"); //Jesteœ pewien, ¿e mi zap³aci?
    AI_Output (other, self ,"DIA_Pock_Plaga_15_08"); //Jeœli nie bêdzie ci p³aci³ to mi powiedz. Ja pogadam z nim po swojemu...
    AI_Output (self, other ,"DIA_Pock_Plaga_03_09"); //Niech stracê. Zgoda. Mogê siê tym zaj¹æ.
    AI_Output (other, self ,"DIA_Pock_Plaga_15_10"); //Znakomicie. Pomówiê z Ry¿owym Ksiêciem.
	Npc_ExchangeRoutine(Bau_902_Pock,"Plaga");
	B_LogEntry               (Plaga,"Pock zgodzi³ siê zostaæ stró¿em magazynu Ry¿owego Ksiêcia. Wreszcie znalaz³em fra... Znaczy chcia³em napisaæ chêtnego. ");
};

instance dia_pock_pickpocket(c_info) {
    npc = bau_902_pock;
    nr = 900;
    condition = dia_pock_pickpocket_condition;
    information = dia_pock_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_pock_pickpocket_condition() {
	e_beklauen(baseThfChanceBAU, 15);
};

func void dia_pock_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_pock_pickpocket);
	info_addchoice(dia_pock_pickpocket, dialog_back, dia_pock_pickpocket_back);
	info_addchoice(dia_pock_pickpocket, dialog_pickpocket, dia_pock_pickpocket_doit);
};

func void dia_pock_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_pock_pickpocket);
};

func void dia_pock_pickpocket_back() {
    info_clearchoices(dia_pock_pickpocket);
};
