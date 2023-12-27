//poprawione i sprawdzone - Reflide

// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Brennus_Exit (C_INFO)
{
	npc			= VLK_40057_Brennus;
	nr			= 999;
	condition	= DIA_Brennus_Exit_Condition;
	information	= DIA_Brennus_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Brennus_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Brennus_Exit_Info()
{
	
	AI_StopProcessInfos	( self );
};

//========================================
//-----------------> TaLK
//========================================

INSTANCE DIA_Brennus_TALK (C_INFO)
{
   npc          = VLK_40057_Brennus;
   nr           = 1;
   condition    = DIA_Brennus_TALK_Condition;
   information  = DIA_Brennus_TALK_Info;
   permanent	= TRUE;
   description	= "Co s�ycha�?";
};

FUNC INT DIA_Brennus_TALK_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Brennus_HI_BRE2))
{
    return TRUE;
};
};
FUNC VOID DIA_Brennus_TALK_Info()
{
    AI_Output (other, self ,"DIA_Brennus_TALK_15_01"); //Co s�ycha�?
    AI_Output (self, other ,"DIA_Brennus_TALK_03_02"); //Ahh... nie mam ju� ochoty na rozmow�.
    AI_Output (other, self ,"DIA_Brennus_TALK_15_03"); //Co� nie tak?
    AI_Output (self, other ,"DIA_Brennus_TALK_03_04"); //Chyba jasno si� wyrazi�em nieprawda�?
	AI_StopProcessInfos	( self );
  
};
//========================================
//-----------------> HI_BRE
//========================================

INSTANCE DIA_Brennus_HI_BRE (C_INFO)
{
   npc          = VLK_40057_Brennus;
   nr           = 1;
   condition    = DIA_Brennus_HI_BRE_Condition;
   information  = DIA_Brennus_HI_BRE_Info;
   permanent	= FALSE;
   description	= "Co u ciebie?";
};

FUNC INT DIA_Brennus_HI_BRE_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Brennus_HI_BRE_Info()
{
    AI_Output (other, self ,"DIA_Brennus_HI_BRE_15_01"); //Co u ciebie?
    AI_Output (self, other ,"DIA_Brennus_HI_BRE_03_02"); //Daj spok�j Z ka�dym dniem zbli�am si� do powrotu do ,,ukochanej� kopalni.
    AI_Output (self, other ,"DIA_Brennus_HI_BRE_03_03"); //Krew si� w cz�owieku gotuje!
    AI_Output (other, self ,"DIA_Brennus_HI_BRE_15_04"); //Widz�, �e nie pa�asz zbytnim optymizmem co do wizyty w kopalni.
    AI_Output (self, other ,"DIA_Brennus_HI_BRE_03_05"); //M�czarnia I tyle. Wszystko co uzyskasz l�duje w kieszeni Magnat�w. Na dodatek ci�gle obawiasz si� o te cholerne Pe�zacze.
    AI_Output (other, self ,"DIA_Brennus_HI_BRE_15_06"); //Widzia�e� kiedy� Pe�zacza?
    AI_Output (self, other ,"DIA_Brennus_HI_BRE_03_07"); //Samego pe�zacza nie ale ju� efekt jego lub ich posi�ku tak. Ze�ar�y mojego kumpla.
    AI_Output (self, other ,"DIA_Brennus_HI_BRE_03_08"); //Dlatego siedz� tutaj I czekam na wyrok.
};

//========================================
//-----------------> HI_BRE2
//========================================

INSTANCE DIA_Brennus_HI_BRE2 (C_INFO)
{
   npc          = VLK_40057_Brennus;
   nr           = 2;
   condition    = DIA_Brennus_HI_BRE2_Condition;
   information  = DIA_Brennus_HI_BRE2_Info;
   permanent	= FALSE;
   description	= "Nie my�la�e� by do��czy� do Cieni?";
};

FUNC INT DIA_Brennus_HI_BRE2_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Brennus_HI_BRE))
{
    return TRUE;
};
};
FUNC VOID DIA_Brennus_HI_BRE2_Info()
{
    AI_Output (other, self ,"DIA_Brennus_HI_BRE2_15_01"); //Nie my�la�e� by do��czy� do Cieni?
    AI_Output (self, other ,"DIA_Brennus_HI_BRE2_03_02"); //To nie moja bajka. Diego nic we mnie nie zobaczy. Nie mam specjalnych umiej�tno�ci czy wp�yw�w w�r�d tutejszych Cieni.
    AI_Output (self, other ,"DIA_Brennus_HI_BRE2_03_03"); //Za to jestem do�� silny.
    AI_Output (other, self ,"DIA_Brennus_HI_BRE2_15_04"); //Co robi�e� przed zrzuceniem pod barier�?
    AI_Output (self, other ,"DIA_Brennus_HI_BRE2_03_05"); //Pracowa�em jako robotnik fizyczny tu I tam. G��wnie za ciep�e jedzenie.
    AI_Output (self, other ,"DIA_Brennus_HI_BRE2_03_06"); //�y�em jak �y�em. Ale mia�em co� co jest najwa�niejsze a tutaj tego brak. Wolno��.
    AI_Output (self, other ,"DIA_Brennus_HI_BRE2_03_07"); // Oby ta bariera pad�a jak najszybciej.
    AI_Output (other, self ,"DIA_Brennus_HI_BRE2_15_08"); //Te� mam tak� nadzieje.
};



