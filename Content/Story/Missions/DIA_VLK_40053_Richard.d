
// ********************************
// 				EXIT
// ********************************

instance DIA_Richard_EXIT (C_INFO)
{
	npc			= VLK_40053_Richard;
	nr			= 999;
	condition	= DIA_Richard_EXIT_Condition;
	information	= DIA_Richard_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Richard_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_Richard_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};



// ********************************
// 				Dziwna przypad�o��
// ********************************

instance DIA_Richard_Hallo (C_INFO)
{
	npc			= VLK_40053_Richard;
	nr			= 1;
	condition	= DIA_Richard_Hallo_Condition;
	information	= DIA_Richard_Hallo_Info;
	permanent	= 0;
    important   = TRUE;
};                       

FUNC int DIA_Richard_Hallo_Condition()
{
if (hero.level >= 5) 
{
	return 1;
};
};
FUNC VOID  DIA_Richard_Hallo_Info()
{
	AI_Output (self, other,"DIA_Richard_Hallo_04_00"); //Ch�opcze, prosz� podejd� na chwile. Musisz mi pom�c.
	AI_Output (other, self,"DIA_Richard_Hallo_15_01"); //O co chodzi? O rud�, kt�r� mam ci po�yczy� na wieczne nieoddanie?
	AI_Output (self, other,"DIA_Richard_Hallo_04_02"); //Nie mierz wszystkich w tej brudnej Kolonii jedn� miar�.
    AI_Output (self, other,"DIA_Richard_Hallo_04_03"); //Tu nie chodzi o par� marnych bry�ek rudy na piwo. To powa�na sprawa!
	AI_Output (self, other,"DIA_Richard_Hallo_04_04"); //Cholera... Niedobrze mi! (Bierze g��boki oddech).
	AI_Output (self, other,"DIA_Richard_Hallo_04_05"); //Fatalnie si� czuje, oblewa mnie zimny pot, mam gor�czk� i ci�gle wymiotuje. Jest coraz gorzej...
	
};


//========================================
//-----------------> Dziwna przypad�o��
//========================================

INSTANCE DIA_Richard_Why (C_INFO)
{
   npc          = VLK_40053_Richard;
   nr           = 1;
   condition    = DIA_Richard_Why_Condition;
   information  = DIA_Richard_Why_Info;
   permanent	= FALSE;
   description	= "Dlaczego jest z tob� tak �le?";
};

FUNC INT DIA_Richard_Why_Condition()
{
if (Npc_KnowsInfo (hero, DIA_Richard_Hallo))
{
    return TRUE;
};
};


FUNC VOID DIA_Richard_Why_Info()
{
    AI_Output (other, self ,"DIA_Richard_Why_15_01"); //Dlaczego jest z tob� tak �le?
    AI_Output (self, other ,"DIA_Richard_Why_03_02"); //Zawsze lubi�em gra� w ko�ci z innymi kopaczami. Par� tygodni temu czu�em, �e mi si� poszcz�ci.
    AI_Output (self, other ,"DIA_Richard_Why_03_03"); //Postawi�em wi�c prawie ca�� swoja rud� i przegra�em. Wkr�tce moje zapasy �ywno�ci si� sko�czy�y a na now� nie by�o mnie sta�.
    AI_Output (self, other ,"DIA_Richard_Why_03_04"); //Pewnego dnia znalaz�em jakiego� niebieskiego grzyba i odk�d go zjad�em to wszystko si� zacze�o.
    AI_Output (self, other ,"DIA_Richard_Why_03_05"); //Grimes poradzi� mi bym wys�a� kogo� by pom�wi� z jakim� Magiem na temat lekarstwa.
	
	
};

//========================================
//-----------------> Dziwna przypad�o��
//========================================

INSTANCE DIA_Richard_Decyzja (C_INFO)
{
   npc          = VLK_40053_Richard;
   nr           = 2;
   condition    = DIA_Richard_Decyzja_Condition;
   information  = DIA_Richard_Decyzja_Info;
   permanent	= FALSE;
   description	= "Ten kto� to oczywi�cie ja... jak zwykle.";
};

