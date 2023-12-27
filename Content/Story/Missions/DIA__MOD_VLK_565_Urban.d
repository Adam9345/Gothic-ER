//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Urban_EXIT(C_INFO)
{
	npc             = VLK_565_Buddler;
	nr              = 999;
	condition		= DIA_Urban_EXIT_Condition;
	information		= DIA_Urban_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Urban_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Urban_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Beer
//========================================
var int Urban_drunked;

INSTANCE DIA_Urban_Beer (C_INFO)
{
   npc          = VLK_565_Buddler;
   nr           = 1;
   condition    = DIA_Urban_Beer_Condition;
   information  = DIA_Urban_Beer_Info;
   permanent	= 1;
   description	= "Mo¿e napijesz siê ze mn¹ piwka?";
};

FUNC INT DIA_Urban_Beer_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Karczmarz_LookingForWorkers)) && MIS_ZmianaLorenza == LOG_RUNNING && (Urban_drunked == false)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Urban_Beer_Info()
{
    AI_Output (other, self ,"DIA_Urban_Beer_15_01"); //Mo¿e napijesz siê ze mn¹ piwka?
    AI_Output (self, other ,"DIA_Urban_Beer_03_02"); //A masz coœ? 
	if Npc_HasItems (other,itfobeer) >= 5
	{
	AI_Output (other, self ,"DIA_Urban_Beer_15_03"); //Trzymaj.
	AI_Output (self, other ,"DIA_Urban_Beer_03_04"); //A¿ piêæ butelek. Coœ ty taki szczodry? Czego chcesz?
	AI_Output (other, self ,"DIA_Urban_Beer_15_05"); //Po prostu chcia³em z kimœ pogadaæ. Wiesz, jestem nowy...
	B_Giveinvitems (other,self,itfobeer,5);
	AI_StandUp (self);
	AI_UseItem (self,itfobeer);
	AI_Output (self, other ,"DIA_Urban_Beer_03_06"); //A no to œwietnie! Mów, co tam s³ychaæ, albo pytaj o co chcesz. 
	Urban_drunked = true;
	Info_ClearChoices(DIA_Urban_Beer);
	if MIS_FightWithNaldur == LOG_SUCCESS
	{
	Info_AddChoice	 (DIA_Urban_Beer, "Ostatnio utar³em nosa Erensowi...",DIA_Urban_Beer_Erens);
	};
	if Snaf_Zutaten == LOG_SUCCESS
	{
	Info_AddChoice	 (DIA_Urban_Beer, "Snaf poprosi³ mnie o odnalezienie sk³adników.",DIA_Urban_Beer_Snaf);
	};
	Info_AddChoice	 (DIA_Urban_Beer, "Co myœlisz o Stra¿nikach?",DIA_Urban_Beer_Gardists);//nie wiem co tu daæ
	//Info_AddChoice	 (DIA_Urban_Beer, "£adna dziœ pogoda.",DIA_Urban_Beer_Weather);//nie wiem co tu daæ
	}
	else
	{
	Urban_drunked = false;
	AI_Output (other, self ,"DIA_Urban_Beer_15_07"); //Hmm...
	AI_Output (self, other ,"DIA_Urban_Beer_03_08"); //¯eby zaszumia³o to trzeba chocia¿ z piêæ butelek. Masz taki s³aby ³eb? Ja zawsze zaczynam od piêciu piwek. 
	B_LogEntry               (CH1_ZmianaLorenza,"¯eby upiæ Urbana potrzebujê piêæ butelek piwa. ");	
	};
};

