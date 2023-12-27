// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Gavilan_EXIT(C_INFO)
{
	npc             = ORG_40138_Gavilan;
	nr              = 999;
	condition	= DIA_Gavilan_EXIT_Condition;
	information	= DIA_Gavilan_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Gavilan_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Gavilan_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Gavilan_HELLO1 (C_INFO)
{
   npc          = ORG_40138_Gavilan;
   nr           = 1;
   condition    = DIA_Gavilan_HELLO1_Condition;
   information  = DIA_Gavilan_HELLO1_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Gavilan_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Gavilan_HELLO1_Info()
{
    AI_Output (self, other ,"DIA_Gavilan_HELLO1_03_01"); //Nowy przybysz! Przyszed�e� tu zrobi� wielk� karier� nieprawda�? Haha
    AI_Output (other, self ,"DIA_Gavilan_HELLO1_15_02"); //Ka�dy kiedy� zaczyna�.
    AI_Output (self, other ,"DIA_Gavilan_HELLO1_03_03"); //Ale te� cz�sto ko�czy� jako trup lub bankrut. Ale my�l poztywnie ch�opcze.
    AI_Output (self, other ,"DIA_Gavilan_HELLO1_03_04"); //Jak b�dziesz unika� k�opot�w I si� rozwija� to mo�e tu wy�yjesz. Czas poka�e.
    AI_Output (other, self ,"DIA_Gavilan_HELLO1_15_05"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Gavilan_HELLO1_03_06"); //Jestem Gavilan. Zajmuje si� handlem w kotle a sam Lee da� mi specjalne upowa�nienie.
    AI_Output (self, other ,"DIA_Gavilan_HELLO1_03_07"); //Mo�e m�j asortyment nie jest zbyt szeroki ale mo�e z czasem to si� zmieni.
    AI_Output (other, self ,"DIA_Gavilan_HELLO1_15_08"); //Masz jaki� problem z dostawami?
    AI_Output (self, other ,"DIA_Gavilan_HELLO1_03_09"); //Ch�opcz� to Kolonia karna tu ka�dy ma jaki� problem. Zw�aszcza z zaopatrzeniem w towary.
    AI_Output (self, other ,"DIA_Gavilan_HELLO1_03_10"); //Na szcz�cie cz�� asortymentu do mnie dociera. I mam go do dyspozycji.
	B_LogEntry		(GE_TraderOW,"U Gavilana w kotle b�d� m�g� dosta� r�ne drobiazgi.");   
};

//========================================
//-----------------> Trade
//========================================

INSTANCE DIA_Gavilan_Trade (C_INFO)
{
   npc          = ORG_40138_Gavilan;
   nr           = 2;
   condition    = DIA_Gavilan_Trade_Condition;
   information  = DIA_Gavilan_Trade_Info;
   permanent	= TRUE;
   description	= "Chcia�bym troch� pohandlowa�.";
   trade        = 1;
};

FUNC INT DIA_Gavilan_Trade_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Gavilan_HELLO1))
{
    return TRUE;
};
};
FUNC VOID DIA_Gavilan_Trade_Info()
{
    AI_Output (other, self ,"DIA_Gavilan_Trade_15_01"); //Chcia�bym troch� pohandlowa�.
    AI_Output (self, other ,"DIA_Gavilan_Trade_03_02"); //�mia�o ch�opcze!
	B_ClearTreaderAmmo(self);
};

//========================================
//-----------------> CH4
//========================================