//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Brennus_HELLO1 (C_INFO)
{
   npc          = VLK_40057_Brennus;
   nr           = 1;
   condition    = DIA_Brennus_HELLO1_Condition;
   information  = DIA_Brennus_HELLO1_Info;
   permanent	= FALSE;
   description	= "Ty jeste� Brennus?";
};

FUNC INT DIA_Brennus_HELLO1_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Huno_Oprawca))
{
    return TRUE;
};
};
FUNC VOID DIA_Brennus_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Brennus_HELLO1_15_01"); //Ty jeste� Brennus?
    AI_Output (self, other ,"DIA_Brennus_HELLO1_03_02"); //Nie, jestem Gomez... Mo�esz zadawa� m�drzejsze pytania.
    AI_Output (other, self ,"DIA_Brennus_HELLO1_15_03"); //Skoro chcesz. Dlaczego nie donios�e� Asghanowi o szwindlu Winstona?
    AI_Output (self, other ,"DIA_Brennus_HELLO1_03_04"); //Co?!
    AI_Output (other, self ,"DIA_Brennus_HELLO1_15_05"); //By�e� jednym z jego tragarzy. Kupi� tani� bro� u Huno zamiast or� wysokiej jako�ci u Skipa.
    AI_Output (self, other ,"DIA_Brennus_HELLO1_03_06"); //M�wi�, �e to dla kopaczy do obrony...
    AI_Output (other, self ,"DIA_Brennus_HELLO1_15_07"); //Huno m�wi�, �e Winston sprzeda� wam t� opowiastk�. Potwierdzasz to?
    AI_Output (self, other ,"DIA_Brennus_HELLO1_03_08"); //Nie czuje si� winny. Winston kaza� to wykonali�my polecenie.
    AI_Output (other, self ,"DIA_Brennus_HELLO1_15_09"); //Powiesz to Thorusowi.
    AI_Output (self, other ,"DIA_Brennus_HELLO1_03_10"); //50 bry�ek rudy.
    AI_Output (other, self ,"DIA_Brennus_HELLO1_15_11"); //Pazerny z ciebie go��.
    AI_Output (self, other ,"DIA_Brennus_HELLO1_03_12"); //Raczej sprytny i rozs�dny. Jak mam si� to tego miesza� to nie za darmo.
	  B_LogEntry               (Oprawca,"Rozmawia�em z Brennusem. Chce on 50 bry�ek rudy za pomoc w sprawie z Winstonem.");
};



//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Brennus_HELLO2 (C_INFO)
{
   npc          = VLK_40057_Brennus;
   nr           = 2;
   condition    = DIA_Brennus_HELLO2_Condition;
   information  = DIA_Brennus_HELLO2_Info;
   permanent	= FALSE;
   description	= "Dobra, bierz rud�.";
};

FUNC INT DIA_Brennus_HELLO2_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Brennus_HELLO1)) && (Npc_HasItems (other, ItMiNugget) >=50)
{
    return TRUE;
};
};
FUNC VOID DIA_Brennus_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Brennus_HELLO2_15_01"); //Dobra, bierz rud�.
	Brennus_OPR_Day = Wld_GetDay();
    AI_Output (self, other ,"DIA_Brennus_HELLO2_03_02"); // Pogadam z Thorusem. Wr�� do mnie jutro.
    B_GiveInvItems (other, self, itminugget, 50);
	  B_LogEntry               (Oprawca,"Brennus pogada z Thorusem odno�nie szwindlu Winstona. Mam poczeka� do jutra.");
    AI_StopProcessInfos	(self);
};


//========================================
//-----------------> HELLO3
//========================================

INSTANCE DIA_Brennus_HELLO3 (C_INFO)
{
   npc          = VLK_40057_Brennus;
   nr           = 3;
   condition    = DIA_Brennus_HELLO3_Condition;
   information  = DIA_Brennus_HELLO3_Info;
   permanent	= FALSE;
   description	= "I co rozmawia�e� z Thorusem?";
};

