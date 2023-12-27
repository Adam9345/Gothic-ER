// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Fallon_EXIT(C_INFO)
{
	npc             = VLK_40069_Fallon;
	nr              = 999;
	condition	= DIA_Fallon_EXIT_Condition;
	information	= DIA_Fallon_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Fallon_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Fallon_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> ZL_ERENS
//========================================

INSTANCE DIA_Fallon_ZL_ERENS (C_INFO)
{
   npc          = VLK_40069_Fallon;
   nr           = 1;
   condition    = DIA_Fallon_ZL_ERENS_Condition;
   information  = DIA_Fallon_ZL_ERENS_Info;
   permanent	= FALSE;
   important    = TRUE;
};

FUNC INT DIA_Fallon_ZL_ERENS_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Buddler_ZL_GIVE_NUGGET))
{
    return TRUE;
};
};
FUNC VOID DIA_Fallon_ZL_ERENS_Info()
{
    AI_Output (self, other ,"DIA_Fallon_ZL_ERENS_03_01"); //Widz�, �e robisz interesiki z Erensem!
    AI_Output (other, self ,"DIA_Fallon_ZL_ERENS_15_02"); //I co z tego?
    AI_Output (self, other ,"DIA_Fallon_ZL_ERENS_03_03"); //Dziwny ostatnio z niego go��. Nocami m�wi co� w nieznanym j�zyku i odprawia jakie� mini-rytua�y.
    AI_Output (other, self ,"DIA_Fallon_ZL_ERENS_15_04"); //Rytua�y?
    AI_Output (self, other ,"DIA_Fallon_ZL_ERENS_03_05"); //Z pewno�ci� mroczne. Widzia�em jak zrobi� sobie ran� i upuszcza� w�asn� krew, wyj�c co� niezrozumiale.
    AI_Output (self, other ,"DIA_Fallon_ZL_ERENS_03_06"); //Jak dla mnie to ju� od jakiego� czasu powinni go zamkn�� w lochu albo wywali� na zbity pysk z obozu.
    AI_Output (other, self ,"DIA_Fallon_ZL_ERENS_15_07"); //Interesuj�ce...
    AI_Output (self, other ,"DIA_Fallon_ZL_ERENS_03_08"); //Drobiazg...
	B_LogEntry               (KsiegaDlaVictora,"Kopacz Fallon powiedzia�, �e Erens by� zamieszany w podejrzane rytua�y. Zapewne chodzi te� o t� ksi�g�, kt�r� w�a�nie mam przy sobie...");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HI_FALLO
//========================================

INSTANCE DIA_Fallon_HI_FALLO (C_INFO)
{
   npc          = VLK_40069_Fallon;
   nr           = 1;
   condition    = DIA_Fallon_HI_FALLO_Condition;
   information  = DIA_Fallon_HI_FALLO_Info;
   permanent	= FALSE;
   description	= "Co z ciebie za jeden?";
};

FUNC INT DIA_Fallon_HI_FALLO_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Fallon_HI_FALLO_Info()
{
    AI_Output (other, self ,"DIA_Fallon_HI_FALLO_15_01"); //Co z ciebie za jeden?
    AI_Output (self, other ,"DIA_Fallon_HI_FALLO_03_02"); //Jestem Fallon. Niegdy� by�em bednarzem w Trellis I �y�em dosy� dobrze.
    AI_Output (other, self ,"DIA_Fallon_HI_FALLO_15_03"); //Domy�lam si�, �e co� ci si� przytrafi�o.
    AI_Output (self, other ,"DIA_Fallon_HI_FALLO_03_04"); //Pewien idiota.
    AI_Output (other, self ,"DIA_Fallon_HI_FALLO_15_05"); //Jaki idiota?
    AI_Output (self, other ,"DIA_Fallon_HI_FALLO_03_06"); //Kt�rego� dnia zamieszka� ko�o mnie pewien cz�owiek. W dzie� I w nocy urz�dza� libacje alkohole z kole�kami.
    AI_Output (self, other ,"DIA_Fallon_HI_FALLO_03_07"); //Wydzieraj�c si�, przeklinaj�c I przygrywaj�c sobie na lutni. Naskar�y�em na niego do w�adz ale �aden po��dkowy si� nie pojawi�.
    AI_Output (self, other ,"DIA_Fallon_HI_FALLO_03_08"); //I pewnego dnia przebra�a si� miara. Zak�u�em dokucznika sztyletem. I zrzucono mnie tutaj. O ile si� nie myl� dwa I p� roku temu.
    AI_Output (other, self ,"DIA_Fallon_HI_FALLO_15_09"); //Dlaczego do��czy�e� do Kopaczy?
    AI_Output (self, other ,"DIA_Fallon_HI_FALLO_03_10"); //A do kogo mia�em? To by� najlepszy w�r�d z�ych wybor�w. Bo wsz�dzie by�o bardziej lub mniej �le.
    AI_Output (self, other ,"DIA_Fallon_HI_FALLO_03_11"); //Jedynie Magnaci... ale oni s� poza wszelk� kategori�. Pono� kiedy� byli zwyk�ymi skaza�cami.
    AI_Output (self, other ,"DIA_Fallon_HI_FALLO_03_12"); //Chcia�bym zobaczy� Gomeza w �achmanach. To by�by ciekawy widok.
    AI_Output (other, self ,"DIA_Fallon_HI_FALLO_15_13"); //Z pewno�ci�. Ale obawiam si�, �e sam Gomez nie ch�tnie zn�w przywdzia�by taki str�j.
};

//========================================
//-----------------> JOHN_NUGGET
//========================================

INSTANCE DIA_Fallon_JOHN_NUGGET (C_INFO)
{
   npc          = VLK_40069_Fallon;
   nr           = 1;
   condition    = DIA_Fallon_JOHN_NUGGET_Condition;
   information  = DIA_Fallon_JOHN_NUGGET_Info;
   permanent	= FALSE;
   description	= "Pono� od dawna zalegasz pewn� sumk� rudy Stra�nikowi imieniem John!";
};

FUNC INT DIA_Fallon_JOHN_NUGGET_Condition()
{
if (Fallon_Nugget == TRUE)
{
    return TRUE;
};
};
FUNC VOID DIA_Fallon_JOHN_NUGGET_Info()
{
    AI_Output (other, self ,"DIA_Fallon_JOHN_NUGGET_15_01"); //Pono� od dawna zalegasz pewn� sumk� rudy Stra�nikowi imieniem John!
    AI_Output (self, other ,"DIA_Fallon_JOHN_NUGGET_03_02"); //To bzdura. Ta �achudra zwyczajnie k�amie. Zawsze by�em na bie��co z wszystkimi op�atami u niego gdy mia� ten rewir podatkowy!
    AI_Output (other, self ,"DIA_Fallon_JOHN_NUGGET_15_03"); //John twierdzi, �e jeste� mu winny 50 bry�ek rudy.
    AI_Output (self, other ,"DIA_Fallon_JOHN_NUGGET_03_04"); //M�wi� ci, �e to nie prawda.
    AI_Output (other, self ,"DIA_Fallon_JOHN_NUGGET_15_05"); //Dawaj t� rud�! I to migiem.
    AI_Output (self, other ,"DIA_Fallon_JOHN_NUGGET_03_06"); //Nie ma mowy. Nie zgodz� si� na to!
	Info_ClearChoices	(DIA_Fallon_JOHN_NUGGET);
    Info_AddChoice		(DIA_Fallon_JOHN_NUGGET, "I tak nic nie wsk�rasz. Je�li nawet nie dasz mi rudy to John...", DIA_Fallon_JOHNN);
    Info_AddChoice		(DIA_Fallon_JOHN_NUGGET, "Dawaj t� rud� �mieciu.", DIA_Fallon_JOHNY);
};

FUNC VOID DIA_Fallon_JOHNN()
{
    AI_Output (other, self ,"DIA_Fallon_JOHNN_15_01"); //I tak nic nie wsk�rasz. Je�li nawet nie dasz mi rudy to John sam si� o ni� upomni. I rozwali ci mak�wk�.
	AI_Output (self,  other,"DIA_Fallon_JOHNN_03_02"); //Ahh No nie. W sumie masz racje, mo�e by� tylko gorzej.
	AI_Output (self,  other,"DIA_Fallon_JOHNN_03_03"); //We� t� rud�.
	AI_Output (self,  other,"DIA_Fallon_JOHNN_03_04"); //Mam nadzieje, �e ten podst�pny sukinsyn o mnie zapomni.
	AI_Output (other, self ,"DIA_Fallon_JOHNN_15_05"); //To ju� wasza wewn�trzna sprawa. Do zobaczenia
	AI_Output (self,  other,"DIA_Fallon_JOHNN_03_06"); //Na twoim miejscu... Dobra nie wa�ne...
	Fallon_Dlug = TRUE;
	B_GiveInvItems (self,other, itminugget, 50);
	
	B_LogEntry               (Blachostka,"Przekona�em Fallona do dobrowolnego oddania rudy.");
	
	
	
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Fallon_JOHNY()
{
    AI_Output (other, self ,"DIA_Fallon_JOHNY_15_01"); //Dawaj t� rud� �mieciu.
    AI_Output (self, other ,"DIA_Fallon_JOHNY_03_02"); //Wyszczekany jeste� kundelku. Teraz stary Fallon nauczy ci� odpowiednio szacunku!
    AI_Output (other, self ,"DIA_Fallon_JOHNY_15_03"); //Mam nadzieje, �e nie umr� ze staro�ci za nim wyci�gniesz bro� I b�dziesz ni� wymachiwa�...
    AI_Output (self, other ,"DIA_Fallon_JOHNY_03_04"); //Stawaj do walki Ty nieopierzona m�dralo...
	B_LogEntry               (Blachostka,"Fallon nie chce odda� rudy Johna, chyba musz� by� nieco bardziej dosadny...");
    Fallon_Angry = TRUE;
    AI_StopProcessInfos	(self);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
	
};


//========================================
//-----------------> Bojka
//========================================

INSTANCE DIA_Fallon_Bojka (C_INFO)
{
   npc          = VLK_40069_Fallon;
   nr           = 2;
   condition    = DIA_Fallon_Bojka_Condition;
   information  = DIA_Fallon_Bojka_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Fallon_Bojka_Condition()
{
  if (VLK_40069_Fallon.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
  && (Fallon_Angry == TRUE)
{
    return TRUE;
};
};
FUNC VOID DIA_Fallon_Bojka_Info()
{
    AI_Output (self, other ,"DIA_Fallon_Bojka_03_01"); //O bogowie... Moje ko�ci...
    AI_Output (other, self ,"DIA_Fallon_Bojka_15_02"); //Gdzie ruda dla Johna?
    AI_Output (self, other ,"DIA_Fallon_Bojka_03_03"); //Trzymaj. I zejd� mi z oczu!
    AI_Output (other, self ,"DIA_Fallon_Bojka_15_04"); //W sumie wykonuje tylko polecenia.
    AI_Output (self, other ,"DIA_Fallon_Bojka_03_05"); //Poszukujesz zapewne wsz�dzie poparcia m�okosie. Ale John to pod�a gnida I z pewno�ci� daleko nie zajdziesz z takimi konszachtami.
    AI_Output (other, self ,"DIA_Fallon_Bojka_15_06"); //To ju� moja sprawa. A ty jako� zbierz si� do kupy.
	Fallon_Dlug = TRUE;
	B_LogEntry               (Blachostka,"Kopacz odda� zaleg�� rud�, mog� wraca� do Johna.");
	B_GiveInvItems (self,other, itminugget, 50);
    AI_StopProcessInfos	(self);
};

