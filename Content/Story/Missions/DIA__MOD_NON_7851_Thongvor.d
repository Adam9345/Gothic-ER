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
    AI_Output (self, other ,"DIA_Nordmarczyk_HELLO1_03_02"); //Nie widaæ?! Wyrabiam orê¿.
	AI_Output (other, self ,"DIA_Nordmarczyk_HELLO1_15_03"); //Sam? Na tym odludziu? Dla kogo pracujesz?
	AI_Output (self, other ,"DIA_Nordmarczyk_HELLO1_03_04"); //Tak, sam. Masz jakiœ problem czy zlecenie? Pracujê dla kogo chcê. Nie jestem byle jakim kowalem. Pochodzê z Nordmaru.
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
   description	= "Jesteœ Nordmarczykiem? Jak siê tu dosta³eœ?";
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
    AI_Output (other, self ,"DIA_Nordmarczyk_HELLO2_15_01"); //Jesteœ Nordmarczykiem? Jak siê tu dosta³eœ?
    AI_Output (self, other ,"DIA_Nordmarczyk_HELLO2_03_02"); //Jak to jak?! Z³ama³em prawo, zosta³em z³apany i wtr¹cony do Kolonii. Pewnie zapytasz co zrobi³em... Pomog³em w napadzie na kupca.
	AI_Output (other, self ,"DIA_Nordmarczyk_HELLO2_15_03"); //Nordmarczycy rzadko opuszczaj¹ swoje klany. Co ciê do tego sk³oni³o?
	AI_Output (self, other ,"DIA_Nordmarczyk_HELLO2_03_04"); //Chcia³em spróbowaæ innego ¿ycia w mniej surowych warunkach. Planowa³em wkrótce wróciæ, ale wda³em siê w z³e towarzystwo. 
	AI_Output (self, other ,"DIA_Nordmarczyk_HELLO2_03_05"); //Wielu chcia³o wykorzystaæ moj¹ si³ê i odwagê. No i tak da³em siê namówiæ na taki skok...
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
   description	= "Pilnie potrzebujê sztabki stali...";
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
    AI_Output (other, self ,"DIA_Nordmarczyk_OLDORESTAB_15_01"); //Pilnie potrzebujê sztabki stali odlanej wed³ug starej metody.
    AI_Output (self, other ,"DIA_Nordmarczyk_OLDORESTAB_03_02"); //Tej z czasów pierwszej wojny z orkami? A po có¿ ci coœ takiego?
	AI_Output (other, self ,"DIA_Nordmarczyk_OLDORESTAB_15_03"); //Pewien kowal musi naprawiæ bardzo stary orê¿. 
	AI_Output (self, other ,"DIA_Nordmarczyk_OLDORESTAB_03_04"); //Od lat nie u¿ywa siê tego typu stali.
	AI_Output (other, self ,"DIA_Nordmarczyk_OLDORESTAB_15_05"); //Masz mo¿e jeden spoœród tych reliktów przesz³oœci na wyposa¿eniu?
	AI_Output (self, other ,"DIA_Nordmarczyk_OLDORESTAB_03_06"); //Ja? Sk¹d¿e! Ale jest cieñ szansy...
	AI_Output (self, other ,"DIA_Nordmarczyk_OLDORESTAB_03_07"); //Dawniej kowalstwo rozwija³o siê w dolinie niezwykle prê¿nie. Sam wiesz, kopalnie...
	AI_Output (self, other ,"DIA_Nordmarczyk_OLDORESTAB_03_08"); //Rudê i inne sk³adniki rzemieœlnicze transportowano po Górniczej Dolinie przy u¿yciu wozów. 
	AI_Output (self, other ,"DIA_Nordmarczyk_OLDORESTAB_03_09"); //Do dziœ mo¿na spotkaæ ich wraki na starych traktach. Jeden z takich w³aœnie wraków le¿y nieopodal.
	AI_Output (self, other ,"DIA_Nordmarczyk_OLDORESTAB_03_10"); //By³ prze³adowany rud¹ i ¿elazem. Oczywiœcie zabra³em stamt¹d wszystko, co siê da³o, ale mo¿e zosta³y jakieœ resztki dla ciebie.
	AI_Output (self, other ,"DIA_Nordmarczyk_OLDORESTAB_03_11"); //Rozejrzyj siê tam.
	AI_Output (other, self ,"DIA_Nordmarczyk_OLDORESTAB_15_12"); //Gdzie dok³adnie jest ten wóz?
	AI_Output (self, other ,"DIA_Nordmarczyk_OLDORESTAB_03_13"); //Za moj¹ wie¿¹ rozci¹ga siê p³askowy¿ na którym ¿yj¹ œcierwojady. PójdŸ tam i skieruj siê na Ziemie Orków.
	AI_Output (self, other ,"DIA_Nordmarczyk_OLDORESTAB_03_14"); //Wóz znajduje siê w uschniêtym zagajniku. Uwa¿aj na czaj¹ce siê tam wilki.
	
	B_LogEntry               (CH1_TorlofsAxe,"Nordmarski kowal poleci³ mi przeszukaæ wrak starego wozu, którym dawniej transportowano sk³adniki rzemieœlnicze. Znajdê go w uschniêtym zagajniku, na p³askowy¿u za wie¿¹ Nordmarczyka. To moja ostatnia szansa.");
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
   description	= "Potrafisz wykonaæ mistrzowsk¹ broñ?";
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
    AI_Output (other, self ,"DIA_Nordmarczyk_YOURWORK_15_01"); //Potrafisz wykonaæ mistrzowsk¹ broñ?
    AI_Output (self, other ,"DIA_Nordmarczyk_YOURWORK_03_02"); //Mogê zaoferowaæ ci wiêcej ni¿ wszyscy kowale z tej pieprzonej Kolonii razem wziêci. Wykowanie mistrzowskich broni, przekuwanie, osadzanie run... Wszystko!
	AI_Output (self, other ,"DIA_Nordmarczyk_YOURWORK_03_03"); //Oczywiœcie nie robiê ABSOULTNIE NIC ZA DARMO. Jasne?
	AI_Output (other, self ,"DIA_Nordmarczyk_YOURWORK_15_04"); //Dobrze, dobrze. Jak bêdê mia³ dla ciebie zlecenie na pewno siê odezwê.
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
   description	= "Chcia³bym, abyœ przeku³ dla mnie ten miecz.";
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
    AI_Output (other, self ,"DIA_Nordmarczyk_URIZIEL_1H_15_01"); //Chcia³bym, abyœ przeku³ dla mnie ten miecz.
    AI_Output (self, other ,"DIA_Nordmarczyk_URIZIEL_1H_03_02"); //Poka¿ mi to.
	
	CreateInvItem 			(self, Mythrilklinge01);
	Npc_RemoveInvItem 		(self, ItMw_2H_Axe_Big_01);	
	AI_EquipBestMeleeWeapon	(self);
	AI_ReadyMeleeWeapon		(self);
	AI_PlayAni				(self, "T_1HSINSPECT");
	AI_RemoveWeapon			(self);
	AI_UnequipWeapons		(self);
	Npc_RemoveInvItem 		(self, Mythrilklinge01);	
	EquipItem (self, ItMw_2H_Axe_Big_01);		
	
	AI_Output (self, other ,"DIA_Nordmarczyk_URIZIEL_1H_03_03"); //Wspania³a broñ... Jednak ma na sobie doœæ wyraŸne znamiê przesz³oœci. Osadzono tu jakiœ klejnot.
	AI_Output (other, self ,"DIA_Nordmarczyk_URIZIEL_1H_15_04"); //Przy pomocy tego ostrza dokonano wielkich czynów. Znalaz³em je w orkowej œwi¹tyni.
	AI_Output (self, other ,"DIA_Nordmarczyk_URIZIEL_1H_03_05"); //(spogl¹da pytaj¹co) Zapuszczasz siê w takie miejsca?
	AI_Output (self, other ,"DIA_Nordmarczyk_URIZIEL_1H_03_06"); //Niewa¿ne. Powiedz mi, co chcesz z tego zrobiæ.
	AI_Output (other, self ,"DIA_Nordmarczyk_URIZIEL_1H_15_07"); //Musisz przekuæ to ostrze tak, abym móg³ je swobodnie trzymaæ w jednej rêce. Dasz sobie z tym radê? 
	AI_Output (self, other ,"DIA_Nordmarczyk_URIZIEL_1H_03_08"); //Jasne, ¿e dam, jednak nie za darmo. To bêdzie ciê trochê kosztowaæ. Konkretnie 2000 bry³ek rudy. 
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
   description	= "Przekuj dla mnie URIZIEL na miecz jednorêczny (koszt: 2000 bry³ek rudy).";
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
    AI_Output (other, self ,"DIA_Nordmarczyk_URIZIEL_1H_DECIDE_15_01"); //Przekuj dla mnie URIZIEL na miecz jednorêczny. 
    AI_Output (self, other ,"DIA_Nordmarczyk_URIZIEL_1H_DECIDE_03_02"); //No to dawaj rudê, miecz i do roboty!
	
	B_GiveInvItems (hero,self, Mythrilklinge01, 1);
	B_GiveInvItems (hero,self, itminugget, 2000);
	
	CreateInvItem (self, URIZIEL_Touch);
	B_GiveInvItems (self,hero, URIZIEL_Touch, 1);
	
	//PlayVideo ( "ER_NORDMARIAN_SWORD.bik");
	AI_Output (self, other ,"DIA_Nordmarczyk_URIZIEL_1H_DECIDE_03_03"); //Gotowe! Wysz³o naprawdê œwietnie. Niech ci s³u¿y. 
	AI_Output (other, self ,"DIA_Nordmarczyk_URIZIEL_1H_DECIDE_15_04"); //Dziêki. Mam nadziejê, ¿e nie wyda³em tej rudy na marne. 
	AI_Output (self, other ,"DIA_Nordmarczyk_URIZIEL_1H_DECIDE_03_05"); //Chcesz pisemn¹ gwarancjê? 
	AI_Output (other, self ,"DIA_Nordmarczyk_URIZIEL_1H_DECIDE_15_06"); //Na ile?
	AI_Output (self, other ,"DIA_Nordmarczyk_URIZIEL_1H_DECIDE_03_07"); //Powinieneœ daæ radê zabiæ t¹ broni¹... hmm... powiedzmy, ¿e stu orków. Oczywiœcie musisz regularnie zagl¹daæ do autoryzowanego kowala. 
	AI_Output (other, self ,"DIA_Nordmarczyk_URIZIEL_1H_DECIDE_15_08"); //Pewnie taki przegl¹d nie jest tani...
	AI_Output (self, other ,"DIA_Nordmarczyk_URIZIEL_1H_DECIDE_03_09"); //Myœlê, ¿e móg³bym daæ ci jak¹œ zni¿kê. No, ale doœæ ju¿ ¿artów. Pewnie masz du¿o do zrobienia.
	AI_Output (other, self ,"DIA_Nordmarczyk_URIZIEL_1H_DECIDE_15_10"); //Tak, wielkie dziêki za pomoc. 
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
   description	= "Mo¿esz mnie czegoœ nauczyæ?";
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
    AI_Output (other, self ,"DIA_Thongvor_LearnMe_15_01"); //Mo¿esz mnie czegoœ nauczyæ?
    AI_Output (self, other ,"DIA_Thongvor_LearnMe_03_02"); //Mogê, jednak na pocz¹tek musisz potrafiæ stworzyæ dobr¹ broñ, a nie byle jakie ostrze.
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
  //  AI_Output (self, other ,"DIA_Thongvor_LearnSmith_02_03_02"); //Potrafisz wykuæ dobr¹ broñ co ju¿ mi siê podoba, ale do rzeczy...
  //  AI_Output (self, other ,"DIA_Thongvor_LearnSmith_02_03_03"); //Kowalstwo nie polega na samym waleniu m³otem, ale by wykuæ cholernie porz¹dn¹ broñ musisz dobrze nim operowaæ co ju¿ wiesz.
  //  AI_Output (self, other ,"DIA_Thongvor_LearnSmith_02_03_04"); //
    AI_Output (self, other ,"DIA_Thongvor_LearnSmith_02_03_05"); //Dobrze.
	PrintScreen ("Nauka kowalstwo",2, 62, "FONT_OLD_10_WHITE.TGA", 2);
	NPC_TALENT_SMITH = 3;
	Hero.lp -= 15;
	}
	else 
	{
	AI_Output (self,other ,"DIA_Thongvor_LearnSmith_02_03_06"); //Brak ci doœwiadczenia.
	PrintS_Ext  ("Brak ci doœwiadczenia!", COL_RED);
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
    AI_Output (self, other ,"DIA_Nordmarczyk_RedSword_03_01"); //O widzê, ¿e masz przy sobie interesuj¹c¹ broñ.
    AI_Output (other, self ,"DIA_Nordmarczyk_RedSword_15_02"); //Interesuj¹c¹? To raczej stary badziew...
    AI_Output (self, other ,"DIA_Nordmarczyk_RedSword_03_03"); //Wiesz co? Myœlê ¿e sie mylisz, rêkojeœæ wygl¹da w porz¹dku, problem raczej tkwi w ostrzu i osadzonej na nim rdzy.
    AI_Output (self, other ,"DIA_Nordmarczyk_RedSword_03_04"); //Mogê go obejrzeæ?
    AI_Output (other, self ,"DIA_Nordmarczyk_RedSword_15_05"); //Jasne przyj¿yj siê mu.
	B_GiveInvItems          (hero,self, ItMw_2h_OldRedSword, 1);
    EquipItem 			    (NON_7851_Nordmarczyk,ItMw_2h_OldRedSword);
	AI_ReadyMeleeWeapon		(self);
	AI_PlayAni				(self, "T_1HSINSPECT");
	AI_RemoveWeapon			(self);
    AI_Output (self, other ,"DIA_Nordmarczyk_RedSword_03_06"); //Có¿, to ostrze nie jest w tak tragicznym stanie jak myœla³em.
    AI_Output (self, other ,"DIA_Nordmarczyk_RedSword_03_07"); //Mogê je naprawiæ jednak nie za nic.
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
   description	= "Czego ¿¹dasz za naprawê?";
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
    AI_Output (other, self ,"DIA_Nordmarczyk_RedRepair_15_01"); //Czego ¿¹dasz za naprawê?
    AI_Output (self, other ,"DIA_Nordmarczyk_RedRepair_03_02"); //Przedewszystkim bêdê potrzebowa³ paru drobiazgów do naprawy i powiedzmy... czegoœ do jedzenia... no i trochê rudy.
	B_GiveInvItems (self,other, ItMw_2h_OldRedSword, 1);
	
	Info_ClearChoices	(DIA_Nordmarczyk_RedRepair);
	Info_AddChoice		(DIA_Nordmarczyk_RedRepair,"Umowa stoi.",DIA_Nordmarczyk_RedRepair_Yes);
	Info_AddChoice		(DIA_Nordmarczyk_RedRepair,"Mam wa¿niejsze sprawy ni¿ stanie przy garach.",DIA_Nordmarczyk_RedRepair_No);
	
};