INSTANCE DIA_Gavilan_CH4 (C_INFO)
{
   npc          = ORG_40138_Gavilan;
   nr           = 1;
   condition    = DIA_Gavilan_CH4_Condition;
   information  = DIA_Gavilan_CH4_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Gavilan_CH4_Condition()
{
if (kapitel >= 4)
{
    return TRUE;
};
};
FUNC VOID DIA_Gavilan_CH4_Info()
{
    AI_Output (self, other ,"DIA_Gavilan_CH4_03_01"); //O widz�, �e ty te� dotar�e� do �owc�w Ork�w jak ja przed chwil�.
    AI_Output (other, self ,"DIA_Gavilan_CH4_15_02"); //Zgadza si�. Sk�d u ciebie pomys� by tu przyby�?
    AI_Output (self, other ,"DIA_Gavilan_CH4_03_03"); //C� za�atwia�em nowe kontakty by poprawi� swoj� ofert� handlow�. Dlatego opu�ci�em Kocio�.
    AI_Output (self, other ,"DIA_Gavilan_CH4_03_04"); //Wkr�tce dosz�y do mnie wiadomo�ci o ataku si� Gomeza na Woln� Kopalnie. 
    AI_Output (self, other ,"DIA_Gavilan_CH4_03_05"); // A to pod�y sukinsyn! Pewnie wszyscy dotychczasowi bywalcy tego miejsca przepadli...
    AI_Output (other, self ,"DIA_Gavilan_CH4_15_06"); //Ale sk�d pomys� by trafi� tutaj?
    AI_Output (self, other ,"DIA_Gavilan_CH4_03_07"); //Wszystko wysz�o przez przypadek. Natkn��em si� na jednego z �owc�w na zwiadach. 
    AI_Output (self, other ,"DIA_Gavilan_CH4_03_08"); //Zapyta�em gdzie na co dzie� przebywa i czy jest ich wi�cej. Zaprowadzi� mnie tutaj a Wilson pozwoli� mi si� tutaj schroni�.
    AI_Output (other, self ,"DIA_Gavilan_CH4_15_09"); //Mi�o z jego strony.
    AI_Output (self, other ,"DIA_Gavilan_CH4_03_10"); //Jestem mu ogromnie wdz�czny. Da�em mu troch� rudy w podzi�ce ale to nadal niewiele....
    AI_Output (self, other ,"DIA_Gavilan_CH4_03_11"); //Gdybym natkn�� si� na patrol ludzi Gomeza m�j los by�by przes�dzony. Teraz morduj� bez �adnej lito�ci.
    AI_Output (other, self ,"DIA_Gavilan_CH4_15_12"); //Trzeba zako�czy� to szale�stwo najszybciej jak si� da.
    AI_Output (self, other ,"DIA_Gavilan_CH4_03_13"); //Mam szczer� nadzieje ale to b�dzie ci�kie zadanie dla kogokolwiek kto si� tego podejmie. 
};

//========================================
//-----------------> BearFur
//========================================

INSTANCE DIA_Gavilan_BearFur (C_INFO)
{
   npc          = ORG_40138_Gavilan;
   nr           = 1;
   condition    = DIA_Gavilan_BearFur_Condition;
   information  = DIA_Gavilan_BearFur_Info;
   permanent	= FALSE;
   description	= "Mam sk�r� nied�wiedzia do sprzedania.";
};

FUNC INT DIA_Gavilan_BearFur_Condition()
{
if (Npc_HasItems (other, ItAt_BearFur) >=1)
&& (Npc_KnowsInfo(hero,DIA_Arnold_Bears_Are_Die))
{
    return TRUE;
};
};
FUNC VOID DIA_Gavilan_BearFur_Info()
{
    AI_Output (other, self ,"DIA_Gavilan_BearFur_15_01"); //Mam sk�r� nied�wiedzia do sprzedania.
    AI_Output (self, other ,"DIA_Gavilan_BearFur_03_02"); //No i to mi si� podoba! 
    AI_Output (self, other ,"DIA_Gavilan_BearFur_03_03"); //To rzadki towar. Nie ma zbyt wiele nied�wiedzi pod Barier�.
    AI_Output (self, other ,"DIA_Gavilan_BearFur_03_04"); //Poka� t� sk�r�.
    AI_Output (other, self ,"DIA_Gavilan_BearFur_15_05"); //Popatrz na ni�. Chyba si� nada.
    AI_Output (self, other ,"DIA_Gavilan_BearFur_03_06"); //Przyznam, �e wygl�da bardzo dobrze. Niez�a robota. We� t� rud�. Mam nadzieje, �e wystarczy.
	B_GiveInvItems (other,self, ItAt_BearFur, 1);
	B_GiveInvItems (self,other, itminugget, 200);
    AI_Output (other, self ,"DIA_Gavilan_BearFur_15_07"); //Nie�le. Mi pasuje.
    AI_Output (self, other ,"DIA_Gavilan_BearFur_03_08"); //Sam upolowa�e� tego nied�wiedzia?
    AI_Output (other, self ,"DIA_Gavilan_BearFur_15_09"); //Razem z pewnym my�liwym. W boju pad�y dwie sztuki wi�c pozyskali�my dwie sk�ry.
    AI_Output (other, self ,"DIA_Gavilan_BearFur_15_10"); //M�j kompan z polowania wkr�tce ci� odwiedzi z drugim trofeum.
    AI_Output (self, other ,"DIA_Gavilan_BearFur_03_11"); //No to bardzo dobrze. Cenny towar zawsze mile widziany u porz�dnego handlarza. Dzi�ki. Gdyby� mia� co� r�wnie ciekawego do zaoferowania to daj zna�!
    AI_Output (other, self ,"DIA_Gavilan_BearFur_15_12"); //W porz�dku. Zawsze fajne zarobi�.
	B_LogEntry               (NiedzwiedziaPrzysluga,"Sprzeda�em Gavilanowi sk�r� nied�wiedzia i powiedzia�em o rych�ej wizycie Arnolda w podobnym celu. Trzeba przyzna�, �e sporo zarobi�em za pozyskan� wcze�niej sk�r� i Gavilan ch�tnie widzi potencjaln� dalsz� wsp�prac� handlow� ze mn�.");
	Log_SetTopicStatus	(NiedzwiedziaPrzysluga, LOG_SUCCESS);
	B_GiveXP(200);
    AI_StopProcessInfos	(self);
};

