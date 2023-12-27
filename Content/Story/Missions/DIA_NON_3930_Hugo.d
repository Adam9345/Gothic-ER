// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Hugo_EXIT(C_INFO)
{
	npc             = NON_3930_Hugo;
	nr              = 999;
	condition	= DIA_Hugo_EXIT_Condition;
	information	= DIA_Hugo_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Hugo_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Hugo_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Hugo_HELLO1 (C_INFO)
{
   npc          = NON_3930_Hugo;
   nr           = 1;
   condition    = DIA_Hugo_HELLO1_Condition;
   information  = DIA_Hugo_HELLO1_Info;
   permanent	= FALSE;
   description	= "Co ty tu robisz?";
};

FUNC INT DIA_Hugo_HELLO1_Condition()
{
    if (MIS_HunterHugo == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Hugo_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Hugo_HELLO1_15_01"); //Co ty tu robisz?
	//fix1210
    AI_Output (self, other ,"DIA_Hugo_HELLO1_15_02"); //Postanowi³em za³o¿yæ tu sobie bazê wypadow¹. Znalaz³em pewn¹ mapê z orkowym skarbem. Zbieram siê od kilku dni, aby po niego wyruszyæ. 
    AI_Output (other, self ,"DIA_Hugo_HELLO1_15_03"); //Zaraz, nazywasz siê Hugo?
    AI_Output (self, other ,"DIA_Hugo_HELLO1_03_04"); //Tak, jestem Hugo, ³owca orków, sk¹d znasz moje imiê?
    AI_Output (other, self ,"DIA_Hugo_HELLO1_15_05"); //Ch³opaki z obozu ciê szukaj¹. Mówili, ¿e znikn¹³eœ bez œladu.
    AI_Output (self, other ,"DIA_Hugo_HELLO1_03_06"); //Zgadza siê, nie chcia³em siê im t³umaczyæ z tego, co odkry³em. Jestem na tropie skarbu i chcia³em wymkn¹æ siê ukradkiem, aby w spokoju go odnaleŸæ. 
    B_LogEntry                     (CH1_HunterHugo,"Hugo ukry³ siê przed przyjació³mi, bo odnalaz³ mapê do orkowego skarbu. Nie chcia³ dzieliæ siê nagrod¹, której jeszcze nawet nie zdoby³.");
//fix 1210
    B_GiveXP (150);
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Hugo_HELLO2 (C_INFO)
{
   npc          = NON_3930_Hugo;
   nr           = 2;
   condition    = DIA_Hugo_HELLO2_Condition;
   information  = DIA_Hugo_HELLO2_Info;
   permanent	= FALSE;
   description	= "Opowiedz mi o tym skarbie. ";
};

FUNC INT DIA_Hugo_HELLO2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Hugo_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Hugo_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Hugo_HELLO2_15_01"); //Opowiedz mi o tym skarbie. 
    AI_Output (self, other ,"DIA_Hugo_HELLO2_03_02"); //No wiêc kilka dni temu stoczyliœmy z ch³opakami potyczkê z grup¹ orków w starej Cytadeli w górach. 
	AI_Output (self, other ,"DIA_Hugo_HELLO2_03_03"); //Jestem bardzo zainteresowany wszystkim, co nosi znamiê orków i pozwoli mi zbadaæ dog³êbnie ich kulturê. 
	AI_Output (self, other ,"DIA_Hugo_HELLO2_03_04"); //Mam pewn¹ zasadê: zanim zabijê jakiegoœ orka torturujê go, aby wydobyæ informacje, a gdy ju¿ go zabijam, zawsze przeszukujê zw³oki.
    AI_Output (self, other ,"DIA_Hugo_HELLO2_03_05"); //Po potyczce przeszuka³em wiêc cia³o przywódcy tej grupy orków i znalaz³em pewn¹ mapê. 
	AI_Output (self, other ,"DIA_Hugo_HELLO2_03_06"); //Miejsce, gdzie znajduje siê skarb oznaczono na mapie krzy¿ykiem. Postanowi³em wiêc opuœciæ obóz ³owców orków na jakiœ czas i odnaleŸæ skarb.
};

//========================================
//-----------------> HELLO3
//========================================

INSTANCE DIA_Hugo_HELLO3 (C_INFO)
{
   npc          = NON_3930_Hugo;
   nr           = 3;
   condition    = DIA_Hugo_HELLO3_Condition;
   information  = DIA_Hugo_HELLO3_Info;
   permanent	= FALSE;
   description	= "Pomogê ci odnaleŸæ skarb, poka¿ mi t¹ mapê. ";
};

FUNC INT DIA_Hugo_HELLO3_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Hugo_HELLO2))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Hugo_HELLO3_Info()
{
    AI_Output (other, self ,"DIA_Hugo_HELLO3_15_01"); //Pomogê ci odnaleŸæ skarb, poka¿ mi t¹ mapê. 
    AI_Output (self, other ,"DIA_Hugo_HELLO3_03_02"); //Proszê bardzo, przynieœ mi wszystko co tam znajdziesz, a nagrodzê ciê rud¹. 
	AI_Output (self, other ,"DIA_Hugo_HELLO3_03_03"); //Nie próbuj jednak znikn¹æ ze skarbem, bo zrobi siê nieciekawie. Wychowa³em siê w Nordmarze i mo¿esz mi wierzyæ, ¿e na bitce to ja siê znam. 
    AI_Output (other, self ,"DIA_Hugo_HELLO3_15_04"); //Nie obawiaj siê, przyniosê ci skarb.
    AI_Output (self, other ,"DIA_Hugo_HELLO3_03_05"); //Œwietnie, oto mapa. Miejsce, gdzie znajduje siê skarb znajduje siê chyba w okolicach Nowego Obozu i Starej Kopalni. Powodzenia, i pamiêtaj o naszej umowie.
    AI_Output (other, self ,"DIA_Hugo_HELLO3_15_06"); //Dziêki.
	B_GiveInvItems (self, other, Hugo_Map, 1);
    B_LogEntry                     (CH1_HunterHugo,"Hugo nie pokusi³ siê, ¿eby iœæ ze mn¹ odnaleŸæ skarb. Nie doœæ, ¿e muszê sam udaæ siê w wyznaczone miejsce, to jeszcze mam siê z nim podzieliæ po³ow¹ skarbu.");
};//fix 1210