FUNC INT DIA_Richard_Decyzja_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Richard_Why))
  
    {
    return TRUE;
    };
};


FUNC VOID DIA_Richard_Decyzja_Info()
{
    AI_Output (other, self ,"DIA_Richard_Decyzja_15_01"); //Ten kto� to oczywi�cie ja... jak zwykle.
    AI_Output (self, other ,"DIA_Richard_Decyzja_03_02"); //M�ody, nie traktuj tego jak zwyk�� b�ahostk�. Tu chodzi o moje �ycie i zdrowie.
	AI_Output (self, other ,"DIA_Richard_Decyzja_03_03"); //Obiecuj� �e jako� ci si� odwdzi�dz�.
    AI_Output (other, self ,"DIA_Richard_Decyzja_15_04"); //Ale co konkretnie mam zrobi�? Tak po prostu podrepta� do, kt�rego� z Mag�w i powiedzie�, �e zjad�e� jakiego� grzyba i �le si� czujesz?!
    AI_Output (self, other ,"DIA_Richard_Decyzja_03_05"); //Musimy by� dok�adni inaczej nie wyrwie si� temu cholerstwu i zgin� marnie...
   
    Info_ClearChoices (DIA_Richard_Decyzja);
	Info_AddChoice    (DIA_Richard_Decyzja,"Dobrze, pomog� ci.",DIA_Richard_D_Tak);
	Info_AddChoice    (DIA_Richard_Decyzja,"Poszukaj sobie innego ch�opca na posy�ki.",DIA_Richard_D_Nie);
};

FUNC VOID DIA_Richard_D_Tak()
  {
	AI_Output (other,self ,"DIA_Richard_D_Tak_15_00");  //Dobrze, pomog� ci. Ale m�w jasno co mam robi�.
	AI_Output (self ,other,"DIA_Richard_D_Tak_11_01");  //Dam ci fiolk� z moj� krwi� a ty zaniesiesz j� Magowi znaj�cemu si� na alchemii. Musi j� zbada� a potem pomy�le� nad antidotum. Oto ona.
	AI_Output (other,self ,"DIA_Richard_D_Tak_15_02");  //Mam z tym i�� do Maga w Starym Obozie?
    B_GiveInvItems (self,other, ItMi_RichardBlood, 1);
    AI_Output (self ,other,"DIA_Richard_D_Tak_11_03");  //Nie! Magowie Ognia to banda tego starego podst�pnego Corristo. S�ysza�em o nim wiele z�ego...
	AI_Output (self ,other,"DIA_Richard_D_Tak_11_04");  //Lepiej uda� si� do Nowego Obozu pom�wi� z Magami Wody. Oni wydaj� si� uczciwi.
	AI_Output (other,self ,"DIA_Richard_D_Tak_15_05");  //W takim razie nie umieraj zbyt szybko.
    AI_Output (self ,other,"DIA_Richard_D_Tak_11_06");  //Cholerny �artowni�...
	Richard_DP_Yes = TRUE;
	Log_CreateTopic		(DziwnaPrzypadlosc,	LOG_MISSION);
	Log_SetTopicStatus	(DziwnaPrzypadlosc,	LOG_RUNNING);
    B_LogEntry               (DziwnaPrzypadlosc,"Kopacz Richard mia� ostatnio ci�ko w �yciu. Wiedziony wielkim g�odem zjad� jakiego� dziwnie wygl�daj�cego grzyba. Od tamtej pory czuje si� coraz gorzej. Poprosi� mnie bym mu pom�g�. Mam uda� si� do Mag�w Wody po pomoc.");
	
	
	AI_StopProcessInfos	     (self); 
};


FUNC VOID DIA_Richard_D_Nie()
  {
	AI_Output (other,self ,"DIA_Richard_D_Nie_15_00");  //Co�... Poszukaj sobie innego ch�opca na posy�ki.
    AI_StopProcessInfos	     (self); 
    Log_SetTopicStatus	(DziwnaPrzypadlosc,	LOG_FAILED);
};





//========================================
//-----------------> Dziwna przypad�o��
//========================================

