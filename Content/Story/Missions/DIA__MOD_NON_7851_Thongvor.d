//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Nordmarczyk_EXIT(C_INFO)
{
	npc             = NON_7851_Nordmarczyk;
	nr              = 999;
	condition		= DIA_Nordmarczyk_EXIT_Condition;
	information		= DIA_Nordmarczyk_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Nordmarczyk_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Nordmarczyk_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Nordmarczyk_HELLO1 (C_INFO)
{
   npc          = NON_7851_Nordmarczyk;
   nr           = 1;
   condition    = DIA_Nordmarczyk_HELLO1_Condition;
   information  = DIA_Nordmarczyk_HELLO1_Info;
   permanent	= 0;
   description	= "Co ty tu robisz?";
};

FUNC INT DIA_Nordmarczyk_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Nordmarczyk_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Nordmarczyk_HELLO1_15_01"); //Co ty tu robisz?
    AI_Output (self, other ,"DIA_Nordmarczyk_HELLO1_03_02"); //Nie wida�?! Wyrabiam or�.
	AI_Output (other, self ,"DIA_Nordmarczyk_HELLO1_15_03"); //Sam? Na tym odludziu? Dla kogo pracujesz?
	AI_Output (self, other ,"DIA_Nordmarczyk_HELLO1_03_04"); //Tak, sam. Masz jaki� problem czy zlecenie? Pracuj� dla kogo chc�. Nie jestem byle jakim kowalem. Pochodz� z Nordmaru.
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Nordmarczyk_HELLO2 (C_INFO)
{
   npc          = NON_7851_Nordmarczyk;
   nr           = 1;
   condition    = DIA_Nordmarczyk_HELLO2_Condition;
   information  = DIA_Nordmarczyk_HELLO2_Info;
   permanent	= 0;
   description	= "Jeste� Nordmarczykiem? Jak si� tu dosta�e�?";
};

FUNC INT DIA_Nordmarczyk_HELLO2_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Nordmarczyk_HELLO1))
	{
    return TRUE;
	};
};

FUNC VOID DIA_Nordmarczyk_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Nordmarczyk_HELLO2_15_01"); //Jeste� Nordmarczykiem? Jak si� tu dosta�e�?
    AI_Output (self, other ,"DIA_Nordmarczyk_HELLO2_03_02"); //Jak to jak?! Z�ama�em prawo, zosta�em z�apany i wtr�cony do Kolonii. Pewnie zapytasz co zrobi�em... Pomog�em w napadzie na kupca.
	AI_Output (other, self ,"DIA_Nordmarczyk_HELLO2_15_03"); //Nordmarczycy rzadko opuszczaj� swoje klany. Co ci� do tego sk�oni�o?
	AI_Output (self, other ,"DIA_Nordmarczyk_HELLO2_03_04"); //Chcia�em spr�bowa� innego �ycia w mniej surowych warunkach. Planowa�em wkr�tce wr�ci�, ale wda�em si� w z�e towarzystwo. 
	AI_Output (self, other ,"DIA_Nordmarczyk_HELLO2_03_05"); //Wielu chcia�o wykorzysta� moj� si�� i odwag�. No i tak da�em si� nam�wi� na taki skok...
};

//========================================
//-----------------> OLDORESTAB
//========================================

INSTANCE DIA_Nordmarczyk_OLDORESTAB (C_INFO)
{
   npc          = NON_7851_Nordmarczyk;
   nr           = 1;
   condition    = DIA_Nordmarczyk_OLDORESTAB_Condition;
   information  = DIA_Nordmarczyk_OLDORESTAB_Info;
   permanent	= 0;
   description	= "Pilnie potrzebuj� sztabki stali...";
};

FUNC INT DIA_Nordmarczyk_OLDORESTAB_Condition()
{	
	if (Npc_KnowsInfo (hero,DIA_Huan_FixMyAxe))
	{
    return TRUE;
	};
};

