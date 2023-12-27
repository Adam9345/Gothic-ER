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
    AI_Output (other, self ,"DIA_Norton_HELLO1_15_04"); //To idŸ do karczmy.
    AI_Output (self, other ,"DIA_Norton_HELLO1_03_05"); //Mam tam przekroczone limity przez branie piwa na krechê. 
    AI_Output (other, self ,"DIA_Norton_HELLO1_15_06"); //To ju¿ twój problem.
    AI_Output (self, other ,"DIA_Norton_HELLO1_03_07"); //Daj mi to cholerne piwo!

    Info_ClearChoices	(DIA_Norton_HELLO1);
    Info_AddChoice		(DIA_Norton_HELLO1, "Trzymaj.", DIA_Norton_HELLO1_BeerYes);
    Info_AddChoice		(DIA_Norton_HELLO1, "Poca³uj mnie w dupe.", DIA_Norton_HELLO1_BeerNo);
};

FUNC VOID DIA_Norton_HELLO1_BeerYes()
{
    AI_Output (other, self ,"DIA_Norton_HELLO1_BeerYes_15_01"); //Trzymaj.
	B_GiveInvItems (other,self, itfobeer, 1);
    AI_Output (self ,other ,"DIA_Norton_HELLO1_BeerYes_03_02"); //No to dawaj to!
    AI_Output (self,other ,"DIA_Norton_HELLO1_BeerYes_03_03"); //Dziêki stary...
    AI_UseItem (self, ItFoBeer);
    AI_Output (self, other ,"DIA_Norton_HELLO1_BeerYes_03_04"); //Wiesz, piêkne jest ¿ycie Stra¿nika. Masz pod sob¹ wszystkie Cienie i tych z³amanych kopaczy.
    AI_Output (self, other ,"DIA_Norton_HELLO1_BeerYes_03_05"); // Od tych drugich mo¿esz wyci¹gn¹æ jak¹œ rudê. A czasem pójdzie siê w konwoju do Starej Kopalni. 
    AI_Output (self, other ,"DIA_Norton_HELLO1_BeerYes_03_06"); //A najwiêksza frajda to walka z Bandytami! Pamiêtam jak paru rozp³ata³em a jednemu rozbi³em tak czerep, ¿e mózg by³o widaæ.
    AI_Output (self, other ,"DIA_Norton_HELLO1_BeerYes_03_07"); //By³em zaskoczony, ¿e taka ³achudra w ogóle go ma!
    AI_Output (self, other ,"DIA_Norton_HELLO1_BeerYes_03_08"); //A teraz dawaj kolejne piwo.
    NortonBeer = TRUE;
    Info_ClearChoices		(DIA_Norton_HELLO1);
};


