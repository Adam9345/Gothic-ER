//poprawione i sprawdzone - Reflide

// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Guy_Exit (C_INFO)
{
	npc			= Vlk_530_Guy;
	nr			= 999;
	condition	= DIA_Guy_Exit_Condition;
	information	= DIA_Guy_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Guy_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Guy_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Erstes Mal aufkreuzen
// **************************************************

INSTANCE DIA_Guy_Hello (C_INFO)
{
	npc				= Vlk_530_Guy;
	nr				= 2;
	condition		= DIA_Guy_Hello_Condition;
	information		= DIA_Guy_Hello_Info;
	permanent		= 0;
	description 	= "Witam!";
};

FUNC INT DIA_Guy_Hello_Condition()
{	
	if  (Kapitel < 4) 
	{
		return 1;
	};
};

FUNC VOID DIA_Guy_Hello_Info()
{
	AI_Output (other, self,"DIA_Guy_Hello_15_00"); //Witam!
	AI_Output (self, other,"DIA_Guy_Hello_03_01"); //Mhm? Nie widzia³em ciê jeszcze tutaj. Jesteœ nowy, prawda?
	AI_Output (other, self,"DIA_Guy_Hello_15_02"); //Tak, trafi³em tu niedawno...
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
	AI_Output (self, other,"DIA_Guy_Hello_03_03"); //Zdecydowa³eœ ju¿, do którego obozu do³¹czysz?
	AI_Output (other, self,"DIA_Guy_Hello_15_04"); //Nie. Masz dla mnie jakieœ sugestie?
	AI_Output (self, other,"DIA_Guy_Hello_03_05"); //Có¿, to zale¿y. Ka¿dy obóz ma swoje wady i zalety.
	AI_Output (self, other,"DIA_Guy_Hello_03_06"); //Dopóki nie podejmiesz decyzji, mo¿esz zostaæ tutaj. W³aœnie zwolni³a siê jedna chata.
	};
};

// **************************************************
// 				Advantages OC
// **************************************************

INSTANCE DIA_Guy_AdOC (C_INFO)
{
	npc				= Vlk_530_Guy;
	nr				= 2;
	condition		= DIA_Guy_AdOC_Condition;
	information		= DIA_Guy_AdOC_Info;
	permanent		= 0;
	description 	= "Jakie s¹ zalety Starego Obozu?";
};

FUNC INT DIA_Guy_AdOC_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Guy_Hello))
	&& (Kapitel < 4) && ((Npc_GetTrueGuild (other)==GIL_NONE) || (Npc_GetTrueGuild (other)==GIL_VLK) || (Npc_GetTrueGuild (other)==GIL_SFB))
	{
		return 1;
	};
};

FUNC VOID DIA_Guy_AdOC_Info()
{
	AI_Output (other, self,"DIA_Guy_AdOC_15_00"); //Jakie s¹ zalety Starego Obozu?
	AI_Output (self, other,"DIA_Guy_AdOC_03_01"); //Jeœli zap³acisz Stra¿nikom za ochronê, bêdziesz móg³ ¿yæ we wzglêdnym spokoju. Stra¿nicy pilnuj¹, ¿eby ich ludziom nie dzia³a siê krzywda.
	AI_Output (self, other,"DIA_Guy_AdOC_03_02"); //Poza tym, tylko tutaj dostaniesz towary z Zewnêtrznego Œwiata po przyzwoitych cenach. W innych obozach zap³acisz za nie fortunê!

	Info_ClearChoices(DIA_Guy_AdOC);
	Info_AddChoice	 (DIA_Guy_AdOC, "Chyba doœæ ju¿ us³ysza³em o Starym Obozie." ,DIA_Guy_AdOC_BACK);
	Info_AddChoice	 (DIA_Guy_AdOC, "Jakie towary s¹ tu szczególnie cenne?"			,DIA_Guy_AdOC_Warez);
	Info_AddChoice	 (DIA_Guy_AdOC, "A co, gdy walczy dwóch ludzi, którzy zap³acili za ochronê?"			,DIA_Guy_AdOC_Protection);
};	