FUNC VOID DIA_Nordmarczyk_OLDORESTAB_Info()
{
    AI_Output (other, self ,"DIA_Nordmarczyk_OLDORESTAB_15_01"); //Pilnie potrzebuj� sztabki stali odlanej wed�ug starej metody.
    AI_Output (self, other ,"DIA_Nordmarczyk_OLDORESTAB_03_02"); //Tej z czas�w pierwszej wojny z orkami? A po c� ci co� takiego?
	AI_Output (other, self ,"DIA_Nordmarczyk_OLDORESTAB_15_03"); //Pewien kowal musi naprawi� bardzo stary or�. 
	AI_Output (self, other ,"DIA_Nordmarczyk_OLDORESTAB_03_04"); //Od lat nie u�ywa si� tego typu stali.
	AI_Output (other, self ,"DIA_Nordmarczyk_OLDORESTAB_15_05"); //Masz mo�e jeden spo�r�d tych relikt�w przesz�o�ci na wyposa�eniu?
	AI_Output (self, other ,"DIA_Nordmarczyk_OLDORESTAB_03_06"); //Ja? Sk�d�e! Ale jest cie� szansy...
	AI_Output (self, other ,"DIA_Nordmarczyk_OLDORESTAB_03_07"); //Dawniej kowalstwo rozwija�o si� w dolinie niezwykle pr�nie. Sam wiesz, kopalnie...
	AI_Output (self, other ,"DIA_Nordmarczyk_OLDORESTAB_03_08"); //Rud� i inne sk�adniki rzemie�lnicze transportowano po G�rniczej Dolinie przy u�yciu woz�w. 
	AI_Output (self, other ,"DIA_Nordmarczyk_OLDORESTAB_03_09"); //Do dzi� mo�na spotka� ich wraki na starych traktach. Jeden z takich w�a�nie wrak�w le�y nieopodal.
	AI_Output (self, other ,"DIA_Nordmarczyk_OLDORESTAB_03_10"); //By� prze�adowany rud� i �elazem. Oczywi�cie zabra�em stamt�d wszystko, co si� da�o, ale mo�e zosta�y jakie� resztki dla ciebie.
	AI_Output (self, other ,"DIA_Nordmarczyk_OLDORESTAB_03_11"); //Rozejrzyj si� tam.
	AI_Output (other, self ,"DIA_Nordmarczyk_OLDORESTAB_15_12"); //Gdzie dok�adnie jest ten w�z?
	AI_Output (self, other ,"DIA_Nordmarczyk_OLDORESTAB_03_13"); //Za moj� wie�� rozci�ga si� p�askowy� na kt�rym �yj� �cierwojady. P�jd� tam i skieruj si� na Ziemie Ork�w.
	AI_Output (self, other ,"DIA_Nordmarczyk_OLDORESTAB_03_14"); //W�z znajduje si� w uschni�tym zagajniku. Uwa�aj na czaj�ce si� tam wilki.
	
	B_LogEntry               (CH1_TorlofsAxe,"Nordmarski kowal poleci� mi przeszuka� wrak starego wozu, kt�rym dawniej transportowano sk�adniki rzemie�lnicze. Znajd� go w uschni�tym zagajniku, na p�askowy�u za wie�� Nordmarczyka. To moja ostatnia szansa.");
};

//========================================
//-----------------> YOURWORK
//========================================

INSTANCE DIA_Nordmarczyk_YOURWORK (C_INFO)
{
   npc          = NON_7851_Nordmarczyk;
   nr           = 1;
   condition    = DIA_Nordmarczyk_YOURWORK_Condition;
   information  = DIA_Nordmarczyk_YOURWORK_Info;
   permanent	= 0;
   description	= "Potrafisz wykona� mistrzowsk� bro�?";
};

FUNC INT DIA_Nordmarczyk_YOURWORK_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Nordmarczyk_HELLO1))
	{
    return TRUE;
	};
};

FUNC VOID DIA_Nordmarczyk_YOURWORK_Info()
{
    AI_Output (other, self ,"DIA_Nordmarczyk_YOURWORK_15_01"); //Potrafisz wykona� mistrzowsk� bro�?
    AI_Output (self, other ,"DIA_Nordmarczyk_YOURWORK_03_02"); //Mog� zaoferowa� ci wi�cej ni� wszyscy kowale z tej pieprzonej Kolonii razem wzi�ci. Wykowanie mistrzowskich broni, przekuwanie, osadzanie run... Wszystko!
	AI_Output (self, other ,"DIA_Nordmarczyk_YOURWORK_03_03"); //Oczywi�cie nie robi� ABSOULTNIE NIC ZA DARMO. Jasne?
	AI_Output (other, self ,"DIA_Nordmarczyk_YOURWORK_15_04"); //Dobrze, dobrze. Jak b�d� mia� dla ciebie zlecenie na pewno si� odezw�.
};

