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
    AI_Output (self, other ,"DIA_Gavilan_HELLO1_03_01"); //Nowy przybysz! Przyszed³eœ tu zrobiæ wielk¹ karierê nieprawda¿? Haha
    AI_Output (other, self ,"DIA_Gavilan_HELLO1_15_02"); //Ka¿dy kiedyœ zaczyna³.
    AI_Output (self, other ,"DIA_Gavilan_HELLO1_03_03"); //Ale te¿ czêsto koñczy³ jako trup lub bankrut. Ale myœl poztywnie ch³opcze.
    AI_Output (self, other ,"DIA_Gavilan_HELLO1_03_04"); //Jak bêdziesz unika³ k³opotów I siê rozwija³ to mo¿e tu wy¿yjesz. Czas poka¿e.
    AI_Output (other, self ,"DIA_Gavilan_HELLO1_15_05"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Gavilan_HELLO1_03_06"); //Jestem Gavilan. Zajmuje siê handlem w kotle a sam Lee da³ mi specjalne upowa¿nienie.
    AI_Output (self, other ,"DIA_Gavilan_HELLO1_03_07"); //Mo¿e mój asortyment nie jest zbyt szeroki ale mo¿e z czasem to siê zmieni.
    AI_Output (other, self ,"DIA_Gavilan_HELLO1_15_08"); //Masz jakiœ problem z dostawami?
    AI_Output (self, other ,"DIA_Gavilan_HELLO1_03_09"); //Ch³opczê to Kolonia karna tu ka¿dy ma jakiœ problem. Zw³aszcza z zaopatrzeniem w towary.
    AI_Output (self, other ,"DIA_Gavilan_HELLO1_03_10"); //Na szczêœcie czêœæ asortymentu do mnie dociera. I mam go do dyspozycji.
	B_LogEntry		(GE_TraderOW,"U Gavilana w kotle bêdê móg³ dostaæ ró¿ne drobiazgi.");   
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
   description	= "Chcia³bym trochê pohandlowaæ.";
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
    AI_Output (other, self ,"DIA_Gavilan_Trade_15_01"); //Chcia³bym trochê pohandlowaæ.
    AI_Output (self, other ,"DIA_Gavilan_Trade_03_02"); //Œmia³o ch³opcze!
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
    AI_Output (self, other ,"DIA_Gavilan_CH4_03_01"); //O widzê, ¿e ty te¿ dotar³eœ do £owców Orków jak ja przed chwil¹.
    AI_Output (other, self ,"DIA_Gavilan_CH4_15_02"); //Zgadza siê. Sk¹d u ciebie pomys³ by tu przybyæ?
    AI_Output (self, other ,"DIA_Gavilan_CH4_03_03"); //Có¿ za³atwia³em nowe kontakty by poprawiæ swoj¹ ofertê handlow¹. Dlatego opuœci³em Kocio³.
    AI_Output (self, other ,"DIA_Gavilan_CH4_03_04"); //Wkrótce dosz³y do mnie wiadomoœci o ataku si³ Gomeza na Woln¹ Kopalnie. 
    AI_Output (self, other ,"DIA_Gavilan_CH4_03_05"); // A to pod³y sukinsyn! Pewnie wszyscy dotychczasowi bywalcy tego miejsca przepadli...
    AI_Output (other, self ,"DIA_Gavilan_CH4_15_06"); //Ale sk¹d pomys³ by trafiæ tutaj?
    AI_Output (self, other ,"DIA_Gavilan_CH4_03_07"); //Wszystko wysz³o przez przypadek. Natkn¹³em siê na jednego z £owców na zwiadach. 
    AI_Output (self, other ,"DIA_Gavilan_CH4_03_08"); //Zapyta³em gdzie na co dzieñ przebywa i czy jest ich wiêcej. Zaprowadzi³ mnie tutaj a Wilson pozwoli³ mi siê tutaj schroniæ.
    AI_Output (other, self ,"DIA_Gavilan_CH4_15_09"); //Mi³o z jego strony.
    AI_Output (self, other ,"DIA_Gavilan_CH4_03_10"); //Jestem mu ogromnie wdzêczny. Da³em mu trochê rudy w podziêce ale to nadal niewiele....
    AI_Output (self, other ,"DIA_Gavilan_CH4_03_11"); //Gdybym natkn¹³ siê na patrol ludzi Gomeza mój los by³by przes¹dzony. Teraz morduj¹ bez ¿adnej litoœci.
    AI_Output (other, self ,"DIA_Gavilan_CH4_15_12"); //Trzeba zakoñczyæ to szaleñstwo najszybciej jak siê da.
    AI_Output (self, other ,"DIA_Gavilan_CH4_03_13"); //Mam szczer¹ nadzieje ale to bêdzie ciê¿kie zadanie dla kogokolwiek kto siê tego podejmie. 
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
   description	= "Mam skórê niedŸwiedzia do sprzedania.";
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
    AI_Output (other, self ,"DIA_Gavilan_BearFur_15_01"); //Mam skórê niedŸwiedzia do sprzedania.
    AI_Output (self, other ,"DIA_Gavilan_BearFur_03_02"); //No i to mi siê podoba! 
    AI_Output (self, other ,"DIA_Gavilan_BearFur_03_03"); //To rzadki towar. Nie ma zbyt wiele niedŸwiedzi pod Barier¹.
    AI_Output (self, other ,"DIA_Gavilan_BearFur_03_04"); //Poka¿ t¹ skórê.
    AI_Output (other, self ,"DIA_Gavilan_BearFur_15_05"); //Popatrz na ni¹. Chyba siê nada.
    AI_Output (self, other ,"DIA_Gavilan_BearFur_03_06"); //Przyznam, ¿e wygl¹da bardzo dobrze. Niez³a robota. WeŸ t¹ rudê. Mam nadzieje, ¿e wystarczy.
	B_GiveInvItems (other,self, ItAt_BearFur, 1);
	B_GiveInvItems (self,other, itminugget, 200);
    AI_Output (other, self ,"DIA_Gavilan_BearFur_15_07"); //NieŸle. Mi pasuje.
    AI_Output (self, other ,"DIA_Gavilan_BearFur_03_08"); //Sam upolowa³eœ tego niedŸwiedzia?
    AI_Output (other, self ,"DIA_Gavilan_BearFur_15_09"); //Razem z pewnym myœliwym. W boju pad³y dwie sztuki wiêc pozyskaliœmy dwie skóry.
    AI_Output (other, self ,"DIA_Gavilan_BearFur_15_10"); //Mój kompan z polowania wkrótce ciê odwiedzi z drugim trofeum.
    AI_Output (self, other ,"DIA_Gavilan_BearFur_03_11"); //No to bardzo dobrze. Cenny towar zawsze mile widziany u porz¹dnego handlarza. Dziêki. Gdybyœ mia³ coœ równie ciekawego do zaoferowania to daj znaæ!
    AI_Output (other, self ,"DIA_Gavilan_BearFur_15_12"); //W porz¹dku. Zawsze fajne zarobiæ.
	B_LogEntry               (NiedzwiedziaPrzysluga,"Sprzeda³em Gavilanowi skórê niedŸwiedzia i powiedzia³em o rych³ej wizycie Arnolda w podobnym celu. Trzeba przyznaæ, ¿e sporo zarobi³em za pozyskan¹ wczeœniej skórê i Gavilan chêtnie widzi potencjaln¹ dalsz¹ wspó³pracê handlow¹ ze mn¹.");
	Log_SetTopicStatus	(NiedzwiedziaPrzysluga, LOG_SUCCESS);
	B_GiveXP(200);
    AI_StopProcessInfos	(self);
};

