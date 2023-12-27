instance KDF_403_Drago_RUNE (C_INFO)
{
	npc				= KDF_403_Drago;
	condition		= KDF_403_Drago_RUNE_Condition;
	information		= KDF_403_Drago_RUNE_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  KDF_403_Drago_RUNE_Condition()
{	
	if (Npc_KnowsInfo (hero,KDF_402_Corristo_ROBE))
	{
		return TRUE;
	};
};
func void  KDF_403_Drago_RUNE_Info()
{
	AI_Output (self, other,"KDF_403_Drago_RUNE_Info_13_01"); //Przyjmij tę runę jako znak przychylności Innosa. Oby cię chroniła podczas marszu przez twą ścieżkę życia.
	CreateInvItem (self,ItArRuneFirebolt);
	B_GiveInvItems (self, other, ItArRuneFirebolt, 1);
	AI_StopProcessInfos	( self );
};
//------------------------------------------------------------------
//					    EXIT
//------------------------------------------------------------------
instance  KDF_403_Drago_Exit (C_INFO)
{
	npc			=  KDF_403_Drago;
	nr			=  999;
	condition	=  KDF_403_Drago_Exit_Condition;
	information	=  KDF_403_Drago_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  KDF_403_Drago_Exit_Condition()
{
	return TRUE;
};

FUNC VOID  KDF_403_Drago_Exit_Info()
{
	AI_StopProcessInfos	( self );
};
//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Drago_HELLO1 (C_INFO)
{
   npc          = KDF_403_Drago;
   nr           = 1;
   condition    = DIA_Drago_HELLO1_Condition;
   information  = DIA_Drago_HELLO1_Info;
   permanent	= FALSE;
   description	= "Kim jesteś?";
};

FUNC INT DIA_Drago_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Drago_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Drago_HELLO1_15_01"); //Kim jesteś?
    AI_Output (self, other ,"DIA_Drago_HELLO1_03_02"); //Nazywam się Drago, Mag z Kręgu Ognia. Jestem także znawcą magii oraz run.
    AI_Output (self, other ,"DIA_Drago_HELLO1_03_03"); //W dawnych czasach sam wyrabiałem runy na stole runicznym, jednak odkąd żyjemy otoczeni magiczną Barierą, nie muszę tego robić.
	AI_Output (self, other ,"DIA_Drago_HELLO1_03_04"); //Magiczne runy dostarczają nam z Zewnętrznego Świata, z Klasztoru Magów Ognia w Khorinis. 
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Drago_HELLO2 (C_INFO)
{
   npc          = KDF_403_Drago;
   nr           = 2;
   condition    = DIA_Drago_HELLO2_Condition;
   information  = DIA_Drago_HELLO2_Info;
   permanent	= FALSE;
   description	= "Możesz mnie czegoś nauczyć? ";
};

FUNC INT DIA_Drago_HELLO2_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Drago_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Drago_HELLO2_15_01"); //Możesz mnie czegoś nauczyć? 
    AI_Output (self, other ,"DIA_Drago_HELLO2_03_02"); //Nie, synu. Nie uważam, żeby w Kolonii zdolność wytwarzania run była niezbędna. 
	AI_Output (self, other ,"DIA_Drago_HELLO2_03_03"); //Jeśli chcesz nabyć runę magiczną, porozmawiaj z Torrezem, sprzedaje ich całe mnóstwo. 
};

//========================================
//-----------------> HELLO3
//========================================

INSTANCE DIA_Drago_HELLO3 (C_INFO)
{
   npc          = KDF_403_Drago;
   nr           = 3;
   condition    = DIA_Drago_HELLO3_Condition;
   information  = DIA_Drago_HELLO3_Info;
   permanent	= FALSE;
   description	= "Czy mogę ci w czymś pomóc?";
};

FUNC INT DIA_Drago_HELLO3_Condition()
{
    if (Npc_GetTrueGuild(other) == GIL_KDF) && (Kapitel < 3)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Drago_HELLO3_Info()
{
    AI_Output (other, self ,"DIA_Drago_HELLO3_15_01"); //Czy mogę ci w czymś pomóc?
    AI_Output (self, other ,"DIA_Drago_HELLO3_03_02"); //W rzeczy samej. Teraz, gdy wiemy, że służysz Inosowi możemy cię wtajemniczyć w nasze sprawy.
    AI_Output (self, other ,"DIA_Drago_HELLO3_03_03"); //Jak wiesz tu, w Górniczej Dolinie znajduje się obóz na bagnie. Rezydują tam wyznawcy Śniącego, boga którego natury nie możemy zgłębić.
    AI_Output (self, other ,"DIA_Drago_HELLO3_03_04"); //Istnieje tylko trzech bogów: Innos - Pan Ognia i Sprawiedliwości, Adanos - Pan Wód i Równowagi oraz Beliar - Władca Mroku i Zła. W świętej trójce nie ma miejsca dla czwartego boga.
    AI_Output (self, other ,"DIA_Drago_HELLO3_03_05"); //Nie rozumiem dlaczego, ale Guru dysponują magią nadaną im przez Śniącego, tak jakby rzeczywiście był bogiem. 
	AI_Output (self, other ,"DIA_Drago_HELLO3_03_06"); //Wcześniej nie zawracaliśmy sobie głowy wymysłami Sekty, lecz ostatnio w Starym Obozie pojawiło się znacznie więcej ich wysłanników.
    AI_Output (self, other ,"DIA_Drago_HELLO3_03_07"); //Poleciłem jednemu z naszych Cieni, aby spróbował się od nich dowiedzieć, co planują Guru. 
	AI_Output (self, other ,"DIA_Drago_HELLO3_03_08"); //Zdaje się, że przygotowują się do wielkiego przyzwania, w czasie którego Śniący ma im pokazać sposób na zniszczenie Bariery.
    AI_Output (self, other ,"DIA_Drago_HELLO3_03_09"); //Do tego wszystkiego dochodzi list od mistrza Pyrokara, który nam dostarczyłeś. Uważa on, że Bractwo niesie ze sobą ogromne zagrożenie dla losów całej Myrtany. 
	AI_Output (self, other ,"DIA_Drago_HELLO3_03_10"); //Ten fakt bardzo zaniepokoił mistrza Corristo i zlecił mi bardzo ważną misję.
    AI_Output (self, other ,"DIA_Drago_HELLO3_03_11"); //Mam dowiedzieć się wszystkiego o boskiej mocy, która napędza runy Bractwa. Tu właśnie mam dla ciebie ważkie zlecenie.
    AI_Output (self, other ,"DIA_Drago_HELLO3_03_12"); //Pójdziesz do obozu na bagnie i przyniesiesz mi trzy runy z zaklęciami Śniącego. Zaklęcia nazywają się: uderzenie wiatru, pirokineza i sen. 
	AI_Output (self, other ,"DIA_Drago_HELLO3_03_13"); //Spiesz się, musimy zdobyć te runy zanim odbędzie się przywołanie Śniącego.
    AI_Output (other, self ,"DIA_Drago_HELLO3_15_14"); //Czy jak spróbuje je wykraść, nie będzie to czyn hańbiący imię Innosa?
    AI_Output (self, other ,"DIA_Drago_HELLO3_03_15"); //Nie, mój synu. Robisz to ku chwale Innosa i w imię dobra, więc Pan Ognia przymknie oko na pochodzenie run. 
    AI_Output (self, other ,"DIA_Drago_HELLO3_03_16"); //Zatem ruszam w drogę. 
    MIS_NEW_GOD = LOG_RUNNING;

    Log_CreateTopic          (CH2_New_God, LOG_MISSION);
    Log_SetTopicStatus       (CH2_New_God, LOG_RUNNING);
    B_LogEntry               (CH2_New_God,"Drago, Mag Ognia ze Starego Obozu musi zbadać, kim naprawdę jest Śniący i skąd Guru biorą swoją moc. Aby pomóc mu w badaniach, muszę przynieść trzy runy: Uderzenie Wiatru, Sen i Pirokineza.");
    AI_StopProcessInfos	(self);
};
var int herocan_askaboutresarch_drago;
//========================================
//-----------------> RUNES_ALL_HEVE
//========================================

INSTANCE DIA_Drago_RUNES_ALL_HEVE (C_INFO)
{
   npc          = KDF_403_Drago;
   nr           = 1;
   condition    = DIA_Drago_RUNES_ALL_HEVE_Condition;
   information  = DIA_Drago_RUNES_ALL_HEVE_Info;
   permanent	= FALSE;
   description	= "Zdobyłem runy magii Śniącego, oto one.";
};

FUNC INT DIA_Drago_RUNES_ALL_HEVE_Condition()
{
    if (MIS_NEW_GOD == LOG_RUNNING)
    && (Npc_HasItems (other, ItArRuneSleep) >=1)
    && (Npc_HasItems (other, ItArRunePyrokinesis) >=1)
    && (Npc_HasItems (other, ItArRuneWindfist) >=1)
    && (kapitel < 3)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Drago_RUNES_ALL_HEVE_Info()
{
    AI_Output (other, self ,"DIA_Drago_RUNES_ALL_HEVE_15_01"); //Zdobyłem runy magii Śniącego, oto one.
    B_GiveInvItems (other, self, ItArRuneSleep, 1);
    B_GiveInvItems (other, self, ItArRuneWindfist, 1);
    B_GiveInvItems (other, self, ItArRunePyrokinesis, 1);
    AI_Output (self, other ,"DIA_Drago_RUNES_ALL_HEVE_03_02"); //Nareszcie zbadamy czym naprawdę jest Śniący. Natychmiast przystąpię do badań. Weź tą miksturę, przygotował ją nasz alchemik - Damarok. 
	AI_Output (self, other ,"DIA_Drago_RUNES_ALL_HEVE_03_03"); //Niech zwiększy ona twoje duchowe zdolności. Wróć do mnie za jakiś czas, gdy skończę moje badania.
    CreateInvItems (self, ItFo_Potion_Mana_Perma_01, 1);
    B_GiveInvItems (self, other, ItFo_Potion_Mana_Perma_01, 1);
    B_LogEntry                     (CH2_New_God,"Oddałem wszystkie trzy runy magowi Drago. W zamian otrzymałem potężna miksturę, oraz świadomość, że pomogłem Magom Ognia. Teraz muszę tylko czekać na wyniki badań.");
    
	herocan_askaboutresarch_drago = true;
    B_GiveXP (500);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> RUNES_RESEARCH_PROGRESS
//========================================

INSTANCE DIA_Drago_RUNES_RESEARCH_PROGRESS (C_INFO)
{
   npc          = KDF_403_Drago;
   nr           = 2;
   condition    = DIA_Drago_RUNES_RESEARCH_PROGRESS_Condition;
   information  = DIA_Drago_RUNES_RESEARCH_PROGRESS_Info;
   permanent	= true;
   description	= "I jak tam badania nad runami?";
};

FUNC INT DIA_Drago_RUNES_RESEARCH_PROGRESS_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Drago_RUNES_ALL_HEVE)) && (must_talk_corristo == false)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Drago_RUNES_RESEARCH_PROGRESS_Info()
{
    AI_Output (other, self ,"DIA_Drago_RUNES_RESEARCH_PROGRESS_15_01"); //I jak tam badania nad runami?
    if (kapitel < 3)
    {
        AI_Output (self, other ,"DIA_Drago_RUNES_RESEARCH_PROGRESS_03_02"); //Wróć później. Wciąż próbuję dowiedzieć się jaka siła je napędza. Niech Innos obdaruje się cierpliwością bracie.
    }
    else if (kapitel == 3) && (AngarTellHeroForCalom == TRUE)
    {
        AI_Output (self, other ,"DIA_Drago_RUNES_RESEARCH_PROGRESS_03_03"); //Udało mi się zgłębić naturę run magii Śniącego! Mistrz Pyrokar ma rację, Sekta jest poważnym zagrożeniem dla naszego świata.
        AI_Output (self, other ,"DIA_Drago_RUNES_RESEARCH_PROGRESS_03_04"); //Śniący okazał się być demonem z piekła rodem. Omamił on ludzi z Bractwa przedstawiając się jako wspaniały i miłosierny bóg, jednak w rzeczywistości jest wcieleniem samego Beliara.
        AI_Output (self, other ,"DIA_Drago_RUNES_RESEARCH_PROGRESS_03_05"); //Manipulował on Guru, którzy pozostali pod wpływem palonego przez nich bagiennego ziela. Chciał zostać uwolniony i przynieść na nas zagładę.
        AI_Output (other, self ,"DIA_Drago_RUNES_RESEARCH_PROGRESS_15_06"); //Wiem o tym. Wielkie przywołanie okazało się kompletną klapą, doprowadziło do śmierci Y"Beriona, duchowego przywódcy Bractwa. 
		AI_Output (other, self ,"DIA_Drago_RUNES_RESEARCH_PROGRESS_15_07"); //Przed śmiercią wielki mistrz zbudził się i obwieścił że Śniący nie jest tym, za co go uważają.
        AI_Output (other, self ,"DIA_Drago_RUNES_RESEARCH_PROGRESS_15_08"); //Tym samym wiara w Śniącego została porzucona przez Sektę, a nowym przywódcą został Cor Angar.
        AI_Output (self, other ,"DIA_Drago_RUNES_RESEARCH_PROGRESS_03_09"); //Jesteś pewny, że wszyscy porzucili wiarę w Śniącego?
        AI_Output (other, self ,"DIA_Drago_RUNES_RESEARCH_PROGRESS_15_10"); //Nie. Cor Kalom, zebrał oddział fanatycznych Strażników Świątynnych i opuścił obóz. Nie chciał uwierzyć w prawdziwą naturę Śniącego i postanowił odszukać go na własną rękę. 
        AI_Output (self, other ,"DIA_Drago_RUNES_RESEARCH_PROGRESS_03_11"); //O Innosie, powstrzymaj tego szaleńca. Pomów natychmiast z Corristo, musimy podjąć odpowiednie kroki.
        AI_Output (other, self ,"DIA_Drago_RUNES_RESEARCH_PROGRESS_15_12"); //W porządku.
		DIA_Drago_RUNES_RESEARCH_PROGRESS.permanent = false;
		B_LogEntry                     (CH2_New_God,"Drago powiedział mi dokładnie to samo, co już wiedziałem. Śniący to demon, który oszukał członków Bractwa. Muszę szybko porozmawiać z Corristo. To, co dzieje się na bagnach może wpłynąć na życie wszystkich ludzi pod Barierą.");
		must_talk_corristo = true;
		B_GiveXP (100);
    };
    AI_StopProcessInfos	(self);
};