//========================================
//-----------------> URIZIEL_1H
//========================================

INSTANCE DIA_Nordmarczyk_URIZIEL_1H (C_INFO)
{
   npc          = NON_7851_Nordmarczyk;
   nr           = 1;
   condition    = DIA_Nordmarczyk_URIZIEL_1H_Condition;
   information  = DIA_Nordmarczyk_URIZIEL_1H_Info;
   permanent	= 0;
   description	= "Chcia�bym, aby� przeku� dla mnie ten miecz.";
};

FUNC INT DIA_Nordmarczyk_URIZIEL_1H_Condition()
{
	if (Uriziel1H_possible == true) && ( Npc_HasItems ( hero, Mythrilklinge01 ))
	{
    return TRUE;
	};
};

FUNC VOID DIA_Nordmarczyk_URIZIEL_1H_Info()
{
    AI_Output (other, self ,"DIA_Nordmarczyk_URIZIEL_1H_15_01"); //Chcia�bym, aby� przeku� dla mnie ten miecz.
    AI_Output (self, other ,"DIA_Nordmarczyk_URIZIEL_1H_03_02"); //Poka� mi to.
	
	CreateInvItem 			(self, Mythrilklinge01);
	Npc_RemoveInvItem 		(self, ItMw_2H_Axe_Big_01);	
	AI_EquipBestMeleeWeapon	(self);
	AI_ReadyMeleeWeapon		(self);
	AI_PlayAni				(self, "T_1HSINSPECT");
	AI_RemoveWeapon			(self);
	AI_UnequipWeapons		(self);
	Npc_RemoveInvItem 		(self, Mythrilklinge01);	
	EquipItem (self, ItMw_2H_Axe_Big_01);		
	
	AI_Output (self, other ,"DIA_Nordmarczyk_URIZIEL_1H_03_03"); //Wspania�a bro�... Jednak ma na sobie do�� wyra�ne znami� przesz�o�ci. Osadzono tu jaki� klejnot.
	AI_Output (other, self ,"DIA_Nordmarczyk_URIZIEL_1H_15_04"); //Przy pomocy tego ostrza dokonano wielkich czyn�w. Znalaz�em je w orkowej �wi�tyni.
	AI_Output (self, other ,"DIA_Nordmarczyk_URIZIEL_1H_03_05"); //(spogl�da pytaj�co) Zapuszczasz si� w takie miejsca?
	AI_Output (self, other ,"DIA_Nordmarczyk_URIZIEL_1H_03_06"); //Niewa�ne. Powiedz mi, co chcesz z tego zrobi�.
	AI_Output (other, self ,"DIA_Nordmarczyk_URIZIEL_1H_15_07"); //Musisz przeku� to ostrze tak, abym m�g� je swobodnie trzyma� w jednej r�ce. Dasz sobie z tym rad�? 
	AI_Output (self, other ,"DIA_Nordmarczyk_URIZIEL_1H_03_08"); //Jasne, �e dam, jednak nie za darmo. To b�dzie ci� troch� kosztowa�. Konkretnie 2000 bry�ek rudy. 
};

//========================================
//-----------------> URIZIEL_1H_DECIDE
//========================================

INSTANCE DIA_Nordmarczyk_URIZIEL_1H_DECIDE (C_INFO)
{
   npc          = NON_7851_Nordmarczyk;
   nr           = 1;
   condition    = DIA_Nordmarczyk_URIZIEL_1H_DECIDE_Condition;
   information  = DIA_Nordmarczyk_URIZIEL_1H_DECIDE_Info;
   permanent	= 0;
   description	= "Przekuj dla mnie URIZIEL na miecz jednor�czny (koszt: 2000 bry�ek rudy).";
};

FUNC INT DIA_Nordmarczyk_URIZIEL_1H_DECIDE_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Nordmarczyk_URIZIEL_1H)) && ( Npc_HasItems ( hero, Mythrilklinge01 ))
	{
    return TRUE;
	};
};