func void DIA_Guy_AdOC_BACK()
{
	AI_Output (other, self,"DIA_Guy_AdOC_BACK_15_00"); //Chyba doœæ ju¿ us³ysza³em o Starym Obozie.
	AI_Output (self, other,"DIA_Guy_AdOC_BACK_03_01"); //Podoba mi siê tutaj.
	Info_ClearChoices(DIA_Guy_AdOC);
};

func void DIA_Guy_AdOC_Warez()
{
	AI_Output (other, self,"DIA_Guy_AdOC_Warez_15_00"); //Jakie towary s¹ tu szczególnie cenne?
	AI_Output (self, other,"DIA_Guy_AdOC_Warez_03_01"); //Wszystko, co pochodzi z Zewnêtrznego Œwiata: chleb, ser, boczek, ale przede wszystkim piwo i wino. W Kolonii wytwarza siê tylko tê paskudn¹ ry¿ówkê!
	AI_Output (self, other,"DIA_Guy_AdOC_Warez_03_02"); //Zawsze mo¿na zarobiæ na broni, a zbroje s¹ NIEZWYKLE kosztowne.
	AI_Output (self, other,"DIA_Guy_AdOC_Warez_03_03"); //Stra¿nicy zdjêli zbroje z zabitych królewskich rycerzy.
	AI_Output (self, other,"DIA_Guy_AdOC_Warez_03_04"); //Zreszt¹ ³atwo ich rozpoznaæ w³aœnie po ich zbroi - tylko Stra¿nicy mog¹ takie nosiæ.
};

func void DIA_Guy_AdOC_Protection()
{
	AI_Output (other, self,"DIA_Guy_AdOC_Protection_15_00"); //A co siê dzieje, gdy walczy dwóch ludzi, którzy zap³acili za ochronê?
	AI_Output (self, other,"DIA_Guy_AdOC_Protection_03_01"); //W takiej sytuacji Stra¿nicy po prostu siê przygl¹daj¹, czekaj¹c a¿ jeden z walcz¹cych zginie. Wtedy zabijaj¹ drugiego!
};

// **************************************************
// 				Advantages NewCamp
// **************************************************

INSTANCE DIA_Guy_AdNC (C_INFO)
{
	npc				= Vlk_530_Guy;
	nr				= 3;
	condition		= DIA_Guy_AdNC_Condition;
	information		= DIA_Guy_AdNC_Info;
	permanent		= 0;
	description 		= "Jakie s¹ zalety Nowego Obozu?";
};

FUNC INT DIA_Guy_AdNC_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Guy_Hello))
	&& (Kapitel < 4) && ((Npc_GetTrueGuild (other)==GIL_NONE) || (Npc_GetTrueGuild (other)==GIL_VLK) || (Npc_GetTrueGuild (other)==GIL_SFB))
	{
		return 1;
	};
};

FUNC VOID DIA_Guy_AdNC_Info()
{
	AI_Output (other, self,"DIA_Guy_AdNC_15_00"); //Jakie s¹ zalety Nowego Obozu?
	AI_Output (self, other,"DIA_Guy_AdNC_03_01"); //Jeœli nie masz nic przeciwko poder¿niêtemu gard³u, mo¿esz tam œmia³o iœæ.
	AI_Output (self, other,"DIA_Guy_AdNC_03_02"); //Nie, nie jest tam a¿ tak Ÿle, ale to zupe³nie inne osiedle.
	AI_Output (self, other,"DIA_Guy_AdNC_03_03"); //Tutaj o wzglêdny porz¹dek troszczy siê Gomez. W Nowym Obozie natomiast pojêcie porz¹dku nie istnieje.
	AI_Output (self, other,"DIA_Guy_AdNC_03_04"); //Jedyni ludzie, którzy maj¹ tam coœ do powiedzenia to Magowie Wody. Ale oni spêdzaj¹ ca³e dnie na badaniu Bariery.
};	

// **************************************************
// 				Advantages ST
// **************************************************

INSTANCE DIA_Guy_AdST (C_INFO)
{
	npc				= Vlk_530_Guy;
	nr				= 4;
	condition		= DIA_Guy_AdST_Condition;
	information		= DIA_Guy_AdST_Info;
	permanent		= 0;
	description 	= "A co przemawia za przy³¹czeniem siê do Sekty?";
};