FUNC VOID DIA_Norton_HELLO1_BeerNo()
{
    AI_Output (other, self ,"DIA_Norton_HELLO1_BeerNo_15_01"); //Poca³uj mnie w dupe.
    AI_Output (self, other ,"DIA_Norton_HELLO1_BeerNo_03_02"); //Jeszcze tego po¿a³ujesz frajerze!
    AI_Output (other, self ,"DIA_Norton_HELLO1_BeerNo_15_03"); //Po¿yjemy, zobaczymy...

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
    AI_Output (self, other ,"DIA_Norton_Beer_Two_03_02"); //Dziêki stary...
	B_GiveInvItems (other,self, itfobeer, 1);
    AI_UseItem (self, ItFoBeer);
    AI_Output (self, other ,"DIA_Norton_Beer_Two_03_03"); //Moja siostra ca³kiem popsu³a nam reputacjê rodzinn¹ eeee...
    AI_Output (self, other ,"DIA_Norton_Beer_Two_03_04"); //£atwa by³a i nawet osio³ móg³by j¹ posi¹œæ... Eeeee... Wiesz, dziewucha nie lubi³a odmawiaæ.
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
    AI_Output (self, other ,"DIA_Norton_BeerAdd_03_02"); //O widzisz. Innym razem napotka³em jakiegoœ pojedynczego Bandytê. Szed³ zupe³nie nieœwiadomy i nawet nie atakowa³ czy nie ucieka³.
    AI_Output (self, other ,"DIA_Norton_BeerAdd_03_03"); //Dopiero jak go ostrzelaliœmy z kusz. Zacz¹³ uciekaæ i wspinaæ siê na ska³ki przy Opuszczonej Kopalni.
    AI_Output (self, other ,"DIA_Norton_BeerAdd_03_04"); //Jak siê wspina³ to dosta³ be³tem ode mnie. Liczy³em, ¿e spadnie i go dobije ale on wspi¹³ siê na górê.
    AI_Output (self, other ,"DIA_Norton_BeerAdd_03_05"); //Nie chcia³o mi siê go goniæ. Poza tym drañ pewnie nie po¿y³ zbyt d³ugo.
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
    AI_Output (self, other ,"DIA_Norton_Beer_Othniella_03_02"); //Dziêki.
	B_GiveInvItems (other,self, itfobeer, 1);
    AI_UseItem (self, ItFoBeer);
    AI_Output (self, other ,"DIA_Norton_Beer_Othniella_03_03"); //Wiesz ta ca³a Othnielia... Haha zar¿n¹³em j¹ jak dorodne prosiê.
    AI_Output (self, other ,"DIA_Norton_Beer_Othniella_03_04"); //Wbi³em miecz i wypru³em kiszki.
    AI_Output (other, self ,"DIA_Norton_Beer_Othniella_15_05"); //Czy to przez trafi³eœ pod Barierê panie gadu³o? Kim by³a ta Othnielia?
    AI_Output (self, other ,"DIA_Norton_Beer_Othniella_03_06"); //Niee trafi³eeem tu z zupe³nie innego powoodu! 
    AI_Output (self, other ,"DIA_Norton_Beer_Othniella_03_07"); //A co do Othnielii?! To nie twoja sprawawa! I tak ju¿ zaza du¿o ci powiedzia³em!
    AI_Output (other, self ,"DIA_Norton_Beer_Othniella_15_08"); //Chyba ju¿ nic wiêcej z ciebie nie wyci¹gnê. Ale ta Othnielia... To imiê coœ mi mówi...
	Log_CreateTopic		(ZaDlugiJezor,	LOG_MISSION);
	Log_SetTopicStatus	(ZaDlugiJezor,	LOG_RUNNING);
	B_LogEntry               (ZaDlugiJezor,"Pijany Stra¿nik Norton wspomnia³ coœ, ¿e zamordowa³ niejak¹ Othnieliê. To imiê zdajê mi siê co mówiæ... Powinienem porozmawiaæ z kimœ zaufanym w obozie.");
	
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
   description	= "Ty œmieciu! Nas³a³eœ na mnie p³atnego mordercê!";
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
    AI_Output (other, self ,"DIA_Norton_HELLO2_15_01"); //Ty œmieciu! Nas³a³eœ na mnie p³atnego mordercê!
    AI_Output (self, other ,"DIA_Norton_HELLO2_03_02"); //To by³ najlepszy sposób ¿ebyœ zamkn¹³ pysk. 
    AI_Output (other, self ,"DIA_Norton_HELLO2_15_03"); //O co ci chodzi?
    AI_Output (self, other ,"DIA_Norton_HELLO2_03_04"); //Nie udawaj kretyna. Po pijaku powiedzia³em o parê spraw za du¿o.
    AI_Output (other, self ,"DIA_Norton_HELLO2_15_05"); //O swojej puszczalskiej siostrze?
    AI_Output (self, other ,"DIA_Norton_HELLO2_03_06"); //Nie zgrywaj siê. Jeœli ON dowie siê o Othnieli to jestem skoñczony. Jego zemsta rêkami jego ludzi dopadnie mnie i ur¿nie ³eb.
    AI_Output (other, self ,"DIA_Norton_HELLO2_15_07"); //Kim jest ,,On”?
    AI_Output (self, other ,"DIA_Norton_HELLO2_03_08"); //Nigdy ci tego nie powiem. Choæbyœ da³ mi ca³¹ rudê Kolonii. Nie ma mowy.
    AI_Output (self, other ,"DIA_Norton_HELLO2_03_09"); //A teraz zjerzd¿aj! Bo inaczej wypruje ci flaki!
	B_LogEntry               (ZaDlugiJezor,"Norton grozi³ mi, ¿e mnie zabije jeœli pisnê s³ówko na temat œmierci ¿ony króla. Wydaje siê, ¿e sam z kolei boi siê kogoœ innego….");
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
    AI_Output (self, other ,"DIA_Norton_HELLO4_03_01"); //No proszê znowu siê spotykamy!
    AI_Output (other, self ,"DIA_Norton_HELLO4_15_02"); //Widzê, ¿e zamierzasz stawiaæ opór.
    AI_Output (self, other ,"DIA_Norton_HELLO4_03_03"); //No proszê geniuszu domyœli³eœ siê.
    AI_Output (self, other ,"DIA_Norton_HELLO4_03_04"); //Braæ go i wygarbowaæ mu skórê. 
	B_LogEntry               (ZaDlugiJezor,"Stan¹³em oko w oko z Nortonem. Nadszed³ czas by daæ mu nauczkê. Lecz muszê pamiêtaæ o tym co mówi³ Lee!");
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
   description	= "Przysy³a mnie Lee. Mam do ciebie kilka pytañ.";
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
    AI_Output (other, self ,"DIA_Norton_HELLO5_15_01"); //Przysy³a mnie Lee. Mam do ciebie kilka pytañ.
    AI_Output (self, other ,"DIA_Norton_HELLO5_03_02"); //Cholera ty, parszywy wariacie... (zwija siê z bólu)
    AI_Output (self, other ,"DIA_Norton_HELLO5_03_03"); //Ju¿ po mnie...
    AI_Output (other, self ,"DIA_Norton_HELLO5_15_04"); //Mów, kim by³ zleceniodawca zabójstwa królewskiej ¿ony?
    AI_Output (self, other ,"DIA_Norton_HELLO5_03_05"); //To wszystko sz³o z góry... Aghhh, z wysokiego szczebla. Za taki stos z³ota grzech by³o odmówiæ eeee...
    AI_Output (other, self ,"DIA_Norton_HELLO5_15_06"); //A konkretniej?
    AI_Output (self, other ,"DIA_Norton_HELLO5_03_07"); //Niech stracê... Moim zleceniodawc¹ by³...
	
	//B_KillNpc			(Grd_40107_Norton);
	B_LogEntry          (ZaDlugiJezor,"Norton powiedzia³, ¿e inicjatywa zabójstwa królewskiej ¿ony wysz³a z wysokiego szczebla. Jednak nim sprecyzowa³ o kogo dok³adnie chodzi umar³. Chyba bij¹c go wykaza³em siê nadmiernym entuzjazmem...");
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
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Norton_HI_KILLER_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Norton_HI_KILLER_Info()
{
    AI_Output (other, self ,"DIA_Norton_HI_KILLER_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Norton_HI_KILLER_03_02"); //A co œlepy jesteœ? Kobiet¹ Gomeza. Dajcie mi si³ê!
    AI_Output (self, other ,"DIA_Norton_HI_KILLER_03_03"); //Gadasz ze Stra¿nikiem I to œwietnym wiêc nie marnuj mojego czasu na takie pytania.
    AI_Output (self, other ,"DIA_Norton_HI_KILLER_03_04"); //Nie wiêm sk¹d siê przypl¹ta³eœ ale nabierz trochê og³ady œwierzaku.
    AI_Output (other, self ,"DIA_Norton_HI_KILLER_15_05"); //Co robi³eœ w czasach przed barier¹?
    AI_Output (self, other ,"DIA_Norton_HI_KILLER_03_06"); //Nic ci do tego. I nie mówiê co zrobi³em przed laty. A ju¿ na pewno nie tobie.
    AI_Output (self, other ,"DIA_Norton_HI_KILLER_03_07"); //Przestañ zawracaæ mi dupê. Najlepiej zabierz st¹d gnaty I przestañ mnie denerwowaæ.
};


/*
//========================================
//-----------------> OPCJA KRADZIE¯Y
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