FUNC VOID DIA_Nordmarczyk_URIZIEL_1H_DECIDE_Info()
{
    AI_Output (other, self ,"DIA_Nordmarczyk_URIZIEL_1H_DECIDE_15_01"); //Przekuj dla mnie URIZIEL na miecz jednor�czny. 
    AI_Output (self, other ,"DIA_Nordmarczyk_URIZIEL_1H_DECIDE_03_02"); //No to dawaj rud�, miecz i do roboty!
	
	B_GiveInvItems (hero,self, Mythrilklinge01, 1);
	B_GiveInvItems (hero,self, itminugget, 2000);
	
	CreateInvItem (self, URIZIEL_Touch);
	B_GiveInvItems (self,hero, URIZIEL_Touch, 1);
	
	//PlayVideo ( "ER_NORDMARIAN_SWORD.bik");
	AI_Output (self, other ,"DIA_Nordmarczyk_URIZIEL_1H_DECIDE_03_03"); //Gotowe! Wysz�o naprawd� �wietnie. Niech ci s�u�y. 
	AI_Output (other, self ,"DIA_Nordmarczyk_URIZIEL_1H_DECIDE_15_04"); //Dzi�ki. Mam nadziej�, �e nie wyda�em tej rudy na marne. 
	AI_Output (self, other ,"DIA_Nordmarczyk_URIZIEL_1H_DECIDE_03_05"); //Chcesz pisemn� gwarancj�? 
	AI_Output (other, self ,"DIA_Nordmarczyk_URIZIEL_1H_DECIDE_15_06"); //Na ile?
	AI_Output (self, other ,"DIA_Nordmarczyk_URIZIEL_1H_DECIDE_03_07"); //Powiniene� da� rad� zabi� t� broni�... hmm... powiedzmy, �e stu ork�w. Oczywi�cie musisz regularnie zagl�da� do autoryzowanego kowala. 
	AI_Output (other, self ,"DIA_Nordmarczyk_URIZIEL_1H_DECIDE_15_08"); //Pewnie taki przegl�d nie jest tani...
	AI_Output (self, other ,"DIA_Nordmarczyk_URIZIEL_1H_DECIDE_03_09"); //My�l�, �e m�g�bym da� ci jak�� zni�k�. No, ale do�� ju� �art�w. Pewnie masz du�o do zrobienia.
	AI_Output (other, self ,"DIA_Nordmarczyk_URIZIEL_1H_DECIDE_15_10"); //Tak, wielkie dzi�ki za pomoc. 
	B_GiveXP (500);
};

//========================================
//-----------------> LearnMe
//========================================

INSTANCE DIA_Thongvor_LearnMe (C_INFO)
{
   npc          = NON_7851_Nordmarczyk;
   nr           = 1;
   condition    = DIA_Thongvor_LearnMe_Condition;
   information  = DIA_Thongvor_LearnMe_Info;
   permanent	= FALSE;
   description	= "Mo�esz mnie czego� nauczy�?";
};

FUNC INT DIA_Thongvor_LearnMe_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Nordmarczyk_HELLO1))
{
    return TRUE;
};
};
FUNC VOID DIA_Thongvor_LearnMe_Info()
{
    AI_Output (other, self ,"DIA_Thongvor_LearnMe_15_01"); //Mo�esz mnie czego� nauczy�?
    AI_Output (self, other ,"DIA_Thongvor_LearnMe_03_02"); //Mog�, jednak na pocz�tek musisz potrafi� stworzy� dobr� bro�, a nie byle jakie ostrze.
};

//========================================
//-----------------> LearnSmith_01
//========================================

INSTANCE DIA_Thongvor_LearnSmith_02 (C_INFO)
{
   npc          = NON_7851_Nordmarczyk;
   nr           = 1;
   condition    = DIA_Thongvor_LearnSmith_02_Condition;
   information  = DIA_Thongvor_LearnSmith_02_Info;
   permanent	= TRUE;
   description	= "Naucz mnie swojego fachu. (Kowalstwo poz.3/3 - 15 PN)";
};