INSTANCE DIA_Richard_Antidotum (C_INFO)
{
   npc          = VLK_40053_Richard;
   nr           = 1;
   condition    = DIA_Richard_Antidotum_Condition;
   information  = DIA_Richard_Antidotum_Info;
   permanent	= FALSE;
   description	= "Oto twoje antidotum. Wypij je a wyzdrowiejesz.";
};

FUNC INT DIA_Richard_Antidotum_Condition()
{
if (Npc_KnowsInfo (hero, Info_Riordian_DP_Lekarstwo))
&& (Npc_HasItems (other, ItMi_Dp_Antidotum) >=1)
{
    return TRUE;
};
};


FUNC VOID DIA_Richard_Antidotum_Info()
{
    AI_StandUp( VLK_40053_Richard ); 
    AI_Output (other, self ,"DIA_Richard_Antidotum_15_01"); //Oto twoje antidotum. Wypij je a wyzdrowiejesz.
    AI_Output (self, other ,"DIA_Richard_Antidotum_03_02"); //Ledwo mog� usta� na nogach... Eeee... Zaraz si� po�ygam...
    AI_Output (other, self ,"DIA_Richard_Antidotum_15_03"); //Pij!
    AI_Output (self, other ,"DIA_Richard_Antidotum_03_04"); //Dobrze...
	B_GiveInvItems (other,self, ItMi_Dp_Antidotum, 1);
	AI_UseItem(self,ItMi_Dp_Antidotum);
    AI_Output (self, other ,"DIA_Richard_Antidotum_03_05"); //Ohyda!
	AI_Output (other, self ,"DIA_Richard_Antidotum_15_06"); //I jak lepiej?
    AI_Output (self, other ,"DIA_Richard_Antidotum_03_07"); //Chyba nie. Wr�� jutro o ile go do�yje, b�d� ju� wiedzia� czy lekarstwo pomog�o.
    AI_Output (other, self ,"DIA_Richard_Antidotum_15_08"); //Do jutra.
	Richard_Heal_Day = Wld_GetDay();
	B_LogEntry               (DziwnaPrzypadlosc,"Da�em Richardowi lekarstwo. Nie by�o zbyt smaczne ale oka�� si� czy skuteczne. Pom�wi� z nim jutro.");
	
};


//========================================
//-----------------> Dziwna przypad�o��
//========================================

INSTANCE DIA_Richard_Jak_Tam (C_INFO)
{
   npc          = VLK_40053_Richard;
   nr           = 1;
   condition    = DIA_Richard_Jak_Tam_Condition;
   information  = DIA_Richard_Jak_Tam_Info;
   permanent	= FALSE;
   description	= "I jak tam?";
};

FUNC INT DIA_Richard_Jak_Tam_Condition()
{
if (Npc_KnowsInfo (hero, DIA_Richard_Antidotum))  
&& (Richard_Heal_Day != Wld_GetDay())
{
    return TRUE;
};
};


