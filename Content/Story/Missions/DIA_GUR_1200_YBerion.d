//poprawione i sprawdzone -  

// ************************************************************
// 							EXIT 
// ************************************************************

INSTANCE Info_Yberion_EXIT(C_INFO)
{
	npc			= GUR_1200_Yberion;
	nr			= 999;
	condition	= Info_Yberion_EXIT_Condition;
	information	= Info_Yberion_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Yberion_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Yberion_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

//############################### KAPITEL 1 ###############################


INSTANCE DIA_YBerion_Wache(C_INFO)
{
	npc			= GUR_1200_Yberion;
	nr			= 1;
	condition	= DIA_YBerion_Wache_Condition;
	information	= DIA_YBerion_Wache_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_YBerion_Wache_Condition()
{
	if (Kapitel == 1)
	{
		return 1;
	};
};

FUNC VOID DIA_YBerion_Wache_Info()
{	
	AI_Output			(self,	other,"DIA_YBerion_Wache_12_00"); //Co tu robisz? Kto ci� tu wpu�ci�? Stra�!
	B_IntruderAlert		(self,	other);
	    AI_StopProcessInfos	(self);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
//1.3 er

};

//############################### Kennen? ###############################

INSTANCE DIA_YBerion_Kennen(C_INFO)
{
	npc			= GUR_1200_Yberion;
	nr			= 1;
	condition	= DIA_YBerion_Kennen_Condition;
	information	= DIA_YBerion_Kennen_Info;
	permanent	= 0;
	description = "Witaj, Mistrzu Y'Berionie.";
};                       

FUNC INT DIA_YBerion_Kennen_Condition()
{
	if (Kapitel == 2)
	{
		return 1;
	};
};

FUNC VOID DIA_YBerion_Kennen_Info()
{	
	AI_Output (other, self,"DIA_YBerion_Kennen_15_00"); //Witaj, Mistrzu Y'Berionie.
	AI_Output (self, other,"DIA_YBerion_Kennen_12_01"); //Ach! Przypominam sobie twoj� twarz.
	AI_Output (other, self,"DIA_YBerion_Kennen_15_02"); //To niemo�liwe. Nigdy wcze�niej si� nie spotkali�my.
	AI_Output (self, other,"DIA_YBerion_Kennen_12_03"); //Ale my�la�em... Ach, czego sobie �yczysz?
};

//############################### KAPITEL 2 ###############################


func void FortunoRespItems()

{

	CreateInvItem (NOV_1357_Fortuno, ItMi_Alchemy_Quicksilver_01);
	CreateInvItem (NOV_1357_Fortuno, ItFo_Honey);
	CreateInvItem (NOV_1357_Fortuno, ItFo_Plants_Flameberry_01);

};


// ------------------------------ BringFocus ---------------------------
INSTANCE Info_YBerion_BringFocus (C_INFO)
{
	npc			= GUR_1200_Yberion;
	condition	= Info_YBerion_BringFocus_Condition;
	information	= Info_YBerion_BringFocus_Info;
	permanent	= 1;
	description = "S�ysza�em, �e czego� szukasz.";
};


FUNC INT Info_YBerion_BringFocus_Condition()
{
	if	(Npc_KnowsInfo(hero,DIA_YBerion_Kennen)	)
	&&	(Npc_GetTrueGuild(hero) != GIL_NONE		)
	&& 	(YBerion_BringFocus		!= LOG_RUNNING	)
	&& 	(YBerion_BringFocus		!= LOG_SUCCESS	)
	{
		return 1;
	};
};

FUNC VOID Info_YBerion_BringFocus_Info()
{
	AI_Output (other, self,"Sit_2_PSI_Yberion_BringFocus_Info_15_01"); //S�ysza�em, �e czego� szukasz.
	AI_Output (self, other,"Sit_2_PSI_Yberion_BringFocus_Info_12_02"); //Zgadza si�. Potrzebujemy magicznego kamienia ogniskuj�cego.
	AI_Output (self, other,"Sit_2_PSI_Yberion_BringFocus_Info_12_03"); //Mia� go dostarczy� jeden z Nowicjuszy, niejaki Nyras, ale do tej pory nie wr�ci�.
	AI_Output (self, other,"Sit_2_PSI_Yberion_BringFocus_Info_12_04"); //M�g�by� dowiedzie� si� co si� z nim dzieje!
	
	Info_ClearChoices	(Info_YBerion_BringFocus);
	Info_AddChoice		(Info_YBerion_BringFocus,DIALOG_BACK							,	Info_YBerion_BringFocus_BACK);
	Info_AddChoice		(Info_YBerion_BringFocus,"Przynios� ci ten kamie� ogniskuj�cy!"	,	Info_YBerion_BringFocus_OK);
	Info_AddChoice		(Info_YBerion_BringFocus,"Gdzie powinienem zacz�� poszukiwania?"					,	Info_YBerion_BringFocus_WO);
	Info_AddChoice		(Info_YBerion_BringFocus,"Dlaczego ten kamie� jest taki wa�ny?"	,	Info_YBerion_BringFocus_FOKUS);
};

func void Info_YBerion_BringFocus_BACK ()
{
	Info_ClearChoices	(Info_YBerion_BringFocus);
};

func void Info_YBerion_BringFocus_OK ()
{
	AI_Output			(other, self,"Sit_2_PSI_Yberion_BringFocus_OK_15_01"); //Przynios� ci ten kamie� ogniskuj�cy!
	AI_Output			(self, other,"Sit_2_PSI_Yberion_BringFocus_OK_12_02"); //We� t� map�. Zaznaczono na niej po�o�enie kamienia.

	B_Story_BringFirstFocus();

	B_LogEntry		(CH2_Focus,	"Y'Berion wys�a� Nyrasa na poszukiwania kamienia ogniskuj�cego. Niestety, Nowicjusz jeszcze nie powr�ci�. Guru da� mi map�, kt�ra wskazuje po�o�enie artefaktu.");
	B_LogEntry                     (CH1_PSIcampWORK,"Dosta�em si� do Y'Beriona. Zleci� mi odnalezienie kamienia ogniskuj�cego.");
};

func void Info_YBerion_BringFocus_WO ()
{
	AI_Output			(other, self,"Sit_2_PSI_Yberion_BringFocus_WO_15_01"); //Gdzie powinienem zacz�� poszukiwania?
	AI_Output			(self, other,"Sit_2_PSI_Yberion_BringFocus_WO_12_02"); //Po wyj�ciu z Obozu skr�� w prawo i wejd� na strome zbocze. Id� przez las, dop�ki nie dojdziesz nad brzeg morza. Tam znajdziesz kamie� ogniskuj�cy.
};

func void Info_YBerion_BringFocus_FOKUS ()
{
	AI_Output			(other, self,"Sit_2_PSI_Yberion_BringFocus_FOKUS_15_01"); //Dlaczego ten kamie� jest taki wa�ny?
	AI_Output			(self, other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_02"); //Ten magiczny artefakt zogniskuje duchow� si�� naszych braci.
	AI_Output			(self, other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_03"); //To jeden z pi�ciu kamieni ogniskuj�cych, kt�re pos�u�y�y magom do utworzenia Bariery.
	AI_Output			(self, other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_04"); //Jedna z moich wizji objawi�a mi zastosowanie kamienia.
	AI_Output			(other, self,"Sit_2_PSI_Yberion_BringFocus_FOKUS_15_05"); //To musia�a by� niezwykle ciekawa wizja.
	AI_Output			(self, other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_06"); //Zes�a� mi j� sam �ni�cy! Dzi�ki kamieniowi ogniskuj�cemu b�dziemy mogli nawi�za� z nim kontakt!
};

// ------------------------------ RUNNING ----------------------------------
INSTANCE Info_YBerion_BringFocus_RUNNING (C_INFO)
{
	npc			= GUR_1200_Yberion;
	nr			= 1;
	condition	= Info_YBerion_BringFocus_RUNNING_Condition;
	information	= Info_YBerion_BringFocus_RUNNING_Info;
	permanent	= 0;
	description	= "Jeszcze nie znalaz�em kamienia ogniskuj�cego.";
};                       

FUNC INT Info_YBerion_BringFocus_RUNNING_Condition()
{
	if  ( YBerion_BringFocus == LOG_RUNNING ) && ( !Npc_HasItems ( hero, Focus_1 ))
	{
		return TRUE;
	};
};

FUNC VOID Info_YBerion_BringFocus_RUNNING_Info()
{	
	AI_Output (other, self,"Info_YBerion_BringFocus_RUNNING_15_01"); //Jeszcze nie znalaz�em kamienia ogniskuj�cego.
	AI_Output (self, other,"Info_YBerion_BringFocus_RUNNING_12_02"); //Wi�c szukaj dalej. �ni�cy wska�e ci drog�.
};

// ------------------------------ SUCCESS ----------------------------------
INSTANCE Info_YBerion_BringFocus_Success (C_INFO)
{
	npc			= GUR_1200_Yberion;
	nr			= 1;
	condition	= Info_YBerion_BringFocus_Success_Condition;
	information	= Info_YBerion_BringFocus_Success_Info;
	permanent	= 0;
	description	= "Znalaz�em kamie�.";
};                       

FUNC INT Info_YBerion_BringFocus_Success_Condition()
{
	if  ( YBerion_BringFocus == LOG_RUNNING ) && ( Npc_HasItems ( hero, Focus_1 ))
	{
		return 1;
	};
};

FUNC VOID Info_YBerion_BringFocus_Success_Info()
{	
	AI_Output			(other, self,"Info_YBerion_BringFocus_Success_15_01"); //Znalaz�em kamie�.
	AI_Output			(self, other,"Info_YBerion_BringFocus_Success_12_02"); //�wietnie. Odda�e� nam ogromn� przys�ug�.
	AI_Output			(self, other,"Info_YBerion_BringFocus_Success_12_03"); //Teraz zanie� kamie� Cor Kalomowi. On b�dzie wiedzia�, co z nim zrobi�.
	if	(Kalom_TalkedTo == FALSE)
	{
		AI_Output		(other, self,"Info_YBerion_BringFocus_Success_15_04"); //Gdzie znajd� tego Cor Kaloma?
		AI_Output		(self, other,"Info_YBerion_BringFocus_Success_12_05"); //Wi�kszo�� czasu sp�dza w laboratorium alchemicznym na wy�szym poziomie Obozu
		AI_Output		(self, other,"Info_YBerion_BringFocus_Success_12_06"); //Porozmawiaj z Lesterem. Znajdziesz go przy wej�ciu do Obozu. On wska�e ci drog�.
		B_LogEntry		(CH2_Focus,	"Y'Berion kaza� mi zanie�� kamie� ogniskuj�cy innemu Guru, imieniem Cor Kalom. Ten Kalom sp�dza pono� ca�e dnie w swoim laboratorium alchemicznym."); 
	}
	else
	{
		B_LogEntry		(CH2_Focus,	"Y'Berion kaza� mi zanie�� kamie� ogniskuj�cy Cor Kalomowi. C� za rado��! Zn�w spotkam tego przemi�ego cz�owieka!");
	};

	Tpl_1406_Templer.aivar[AIV_PASSGATE] = TRUE;		//T�rwache vor dem Labor

	YBerion_BringFocus = LOG_SUCCESS;
	B_GiveXP			(XP_BringFocusToYBerion);
};


//========================================
//-----------------> MessengerStartInfo
//========================================

INSTANCE DIA_Yberion_MessengerStartInfo (C_INFO)
{
   npc          = GUR_1200_Yberion;
   nr           = 1;
   condition    = DIA_Yberion_MessengerStartInfo_Condition;
   information  = DIA_Yberion_MessengerStartInfo_Info;
   permanent	= FALSE;
   description	= "Przychodz� w sprawie pos�a�ca �ni�cego.";
};

FUNC INT DIA_Yberion_MessengerStartInfo_Condition()
{
    if  (Npc_KnowsInfo(hero,DIA_YBerion_Kennen)  	)
	&&	(Npc_GetTrueGuild(hero)     != GIL_NONE		)
	&& 	(MIS_MessengerRecall		== LOG_RUNNING	)
	&& 	(MIS_MessengerRecall		!= LOG_SUCCESS	)
	
    {
    return TRUE;
    };
};


FUNC VOID DIA_Yberion_MessengerStartInfo_Info()
{
    AI_Output (other, self ,"DIA_Yberion_MessengerStartInfo_15_01"); //Mistrzu, przysy�a mnie Lester. Przychodz� w sprawie pos�a�ca �ni�cego.
    AI_Output (self, other ,"DIA_Yberion_MessengerStartInfo_03_02"); //Dost�pisz wielkiego zaszczytu. 
    AI_Output (other, self ,"DIA_Yberion_MessengerStartInfo_15_03"); //O czym m�wisz, Mistrzu?
    AI_Output (self, other ,"DIA_Yberion_MessengerStartInfo_03_04"); //Jeden z naszych Guru ujrza� w wizji niezwyk�� zapowied�. 
    AI_Output (other, self ,"DIA_Yberion_MessengerStartInfo_15_05"); //Zapowied� czego?
    AI_Output (self, other ,"DIA_Yberion_MessengerStartInfo_03_06"); //Cierpliwo�ci. Daj mi sko�czy�.
    AI_Output (self, other ,"DIA_Yberion_MessengerStartInfo_03_07"); //Ujrza� zapowied� przybycia pos�a�ca �ni�cego. To w�a�nie On mo�e nam da� wskaz�wki dotycz�ce przywo�ania �ni�cego.
    AI_Output (self, other ,"DIA_Yberion_MessengerStartInfo_03_08"); //Cor Kalom boryka si� z wielkim problemem. Wydzielina pe�zaczy jest zbyt s�aba, aby rytua� przywo�ania przebieg� pomy�lnie.
    AI_Output (self, other ,"DIA_Yberion_MessengerStartInfo_03_09"); //Pos�aniec mo�e nam da� odpowied� czym zast�pi� wydzielin�. 
    AI_Output (other, self ,"DIA_Yberion_MessengerStartInfo_15_11"); //Co musimy zrobi�, aby go przywo�a�? 
    AI_Output (self, other ,"DIA_Yberion_MessengerStartInfo_03_13"); //Guru spisa� list� przedmiot�w ze sto�u ofiarnego. B�d� one potrzebne do odprawienia rytua�u przywo�ania magicznego Pos�a�ca. Cz�� z nich znajdziesz u nowicjusza Fortuno.
    AI_Output (self, other ,"DIA_Yberion_MessengerStartInfo_03_14"); //I to ty m�odzie�cze b�dziesz mia� zaszczyt je zebra�. Nast�pnie udasz si� do Cor Kaloma - on powie ci co dalej. Oto lista.
    AI_Output (other, self ,"DIA_Yberion_MessengerStartInfo_15_15"); //Zbior� co trzeba i udam si� do Kaloma.
    AI_Output (self, other ,"DIA_Yberion_MessengerStartInfo_03_16"); //Pami�taj, �e nie ominie ci� nagroda zar�wno duchowa jak i materialna.
	
	CreateInvItems (self, ItWr_MessengerList,1);
	B_GiveInvItems (self, other,ItWr_MessengerList,1);
	B_LogEntry(CH2_MessengerRecall,"Y'Berion wyja�ni� mi, �e jeden z Guru do�wiadczy� wizji, w kt�rej objawi� mu si� rytua� przywo�ania pos�a�ca �ni�cego. Ta magiczna istota mo�e da� Bractwu odpowiedzi na pytania zwi�zane z wielkim przywo�aniem �ni�cego. Da� mi list� rzeczy, kt�re musz� zdoby� i zanie�� do Kaloma. Cz�� z nich znajd� u nowicjusza Fortuno.");
	FortunoRespItems();

};


//========================================
//-----------------> MustMix
//========================================

INSTANCE DIA_Yberion_MustMix (C_INFO)
{
   npc          = GUR_1200_Yberion;
   nr           = 1;
   condition    = DIA_Yberion_MustMix_Condition;
   information  = DIA_Yberion_MustMix_Info;
   permanent	= FALSE;
   description	= "Musisz zmusi� Nowicjusza Caine'a do sporz�dzenia mikstury.";
};

FUNC INT DIA_Yberion_MustMix_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Caine_JadJaszczura))
    && (MIS_SickHunter == LOG_RUNNING)
	&& (YBerion_BringFocus == LOG_SUCCESS)
    && (!Npc_KnowsInfo (hero, DIA_Caine_300Oreive))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Yberion_MustMix_Info()
{//1.24 fixed
    AI_Output (other, self ,"DIA_Yberion_MustMix_15_01"); //Musisz zmusi� Nowicjusza Caine'a do sporz�dzenia mikstury.
    AI_Output (other, self ,"DIA_Yberion_MustMix_15_02"); //My�liwy Claw zosta� silnie zatruty, a nikt z twoich ludzi nie chce mi pom�c.
    AI_Output (other, self ,"DIA_Yberion_MustMix_15_03"); //Caine ��da one mnie du�ej ilo�ci rudy.
    AI_Output (other, self ,"DIA_Yberion_MustMix_15_04"); //Przecie� przys�u�y�em si� Bractwu. My�liwi z pewno�ci� te� wiele razy wam pomogli.
    AI_Output (self, other ,"DIA_Yberion_MustMix_03_05"); //Masz racj�. My�liwi pomagali nam pozby� si� bagiennych w�y.
    AI_Output (self, other ,"DIA_Yberion_MustMix_03_06"); //Powiedz Caine'owi, �e nakazuj� mu sporz�dzi� t� mikstur�.
    AI_Output (other, self ,"DIA_Yberion_MustMix_15_07"); //Dzi�kuj�, Ja�nie O�wiecony.
    B_LogEntry                     (CH2_SickHunter,"Y'Berion przem�wi Caine'owi do rozs�dku. Nowicjusz musi mi pom�c! Czy tego chce, czy nie.");

    B_GiveXP (200);
};


// ------------------------------ NYRAS ----------------------------------
INSTANCE Info_YBerion_NYRAS (C_INFO)
{
	npc			= GUR_1200_Yberion;
	nr			= 1;
	condition	= Info_YBerion_NYRAS_Condition;
	information	= Info_YBerion_NYRAS_Info;
	permanent	= 0;
	description	= "Nyras postrada� zmys�y!";
};                       

FUNC INT Info_YBerion_NYRAS_Condition()
{
	if  ( Npc_HasItems ( hero, Focus_1 ))
	{
		return 1;
	};
};

FUNC VOID Info_YBerion_NYRAS_Info()
{	
	AI_Output			(other, self,"Info_YBerion_NYRAS_15_01"); //Nyras postrada� zmys�y!
	AI_Output			(other, self,"Info_YBerion_NYRAS_15_02"); //Twierdzi�, �e �ni�cy objawi� si� mu w wizji i wybra� go na swojego jedynego s�ug�!
	AI_Output			(other, self,"Info_YBerion_NYRAS_15_03"); //Potem rzuci� si� na mnie i pr�bowa� mnie zabi�!
	AI_Output			(self, other,"Info_YBerion_NYRAS_12_04"); //Pot�ga �ni�cego jest tak ogromna, �e mo�e przywie�� nieprzygotowane dusze do szale�stwa.
	AI_Output			(self, other,"Info_YBerion_NYRAS_12_05"); //Tylko my - Guru, po d�ugich latach medytacji, posiadamy wystarczaj�c� si�� duchow�, by m�c sprosta� wyzwaniu, jakim jest wys�uchanie g�osu �ni�cego!
};

// ------------------------------ BELOHNUNG ----------------------------------
instance  GUR_1200_Yberion_EARN (C_INFO)
{
	npc				= GUR_1200_Yberion;
	condition		= GUR_1200_Yberion_EARN_Condition;
	information		= GUR_1200_Yberion_EARN_Info;
	important		= 0;
	permanent		= 0;
	description		= "Chyba nale�y mi si� jaka� nagroda?"; 
};

FUNC int  GUR_1200_Yberion_EARN_Condition()
{	
	if ( YBerion_BringFocus == LOG_SUCCESS) && ( Npc_GetTrueGuild (hero)!= GIL_NOV ) && ( C_IsChapter(2) )
	{
		return 1;
	};

};
FUNC void  GUR_1200_Yberion_EARN_Info()
{
	AI_Output				(other, self,"GUR_1200_Yberion_EARN_Info_15_01"); //Chyba nale�y mi si� jaka� nagroda?
	AI_Output				(self, other,"GUR_1200_Yberion_EARN_Info_12_02"); //Jako �e nie nale�ysz do Bractwa, postanowi�em ci� wynagrodzi�.
	AI_Output				(self, other,"GUR_1200_Yberion_EARN_Info_12_03"); //Przyjmij ten amulet jako wyraz mojej wdzi�czno�ci.
	CreateInvItem	    (self, Schutzamulett_Feuer);
	B_GiveInvItems	    (self, hero, Schutzamulett_Feuer, 1);
};  

//========================================
//-----------------> KASADZIADU
//========================================

INSTANCE DIA_Yberion_KASADZIADU (C_INFO)
{
   npc          = GUR_1200_Yberion;
   nr           = 1;
   condition    = DIA_Yberion_KASADZIADU_Condition;
   information  = DIA_Yberion_KASADZIADU_Info;
   permanent	= FALSE;
   description	= "Jestem wys�annnikiem Quentina.";
};

FUNC INT DIA_Yberion_KASADZIADU_Condition()
{
    if (Npc_KnowsInfo (hero, GUR_1200_Yberion_EARN))
    && (Npc_GetTrueGuild(hero) == GIL_BAU)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Yberion_KASADZIADU_Info()
{
    AI_Output (other, self ,"DIA_Yberion_KASADZIADU_15_01"); //Jestem wys�annikiem Quentina. 
    AI_Output (other, self ,"DIA_Yberion_KASADZIADU_15_02"); //Obieca�e� 1000 bry�ek rudy  Bandytom.
    AI_Output (self, other ,"DIA_Yberion_KASADZIADU_03_03"); //Ach, tak. Zapomnia�em. Prosz� bardzo.
    CreateInvItems (self, ItMiNugget, 1000);
    B_GiveInvItems (self, other, ItMiNugget, 1000);
    B_LogEntry                     (CH1_PSIcampWORK,"Uda�o si�, otrzyma�em rud�. Teraz mog� si� nieco rozejrze�.");

    B_GiveXP (300);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HOW_YOU_LEADER
//========================================

INSTANCE DIA_Yberion_HOW_YOU_LEADER (C_INFO)
{
   npc          = GUR_1200_Yberion;
   nr           = 1;
   condition    = DIA_Yberion_HOW_YOU_LEADER_Condition;
   information  = DIA_Yberion_HOW_YOU_LEADER_Info;
   permanent	= FALSE;
   description	= "Jak odkry�e�, �e chcesz by� duchowym liderem?";
};

FUNC INT DIA_Yberion_HOW_YOU_LEADER_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Yberion_HOW_YOU_LEADER_Info()
{
    AI_Output (other, self ,"DIA_Yberion_HOW_YOU_LEADER_15_01"); //Jak odkry�e�, �e chcesz by� duchowym liderem?
    AI_Output (self, other ,"DIA_Yberion_HOW_YOU_LEADER_03_02"); //To samo przysz�o do mnie. �ni�cy powo�a� mnie bym by� duchowym drogowskazem.
    AI_Output (self, other ,"DIA_Yberion_HOW_YOU_LEADER_03_03"); //Wtedy przed laty w Starym Obozie wielu by�o niezadowolonych z codziennej egzystencji. Ludzie przestali mie� cel, tracili wiar�.
    AI_Output (self, other ,"DIA_Yberion_HOW_YOU_LEADER_03_04"); //Lecz ci, kt�rzy poczuli moc �ni�cego wsparli moj� inicjatyw�. Wtedy poczu�em jeszcze wi�ksz� si��.
    AI_Output (other, self ,"DIA_Yberion_HOW_YOU_LEADER_15_05"); //Nie czujesz si� tym przyt�oczony?
    AI_Output (self, other ,"DIA_Yberion_HOW_YOU_LEADER_03_06"); //A czym�e to?
    AI_Output (other, self ,"DIA_Yberion_HOW_YOU_LEADER_15_07"); //Jeste� nie tylko przyw�dc� obozu ale te� duchowym przyw�dc�. To tworzy presj� I absorbuje.
    AI_Output (self, other ,"DIA_Yberion_HOW_YOU_LEADER_03_08"); //Haaa... Od �ni�cego sp�ywa na mnie dar energii by zarz�dza� obozem I �yciem duchowym jego mieszka�c�w.
    AI_Output (self, other ,"DIA_Yberion_HOW_YOU_LEADER_03_09"); //Musz� spaja� t� wsp�lnot�. I p�ki, �yje tak w�a�nie b�dzie!
    AI_Output (self, other ,"DIA_Yberion_HOW_YOU_LEADER_03_10"); //Nie mog� zawie�� �adnej z kast, kt�re mam pod duchowym zwierzchnictwem. 
    AI_Output (other, self ,"DIA_Yberion_HOW_YOU_LEADER_15_11"); //Rozumiem. To dosy� ciekawe.
};



//############################### KAPITEL 3 ###############################
//SPIELER HAT DIE HEILKR�UTER ZU COR ANGAR GEBRACHT
//YBERION WACHT AUF UND STIRBT
/*
instance GUR_1200_Yberion_LASTWORDS (C_INFO)
{
	npc				= GUR_1200_Yberion;
	condition		= GUR_1200_Yberion_LASTWORDS_Condition;
	information		= GUR_1200_Yberion_LASTWORDS_Info;
	important		= 1;
	permanent		= 0;

};

FUNC int GUR_1200_Yberion_LASTWORDS_Condition()
{	
	if ( Npc_KnowsInfo (hero,Info_CorAngar_FindHerb_Success))
	{
		return 1;
	};

};
FUNC void  GUR_1200_Yberion_LASTWORDS_Info()
{
	AI_Output (self, other,"GUR_1200_Yberion_LASTWORDS_Info_12_01"); //Das Ende...der Schl�fer...ich sah...IHN!
	AI_Output (self, other,"GUR_1200_Yberion_LASTWORDS_Info_12_02"); //Wer...?...du bist es, gut. H�r mir zu....
	AI_Output (self, other,"GUR_1200_Yberion_LASTWORDS_Info_12_03"); //Du darfst den Schl�fer nicht wecken,... die Wassermagier, ...
	AI_Output (other, self,"GUR_1200_Yberion_LASTWORDS_Info_15_04"); //Was ist mit den Wassermagiern?
	AI_Output (self, other,"GUR_1200_Yberion_LASTWORDS_Info_12_05"); //Du musst zu den Wassermagiern gehen. Sie werden es schaffen, hier rauszukommen.
	AI_Output (self, other,"GUR_1200_Yberion_LASTWORDS_Info_12_06"); //Der Schl�fer...Ich sah ihn. Er ist ein ...ein ....D�mon!
	AI_Output (self, other,"GUR_1200_Yberion_LASTWORDS_Info_12_07"); //Wenn du die Barriere noch immer vernichten willst,... geh zum Neuen Lager. Berichte ihnen vom Fokus. Sag ihnen...
	AI_Output (self, other,"GUR_1200_Yberion_LASTWORDS_Info_12_08"); //...sag ihnen das wir herausgefunden haben, wie sich die Foki aufladen lassen, sie sollen...sollen die Barriere vernichten......ihr m�sst ....
	AI_Output (self, other,"GUR_1200_Yberion_LASTWORDS_Info_12_09"); //...das B�se....darf nicht erwachen .... 
	
	
	
};  
// ------------------------------  ----------------------------------
*/

instance dia_yberion_pickpocket(c_info) {
    npc = gur_1200_yberion;
    nr = 900;
    condition = dia_yberion_pickpocket_condition;
    information = dia_yberion_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_yberion_pickpocket_condition() {
	e_beklauen(baseThfChanceGUR - 5, 50);
};

func void dia_yberion_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_yberion_pickpocket);
	info_addchoice(dia_yberion_pickpocket, dialog_back, dia_yberion_pickpocket_back);
	info_addchoice(dia_yberion_pickpocket, dialog_pickpocket, dia_yberion_pickpocket_doit);
};

func void dia_yberion_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_yberion_pickpocket);
};

func void dia_yberion_pickpocket_back() {
    info_clearchoices(dia_yberion_pickpocket);
};