FUNC INT DIA_Thongvor_LearnSmith_02_Condition()
{
 if (NPC_TALENT_SMITH == 2) 
{
    return TRUE;
};
};
FUNC VOID DIA_Thongvor_LearnSmith_02_Info()
{

    if  (hero.lp >= 15) 
	{
    AI_Output (other, self ,"DIA_Thongvor_LearnSmith_02_15_01"); //Naucz mnie swojego fachu.
  //  AI_Output (self, other ,"DIA_Thongvor_LearnSmith_02_03_02"); //Potrafisz wyku� dobr� bro� co ju� mi si� podoba, ale do rzeczy...
  //  AI_Output (self, other ,"DIA_Thongvor_LearnSmith_02_03_03"); //Kowalstwo nie polega na samym waleniu m�otem, ale by wyku� cholernie porz�dn� bro� musisz dobrze nim operowa� co ju� wiesz.
  //  AI_Output (self, other ,"DIA_Thongvor_LearnSmith_02_03_04"); //
    AI_Output (self, other ,"DIA_Thongvor_LearnSmith_02_03_05"); //Dobrze.
	PrintScreen ("Nauka kowalstwo",2, 62, "FONT_OLD_10_WHITE.TGA", 2);
	NPC_TALENT_SMITH = 3;
	Hero.lp -= 15;
	}
	else 
	{
	AI_Output (self,other ,"DIA_Thongvor_LearnSmith_02_03_06"); //Brak ci do�wiadczenia.
	PrintS_Ext  ("Brak ci do�wiadczenia!", COL_RED);
	};
	
};


//========================================
//-----------------> RedSword
//========================================

INSTANCE DIA_Nordmarczyk_RedSword (C_INFO)
{
   npc          = NON_7851_Nordmarczyk;
   nr           = 1;
   condition    = DIA_Nordmarczyk_RedSword_Condition;
   information  = DIA_Nordmarczyk_RedSword_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Nordmarczyk_RedSword_Condition()
{ 
  if (Npc_HasItems(hero, ItMw_2h_OldRedSword) >=1)
{
    return TRUE;
};
};
FUNC VOID DIA_Nordmarczyk_RedSword_Info()
{
    AI_Output (self, other ,"DIA_Nordmarczyk_RedSword_03_01"); //O widz�, �e masz przy sobie interesuj�c� bro�.
    AI_Output (other, self ,"DIA_Nordmarczyk_RedSword_15_02"); //Interesuj�c�? To raczej stary badziew...
    AI_Output (self, other ,"DIA_Nordmarczyk_RedSword_03_03"); //Wiesz co? My�l� �e sie mylisz, r�koje�� wygl�da w porz�dku, problem raczej tkwi w ostrzu i osadzonej na nim rdzy.
    AI_Output (self, other ,"DIA_Nordmarczyk_RedSword_03_04"); //Mog� go obejrze�?
    AI_Output (other, self ,"DIA_Nordmarczyk_RedSword_15_05"); //Jasne przyj�yj si� mu.
	B_GiveInvItems          (hero,self, ItMw_2h_OldRedSword, 1);
    EquipItem 			    (NON_7851_Nordmarczyk,ItMw_2h_OldRedSword);
	AI_ReadyMeleeWeapon		(self);
	AI_PlayAni				(self, "T_1HSINSPECT");
	AI_RemoveWeapon			(self);
    AI_Output (self, other ,"DIA_Nordmarczyk_RedSword_03_06"); //C�, to ostrze nie jest w tak tragicznym stanie jak my�la�em.
    AI_Output (self, other ,"DIA_Nordmarczyk_RedSword_03_07"); //Mog� je naprawi� jednak nie za nic.
};

//========================================
//-----------------> RedRepair
//========================================
var int RepairRedSwd;
INSTANCE DIA_Nordmarczyk_RedRepair (C_INFO)
{
   npc          = NON_7851_Nordmarczyk;
   nr           = 2;
   condition    = DIA_Nordmarczyk_RedRepair_Condition;
   information  = DIA_Nordmarczyk_RedRepair_Info;
   permanent	= FALSE;
   description	= "Czego ��dasz za napraw�?";
};

FUNC INT DIA_Nordmarczyk_RedRepair_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Nordmarczyk_RedSword))
{
    return TRUE;
};
};
FUNC VOID DIA_Nordmarczyk_RedRepair_Info()
{
    AI_Output (other, self ,"DIA_Nordmarczyk_RedRepair_15_01"); //Czego ��dasz za napraw�?
    AI_Output (self, other ,"DIA_Nordmarczyk_RedRepair_03_02"); //Przedewszystkim b�d� potrzebowa� paru drobiazg�w do naprawy i powiedzmy... czego� do jedzenia... no i troch� rudy.
	B_GiveInvItems (self,other, ItMw_2h_OldRedSword, 1);
	
	Info_ClearChoices	(DIA_Nordmarczyk_RedRepair);
	Info_AddChoice		(DIA_Nordmarczyk_RedRepair,"Umowa stoi.",DIA_Nordmarczyk_RedRepair_Yes);
	Info_AddChoice		(DIA_Nordmarczyk_RedRepair,"Mam wa�niejsze sprawy ni� stanie przy garach.",DIA_Nordmarczyk_RedRepair_No);
	
};