FUNC INT DIA_Guy_AdST_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Guy_Hello))
	&& (Kapitel < 4) && ((Npc_GetTrueGuild (other)==GIL_NONE) || (Npc_GetTrueGuild (other)==GIL_VLK) || (Npc_GetTrueGuild (other)==GIL_SFB))
	{
		return 1;
	};
};

FUNC VOID DIA_Guy_AdST_Info()
{
	AI_Output (other, self,"DIA_Guy_AdST_15_00"); //A co przemawia za przy³¹czeniem siê do Sekty?
	AI_Output (self, other,"DIA_Guy_AdST_03_01"); //O to zapytaj ju¿ kogoœ z Obozu Bractwa.
	AI_Output (self, other,"DIA_Guy_AdST_03_02"); //Kilku ich Nowicjuszy zawsze krêci siê po obozie. Jestem pewien, ¿e udziel¹ ci wyczerpuj¹cych informacji.
	AI_Output (self, other,"DIA_Guy_AdST_03_03"); //Osobiœcie nigdy tam nie by³em, ale jeœli wierzyæ we wszystko, co o nich mówi¹, musz¹ byæ bardzo hojni.
	AI_Output (self, other,"DIA_Guy_AdST_03_04"); //Ze wszystkich trzech osiedli chyba naj³atwiej zostaæ cz³onkiem obozu na bagnie.
};

//========================================
//-- Advantages BD
//========================================

INSTANCE DIA_Guy_AdBD (C_INFO)
{
   npc          = Vlk_530_Guy;
   nr           = 1;
   condition    = DIA_Guy_AdBD_Condition;
   information  = DIA_Guy_AdBD_Info;
   permanent	= FALSE;
   description	= "A co mo¿esz mi powiedzieæ o Bandytach?";
};

FUNC INT DIA_Guy_AdBD_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Guy_Hello))
    && (kapitel < 4) && ((Npc_GetTrueGuild (other)==GIL_NONE) || (Npc_GetTrueGuild (other)==GIL_VLK) || (Npc_GetTrueGuild (other)==GIL_SFB))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Guy_AdBD_Info()
{
    AI_Output (other, self ,"DIA_Guy_AdBD_15_01"); //A co mo¿esz mi powiedzieæ o Bandytach?
    AI_Output (self, other ,"DIA_Guy_AdBD_03_02"); //W³aœciwie niezbyt wiele. Wiem tylko tyle, ¿e mieszkaj¹ w górach i prowadz¹ ma³¹ wojnê ze Starym Obozem.
    AI_Output (self, other ,"DIA_Guy_AdBD_03_03"); //Nie mam pojêcia, kto do nich nale¿y, ani gdzie mo¿esz spotkaæ któregoœ z nich. Wiem jednak, ¿e s¹ to twarde skurczybyki, które nie lêkaj¹ siê niczego.
    AI_Output (self, other ,"DIA_Guy_AdBD_03_04"); //Jeœli chcesz do nich do³¹czyæ, to nie mów o tym nikomu w Starym Obozie. Za coœ takiego skoñczysz w lochu. 
    AI_Output (other, self ,"DIA_Guy_AdBD_15_05"); //Lepiej uwa¿aæ. Dziêki. 
};

//========================================
//-----------------> OtherCamps
//========================================

INSTANCE DIA_Guy_OtherCamps (C_INFO)
{
   npc          = Vlk_530_Guy;
   nr           = 2;
   condition    = DIA_Guy_OtherCamps_Condition;
   information  = DIA_Guy_OtherCamps_Info;
   permanent	= FALSE;
   description	= "Czy w Kolonii s¹ jeszcze inne obozy?";
};