//========================================
//-----------------> HELLO4
//========================================

INSTANCE DIA_Hugo_HELLO4 (C_INFO)
{
   npc          = NON_3930_Hugo;
   nr           = 4;
   condition    = DIA_Hugo_HELLO4_Condition;
   information  = DIA_Hugo_HELLO4_Info;
   permanent	= FALSE;
   description	= "Mo¿esz mi co nieco opowiedzieæ o Orkach?";
};

FUNC INT DIA_Hugo_HELLO4_Condition()
{
    //if (Npc_KnowsInfo (hero, DIA_Hugo_HELLO2))
   // {
    return TRUE;
   // };
};


FUNC VOID DIA_Hugo_HELLO4_Info()
{
   AI_Output (other, self ,"DIA_Hugo_HELLO4_15_01"); //Mo¿esz mi co nieco opowiedzieæ o Orkach?
   AI_Output (self, other ,"DIA_Hugo_HELLO4_03_02"); //Có¿ to brutalna I stara rasa. Równa wiekiem nam ludziom.
   AI_Output (self, other ,"DIA_Hugo_HELLO4_03_03"); //Ma ciekaw¹ kulturê a niektórzy Orkowie s¹ wyj¹tkowo inteligentni I da siê z nimi pogadaæ.
   AI_Output (self, other ,"DIA_Hugo_HELLO4_03_04"); //Ale mówiê o tych z kontynentu. Tutaj Orkowie s¹ na ni¿szym szczeblu rozwojowym.
   AI_Output (self, other ,"DIA_Hugo_HELLO4_03_05"); //Czuje, ¿e wi¹¿e siê z nimi jakaœ g³êboka tajemnica...
   AI_Output (self, other ,"DIA_Hugo_HELLO4_03_06"); //Ale teraz wybacz. Jestem zajêty. PrzyjdŸ innym razem jeœli chcesz siê dowiedzieæ wiêcej.
   AI_Output (other, self ,"DIA_Hugo_HELLO4_15_07"); //W porz¹dku.
 
};
//========================================
//-----------------> OPCJA KRADZIE¯Y
//========================================
var int Hugo_PickPoket;
INSTANCE DIA_Hugo_PICKPOCKET(C_INFO)
{
	npc          = NON_3930_Hugo;
	nr           = 900;
	condition    = DIA_Hugo_PICKPOCKET_Condition;
	information  = DIA_Hugo_PICKPOCKET_Info;
	permanent    = TRUE;
	 description = "Kradzie¿ kiesz.";
};

FUNC INT DIA_Hugo_PICKPOCKET_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Hugo_HELLO4))
	&& (Hugo_PickPoket != TRUE)
    {
    return TRUE;
    };
};

FUNC VOID DIA_Hugo_PICKPOCKET_Info()
{
	Info_ClearChoices	(DIA_Hugo_PICKPOCKET);
	Info_AddChoice		(DIA_Hugo_PICKPOCKET, DIALOG_BACK 	                                 ,DIA_Hugo_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Hugo_PICKPOCKET, "(Kradzie¿ tej ksi¹¿ki bêdzie doœæ ryzykowna.)",DIA_Hugo_PICKPOCKET_DoIt);
};