FUNC VOID DIA_Nordmarczyk_RedRepair_Yes()
{
    AI_Output (other, self ,"DIA_Nordmarczyk_RedRepair_Yes_15_01"); //Umowa stoi.
    AI_Output (self, other ,"DIA_Nordmarczyk_RedRepair_Yes_03_02"); //Dobrze, sporz�dze list� potrzebnych rzeczy.
	
	B_UseFakeScroll ();
	
	
	B_GiveInvItems (self,other, ItWr_ThongvorRedRep, 1);
	Log_CreateTopic(ThongvorRepair,Log_Note);
	B_LogEntry(ThongvorRepair,"Kowal jest w stanie naprawi� ostrze starego miecza wzamian za potrzebne rzeczy i drobn� przys�ug�. Otrzyma�em od niego list� z tym co mam mu dostarczy�.");
	RepairRedSwd = True;
	Info_ClearChoices		(DIA_Nordmarczyk_RedRepair);
};
FUNC VOID DIA_Nordmarczyk_RedRepair_No()
{
    AI_Output (other, self ,"DIA_Nordmarczyk_RedRepair_No_15_01"); //Mam wa�niejsze sprawy ni� stanie przy garach.
    AI_Output (self, other ,"DIA_Nordmarczyk_RedRepair_No_03_02"); //A szkoda, nie po�a�owa� by�. No nic w takim razie nie zawracam ci g�owy, do zobaczenia.

	AI_StopProcessInfos	(self);

	
};


//========================================
//-----------------> RepairStart
//========================================
var int ThongvorRepair_Day;
INSTANCE DIA_Nordmarczyk_RepairStart (C_INFO)
{
   npc          = NON_7851_Nordmarczyk;
   nr           = 3;
   condition    = DIA_Nordmarczyk_RepairStart_Condition;
   information  = DIA_Nordmarczyk_RepairStart_Info;
   permanent	= FALSE;
   description	= "Mam potrzebne rzeczy.";
};