FUNC INT DIA_Guy_OtherCamps_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Guy_Hello))
    && (kapitel < 4) && ((Npc_GetTrueGuild (other)==GIL_NONE) || (Npc_GetTrueGuild (other)==GIL_VLK) || (Npc_GetTrueGuild (other)==GIL_SFB))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Guy_OtherCamps_Info()
{
    AI_Output (other, self ,"DIA_Guy_OtherCamps_15_01"); //Czy w Kolonii s¹ jeszcze inne obozy?
    AI_Output (self, other ,"DIA_Guy_OtherCamps_03_02"); //W rzeczy samej s¹. Jednak nie tak potê¿ne, i jeœli do nich do³¹czysz, nie bêdziesz mia³ w³aœciwie ¿adnych przywilejów. 
    AI_Output (self, other ,"DIA_Guy_OtherCamps_03_03"); //Najbli¿ej od Starego Obozu znajduje siê obóz myœliwych. Jego cz³onkowie zajmuj¹ siê polowaniem oraz handlem z innymi obozami. 
    AI_Output (self, other ,"DIA_Guy_OtherCamps_03_04"); //Ich obóz znajdziesz pomiêdzy dwoma wa¿nymi szlakami - obok szlaku ze Starego Obozu do Starej Kopalni, oraz drogi do Nowego Obozu.
    AI_Output (self, other ,"DIA_Guy_OtherCamps_03_05"); //Ka¿dy obcy mo¿e u nich pracowaæ. Ponoæ dobrze p³ac¹ i oferuj¹ niez³e pancerze na sprzeda¿.
    AI_Output (other, self ,"DIA_Guy_OtherCamps_15_06"); //A to ciekawe. Przyda³by mi siê porz¹dny pancerz.
    AI_Output (self, other ,"DIA_Guy_OtherCamps_03_07"); //Innym obozem o którym mi wiadomo jest obóz ³owców orków.
    AI_Output (self, other ,"DIA_Guy_OtherCamps_03_08"); //Zdaje siê, ¿e mieszkaj¹ gdzieœ na terenach orków i trudni¹ siê polowaniem na nich. Jak chcesz obracaæ siê w towarzystwie twardzieli, powinieneœ do nich zajrzeæ. 
    AI_Output (self, other ,"DIA_Guy_OtherCamps_03_09"); //Poza tym w Kolonii s¹ jeszcze dwa obozy nale¿¹ce do Starego i Nowego Obozu.
    AI_Output (self, other ,"DIA_Guy_OtherCamps_03_10"); //Obóz myœliwych-najemników gdzieœ w okolicach Wolnej Kopalni oraz obóz przed Star¹ Kopalni¹.
    AI_Output (self, other ,"DIA_Guy_OtherCamps_03_11"); //Nie wiem o nich zbyt wiele, ale jeœli chcesz z nimi trzymaæ, musisz byæ albo cz³onkiem Starego, albo Nowego Obozu. 
    AI_Output (other, self ,"DIA_Guy_OtherCamps_15_12"); //Dziêki za informacje.
};



// **************************************************
// 				Welche Hütte ist meine
// **************************************************

INSTANCE DIA_Guy_MyOwnHut (C_INFO)
{
	npc				= Vlk_530_Guy;
	nr				= 10;
	condition		= DIA_Guy_MyOwnHut_Condition;
	information		= DIA_Guy_MyOwnHut_Info;
	permanent		= 0;
	description 	= "Któr¹ chatê mogê zaj¹æ?";
};

FUNC INT DIA_Guy_MyOwnHut_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Guy_Hello))
	&& (Kapitel < 4)
	{
		return 1;
	};
};

FUNC VOID DIA_Guy_MyOwnHut_Info()
{
	AI_Output (other, self,"DIA_Guy_MyOwnHut_15_00"); //Któr¹ chatê mogê zaj¹æ?
	AI_PointAt(self, "OCR_HUT_26");
	AI_Output (self, other,"DIA_Guy_MyOwnHut_03_01"); //Tamt¹, z niewielkim baldachimem.
	B_GiveInvItems (self,other, ITKE_ER_GUYHOUSE, 1);
	guysay_about_hut = true;
	AI_StopPointAt(self);
};	

//========================================
//-----------------> Ucieczka
//========================================

INSTANCE DIA_Guy_Ucieczka (C_INFO)
{
   npc          = VLK_530_Guy;
   nr           = 1;
   condition    = DIA_Guy_Ucieczka_Condition;
   information  = DIA_Guy_Ucieczka_Info;
   permanent	= FALSE;
   description	= "Co tu robisz?";
};