func void DIA_Urban_Beer_Erens ()
{
	AI_Output (other, self ,"DIA_Urban_Beer_Erens_15_01"); //Ostatnio utar³em nosa Erensowi...
	AI_Output (self, other ,"DIA_Urban_Beer_Erens_03_02"); //Co ty powiesz? Opowiadaj!
	AI_UseItem (self,itfobeer);
	AI_Output (other, self ,"DIA_Urban_Beer_Erens_15_03"); //Przechodzi³em obok jego chaty, a on zaczepi³ mnie i zacz¹³ prowokowaæ do k³ótni. Zagrozi³em mu, a on zaproponowa³ mi zak³ad.
	AI_Output (self, other ,"DIA_Urban_Beer_Erens_03_04"); //Hip...Jaki zak³ad?
	AI_UseItem (self,itfobeer);
	AI_Output (other, self ,"DIA_Urban_Beer_Erens_15_05"); //Kaza³ mi walczyæ z Naldurem postawi³ na niego sto bry³ek rudy. Wygra³em walkê bez wiêkszych trudnoœci.
	AI_Output (self, other ,"DIA_Urban_Beer_Erens_03_06"); //Ha ha ha! Nale¿a³o im siê! Erens to stary cap, który wszystkich wkurza! Ha ha. (pijacki œmiech)
	AI_UseItem (self,itfobeer);
	AI_Output (self, other ,"DIA_Urban_Beer_Erens_03_07"); //Twoje zdrowie! Hip... Chcia³bym to... zobaczyæ...
	AI_Output (other, self ,"DIA_Urban_Beer_Erens_15_08"); //Mo¿e pójdziemy siê trochê z niego ponabijaæ?
	AI_Output (self, other ,"DIA_Urban_Beer_Erens_03_09"); //Dobry pomys³! Po piwkach mam ciêty dowcip! Cholera, szkoda, ¿e na zewn¹trz jest tak ciemno. Poprowadzisz?
	AI_Output (other, self ,"DIA_Urban_Beer_Erens_15_10"); //Jasne! Za mn¹.
	Mdl_ApplyOverlayMds	(self,"Humans_drunken.mds");
	Npc_ExchangeRoutine (self,"follow");
	AI_StopProcessInfos	(self);	
	UrbanIdzie = true;
};

func void DIA_Urban_Beer_Snaf ()
{
	AI_Output (other, self ,"DIA_Urban_Beer_Snaf_15_01"); //Snaf poprosi³ mnie o odnalezienie sk³adników.
	AI_Output (self, other ,"DIA_Urban_Beer_Snaf_03_02"); //Do potrawki z chrz¹szcza? Ha ha! Ten sukinsyn te¿ mnie o to prosi³.
	AI_UseItem (self,itfobeer);
	AI_Output (other, self ,"DIA_Urban_Beer_Snaf_15_03"); //Domyœlam siê, ¿e mu nie przynios³eœ, tak?
	AI_Output (self, other ,"DIA_Urban_Beer_Snaf_03_04"); //A idŸ mi z tym gównem. Ka¿demu nowemu zawraca tym g³owê. Grubas ruszy³by siê sam, a nie szuka³ g³upiego.
	AI_UseItem (self,itfobeer);
	AI_Output (self, other ,"DIA_Urban_Beer_Snaf_03_05"); //Zreszt¹ tego siê nie da jeœæ!
	AI_Output (other, self ,"DIA_Urban_Beer_Snaf_15_06"); //Czyli nie przepadasz za Snafem?
	AI_Output (self, other ,"DIA_Urban_Beer_Snaf_03_07"); //Nie cierpiê go! Kiedyœ poprosi³em go o porcjê roso³u, to powiedzia³, ¿ebym siê nie zbli¿a³ do kot³a. Co za gnida!
	AI_Output (self, other ,"DIA_Urban_Beer_Snaf_03_08"); //A¿ mam chêæ mu przywaliæ! ChodŸ, zaprowadzisz mnie, bo ma³o co widzê w tym mroku.
	Mdl_ApplyOverlayMds	(self,"Humans_drunken.mds");
	Npc_ExchangeRoutine (self,"follow");
	AI_StopProcessInfos	(self);	
	UrbanIdzie = true;
};

func void DIA_Urban_Beer_Gardists ()
{
	AI_Output (other, self ,"DIA_Urban_Beer_Lorenzo_15_01"); //Co myœlisz o Stra¿nikach?
	AI_Output (self, other ,"DIA_Urban_Beer_Lorenzo_03_02"); //To w wiêkszoœci szuje, które ¿eruj¹ na s³abszych. Jednak nie wszyscy. Niektórzy s¹ w porz¹dku i broni¹ mnie przed Manheimem. 
	AI_UseItem (self,itfobeer);
	AI_Output (self, other ,"DIA_Urban_Beer_Lorenzo_03_03"); //Powiem ci w sekrecie, ¿e ten typ chyba chce mnie wywaliæ z karczmy. Gdy sobie o tym hip... pomyœlê, to ogarnia mnie... hip... ¿al...
	AI_Output (self, other ,"DIA_Urban_Beer_Lorenzo_03_04"); //Muszê siê napiæ...
	AI_UseItem (self,itfobeer);
	AI_Output (other, self ,"DIA_Urban_Beer_Lorenzo_15_05"); //Powiem ci coœ: oni ciê oszukuj¹. Tak naprawdê ciê nie lubi¹. Mszcz¹ siê na Manheimie za to, ¿e ma pozwolenie na prowadzenie karczmy.
	AI_Output (self, other ,"DIA_Urban_Beer_Lorenzo_03_06"); //CO? A to fa³szywe... hip... gnidy! 
	AI_UseItem (self,itfobeer);
	AI_Output (self, other ,"DIA_Urban_Beer_Lorenzo_03_07"); //Mam chêæ obiæ któremuœ z nich mordê! Gdzieœ tu siê krêci³ Trip. Zaraz go... hip... rozwalê!
	AI_Output (other, self ,"DIA_Urban_Beer_Lorenzo_15_08"); //Nie, poczekaj! Ostatnio w Obozie pojawi³ siê nowy Stra¿nik. ChodŸ do niego!
	AI_Output (self, other ,"DIA_Urban_Beer_Lorenzo_03_09"); //Ha ha! Œwietny pomys³! ProwadŸ.
	Mdl_ApplyOverlayMds	(self,"Humans_drunken.mds");
	Npc_ExchangeRoutine (self,"follow");
	AI_StopProcessInfos	(self);
	UrbanIdzie = true;
};