FUNC INT DIA_Nordmarczyk_RepairStart_Condition()
{
if (Npc_HasItems (hero,  ItMi_SilverNugget)         >=20)
&& (Npc_HasItems (hero,  ItMi_IronNugget)           >=10)
&& (Npc_HasItems (hero,  Pr_SztabkaMagicznejStali)  >=2)
&& (Npc_HasItems (hero,  ItMi_Alchemy_Sulphur_01)   >=5) 
&& (Npc_HasItems (hero,  ItFo_BigCasserole)         >=5)
&& (Npc_HasItems (hero,  ItFo_MeatStew)             >=2) 
&& (Npc_HasItems (hero,  ItFoWine)                  >=3) 
&& (Npc_HasItems (hero,  ItMiNugget)                >=200) 
&& (Npc_HasItems (hero,  ItMw_2h_OldRedSword)       >=1) 
&& (RepairRedSwd == TRUE)
{
    return TRUE;
};
};
FUNC VOID DIA_Nordmarczyk_RepairStart_Info()
{
    AI_Output (other, self ,"DIA_Nordmarczyk_RepairStart_15_01"); //Mam potrzebne rzeczy.
    AI_Output (self, other ,"DIA_Nordmarczyk_RepairStart_03_02"); //To �wietnie, a reszta? Masz jedzenie i rud�?
    AI_Output (other, self ,"DIA_Nordmarczyk_RepairStart_15_03"); //Tak o to twoje wynagrodzenie.
    AI_Output (self, other ,"DIA_Nordmarczyk_RepairStart_03_04"); //Dzi�kuj�, zatem po po��dnej wy�erce zabieram si� do roboty.
    AI_Output (other, self ,"DIA_Nordmarczyk_RepairStart_15_05"); //Ile to mo�e potrwa�?
    AI_Output (self, other ,"DIA_Nordmarczyk_RepairStart_03_06"); //My�l� �e, dzie� lub dwa mi zejdzie.
    AI_Output (other, self ,"DIA_Nordmarczyk_RepairStart_15_07"); //Dobra, �ycz� udanej pracy. Na razie.
	B_GiveInvItems (other,self, ItMi_SilverNugget,       20);
	B_GiveInvItems (other,self, ItMi_IronNugget,         10);
	B_GiveInvItems (other,self, Pr_SztabkaMagicznejStali, 2);
	B_GiveInvItems (other,self, ItMi_Alchemy_Sulphur_01,  5);
	B_GiveInvItems (other,self, ItFo_BigCasserole,        5);
	B_GiveInvItems (other,self, ItFo_MeatStew,            2);
	B_GiveInvItems (other,self, ItFoWine,                 3);
	B_GiveInvItems (other,self, ItMw_2h_OldRedSword,      1);
	B_GiveInvItems (other,self, ItMiNugget,             200);
	
	B_GiveXP(100);
	ThongvorRepair_Day = Wld_GetDay();
	B_LogEntry(ThongvorRepair,"Zanios�em kowalowi potrzebne rzeczy, naprawa nie powinna mu zaj�� d�u�ej ni� 2 dni.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> RepairRSEnd
//========================================

INSTANCE DIA_Nordmarczyk_RepairRSEnd (C_INFO)
{
   npc          = NON_7851_Nordmarczyk;
   nr           = 4;
   condition    = DIA_Nordmarczyk_RepairRSEnd_Condition;
   information  = DIA_Nordmarczyk_RepairRSEnd_Info;
   permanent	= FALSE;
   description	= "Co z moj� broni�?";
};

FUNC INT DIA_Nordmarczyk_RepairRSEnd_Condition()
{
if (ThongvorRepair_Day != Wld_GetDay())
&& (Npc_KnowsInfo(hero,DIA_Nordmarczyk_RepairStart))
{
    return TRUE;
};
};
FUNC VOID DIA_Nordmarczyk_RepairRSEnd_Info()
{
    AI_Output (other, self ,"DIA_Nordmarczyk_RepairRSEnd_15_01"); //Co z moj� broni�?
    AI_Output (self, other ,"DIA_Nordmarczyk_RepairRSEnd_03_02"); //L�ni si� jak jajca orkowemu psu na wiosn� haha. Wszystko gotowe, powinna ci s�u�y� jak nale�y!
    AI_Output (other, self ,"DIA_Nordmarczyk_RepairRSEnd_15_03"); //Dzi�ki. Bez obaw chyba b�d� wiedzia� jak jej prawid�owowo u�ywa�. 
	B_GiveInvItems (self,other, ItMw_2h_RepairedRedSword, 1);
	B_LogEntry(ThongvorRepair,"Odebra�em naprawion� bro�, wygl�da ca�kiem nie�le. Czas j� przetestowa� w walce.");
};

instance dia_non_7851_pickpocket(c_info) {
    npc = non_7851_nordmarczyk;
    nr = 900;
    condition = dia_non_7851_pickpocket_condition;
    information = dia_non_7851_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_non_7851_pickpocket_condition() {
	e_beklauen(baseThfChanceSLD, 20);
};

func void dia_non_7851_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_non_7851_pickpocket);
	info_addchoice(dia_non_7851_pickpocket, dialog_back, dia_non_7851_pickpocket_back);
	info_addchoice(dia_non_7851_pickpocket, dialog_pickpocket, dia_non_7851_pickpocket_doit);
};

func void dia_non_7851_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_non_7851_pickpocket);
};

func void dia_non_7851_pickpocket_back() {
    info_clearchoices(dia_non_7851_pickpocket);
};