FUNC INT DIA_Guy_Ucieczka_Condition()
{
    if (Kapitel >= 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Guy_Ucieczka_Info()
{
    AI_Output (other, self ,"DIA_Guy_Ucieczka_15_01"); //Co tu robisz?
    AI_Output (self, other ,"DIA_Guy_Ucieczka_03_02"); //Uciek³em ze Starego Obozu. 
    AI_Output (self, other ,"DIA_Guy_Ucieczka_03_03"); //Gomez traci poparcie. Tyle ci powiem.
    AI_Output (self, other ,"DIA_Guy_Ucieczka_03_04"); //Zosta³o przy nim tylko kilku Stra¿ników, których wys³a³ na œmieræ.
    AI_Output (self, other ,"DIA_Guy_Ucieczka_03_05"); //Powiem wiêcej.
    AI_Output (self, other ,"DIA_Guy_Ucieczka_03_06"); //Nawet Kruk uciek³. Wzi¹³ ze sob¹ Thorusa, Dextera i kilku Kopaczy. Bloodwyn wkróce ma do nich do³¹czyæ.
    AI_Output (other, self ,"DIA_Guy_Ucieczka_15_07"); //Gdzie mogli uciec?
    AI_Output (self, other ,"DIA_Guy_Ucieczka_03_08"); //Nie wiem. Pewnie ukryli siê gdzieœ i czekaj¹, a¿ to wszystko siê skoñczy.
    AI_Output (other, self ,"DIA_Guy_Ucieczka_15_09"); //Co masz na myœli?
    AI_Output (self, other ,"DIA_Guy_Ucieczka_03_10"); //Ostatnimi czasy wszystko tak siê skomplikowa³o, ¿e w koñcu coœ bêdzie musia³o pêkn¹æ.
    AI_Output (other, self ,"DIA_Guy_Ucieczka_15_11"); //W¹tpiê, ¿eby Bariera opad³a.
    AI_Output (self, other ,"DIA_Guy_Ucieczka_03_12"); //Ja te¿. No, ale przecie¿ nie skoczê z klifu z tego powodu.
    AI_Output (self, other ,"DIA_Guy_Ucieczka_03_13"); //Chêtnie wróci³bym do kopalni i do mojego spokojnego ¿ycia.
};

//========================================
//-----------------> backToMine
//========================================

INSTANCE DIA_Guy_backToMine (C_INFO)
{
   npc          = VLK_530_Guy;
   nr           = 2;
   condition    = DIA_Guy_backToMine_Condition;
   information  = DIA_Guy_backToMine_Info;
   permanent	= FALSE;
   description	= "Chcesz wróciæ do kopalni?";
};

FUNC INT DIA_Guy_backToMine_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Guy_Ucieczka))
    && (MIS_NewEnginer == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Guy_backToMine_Info()
{
    AI_Output (other, self ,"DIA_Guy_backToMine_15_01"); //Chcesz wróciæ do kopalni?
    AI_Output (self, other ,"DIA_Guy_backToMine_03_02"); //Oczywiœcie.
    AI_Output (other, self ,"DIA_Guy_backToMine_15_03"); //Mo¿e w takim razie przy³¹czysz siê do Bandytów?
    AI_Output (other, self ,"DIA_Guy_backToMine_15_04"); //Przejêliœmy Opuszczon¹ Kopalniê i wznowiliœmy wydobycie. 
    AI_Output (self, other ,"DIA_Guy_backToMine_03_05"); //Nie ma mowy! Nie chcê zostaæ rozszarpany przez jakieœ œcierwo!
    AI_Output (other, self ,"DIA_Guy_backToMine_15_06"); //Kopalnia jest ju¿ czysta.
    AI_Output (other, self ,"DIA_Guy_backToMine_15_07"); //Zaj¹³em siê tym.
    AI_Output (self, other ,"DIA_Guy_backToMine_03_08"); //Doprawdy?
    AI_Output (self, other ,"DIA_Guy_backToMine_03_09"); //W takim razie wyruszê w najbli¿szym czasie.
    B_LogEntry                     (CH4_NewEnginer,"Guy z chêci¹ wróci do pracy. Mogê powiedzieæ Quentinowi, ¿e ma nowego robotnika.");
    B_GiveXP (100);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> backToMine
//========================================

INSTANCE DIA_Guy_SpierdalajOd_Gilberta (C_INFO)
{
   npc          = VLK_530_Guy;
   nr           = 2;
   condition    = DIA_Guy_SpierdalajOd_Gilberta_Condition;
   information  = DIA_Guy_SpierdalajOd_Gilberta_Info;
   permanent	= FALSE;
   description	= "Zostaw Gilberta w spokoju!";
};

FUNC INT DIA_Guy_SpierdalajOd_Gilberta_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Gilbert_Gaston))
  
    {
    return TRUE;
    };
};