FUNC VOID DIA_Nordmarczyk_RedRepair_Yes()
{
    AI_Output (other, self ,"DIA_Nordmarczyk_RedRepair_Yes_15_01"); //Umowa stoi.
    AI_Output (self, other ,"DIA_Nordmarczyk_RedRepair_Yes_03_02"); //Dobrze, sporz¹dze listê potrzebnych rzeczy.
	
	B_UseFakeScroll ();
	
	
	B_GiveInvItems (self,other, ItWr_ThongvorRedRep, 1);
	Log_CreateTopic(ThongvorRepair,Log_Note);
	B_LogEntry(ThongvorRepair,"Kowal jest w stanie naprawiæ ostrze starego miecza wzamian za potrzebne rzeczy i drobn¹ przys³ugê. Otrzyma³em od niego listê z tym co mam mu dostarczyæ.");
	RepairRedSwd = True;
	Info_ClearChoices		(DIA_Nordmarczyk_RedRepair);
};
FUNC VOID DIA_Nordmarczyk_RedRepair_No()
{
    AI_Output (other, self ,"DIA_Nordmarczyk_RedRepair_No_15_01"); //Mam wa¿niejsze sprawy ni¿ stanie przy garach.
    AI_Output (self, other ,"DIA_Nordmarczyk_RedRepair_No_03_02"); //A szkoda, nie po¿a³owa³ byœ. No nic w takim razie nie zawracam ci g³owy, do zobaczenia.

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
    AI_Output (self, other ,"DIA_Nordmarczyk_RepairStart_03_02"); //To œwietnie, a reszta? Masz jedzenie i rudê?
    AI_Output (other, self ,"DIA_Nordmarczyk_RepairStart_15_03"); //Tak o to twoje wynagrodzenie.
    AI_Output (self, other ,"DIA_Nordmarczyk_RepairStart_03_04"); //Dziêkujê, zatem po po¿¹dnej wy¿erce zabieram siê do roboty.
    AI_Output (other, self ,"DIA_Nordmarczyk_RepairStart_15_05"); //Ile to mo¿e potrwaæ?
    AI_Output (self, other ,"DIA_Nordmarczyk_RepairStart_03_06"); //Myœlê ¿e, dzieñ lub dwa mi zejdzie.
    AI_Output (other, self ,"DIA_Nordmarczyk_RepairStart_15_07"); //Dobra, ¿yczê udanej pracy. Na razie.
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
	B_LogEntry(ThongvorRepair,"Zanios³em kowalowi potrzebne rzeczy, naprawa nie powinna mu zaj¹æ d³u¿ej ni¿ 2 dni.");
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
   description	= "Co z moj¹ broni¹?";
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
    AI_Output (other, self ,"DIA_Nordmarczyk_RepairRSEnd_15_01"); //Co z moj¹ broni¹?
    AI_Output (self, other ,"DIA_Nordmarczyk_RepairRSEnd_03_02"); //Lœni siê jak jajca orkowemu psu na wiosnê haha. Wszystko gotowe, powinna ci s³u¿yæ jak nale¿y!
    AI_Output (other, self ,"DIA_Nordmarczyk_RepairRSEnd_15_03"); //Dziêki. Bez obaw chyba bêdê wiedzia³ jak jej prawid³owowo u¿ywaæ. 
	B_GiveInvItems (self,other, ItMw_2h_RepairedRedSword, 1);
	B_LogEntry(ThongvorRepair,"Odebra³em naprawion¹ broñ, wygl¹da ca³kiem nieŸle. Czas j¹ przetestowaæ w walce.");
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