FUNC INT DIA_Brennus_HELLO3_Condition()
{
if (Brennus_OPR_Day != Wld_GetDay()) &&(Npc_KnowsInfo(hero,DIA_Brennus_HELLO2))
{
    return TRUE;
};
};
FUNC VOID DIA_Brennus_HELLO3_Info()
{
    AI_Output (other, self ,"DIA_Brennus_HELLO3_15_01"); //I co rozmawia�e� z Thorusem?
    AI_Output (self, other ,"DIA_Brennus_HELLO3_03_02"); //Powiedzia�em wszystko, Thorus napisa� list do Asghana. Obci��a twojego kumpla Winstona.
    AI_Output (self, other ,"DIA_Brennus_HELLO3_03_03"); //Oto on.
	CreateInvItem (self, ItWr_OPR_THOASH);
	B_GiveInvItems (self,other, ItWr_OPR_THOASH, 1);
    AI_Output (other, self ,"DIA_Brennus_HELLO3_15_04"); //Dzi�ki. Teraz musz� pom�wi� z Asghanem.
    AI_Output (self, other ,"DIA_Brennus_HELLO3_03_05"); //Ale jak dostaniesz po �bie od Winstona to masz nie pisn�� s��wka o mojej roli w tej sprawie.
    AI_Output (other, self ,"DIA_Brennus_HELLO3_15_06"); //Postaram si� nie dosta� po g�owie od tego osi�ka.
	  B_LogEntry               (Oprawca,"Brennus da� mi list od Thorusa dla Asghana. Musz� mu go czym pr�dzej dor�czy�.");
};

//========================================
//-----------------> PZ
//========================================

INSTANCE DIA_Brennus_PZ (C_INFO)
{
   npc          = VLK_40057_Brennus;
   nr           = 1;
   condition    = DIA_Brennus_PZ_Condition;
   information  = DIA_Brennus_PZ_Info;
   permanent	= FALSE;
   description	= "Przysy�a mnie Foster. Jeste� mu winien 150 bry�ek.";
};

FUNC INT DIA_Brennus_PZ_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Foster_PZ_RUFI))
&& (Npc_HasItems (other, ItWr_PZ_Brennus) >=1)
{
    return TRUE;
};
};
FUNC VOID DIA_Brennus_PZ_Info()
{
    AI_Output (other, self ,"DIA_Brennus_PZ_15_01"); //Przysy�a mnie Foster. Jeste� mu winien 150 bry�ek.
    AI_Output (self, other ,"DIA_Brennus_PZ_03_02"); //Co? Nie.... Mam ci dawa� rud� dla kogo� innego? W dodatku nie jestem mu nic winny.
    AI_Output (other, self ,"DIA_Brennus_PZ_15_03"); //Nie kr��. Bo jego kumple z Nowego Obozu ci� odwiedz�.
    AI_Output (self, other ,"DIA_Brennus_PZ_03_04"); //Eeee....Pod�y argument si�y. Mo�e i mia�em u niego d�ug. Ale nie u ciebie. Jak przyjdzie osobi�cie to dam mu t� cholern� rud�.
    AI_Output (other, self ,"DIA_Brennus_PZ_15_05"); //Dasz j� mnie. Mam pisemne upowa�nienie od Fostera.
    AI_Output (self, other ,"DIA_Brennus_PZ_03_06"); //Poka� to.
    AI_Output (other, self ,"DIA_Brennus_PZ_15_07"); //Masz.
	B_GiveInvItems (other,self, ItWr_PZ_Brennus, 1);
	B_GiveInvItems (self,other, ItMiNugget, 150);
    B_UseFakeScroll ();
    AI_Output (self, other ,"DIA_Brennus_PZ_03_08"); //Takie same bazgro�y jak wtedy (pod nosem).
    AI_Output (other, self ,"DIA_Brennus_PZ_15_09"); //S�ysza�em to. Zatem rozpozna�e� jego pismo wi�c dawaj rud�.
    AI_Output (self, other ,"DIA_Brennus_PZ_03_10"); //Niech b�dzie. We� to skoro musisz i zostaw mnie w spokoju.
    AI_Output (other, self ,"DIA_Brennus_PZ_15_11"); //Ju� si� robi. Na razie.
    AI_Output (self, other ,"DIA_Brennus_PZ_03_12"); //Taa...
	B_LogEntry           (PoszkodowaniZbieracze,"Brennus pr�bowa� si� wykr�ci� ale stosowne argumenty przekona�y go to tego by przekaza� mi rud�, kt�r� by� winien Fosterowi. To ko�czy sprawe.");
	Log_SetTopicStatus	 (PoszkodowaniZbieracze, LOG_SUCCESS);
    AI_StopProcessInfos	(self);
};

instance dia_brennus_pickpocket(c_info) {
    npc = vlk_40057_brennus;
    nr = 900;
    condition = dia_brennus_pickpocket_condition;
    information = dia_brennus_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_brennus_pickpocket_condition() {
	e_beklauen(baseThfChanceVLK, 20);
};

func void dia_brennus_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_brennus_pickpocket);
	info_addchoice(dia_brennus_pickpocket, dialog_back, dia_brennus_pickpocket_back);
	info_addchoice(dia_brennus_pickpocket, dialog_pickpocket, dia_brennus_pickpocket_doit);
};

func void dia_brennus_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_brennus_pickpocket);
};

func void dia_brennus_pickpocket_back() {
    info_clearchoices(dia_brennus_pickpocket);
};