FUNC VOID DIA_Guy_SpierdalajOd_Gilberta_Info()
{
    AI_Output (other, self ,"DIA_Guy_SpierdalajOd_Gilberta_15_01"); //Zostaw Gilberta w spokoju!
    AI_Output (self, other ,"DIA_Guy_SpierdalajOd_Gilberta_03_02"); //Hehe. Nie ma mowy. 
    AI_Output (self, other ,"DIA_Guy_SpierdalajOd_Gilberta_03_03"); //Nie stracê, kury znosz¹cej z³ote jaja.
    AI_Output (other, self ,"DIA_Guy_SpierdalajOd_Gilberta_15_04"); //Jak chcesz, ale stracisz w³asne.	
	AI_EquipBestMeleeWeapon	(other);
	AI_ReadyMeleeWeapon		(other);
    AI_Output (self, other ,"DIA_Guy_SpierdalajOd_Gilberta_03_05"); //Heeej! Mam op³acon¹ ochronê u stra¿ników. Zabij¹ ciê jeœli mnie tkniesz.
  	Info_ClearChoices	(DIA_Guy_SpierdalajOd_Gilberta);
	Info_AddChoice		(DIA_Guy_SpierdalajOd_Gilberta, "Ju¿ z nimi rozmawia³em. (sk³am)", DIA_Guy_Straz_Gilbert);
};

FUNC VOID DIA_Guy_Straz_Gilbert()
{
    AI_Output (other, self ,"DIA_Guy_Straz_Gilbert_15_01"); //Ju¿ z nimi rozmawia³em. (sk³am)
    AI_Output (self, other ,"DIA_Guy_Straz_Gilbert_03_02"); //Jak to? 
    AI_Output (other, self ,"DIA_Guy_Straz_Gilbert_15_03"); //Nie kiwn¹ nawet palcem.
    AI_Output (self, other ,"DIA_Guy_Straz_Gilbert_03_04"); //Cholera. To zmienia postaæ rzeczy.
    AI_Output (other, self ,"DIA_Guy_Straz_Gilbert_15_05"); //Jak widaæ.
    AI_Output (self, other ,"DIA_Guy_Straz_Gilbert_03_06"); //Zap³aæ mi 100 bry³ek rudy i obiecuje daæ mu spokój.
    B_LogEntry               (PSI_Zdrajca,"Ok³ama³em Guya mówi¹c, ¿e stra¿nicy nie udziel¹ mu pomocy w razie gdy bêdzie mia³ dostaæ odemnie solidny ³omot. Teraz ¿¹da 100 bry³ek rudy a wówczas zostawi Gilberta w spokoju.");

    ZdrajcaGhaston = TRUE;
};


//========================================
//-----------------> backToMine
//========================================

INSTANCE DIA_Guy_Nugget_FGilbert (C_INFO)
{
   npc          = VLK_530_Guy;
   nr           = 2;
   condition    = DIA_Guy_Nugget_FGilbert_Condition;
   information  = DIA_Guy_Nugget_FGilbert_Info;
   permanent	= FALSE;
   description	= "Trzymaj rudê.";
};