FUNC VOID DIA_Hugo_PICKPOCKET_DoIt()
{
	

	if (hero.attribute[ATR_DEXTERITY] > 59)
 	{
	     B_GiveInvItems (self,hero, ItWr_HugoBook, 1);
		 B_GiveXP(20);
		 AI_StopProcessInfos	(self);
		 Hugo_PickPoket = TRUE;
	}
	else
	{
		 AI_Output (self, other ,"DIA_Hugo_PICKPOCKET_DoIt_03_01"); //Ty parszywy z³odzieju! Czekaj no!
		 AI_StopProcessInfos	(self);
         Npc_SetTarget (self, other);
         AI_StartState (self, ZS_ATTACK, 1, "");

	};
};

FUNC VOID DIA_Hugo_PICKPOCKET_BACK()
{
	Info_ClearChoices	(DIA_Hugo_PICKPOCKET);
};
//========================================
//-----------------> HELLO5
//========================================

INSTANCE DIA_Hugo_HELLO5 (C_INFO)
{
   npc          = NON_3930_Hugo;
   nr           = 5;
   condition    = DIA_Hugo_HELLO5_Condition;
   information  = DIA_Hugo_HELLO5_Info;
   permanent	= FALSE;
   description	= "By³em w tej jaskini zaznaczonej na mapie i tam nic nie ma. Ani orków, ani skarbu, nic. ";
};