FUNC VOID DIA_Richard_Jak_Tam_Info()
{
    AI_Output (other, self ,"DIA_Richard_Jak_Tam_15_01"); //I jak tam?
    AI_Output (self, other ,"DIA_Richard_Jak_Tam_03_02"); //To niewiarygodne ale czuje si� znacznie lepiej!
    AI_Output (self, other ,"DIA_Richard_Jak_Tam_03_03"); //Wymioty, dreszcze i gor�czka ust�pi�y. Pod koniec my�la�em ju�, �e umr�.
    AI_Output (other, self ,"DIA_Richard_Jak_Tam_15_04"); //Tak by si� sta�o. Zjad�e� wyj�tkowo truj�cego grzyba, mia�e� szcz�cie, �e Mag Riordian zna� antidotum.
    AI_Output (self, other ,"DIA_Richard_Jak_Tam_03_05"); //Jestem twoim d�u�nikiem. Gdyby nie ty, by�bym w�a�nie wrzucany do do�u z robactwem...
	AI_Output (other, self ,"DIA_Richard_Jak_Tam_15_06"); //Zapewne tak.
    AI_Output (self, other ,"DIA_Richard_Jak_Tam_03_07"); //Umiem si� odwdzi�czy�. We� to jako zap�at� chocia� tak naprawd� wy�wiadczy�e� mi bezcenn� przys�ug�.
	B_GiveInvItems (self,other, itminugget, 60);
    AI_Output (other, self ,"DIA_Richard_Jak_Tam_15_08"); //Dzi�ki. Nast�pnym razem nie �aduj si� w takie tarapaty.
    AI_Output (self, other ,"DIA_Richard_Jak_Tam_03_09"); //Wykorzystam drug� szanse od �ycia i postaram si� mie� cz�ciej g�ow� na karku.
    AI_Output (other, self ,"DIA_Richard_Jak_Tam_15_10"); //Sugerowa�bym mie� j� tam zawsze. Trzymaj si� i powodzenia.
	AI_Output (self, other ,"DIA_Richard_Jak_Tam_03_11"); //Dzi�kuje ci za pomoc. Do zobaczenia.
	B_LogEntry               (DziwnaPrzypadlosc,"Richard czuje si� lepiej. Antidotum okaza�o si� skuteczne. Uda�o mi si� go uratowa�. Kopacz by� mi bardzo wdzi�czny i wyp�aci� nale�n� nagrod�.");
	Npc_ExchangeRoutine(self,"Mine");
	Log_SetTopicStatus	(DziwnaPrzypadlosc,	LOG_SUCCESS);
	B_GiveXP(300);
	
};


//========================================
//-----------------> HI_RICHARD
//========================================

INSTANCE DIA_Richard_HI_RICHARD (C_INFO)
{
   npc          = VLK_40053_Richard;
   nr           = 1;
   condition    = DIA_Richard_HI_RICHARD_Condition;
   information  = DIA_Richard_HI_RICHARD_Info;
   permanent	= FALSE;
   description	= "Jak tam u ciebie?";
};

FUNC INT DIA_Richard_HI_RICHARD_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Richard_HI_RICHARD_Info()
{
    AI_Output (other, self ,"DIA_Richard_HI_RICHARD_15_01"); //Jak tam u ciebie?
    AI_Output (self, other ,"DIA_Richard_HI_RICHARD_03_02"); //Raz na wozie raz pod wozem.
    AI_Output (self, other ,"DIA_Richard_HI_RICHARD_03_03"); //Jako� jeszcze �yje.
    AI_Output (other, self ,"DIA_Richard_HI_RICHARD_15_04"); //Tutaj w kolonii to zawsze co�, prawda?
    AI_Output (self, other ,"DIA_Richard_HI_RICHARD_03_05"); //Tak. Wielu ju� w ten czy inny spos�b wybra�o si� na tamten �wiat pod barier�.
    AI_Output (self, other ,"DIA_Richard_HI_RICHARD_03_06"); //Poza ni� nie by�o idylli ale przynajmniej mia�e� wolny wyb�r.
    AI_Output (self, other ,"DIA_Richard_HI_RICHARD_03_07"); //No i jeszcze rodzin�.
    AI_Output (other, self ,"DIA_Richard_HI_RICHARD_15_08"); //Co si� sta�o?
    AI_Output (self, other ,"DIA_Richard_HI_RICHARD_03_09"); //Przepraszam ale to zbyt bolesne. Nie chce do tego wraca�.
    AI_StopProcessInfos	(self);
};

instance dia_richard_pickpocket(c_info) {
    npc = vlk_40053_richard;
    nr = 900;
    condition = dia_richard_pickpocket_condition;
    information = dia_richard_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_richard_pickpocket_condition() {
	e_beklauen(baseThfChanceVLK, 20);
};

func void dia_richard_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_richard_pickpocket);
	info_addchoice(dia_richard_pickpocket, dialog_back, dia_richard_pickpocket_back);
	info_addchoice(dia_richard_pickpocket, dialog_pickpocket, dia_richard_pickpocket_doit);
};

func void dia_richard_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_richard_pickpocket);
};

func void dia_richard_pickpocket_back() {
    info_clearchoices(dia_richard_pickpocket);
};