FUNC INT DIA_Guy_Nugget_FGilbert_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Guy_SpierdalajOd_Gilberta))
    && (ZdrajcaGhaston == TRUE)
	&& (Npc_HasItems (other, itminugget) >=100)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Guy_Nugget_FGilbert_Info()
{
    AI_Output (other, self ,"DIA_Guy_Nugget_FGilbert_15_01"); //Trzymaj te rudê.
    AI_Output (self, other ,"DIA_Guy_Nugget_FGilbert_03_02"); //Dziêki. 
    AI_Output (other, self ,"DIA_Guy_Nugget_FGilbert_15_03"); //Teraz zostaw Gilberta w spokoju.
    AI_Output (self, other ,"DIA_Guy_Nugget_FGilbert_03_04"); //Kogo? Kto to Gilbert?
    AI_Output (other, self ,"DIA_Guy_Nugget_FGilbert_15_05"); //No! Dok³adnie to chcia³em us³yszeæ.
    B_LogEntry               (PSI_Zdrajca,"Zap³aci³em Guyowi 100 bry³ek rudy. Teraz ma daæ spokój Gilbertowi i lepiej ¿eby dotrzyma³ s³owa. Pora do niego wróciæ.");

    B_GiveInvItems (other,self, itminugget, 100);
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Zjawa
//========================================

INSTANCE DIA_Guy_Zjawa (C_INFO)
{
   npc          = Vlk_530_Guy;
   nr           = 1;
   condition    = DIA_Guy_Zjawa_Condition;
   information  = DIA_Guy_Zjawa_Info;
   permanent	= FALSE;
   description	= "Ponoæ widzia³eœ jakiegoœ ducha.";
};

FUNC INT DIA_Guy_Zjawa_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Gravo_Zjawa))
{
    return TRUE;
};
};
FUNC VOID DIA_Guy_Zjawa_Info()
{
    AI_Output (other, self ,"DIA_Guy_Zjawa_15_01"); //Ponoæ widzia³eœ jakiegoœ ducha.
    AI_Output (self, other ,"DIA_Guy_Zjawa_03_02"); //JAKIEGOŒ?! Mówiê ci ch³opiê, ¿e to by³a najstraszniejsza rzecz jak¹ w ¿yciu widzia³em.
    AI_Output (self, other ,"DIA_Guy_Zjawa_03_03"); //Do tej pory ciarki mi przechodz¹ po plecach.
    AI_Output (other, self ,"DIA_Guy_Zjawa_15_04"); //Wygl¹dasz na cz³owieka, który nie k³amie... przynajmniej w tej kwestii. 
    AI_Output (self, other ,"DIA_Guy_Zjawa_03_05"); //To prawda!
    AI_Output (other, self ,"DIA_Guy_Zjawa_15_06"); //Zauwa¿y³eœ jeszcze coœ podejrzanego?
    AI_Output (self, other ,"DIA_Guy_Zjawa_03_07"); //Chyba nie. Wszyscy kopacze s¹ zaniepokojeni. Cienie i zw³aszcza Stra¿nicy nie wierz¹ w to wszystko. 
    AI_Output (self, other ,"DIA_Guy_Zjawa_03_08"); //Jak, któryœ zobaczy to co ja widzia³em bêdzie mia³ pe³ne portki.
    AI_Output (self, other ,"DIA_Guy_Zjawa_03_09"); //Zaraz... Jeszcze tylko to, ¿e kumpel opowiada³ mi o dziwnym zachowaniu Grima. Zamiast siê po prostu baæ ten zachowuje siê jak z³odziej przy³apany na kradzie¿y.
    AI_Output (self, other ,"DIA_Guy_Zjawa_03_10"); //Mo¿e kogoœ okrad³...
    AI_Output (other, self ,"DIA_Guy_Zjawa_15_11"); //Dziêki za informacje.
    AI_Output (self, other ,"DIA_Guy_Zjawa_03_12"); //Chcia³bym ¿eby to ju¿ siê skoñczy³o.
    AI_Output (other, self ,"DIA_Guy_Zjawa_15_13"); //Mo¿e twoje modlitwy zostan¹ wys³uchane.
    AI_Output (other, self ,"DIA_Guy_Zjawa_15_14"); //Do zobaczenia.
    AI_Output (self, other ,"DIA_Guy_Zjawa_03_15"); //Na razie i uwa¿aj na tego ducha!
	B_LogEntry               (Zjawa,"Guyowi rzuci³o siê w oczy podejrzane zachowanie Grima. Wydaje siê i¿ ma on co nieco za uszami. Muszê z niego wydusiæ co dok³adnie.");
};

instance dia_guy_pickpocket(c_info) {
    npc = vlk_530_guy;
    nr = 900;
    condition = dia_guy_pickpocket_condition;
    information = dia_guy_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_guy_pickpocket_condition() {
	e_beklauen(baseThfChanceVLK, 20);
};

func void dia_guy_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_guy_pickpocket);
	info_addchoice(dia_guy_pickpocket, dialog_back, dia_guy_pickpocket_back);
	info_addchoice(dia_guy_pickpocket, dialog_pickpocket, dia_guy_pickpocket_doit);
};

func void dia_guy_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_guy_pickpocket);
};

func void dia_guy_pickpocket_back() {
    info_clearchoices(dia_guy_pickpocket);
};
