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
    AI_Output (self, other ,"DIA_Hugo_HELLO1_15_02"); //Postanowi�em za�o�y� tu sobie baz� wypadow�. Znalaz�em pewn� map� z orkowym skarbem. Zbieram si� od kilku dni, aby po niego wyruszy�. 
    AI_Output (other, self ,"DIA_Hugo_HELLO1_15_03"); //Zaraz, nazywasz si� Hugo?
    AI_Output (self, other ,"DIA_Hugo_HELLO1_03_04"); //Tak, jestem Hugo, �owca ork�w, sk�d znasz moje imi�?
    AI_Output (other, self ,"DIA_Hugo_HELLO1_15_05"); //Ch�opaki z obozu ci� szukaj�. M�wili, �e znikn��e� bez �ladu.
    AI_Output (self, other ,"DIA_Hugo_HELLO1_03_06"); //Zgadza si�, nie chcia�em si� im t�umaczy� z tego, co odkry�em. Jestem na tropie skarbu i chcia�em wymkn�� si� ukradkiem, aby w spokoju go odnale��. 
    B_LogEntry                     (CH1_HunterHugo,"Hugo ukry� si� przed przyjaci�mi, bo odnalaz� map� do orkowego skarbu. Nie chcia� dzieli� si� nagrod�, kt�rej jeszcze nawet nie zdoby�.");
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
    AI_Output (self, other ,"DIA_Hugo_HELLO2_03_02"); //No wi�c kilka dni temu stoczyli�my z ch�opakami potyczk� z grup� ork�w w starej Cytadeli w g�rach. 
	AI_Output (self, other ,"DIA_Hugo_HELLO2_03_03"); //Jestem bardzo zainteresowany wszystkim, co nosi znami� ork�w i pozwoli mi zbada� dog��bnie ich kultur�. 
	AI_Output (self, other ,"DIA_Hugo_HELLO2_03_04"); //Mam pewn� zasad�: zanim zabij� jakiego� orka torturuj� go, aby wydoby� informacje, a gdy ju� go zabijam, zawsze przeszukuj� zw�oki.
    AI_Output (self, other ,"DIA_Hugo_HELLO2_03_05"); //Po potyczce przeszuka�em wi�c cia�o przyw�dcy tej grupy ork�w i znalaz�em pewn� map�. 
	AI_Output (self, other ,"DIA_Hugo_HELLO2_03_06"); //Miejsce, gdzie znajduje si� skarb oznaczono na mapie krzy�ykiem. Postanowi�em wi�c opu�ci� ob�z �owc�w ork�w na jaki� czas i odnale�� skarb.
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
   description	= "Pomog� ci odnale�� skarb, poka� mi t� map�. ";
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
    AI_Output (other, self ,"DIA_Hugo_HELLO3_15_01"); //Pomog� ci odnale�� skarb, poka� mi t� map�. 
    AI_Output (self, other ,"DIA_Hugo_HELLO3_03_02"); //Prosz� bardzo, przynie� mi wszystko co tam znajdziesz, a nagrodz� ci� rud�. 
	AI_Output (self, other ,"DIA_Hugo_HELLO3_03_03"); //Nie pr�buj jednak znikn�� ze skarbem, bo zrobi si� nieciekawie. Wychowa�em si� w Nordmarze i mo�esz mi wierzy�, �e na bitce to ja si� znam. 
    AI_Output (other, self ,"DIA_Hugo_HELLO3_15_04"); //Nie obawiaj si�, przynios� ci skarb.
    AI_Output (self, other ,"DIA_Hugo_HELLO3_03_05"); //�wietnie, oto mapa. Miejsce, gdzie znajduje si� skarb znajduje si� chyba w okolicach Nowego Obozu i Starej Kopalni. Powodzenia, i pami�taj o naszej umowie.
    AI_Output (other, self ,"DIA_Hugo_HELLO3_15_06"); //Dzi�ki.
	B_GiveInvItems (self, other, Hugo_Map, 1);
    B_LogEntry                     (CH1_HunterHugo,"Hugo nie pokusi� si�, �eby i�� ze mn� odnale�� skarb. Nie do��, �e musz� sam uda� si� w wyznaczone miejsce, to jeszcze mam si� z nim podzieli� po�ow� skarbu.");
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
   description	= "Mo�esz mi co nieco opowiedzie� o Orkach?";
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
   AI_Output (other, self ,"DIA_Hugo_HELLO4_15_01"); //Mo�esz mi co nieco opowiedzie� o Orkach?
   AI_Output (self, other ,"DIA_Hugo_HELLO4_03_02"); //C� to brutalna I stara rasa. R�wna wiekiem nam ludziom.
   AI_Output (self, other ,"DIA_Hugo_HELLO4_03_03"); //Ma ciekaw� kultur� a niekt�rzy Orkowie s� wyj�tkowo inteligentni I da si� z nimi pogada�.
   AI_Output (self, other ,"DIA_Hugo_HELLO4_03_04"); //Ale m�wi� o tych z kontynentu. Tutaj Orkowie s� na ni�szym szczeblu rozwojowym.
   AI_Output (self, other ,"DIA_Hugo_HELLO4_03_05"); //Czuje, �e wi��e si� z nimi jaka� g��boka tajemnica...
   AI_Output (self, other ,"DIA_Hugo_HELLO4_03_06"); //Ale teraz wybacz. Jestem zaj�ty. Przyjd� innym razem je�li chcesz si� dowiedzie� wi�cej.
   AI_Output (other, self ,"DIA_Hugo_HELLO4_15_07"); //W porz�dku.
 
};
//========================================
//-----------------> OPCJA KRADZIE�Y
//========================================
var int Hugo_PickPoket;
INSTANCE DIA_Hugo_PICKPOCKET(C_INFO)
{
	npc          = NON_3930_Hugo;
	nr           = 900;
	condition    = DIA_Hugo_PICKPOCKET_Condition;
	information  = DIA_Hugo_PICKPOCKET_Info;
	permanent    = TRUE;
	 description = "Kradzie� kiesz.";
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
	Info_AddChoice		(DIA_Hugo_PICKPOCKET, "(Kradzie� tej ksi��ki b�dzie do�� ryzykowna.)",DIA_Hugo_PICKPOCKET_DoIt);
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
		 AI_Output (self, other ,"DIA_Hugo_PICKPOCKET_DoIt_03_01"); //Ty parszywy z�odzieju! Czekaj no!
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
   description	= "By�em w tej jaskini zaznaczonej na mapie i tam nic nie ma. Ani ork�w, ani skarbu, nic. ";
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
    AI_Output (other, self ,"DIA_Hugo_HELLO5_15_01"); //By�em w tej jaskini zaznaczonej na mapie i tam nic nie ma. Ani ork�w, ani skarbu, nic. 
    AI_Output (self, other ,"DIA_Hugo_HELLO5_03_02"); //CO? Cholera, chyba nie robisz mnie w konia?
    AI_Output (other, self ,"DIA_Hugo_HELLO5_15_03"); //Nie, m�wi� prawd�.
    AI_Output (self, other ,"DIA_Hugo_HELLO5_03_04"); //W porz�dku, wierz� ci. Cholerni orkowie, pewnie to jaka� stara mapa i zwin�li skarb ju� dawno temu zabieraj�c go do miasta. 
	AI_Output (self, other ,"DIA_Hugo_HELLO5_03_05"); //Troch� si� rozczarowa�em, ale trudno. Wracam do obozu. Mo�esz powiedzie� ch�opakom, �e nied�ugo tam b�d�.
    AI_Output (other, self ,"DIA_Hugo_HELLO5_15_06"); //Przeka��.
    B_LogEntry                     (CH1_HunterHugo,"Skarb nie istnieje, Hugo postanowi� wr�ci� do obozu. Powinienem poinformowa� o tym Osko.");

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
   description	= "Zdobyli�my tablic� zapisan� w j�zyku Ork�w...";
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
    AI_Output (other, self ,"DIA_Hugo_TWO_15_01"); //Zdobyli�my tablic� zapisan� w j�zyku Ork�w. Orkowy pos�aniec, kt�ry j� ni�s� bardzo si� �pieszy� wi�c sprawa jest pilna.
	B_GiveInvItems (other,self, ItMi_TWO_Tablica, 1);
	Npc_RemoveInvItems(NON_3930_Hugo, ItMi_TWO_Tablica, 1);
    AI_Output (self, other ,"DIA_Hugo_TWO_03_02"); //O czyli co� w sam raz dla mnie!
    AI_Output (self, other ,"DIA_Hugo_TWO_03_03"); //Szczerze m�wi�c ostatnio �apa�a mnie nuda.
    AI_Output (self, other ,"DIA_Hugo_TWO_03_04"); //Daj mi t� tablice a ja postaram si� j� przet�umaczy� na j�zyk ludzi.
    AI_Output (other, self ,"DIA_Hugo_TWO_15_05"); //Jak d�ugo Ci to zajmie?
    AI_Output (self, other ,"DIA_Hugo_TWO_03_06"); //My�l�, �e jutro b�d� wiedzia� co i jak.
	
	TWO_HUG_DAY = Wld_GetDay();
    AI_Output (other, self ,"DIA_Hugo_TWO_15_07"); //W porz�dku. 
    AI_Output (self, other ,"DIA_Hugo_TWO_03_08"); //Trzymaj si�...
	B_LogEntry               (TajemniczaWiadomoscOrkow,"Porozmawia�em z Hugo odno�nie tajemniczej tablicy Ork�w. Ma j� przet�umaczy� na nasz j�zyk. Zajmi� mu to 2 dni.");
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
   description	= "No i co z t� tablic� Ork�w?";
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
    AI_Output (other, self ,"DIA_Hugo_TWO_Tablica_15_01"); //No i co z t� tablic� Ork�w?
    AI_Output (self, other ,"DIA_Hugo_TWO_Tablica_03_02"); //Przet�umaczy�em j�. To nie by�o trudne w przeciwie�stwie do tego co musz� ci teraz powiedzie�.
    AI_Output (other, self ,"DIA_Hugo_TWO_Tablica_15_03"); //O co chodzi?
    AI_Output (self, other ,"DIA_Hugo_TWO_Tablica_03_04"); //O to czego si� dowiedzia�em.
    AI_Output (other, self ,"DIA_Hugo_TWO_Tablica_15_05"); //M�w.
    AI_Output (self, other ,"DIA_Hugo_TWO_Tablica_03_06"); //,,Teleport do Wie�y prawie gotowy. Szamani ko�cz� przygotowania. Wojownicy wkr�tce zabij� Maga-Umar�ych. Z�y wybraniec straci przewodnika.
    AI_Output (other, self ,"DIA_Hugo_TWO_Tablica_15_07"); //Zaraz... Niemo�liwe... Czy�by... Xardas... Cholera!
    AI_Output (self, other ,"DIA_Hugo_TWO_Tablica_03_08"); //Kogo?
    AI_Output (other, self ,"DIA_Hugo_TWO_Tablica_15_09"); //Kogo� kto ogarnia ca�y ten bajzel. Powstrzymam Ork�w. Teleportuje si� do wie�y Xardasa. Trzeba go ostrzec!
    AI_Output (self, other ,"DIA_Hugo_TWO_Tablica_03_10"); //Nie wiem do ko�ca o co w tym chodzi ale faktycznie si� po�piesz skoro to takie wa�ne.
    AI_Output (self, other ,"DIA_Hugo_TWO_Tablica_03_11"); //Powodzenia!
    TWO_ORC();
	B_LogEntry               (TajemniczaWiadomoscOrkow,"Wr�ci�em do Hugo. Ten przekaza� mi wie�ci, po kt�rych nogi si� podemn� ugi�y. Szamani Ork�w stworzyli magiczny portal przez, kt�ry zamierzaj� dosta� si� do wie�y Xardasa I zabi� go tak by nie pom�g� mi w walce ze �ni�cym. Musz� jak najszybciej go ostrzec.");
};

