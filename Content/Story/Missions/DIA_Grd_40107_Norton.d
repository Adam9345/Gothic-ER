// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Norton_EXIT(C_INFO)
{
	npc             = Grd_40107_Norton;
	nr              = 999;
	condition	= DIA_Norton_EXIT_Condition;
	information	= DIA_Norton_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Norton_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Norton_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Norton_HELLO1 (C_INFO)
{
   npc          = Grd_40107_Norton;
   nr           = 1;
   condition    = DIA_Norton_HELLO1_Condition;
   information  = DIA_Norton_HELLO1_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Norton_HELLO1_Condition()
{
 if (Npc_HasItems (hero, ItFoBeer) >=1)
{
    return TRUE;
};
};
FUNC VOID DIA_Norton_HELLO1_Info()
{
    AI_Output (self, other ,"DIA_Norton_HELLO1_03_01"); //Ej ty!
    AI_Output (other, self ,"DIA_Norton_HELLO1_15_02"); //Czego chcesz?
    AI_Output (self, other ,"DIA_Norton_HELLO1_03_03"); //Piwa!
    AI_Output (other, self ,"DIA_Norton_HELLO1_15_04"); //To id� do karczmy.
    AI_Output (self, other ,"DIA_Norton_HELLO1_03_05"); //Mam tam przekroczone limity przez branie piwa na krech�. 
    AI_Output (other, self ,"DIA_Norton_HELLO1_15_06"); //To ju� tw�j problem.
    AI_Output (self, other ,"DIA_Norton_HELLO1_03_07"); //Daj mi to cholerne piwo!

    Info_ClearChoices	(DIA_Norton_HELLO1);
    Info_AddChoice		(DIA_Norton_HELLO1, "Trzymaj.", DIA_Norton_HELLO1_BeerYes);
    Info_AddChoice		(DIA_Norton_HELLO1, "Poca�uj mnie w dupe.", DIA_Norton_HELLO1_BeerNo);
};

FUNC VOID DIA_Norton_HELLO1_BeerYes()
{
    AI_Output (other, self ,"DIA_Norton_HELLO1_BeerYes_15_01"); //Trzymaj.
	B_GiveInvItems (other,self, itfobeer, 1);
    AI_Output (self ,other ,"DIA_Norton_HELLO1_BeerYes_03_02"); //No to dawaj to!
    AI_Output (self,other ,"DIA_Norton_HELLO1_BeerYes_03_03"); //Dzi�ki stary...
    AI_UseItem (self, ItFoBeer);
    AI_Output (self, other ,"DIA_Norton_HELLO1_BeerYes_03_04"); //Wiesz, pi�kne jest �ycie Stra�nika. Masz pod sob� wszystkie Cienie i tych z�amanych kopaczy.
    AI_Output (self, other ,"DIA_Norton_HELLO1_BeerYes_03_05"); // Od tych drugich mo�esz wyci�gn�� jak�� rud�. A czasem p�jdzie si� w konwoju do Starej Kopalni. 
    AI_Output (self, other ,"DIA_Norton_HELLO1_BeerYes_03_06"); //A najwi�ksza frajda to walka z Bandytami! Pami�tam jak paru rozp�ata�em a jednemu rozbi�em tak czerep, �e m�zg by�o wida�.
    AI_Output (self, other ,"DIA_Norton_HELLO1_BeerYes_03_07"); //By�em zaskoczony, �e taka �achudra w og�le go ma!
    AI_Output (self, other ,"DIA_Norton_HELLO1_BeerYes_03_08"); //A teraz dawaj kolejne piwo.
    NortonBeer = TRUE;
    Info_ClearChoices		(DIA_Norton_HELLO1);
};


FUNC VOID DIA_Norton_HELLO1_BeerNo()
{
    AI_Output (other, self ,"DIA_Norton_HELLO1_BeerNo_15_01"); //Poca�uj mnie w dupe.
    AI_Output (self, other ,"DIA_Norton_HELLO1_BeerNo_03_02"); //Jeszcze tego po�a�ujesz frajerze!
    AI_Output (other, self ,"DIA_Norton_HELLO1_BeerNo_15_03"); //Po�yjemy, zobaczymy...

    AI_StopProcessInfos	(self);
};


//========================================
//-----------------> Beer_Two
//========================================

INSTANCE DIA_Norton_Beer_Two (C_INFO)
{
   npc          = Grd_40107_Norton;
   nr           = 2;
   condition    = DIA_Norton_Beer_Two_Condition;
   information  = DIA_Norton_Beer_Two_Info;
   permanent	= FALSE;
   description	= "Masz.";
};

FUNC INT DIA_Norton_Beer_Two_Condition()
{
 if (Npc_HasItems (other, ItFoBeer) >=1)
 && (NortonBeer == TRUE)
{
    return TRUE;
};
};
FUNC VOID DIA_Norton_Beer_Two_Info()
{
    AI_Output (other, self ,"DIA_Norton_Beer_Two_15_01"); //Masz.
    AI_Output (self, other ,"DIA_Norton_Beer_Two_03_02"); //Dzi�ki stary...
	B_GiveInvItems (other,self, itfobeer, 1);
    AI_UseItem (self, ItFoBeer);
    AI_Output (self, other ,"DIA_Norton_Beer_Two_03_03"); //Moja siostra ca�kiem popsu�a nam reputacj� rodzinn� eeee...
    AI_Output (self, other ,"DIA_Norton_Beer_Two_03_04"); //�atwa by�a i nawet osio� m�g�by j� posi���... Eeeee... Wiesz, dziewucha nie lubi�a odmawia�.
	AI_Output (self, other ,"DIA_Norton_Beer_Two_03_05"); //Daj mi jeszcze jedno!
};

//========================================
//-----------------> BeerAdd
//========================================

INSTANCE DIA_Norton_BeerAdd (C_INFO)
{
   npc          = Grd_40107_Norton;
   nr           = 1;
   condition    = DIA_Norton_BeerAdd_Condition;
   information  = DIA_Norton_BeerAdd_Info;
   permanent	= FALSE;
   description	= "Masz...";
};

FUNC INT DIA_Norton_BeerAdd_Condition()
{
 if (Npc_HasItems (other, ItFoBeer) >=1)
 && (Npc_KnowsInfo(hero,DIA_Norton_Beer_Two))
{
    return TRUE;
};
};
FUNC VOID DIA_Norton_BeerAdd_Info()
{
    AI_Output (other, self ,"DIA_Norton_BeerAdd_15_01"); //Masz...
    AI_Output (self, other ,"DIA_Norton_BeerAdd_03_02"); //O widzisz. Innym razem napotka�em jakiego� pojedynczego Bandyt�. Szed� zupe�nie nie�wiadomy i nawet nie atakowa� czy nie ucieka�.
    AI_Output (self, other ,"DIA_Norton_BeerAdd_03_03"); //Dopiero jak go ostrzelali�my z kusz. Zacz�� ucieka� i wspina� si� na ska�ki przy Opuszczonej Kopalni.
    AI_Output (self, other ,"DIA_Norton_BeerAdd_03_04"); //Jak si� wspina� to dosta� be�tem ode mnie. Liczy�em, �e spadnie i go dobije ale on wspi�� si� na g�r�.
    AI_Output (self, other ,"DIA_Norton_BeerAdd_03_05"); //Nie chcia�o mi si� go goni�. Poza tym dra� pewnie nie po�y� zbyt d�ugo.
    AI_Output (self, other ,"DIA_Norton_BeerAdd_03_06"); //A teraz daj mi jeszcze jedno piwo.
};



//========================================
//-----------------> Beer_Othniella
//========================================

INSTANCE DIA_Norton_Beer_Othniella (C_INFO)
{
   npc          = Grd_40107_Norton;
   nr           = 3;
   condition    = DIA_Norton_Beer_Othniella_Condition;
   information  = DIA_Norton_Beer_Othniella_Info;
   permanent	= FALSE;
   description	= "Trzymaj.";
};

FUNC INT DIA_Norton_Beer_Othniella_Condition()
{
 if (Npc_HasItems (other, ItFoBeer) >=1)
 && (Npc_KnowsInfo(hero,DIA_Norton_BeerAdd))
{
    return TRUE;
};
};
FUNC VOID DIA_Norton_Beer_Othniella_Info()
{
    AI_Output (other, self ,"DIA_Norton_Beer_Othniella_15_01"); //Trzymaj.
    AI_Output (self, other ,"DIA_Norton_Beer_Othniella_03_02"); //Dzi�ki.
	B_GiveInvItems (other,self, itfobeer, 1);
    AI_UseItem (self, ItFoBeer);
    AI_Output (self, other ,"DIA_Norton_Beer_Othniella_03_03"); //Wiesz ta ca�a Othnielia... Haha zar�n��em j� jak dorodne prosi�.
    AI_Output (self, other ,"DIA_Norton_Beer_Othniella_03_04"); //Wbi�em miecz i wypru�em kiszki.
    AI_Output (other, self ,"DIA_Norton_Beer_Othniella_15_05"); //Czy to przez trafi�e� pod Barier� panie gadu�o? Kim by�a ta Othnielia?
    AI_Output (self, other ,"DIA_Norton_Beer_Othniella_03_06"); //Niee trafi�eeem tu z zupe�nie innego powoodu! 
    AI_Output (self, other ,"DIA_Norton_Beer_Othniella_03_07"); //A co do Othnielii?! To nie twoja sprawawa! I tak ju� zaza du�o ci powiedzia�em!
    AI_Output (other, self ,"DIA_Norton_Beer_Othniella_15_08"); //Chyba ju� nic wi�cej z ciebie nie wyci�gn�. Ale ta Othnielia... To imi� co� mi m�wi...
	Log_CreateTopic		(ZaDlugiJezor,	LOG_MISSION);
	Log_SetTopicStatus	(ZaDlugiJezor,	LOG_RUNNING);
	B_LogEntry               (ZaDlugiJezor,"Pijany Stra�nik Norton wspomnia� co�, �e zamordowa� niejak� Othnieli�. To imi� zdaj� mi si� co m�wi�... Powinienem porozmawia� z kim� zaufanym w obozie.");
	
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Norton_HELLO2 (C_INFO)
{
   npc          = Grd_40107_Norton;
   nr           = 1;
   condition    = DIA_Norton_HELLO2_Condition;
   information  = DIA_Norton_HELLO2_Info;
   permanent	= FALSE;
   description	= "Ty �mieciu! Nas�a�e� na mnie p�atnego morderc�!";
};

FUNC INT DIA_Norton_HELLO2_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Killer_HELLO1))
&& (Npc_HasItems (other, ItWr_NortonToKiller) >=1)
{
    return TRUE;
};
};
FUNC VOID DIA_Norton_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Norton_HELLO2_15_01"); //Ty �mieciu! Nas�a�e� na mnie p�atnego morderc�!
    AI_Output (self, other ,"DIA_Norton_HELLO2_03_02"); //To by� najlepszy spos�b �eby� zamkn�� pysk. 
    AI_Output (other, self ,"DIA_Norton_HELLO2_15_03"); //O co ci chodzi?
    AI_Output (self, other ,"DIA_Norton_HELLO2_03_04"); //Nie udawaj kretyna. Po pijaku powiedzia�em o par� spraw za du�o.
    AI_Output (other, self ,"DIA_Norton_HELLO2_15_05"); //O swojej puszczalskiej siostrze?
    AI_Output (self, other ,"DIA_Norton_HELLO2_03_06"); //Nie zgrywaj si�. Je�li ON dowie si� o Othnieli to jestem sko�czony. Jego zemsta r�kami jego ludzi dopadnie mnie i ur�nie �eb.
    AI_Output (other, self ,"DIA_Norton_HELLO2_15_07"); //Kim jest ,,On�?
    AI_Output (self, other ,"DIA_Norton_HELLO2_03_08"); //Nigdy ci tego nie powiem. Cho�by� da� mi ca�� rud� Kolonii. Nie ma mowy.
    AI_Output (self, other ,"DIA_Norton_HELLO2_03_09"); //A teraz zjerzd�aj! Bo inaczej wypruje ci flaki!
	B_LogEntry               (ZaDlugiJezor,"Norton grozi� mi, �e mnie zabije je�li pisn� s��wko na temat �mierci �ony kr�la. Wydaje si�, �e sam z kolei boi si� kogo� innego�.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO4
//========================================

INSTANCE DIA_Norton_HELLO4 (C_INFO)
{
   npc          = Grd_40107_Norton;
   nr           = 1;
   condition    = DIA_Norton_HELLO4_Condition;
   information  = DIA_Norton_HELLO4_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Norton_HELLO4_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Lee_Norton))
{
    return TRUE;
};
};
FUNC VOID DIA_Norton_HELLO4_Info()
{
    AI_Output (self, other ,"DIA_Norton_HELLO4_03_01"); //No prosz� znowu si� spotykamy!
    AI_Output (other, self ,"DIA_Norton_HELLO4_15_02"); //Widz�, �e zamierzasz stawia� op�r.
    AI_Output (self, other ,"DIA_Norton_HELLO4_03_03"); //No prosz� geniuszu domy�li�e� si�.
    AI_Output (self, other ,"DIA_Norton_HELLO4_03_04"); //Bra� go i wygarbowa� mu sk�r�. 
	B_LogEntry               (ZaDlugiJezor,"Stan��em oko w oko z Nortonem. Nadszed� czas by da� mu nauczk�. Lecz musz� pami�ta� o tym co m�wi� Lee!");
    AI_StopProcessInfos	(self);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
	B_SetPermAttitude	(GRD_40109_Gardist,	ATT_HOSTILE);
};