FUNC INT DIA_Hugo_HELLO5_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Hugo_HELLO3))
    && (Bylem_wodospad == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Hugo_HELLO5_Info()
{
    AI_Output (other, self ,"DIA_Hugo_HELLO5_15_01"); //By³em w tej jaskini zaznaczonej na mapie i tam nic nie ma. Ani orków, ani skarbu, nic. 
    AI_Output (self, other ,"DIA_Hugo_HELLO5_03_02"); //CO? Cholera, chyba nie robisz mnie w konia?
    AI_Output (other, self ,"DIA_Hugo_HELLO5_15_03"); //Nie, mówiê prawdê.
    AI_Output (self, other ,"DIA_Hugo_HELLO5_03_04"); //W porz¹dku, wierzê ci. Cholerni orkowie, pewnie to jakaœ stara mapa i zwinêli skarb ju¿ dawno temu zabieraj¹c go do miasta. 
	AI_Output (self, other ,"DIA_Hugo_HELLO5_03_05"); //Trochê siê rozczarowa³em, ale trudno. Wracam do obozu. Mo¿esz powiedzieæ ch³opakom, ¿e nied³ugo tam bêdê.
    AI_Output (other, self ,"DIA_Hugo_HELLO5_15_06"); //Przeka¿ê.
    B_LogEntry                     (CH1_HunterHugo,"Skarb nie istnieje, Hugo postanowi³ wróciæ do obozu. Powinienem poinformowaæ o tym Osko.");

    B_GiveXP (200);
	Npc_ExchangeRoutine (self,"lowcy");
};

//========================================
//-----------------> TWO
//========================================

INSTANCE DIA_Hugo_TWO (C_INFO)
{
   npc          = NON_3930_Hugo;
   nr           = 1;
   condition    = DIA_Hugo_TWO_Condition;
   information  = DIA_Hugo_TWO_Info;
   permanent	= FALSE;
   description	= "Zdobyliœmy tablicê zapisan¹ w jêzyku Orków...";
};

FUNC INT DIA_Hugo_TWO_Condition()
{
if (Npc_KnowsInfo(hero,DIA_SZEFU_TWO)) &&  (Npc_HasItems (other, ItMi_TWO_Tablica) >=1)
{
    return TRUE;
};
};
FUNC VOID DIA_Hugo_TWO_Info()
{
    AI_Output (other, self ,"DIA_Hugo_TWO_15_01"); //Zdobyliœmy tablicê zapisan¹ w jêzyku Orków. Orkowy pos³aniec, który j¹ niós³ bardzo siê œpieszy³ wiêc sprawa jest pilna.
	B_GiveInvItems (other,self, ItMi_TWO_Tablica, 1);
	Npc_RemoveInvItems(NON_3930_Hugo, ItMi_TWO_Tablica, 1);
    AI_Output (self, other ,"DIA_Hugo_TWO_03_02"); //O czyli coœ w sam raz dla mnie!
    AI_Output (self, other ,"DIA_Hugo_TWO_03_03"); //Szczerze mówi¹c ostatnio ³apa³a mnie nuda.
    AI_Output (self, other ,"DIA_Hugo_TWO_03_04"); //Daj mi tê tablice a ja postaram siê j¹ przet³umaczyæ na jêzyk ludzi.
    AI_Output (other, self ,"DIA_Hugo_TWO_15_05"); //Jak d³ugo Ci to zajmie?
    AI_Output (self, other ,"DIA_Hugo_TWO_03_06"); //Myœlê, ¿e jutro bêdê wiedzia³ co i jak.
	
	TWO_HUG_DAY = Wld_GetDay();
    AI_Output (other, self ,"DIA_Hugo_TWO_15_07"); //W porz¹dku. 
    AI_Output (self, other ,"DIA_Hugo_TWO_03_08"); //Trzymaj siê...
	B_LogEntry               (TajemniczaWiadomoscOrkow,"Porozmawia³em z Hugo odnoœnie tajemniczej tablicy Orków. Ma j¹ przet³umaczyæ na nasz jêzyk. Zajmiê mu to 2 dni.");
};

Func void TWO_ORC()
{
  	Wld_InsertNpc				(OrcWarrior2,"DT_PLATFORM_01");
	Wld_InsertNpc				(OrcWarrior2,"DT_E3_04");
	Wld_InsertNpc				(OrcWarrior2,"DT_E3_05");
	Wld_InsertNpc				(OrcWarrior2,"DT_MAINGATE");
	Wld_InsertNpc				(Orc_ELite_TWO,"DT_LIBRARY");
	Wld_InsertNpc				(OrcWarrior2,"DT_E1_03");
	Wld_InsertNpc				(OrcWarrior2,"OW_PATH_130");
};
//========================================
//-----------------> TWO_Tablica
//========================================

INSTANCE DIA_Hugo_TWO_Tablica (C_INFO)
{
   npc          = NON_3930_Hugo;
   nr           = 2;
   condition    = DIA_Hugo_TWO_Tablica_Condition;
   information  = DIA_Hugo_TWO_Tablica_Info;
   permanent	= FALSE;
   description	= "No i co z t¹ tablic¹ Orków?";
};

FUNC INT DIA_Hugo_TWO_Tablica_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Hugo_TWO)) && (TWO_HUG_DAY != Wld_GetDay())
{
    return TRUE;
};
};
FUNC VOID DIA_Hugo_TWO_Tablica_Info()
{
    AI_Output (other, self ,"DIA_Hugo_TWO_Tablica_15_01"); //No i co z t¹ tablic¹ Orków?
    AI_Output (self, other ,"DIA_Hugo_TWO_Tablica_03_02"); //Przet³umaczy³em j¹. To nie by³o trudne w przeciwieñstwie do tego co muszê ci teraz powiedzieæ.
    AI_Output (other, self ,"DIA_Hugo_TWO_Tablica_15_03"); //O co chodzi?
    AI_Output (self, other ,"DIA_Hugo_TWO_Tablica_03_04"); //O to czego siê dowiedzia³em.
    AI_Output (other, self ,"DIA_Hugo_TWO_Tablica_15_05"); //Mów.
    AI_Output (self, other ,"DIA_Hugo_TWO_Tablica_03_06"); //,,Teleport do Wie¿y prawie gotowy. Szamani koñcz¹ przygotowania. Wojownicy wkrótce zabij¹ Maga-Umar³ych. Z³y wybraniec straci przewodnika.
    AI_Output (other, self ,"DIA_Hugo_TWO_Tablica_15_07"); //Zaraz... Niemo¿liwe... Czy¿by... Xardas... Cholera!
    AI_Output (self, other ,"DIA_Hugo_TWO_Tablica_03_08"); //Kogo?
    AI_Output (other, self ,"DIA_Hugo_TWO_Tablica_15_09"); //Kogoœ kto ogarnia ca³y ten bajzel. Powstrzymam Orków. Teleportuje siê do wie¿y Xardasa. Trzeba go ostrzec!
    AI_Output (self, other ,"DIA_Hugo_TWO_Tablica_03_10"); //Nie wiem do koñca o co w tym chodzi ale faktycznie siê poœpiesz skoro to takie wa¿ne.
    AI_Output (self, other ,"DIA_Hugo_TWO_Tablica_03_11"); //Powodzenia!
    TWO_ORC();
	B_LogEntry               (TajemniczaWiadomoscOrkow,"Wróci³em do Hugo. Ten przekaza³ mi wieœci, po których nogi siê podemn¹ ugiê³y. Szamani Orków stworzyli magiczny portal przez, który zamierzaj¹ dostaæ siê do wie¿y Xardasa I zabiæ go tak by nie pomóg³ mi w walce ze Œni¹cym. Muszê jak najszybciej go ostrzec.");
};