//========================================
//-----------------> BITKA
//========================================

INSTANCE DIA_Urban_BITKA (C_INFO)
{
   npc          = VLK_565_Buddler;
   nr           = 1;
   condition    = DIA_Urban_BITKA_Condition;
   information  = DIA_Urban_BITKA_Info;
   permanent	= 0;
   important	= 1;
};

FUNC INT DIA_Urban_BITKA_Condition()
{
	if (kapitel == 10)//(Npc_GetDistToNpc (self,GRD_201_Jackal) < 1000) && MIS_ZmianaLorenza == LOG_RUNNING && UrbanIdzie == true
	{
    return TRUE;
	};
};

FUNC VOID DIA_Urban_BITKA_Info()
{
	AI_Output (self, other ,"DIA_Urban_BITKA_03_01"); //Ju¿ dotarliœmy? To ten sukinsyn? Dawaj, lejemy go!
	AI_StopProcessInfos (self);
	var c_npc Szakal;    	Szakal = Hlp_GetNpc(GRD_201_Jackal); 
    var c_npc Urban; 		Urban = Hlp_GetNpc(VLK_565_Buddler);
	Npc_SetTarget (Urban,Szakal);
    AI_StartState (Urban,ZS_ATTACK,1,"");
	Npc_SetTarget (Szakal,Urban);
    AI_StartState (Szakal,ZS_ATTACK,1,"");
	UrbanPobity = true;
	
};

//========================================
//-----------------> OHMYHEAD
//========================================

INSTANCE DIA_Urban_OHMYHEAD (C_INFO)
{
   npc          = VLK_565_Buddler;
   nr           = 1;
   condition    = DIA_Urban_OHMYHEAD_Condition;
   information  = DIA_Urban_OHMYHEAD_Info;
   permanent	= 0;
   important	= 1;
};

FUNC INT DIA_Urban_OHMYHEAD_Condition()
{
	if MIS_ZmianaLorenza == LOG_RUNNING && npc_knowsinfo (hero,DIA_Jackal_ANGRYMAN)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Urban_OHMYHEAD_Info()
{
	AI_Output (self, other ,"DIA_Urban_OHMYHEAD_03_01"); //Jasna cholera, moja g³owa... Co to siê sta³o?
	AI_Output (other, self ,"DIA_Urban_OHMYHEAD_15_02"); //Po pijaku wda³eœ siê w bójkê z Szakalem. Próbowa³em ciê powstrzymaæ i za³agodziæ sytuacjê. Dziêki mnie jeszcze ¿yjesz...
	AI_Output (self, other ,"DIA_Urban_OHMYHEAD_03_03"); //Jak to?
	AI_Output (other, self ,"DIA_Urban_OHMYHEAD_15_04"); //Szakal chcia³ ciê zabiæ na miejscu, ale poprosi³em go, ¿eby lepiej po prostu ciê ukara³. Niestety bêdziesz musia³ wróciæ do pracy w Kopalni.
	AI_Output (self, other ,"DIA_Urban_OHMYHEAD_03_05"); //Dziêki, stary. Naprawdê chyba czas coœ zmieniæ w swoim ¿yciu... I tak koñczy³a mi siê ju¿ ruda...
	AI_Output (other, self ,"DIA_Urban_OHMYHEAD_15_06"); //Spotykamy siê pod chat¹ Lorenzo. Wyruszymy, gdy tylko bêdzie gotowa kolejna zmiana. 
	
	B_LogEntry               (CH1_ZmianaLorenza,"Sprawa z Urbanem zosta³a ju¿ za³atwiona. Mamy siê spotkaæ przed chat¹ Lorenzo.");	
	B_GiveXP (100);
	Npc_ExchangeRoutine (self,"lorenzo");
	MDL_REMOVEOVERLAYMDS (self, "HUMANS_DRUNKEN.MDS");	
	AI_StopProcessInfos (self);
};