//========================================
//-----------------> HELLO5
//========================================

INSTANCE DIA_Norton_HELLO5 (C_INFO)
{
   npc          = Grd_40107_Norton;
   nr           = 2;
   condition    = DIA_Norton_HELLO5_Condition;
   information  = DIA_Norton_HELLO5_Info;
   permanent	= FALSE;
   description	= "Przysy�a mnie Lee. Mam do ciebie kilka pyta�.";
};

FUNC INT DIA_Norton_HELLO5_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Norton_HELLO4))
{
    return TRUE;
};
};
FUNC VOID DIA_Norton_HELLO5_Info()
{
    AI_Output (other, self ,"DIA_Norton_HELLO5_15_01"); //Przysy�a mnie Lee. Mam do ciebie kilka pyta�.
    AI_Output (self, other ,"DIA_Norton_HELLO5_03_02"); //Cholera ty, parszywy wariacie... (zwija si� z b�lu)
    AI_Output (self, other ,"DIA_Norton_HELLO5_03_03"); //Ju� po mnie...
    AI_Output (other, self ,"DIA_Norton_HELLO5_15_04"); //M�w, kim by� zleceniodawca zab�jstwa kr�lewskiej �ony?
    AI_Output (self, other ,"DIA_Norton_HELLO5_03_05"); //To wszystko sz�o z g�ry... Aghhh, z wysokiego szczebla. Za taki stos z�ota grzech by�o odm�wi� eeee...
    AI_Output (other, self ,"DIA_Norton_HELLO5_15_06"); //A konkretniej?
    AI_Output (self, other ,"DIA_Norton_HELLO5_03_07"); //Niech strac�... Moim zleceniodawc� by�...
	
	//B_KillNpc			(Grd_40107_Norton);
	B_LogEntry          (ZaDlugiJezor,"Norton powiedzia�, �e inicjatywa zab�jstwa kr�lewskiej �ony wysz�a z wysokiego szczebla. Jednak nim sprecyzowa� o kogo dok�adnie chodzi umar�. Chyba bij�c go wykaza�em si� nadmiernym entuzjazmem...");
    Info_ClearChoices	(DIA_Norton_HELLO5);
    Info_AddChoice		(DIA_Norton_HELLO5, "Dalej", DIA_Norton_Kill);
};

FUNC VOID DIA_Norton_Kill()
{
   Grd_40107_Norton.attribute[ATR_HITPOINTS] = 0;
    AI_StopProcessInfos	(other);
};

//========================================
//-----------------> HI_KILLER
//========================================

INSTANCE DIA_Norton_HI_KILLER (C_INFO)
{
   npc          = Grd_40107_Norton;
   nr           = 1;
   condition    = DIA_Norton_HI_KILLER_Condition;
   information  = DIA_Norton_HI_KILLER_Info;
   permanent	= FALSE;
   description	= "Kim jeste�?";
};

FUNC INT DIA_Norton_HI_KILLER_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Norton_HI_KILLER_Info()
{
    AI_Output (other, self ,"DIA_Norton_HI_KILLER_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Norton_HI_KILLER_03_02"); //A co �lepy jeste�? Kobiet� Gomeza. Dajcie mi si��!
    AI_Output (self, other ,"DIA_Norton_HI_KILLER_03_03"); //Gadasz ze Stra�nikiem I to �wietnym wi�c nie marnuj mojego czasu na takie pytania.
    AI_Output (self, other ,"DIA_Norton_HI_KILLER_03_04"); //Nie wi�m sk�d si� przypl�ta�e� ale nabierz troch� og�ady �wierzaku.
    AI_Output (other, self ,"DIA_Norton_HI_KILLER_15_05"); //Co robi�e� w czasach przed barier�?
    AI_Output (self, other ,"DIA_Norton_HI_KILLER_03_06"); //Nic ci do tego. I nie m�wi� co zrobi�em przed laty. A ju� na pewno nie tobie.
    AI_Output (self, other ,"DIA_Norton_HI_KILLER_03_07"); //Przesta� zawraca� mi dup�. Najlepiej zabierz st�d gnaty I przesta� mnie denerwowa�.
};


/*
//========================================
//-----------------> OPCJA KRADZIE�Y
//========================================

INSTANCE DIA_Norton_PICKPOCKET(C_INFO)
{
	npc          = Grd_40107_Norton;
	nr           = 900;
	condition    = DIA_Norton_PICKPOCKET_Condition;
	information  = DIA_Norton_PICKPOCKET_Info;
	permanent    = TRUE;
	description  = Pickpocket_20;
};

FUNC INT DIA_Norton_PICKPOCKET_Condition()
{
	C_Beklauen (20, 43);
};

FUNC VOID DIA_Norton_PICKPOCKET_Info()
{
	Info_ClearChoices	(DIA_Norton_PICKPOCKET);
	Info_AddChoice		(DIA_Norton_PICKPOCKET, DIALOG_BACK 	,DIA_Norton_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Norton_PICKPOCKET, DIALOG_PICKPOCKET 	,DIA_Norton_PICKPOCKET_DoIt);
};

FUNC VOID DIA_Norton_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices	(DIA_Norton_PICKPOCKET);
};

FUNC VOID DIA_Norton_PICKPOCKET_BACK()
{
	Info_ClearChoices	(DIA_Norton_PICKPOCKET);
};
*/