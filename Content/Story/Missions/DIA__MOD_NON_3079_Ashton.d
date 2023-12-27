// *Script was make in Easy Dialog Maker (EDM)
/*
//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Ashton_HELLO1 (C_INFO)
{
   npc          = NON_3089_Ashton;
   nr           = 1;
   condition    = DIA_Ashton_HELLO1_Condition;
   information  = DIA_Ashton_HELLO1_Info;
   permanent	= FALSE;
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Ashton_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Ashton_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Ashton_HELLO1_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Ashton_HELLO1_03_02"); //Jestem Ashton, wojownik Innosa!
    AI_Output (self, other ,"DIA_Ashton_HELLO1_03_03"); //£owca Poszukiwaczy i innego plugastwa.
    AI_Output (self, other ,"DIA_Ashton_HELLO1_03_04"); //Niegdyœ by³em paladynem Innosa, ale dopuœci³em siê straszliwej zbrodni.
    AI_Output (self, other ,"DIA_Ashton_HELLO1_03_05"); //Przez to zosta³em tutaj wrzucony.
    AI_Output (self, other ,"DIA_Ashton_HELLO1_03_06"); //Ale nie upad³em. Bêdê dalej kontynuowa³ swoj¹ misjê - misjê oczyszczania.
    B_LogEntry                     (CH1_LowcyPoszukiwaczy,"Ashton by³ paladynem. Teraz jako ³owca Poszukiwaczy kontynuuje swoj¹ misjê. Mogê go znaleŸæ przy starej Cytadeli.");
};

//========================================
//-----------------> HELLO2
//========================================
var int AshtonTeach;
INSTANCE DIA_Ashton_HELLO2 (C_INFO)
{
   npc          = NON_3089_Ashton;
   nr           = 2;
   condition    = DIA_Ashton_HELLO2_Condition;
   information  = DIA_Ashton_HELLO2_Info;
   permanent	= FALSE;
   description	= "Mo¿esz mnie czegoœ nauczyæ?";
};

FUNC INT DIA_Ashton_HELLO2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Ashton_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Ashton_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Ashton_HELLO2_15_01"); //Mo¿esz mnie czegoœ nauczyæ?
    AI_Output (self, other ,"DIA_Ashton_HELLO2_03_02"); //Mogê nauczyæ ciê jak strzelaæ z kuszy.
	if (AshtonTeach == false)
	{
	Log_CreateTopic (GE_TeacherOW,LOG_NOTE);
	B_LogEntry		(GE_TeacherOW,"Ashton, ³owca Poszukiwaczy, nauczy mnie jak strzelaæ z kuszy.");
	AshtonTeach = true;
	};
    if (Wld_IsTime     (00,00,04,00))
    {
        AI_Output (self, other ,"DIA_Ashton_HELLO2_03_03"); //Mo¿emy zacz¹æ trening.
	Info_ClearChoices (DIA_Ashton_HELLO2);
	Info_Addchoice 	(DIA_Ashton_HELLO2,B_BuildLearnString(NAME_LearnCrossbow_1,	LPCOST_TALENT_CROSSBOW_1,200),AshtonCros1);
	Info_Addchoice 	(DIA_Ashton_HELLO2,DIALOG_BACK,Ashton_CROSSBOW_BACK);
    }
    else
    {
        AI_Output (self, other ,"DIA_Ashton_HELLO2_03_04"); //PrzyjdŸ wieczorem na nasze spotkanie. Teraz nie mam czasu.
    };
};
func void Ashton_CROSSBOW_BACK()
{
	Info_ClearChoices (DIA_Ashton_HELLO2);
};

func void AshtonCros1()
{
		if (B_GiveSkill(other,NPC_TALENT_CROSSBOW , 1, LPCOST_TALENT_CROSSBOW_1))
		{
			AI_Output (self, other,"Ashton_AshtonCros1_13_02"); //Dobra. Bierzmy siê do roboty.
			AI_Output (self, other,"Ashton_AshtonCros1_13_03"); //Z³ap kuszê mocno i oprzyj j¹ o ramiê. To powinno zwiêkszyæ celnoœæ strza³u.
			AI_Output (self, other,"Ashton_AshtonCros1_13_04"); //Przez kilka pierwszych dni twoje ramiê da ci siê nieŸle we znaki, ale z czasem przywykniesz.
			AI_Output (self, other,"Ashton_AshtonCros1_13_05"); //Po jakimœ tygodniu bêdziesz mia³ rêce ze stali!
			AI_Output (self, other,"Ashton_AshtonCros1_13_06"); //Wyceluj spokojnie i powoli œci¹gnij spust. Be³t niesie ze sob¹ wiêcej si³y ni¿ strza³a, dlatego powoduje wiêksze zniszczenia.
			//B_GiveInvItems (hero,other,ItMiNugget,200);
			DIA_Ashton_HELLO2.permanent = 0;
		};
};
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Ashton_EXIT(C_INFO)
{
	npc             = NON_3089_Ashton;
	nr              = 999;
	condition		= DIA_Ashton_EXIT_Condition;
	information		= DIA_Ashton_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Ashton_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Ashton_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
/*------------------------------------------------------------------------
							ARMBRUST TALENT2									
------------------------------------------------------------------------*/
/*
instance  Ashton_CROSSBOW2 (C_INFO)
{
	npc				= NON_3089_Ashton;
	condition		= Ashton_CROSSBOW2_Condition;
	information		= Ashton_CROSSBOW2_Info;
	important		= 0;
	permanent		= 1;
	description		= "Chcia³bym dowiedzieæ siê czegoœ wiêcej o strzelaniu z kuszy."; 
};

FUNC int  Ashton_CROSSBOW2_Condition()
{
	if (Npc_GetTalentSkill  (hero, NPC_TALENT_CROSSBOW) == 1) 
	{
		return TRUE;
	};

};
FUNC void  Ashton_CROSSBOW2_Info()
{
	AI_Output (other, self,"Ashton_CROSSBOW2_Info_15_01"); //Chcia³bym dowiedzieæ siê czegoœ wiêcej o strzelaniu z kuszy.
	AI_Output (self, other,"Ashton_CROSSBOW2_Info_13_02"); //To ciê bêdzie kosztowaæ 300 bry³ek rudy.
  
	Info_ClearChoices (Ashton_CROSSBOW2);
	Info_Addchoice 	(Ashton_CROSSBOW2,B_BuildLearnString(NAME_LearnCrossbow_2,	LPCOST_TALENT_CROSSBOW_2,300),Ashton_CROSSBOW2_OK);
	Info_Addchoice 	(Ashton_CROSSBOW2,DIALOG_BACK,  Ashton_CROSSBOW2_BACK);
	

};  
func void Ashton_CROSSBOW2_BACK()
{
	Info_ClearChoices (Ashton_CROSSBOW2);
};

func void Ashton_CROSSBOW2_OK()
{
	AI_Output (other, self,"Ashton_CROSSBOW2_OK_15_01"); //Zaczynajmy.
		if (B_GiveSkill(other,NPC_TALENT_CROSSBOW , 2, LPCOST_TALENT_CROSSBOW_2))
		{
		AI_Output (self, other,"Ashton_CROSSBOW2_OK_13_02"); //Dobra. Twoje strza³y bêd¹ celniejsze, jeœli przed œci¹gniêciem spustu ugniesz nieco nogi w kolanach.
		AI_Output (self, other,"Ashton_CROSSBOW2_OK_13_03"); //Naucz siê poprawnie oceniaæ prêdkoœæ z jak¹ porusza siê twój cel.
		AI_Output (self, other,"Ashton_CROSSBOW2_OK_13_04"); //Wystrzel pocisk tak, by w odpowiednim miejscu i czasie przeci¹³ œcie¿kê, któr¹ porusza siê cel.
		AI_Output (self, other,"Ashton_CROSSBOW2_OK_13_05"); //Jeœli atakujesz wiêcej ni¿ jeden cel, nie traæ czasu: musisz mo¿liwie szybko przygwoŸdziæ jeden za drugim dobrze wymierzonymi strza³ami.
		AI_Output (self, other,"Ashton_CROSSBOW2_OK_13_06"); //To by by³o na tyle.
		//B_GiveInvItems (hero,other,ItMiNugget,300);
		Ashton_CROSSBOW2.permanent = 0;
		};
};
//========================================
//-----------------> HELLO3
//========================================

INSTANCE DIA_Ashton_HELLO3 (C_INFO)
{
   npc          = NON_3089_Ashton ;
   nr           = 3;
   condition    = DIA_Ashton_HELLO3_Condition;
   information  = DIA_Ashton_HELLO3_Info;
   permanent	= FALSE;
   description	= "Jak walczysz z Poszukiwaczami?";
};

FUNC INT DIA_Ashton_HELLO3_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Ashton_HELLO1))
    && (Wld_IsTime     (00,00,04,00))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Ashton_HELLO3_Info()
{
    AI_Output (other, self ,"DIA_Ashton_HELLO3_15_01"); //Jak walczysz z Poszukiwaczami?
    AI_Output (self, other ,"DIA_Ashton_HELLO3_03_02"); //Atakujê przyczajony. Ostrzeliwujê ich z kuszy i uwa¿am na ich magiê.
    B_LogEntry                     (CH1_LowcyPoszukiwaczy,"Ashton atakuje przy u¿yciu kuszy. Trzyma siê na dystans i uwa¿a na magiê.");

    B_GiveXP (50);
};

//========================================
//-----------------> HELLO4
//========================================

INSTANCE DIA_Ashton_HELLO4 (C_INFO)
{
   npc          = NON_3089_Ashton;
   nr           = 4;
   condition    = DIA_Ashton_HELLO4_Condition;
   information  = DIA_Ashton_HELLO4_Info;
   permanent	= FALSE;
   description	= "Szukasz tu czegoœ?";
};

FUNC INT DIA_Ashton_HELLO4_Condition()
{
    if (Wld_IsTime (06,00,00,00))
    && (Npc_KnowsInfo (hero, DIA_Ashton_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Ashton_HELLO4_Info()
{
    AI_Output (other, self ,"DIA_Ashton_HELLO4_15_01"); //Szukasz tu czegoœ?
    AI_Output (self, other ,"DIA_Ashton_HELLO4_03_02"); //Tak w³aœciwie to ju¿ znalaz³em.
    AI_Output (self, other ,"DIA_Ashton_HELLO4_03_03"); //Przy tej Cytadeli znajduje siê o³tarz, na którym Poszukiwacze odprawiaj¹ dziwne obrzêdy.
    AI_Output (self, other ,"DIA_Ashton_HELLO4_03_04"); //Musimy siê go pozbyæ. ChodŸ za mn¹!
	Npc_ExchangeRoutine (NON_3089_Ashton,"bicz");
    MIS_Cytadelaposzukiwacz = LOG_RUNNING;
	Wld_InsertNpc				(NON_3081_Poszukiwacz,"OC1");	
	B_SetPermAttitude	(NON_3081_Poszukiwacz,	ATT_HOSTILE);
	NON_3081_Poszukiwacz.guild = GIL_MOLERAT;
	Wld_InsertNpc				(NON_3082_Poszukiwacz,"OC1");
	B_SetPermAttitude	(NON_3082_Poszukiwacz,	ATT_HOSTILE);
	NON_3082_Poszukiwacz.guild = GIL_MOLERAT;
	Wld_InsertNpc				(NON_3083_Poszukiwacz,"OC1");
	B_SetPermAttitude	(NON_3083_Poszukiwacz,	ATT_HOSTILE);
	NON_3083_Poszukiwacz.guild = GIL_MOLERAT;
	Wld_InsertNpc				(NON_3084_Poszukiwacz,"OC1");	
	B_SetPermAttitude	(NON_3084_Poszukiwacz,	ATT_HOSTILE);
	NON_3084_Poszukiwacz.guild = GIL_MOLERAT;
	Wld_InsertNpc				(NON_7067_Poszukiwacz,"OC1");
	B_SetPermAttitude	(NON_7067_Poszukiwacz,	ATT_HOSTILE);
	NON_7067_Poszukiwacz.guild = GIL_MOLERAT;
    Log_CreateTopic            (CH1_Cytadelaposzukiwacz, LOG_MISSION);
    Log_SetTopicStatus       (CH1_Cytadelaposzukiwacz, LOG_RUNNING);
    B_LogEntry                     (CH1_Cytadelaposzukiwacz,"Ashton odkry³ tajemniczy o³tarz Poszukiwaczy w pobli¿u starej Cytadeli. Musimy go zniszczyæ nim stanie siê coœ z³ego.");
    self.aivar[AIV_PARTYMEMBER] = TRUE;
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> KillAll
//========================================

INSTANCE DIA_Ashton_KillAll (C_INFO)
{
   npc          = NON_3089_Ashton;
   nr           = 1;
   condition    = DIA_Ashton_KillAll_Condition;
   information  = DIA_Ashton_KillAll_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Ashton_KillAll_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Ashton_HELLO4))
    && (Npc_IsDead(NON_3081_Poszukiwacz))
    && (Npc_IsDead(NON_3082_Poszukiwacz))
    && (Npc_IsDead(NON_3083_Poszukiwacz))
    && (Npc_IsDead(NON_3084_Poszukiwacz))
    && (Npc_IsDead(NON_7067_Poszukiwacz))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Ashton_KillAll_Info()
{
    AI_Output (self, other ,"DIA_Ashton_KillAll_03_01"); //Pozbyliœmy siê ich! 
    AI_Output (self, other ,"DIA_Ashton_KillAll_03_02"); //Œwietna robota!
    AI_Output (self, other ,"DIA_Ashton_KillAll_03_03"); //Je¿eli chcesz mo¿esz sprawdziæ jeszcze tê jaskiniê.
    AI_Output (self, other ,"DIA_Ashton_KillAll_03_04"); //Ja wracam szukaæ Czarnego Maga.
    B_LogEntry                     (CH1_Cytadelaposzukiwacz,"Wyeliminowaliœmy Poszukiwaczy odprawiaj¹cych rytua³y w pobli¿u starej Cytadeli.");
    Log_SetTopicStatus       (CH1_Cytadelaposzukiwacz, LOG_SUCCESS);
    MIS_Cytadelaposzukiwacz = LOG_SUCCESS;

    B_GiveXP (500);
    Npc_ExchangeRoutine (self,"START");
};
//========================================
//-----------------> Zbrodnia
//========================================

INSTANCE DIA_Ashton_Zbrodnia (C_INFO)
{
   npc          = NON_3089_Ashton;
   nr           = 1;
   condition    = DIA_Ashton_Zbrodnia_Condition;
   information  = DIA_Ashton_Zbrodnia_Info;
   permanent	= FALSE;
   description	= "Jakiej zbrodni siê dopuœci³eœ?";
};

FUNC INT DIA_Ashton_Zbrodnia_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Ashton_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Ashton_Zbrodnia_Info()
{
    AI_Output (other, self ,"DIA_Ashton_Zbrodnia_15_01"); //Jakiej zbrodni siê dopuœci³eœ?
    AI_Output (self, other ,"DIA_Ashton_Zbrodnia_03_02"); //Zabi³em jednego z Nowicjuszy Ognia. To by³ oszust. Przyby³ do Klasztoru tylko w poszukiwaniu ³atwego zarobku.
    AI_Output (self, other ,"DIA_Ashton_Zbrodnia_03_03"); //Zbezczeœci³ œwiête mury!
    AI_Output (other, self ,"DIA_Ashton_Zbrodnia_15_04"); //To haniebne, ale chyba nie zas³ugiwa³ na œmieræ. S¹ gorsi ludzie na tym œwiecie. 
    AI_Output (self, other ,"DIA_Ashton_Zbrodnia_03_05"); //Có¿... Teraz nie przywrócê mu ¿ycia.
};

//========================================
//-----------------> PosuzkiwaczeInfo
//========================================

INSTANCE DIA_Ashton_PosuzkiwaczeInfo (C_INFO)
{
   npc          = NON_3089_Ashton;
   nr           = 2;
   condition    = DIA_Ashton_PosuzkiwaczeInfo_Condition;
   information  = DIA_Ashton_PosuzkiwaczeInfo_Info;
   permanent	= FALSE;
   description	= "Wiesz coœ o Poszukiwaczach?";
};

FUNC INT DIA_Ashton_PosuzkiwaczeInfo_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Ashton_PosuzkiwaczeInfo_Info()
{
    AI_Output (other, self ,"DIA_Ashton_PosuzkiwaczeInfo_15_01"); //Wiesz coœ o Poszukiwaczach?
    AI_Output (self, other ,"DIA_Ashton_PosuzkiwaczeInfo_03_02"); //Z tego co s³ysza³em od Jefreya to s³u¿¹ Czarnemu Magowi. Nie wiem nawet kim jest ten mag. 
    AI_Output (other, self ,"DIA_Ashton_PosuzkiwaczeInfo_15_03"); //Jefrey dowiedzia³ siê tego ode mnie. Spotka³em siê ze s³ug¹ Czarnego Maga - niejakim Nidasem. 
    AI_Output (self, other ,"DIA_Ashton_PosuzkiwaczeInfo_03_04"); //Sam widzisz. Ledwo wiemy z czym walczymy. 
};

//========================================
//-----------------> POMOC
//========================================

INSTANCE DIA_Ashton_POMOC (C_INFO)
{
   npc          = NON_3089_Ashton;
   nr           = 1;
   condition    = DIA_Ashton_POMOC_Condition;
   information  = DIA_Ashton_POMOC_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Ashton_POMOC_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Avallach_Zabity))
    && (!Npc_KnowsInfo (hero, DIA_Avallach_Lekikurwa))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Ashton_POMOC_Info()
{
    AI_Output (self, other ,"DIA_Ashton_POMOC_03_01"); //Jasna cholera! Co siê tam dzieje?! Ha³asy s³ysza³em ju¿ z Cytadeli! 
    AI_Output (self, other ,"DIA_Ashton_POMOC_03_02"); //Pêdzi³em co si³ w nogach. Co siê sta³o?!
    AI_Output (other, self ,"DIA_Ashton_POMOC_15_03"); //Czarny Mag ukrywa siê w twierdzy! To pewne. Avallach zosta³ trafiony zatrut¹ strza³¹ i pilnie potrzebuje lekarstwa. Lester go os³ania.
    AI_Output (other, self ,"DIA_Ashton_POMOC_15_04"); //IdŸ szybko mu pomóc! Mamy ma³o czasu.
    B_LogEntry                     (CH1_WlakaZczarym,"Ashton przyby³ z Cytadeli. Pomo¿e w zamku. Tymczasem ja muszê siê pospieszyæ.");

    B_GiveXP (400);
    Npc_ExchangeRoutine (NON_3089_Ashton, "defAv");
    AI_StopProcessInfos	(self);
};
//========================================
//-----------------> SUKCES
//========================================

INSTANCE DIA_Ashton_SUKCES (C_INFO)
{
   npc          = NON_3089_Ashton;
   nr           = 1;
   condition    = DIA_Ashton_SUKCES_Condition;
   information  = DIA_Ashton_SUKCES_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Ashton_SUKCES_Condition()
{
    var C_NPC whodie0; 	whodie0 = Hlp_GetNpc(NON_3073_Czarny_Mag);
    if (Npc_KnowsInfo (hero, DIA_Ashton_POMOC))
    && (Npc_IsDead(whodie0)) && (Er_StoryBM_Run == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Ashton_SUKCES_Info()
{
    AI_Output (self, other ,"DIA_Ashton_SUKCES_03_01"); //Pokona³eœ go! Dobra robota, bracie! Wreszcie mo¿emy odetchn¹æ.
    AI_Output (other, self ,"DIA_Ashton_SUKCES_15_02"); //Niestety dla mnie to nie koniec pracy.
    AI_Output (self, other ,"DIA_Ashton_SUKCES_03_03"); //Wiem. Dlatego zanim odejdê, chcia³bym ci daæ ten miecz. Znalaz³em go w okolicy Cytadeli. 
    AI_Output (self, other ,"DIA_Ashton_SUKCES_03_04"); //To dobra broñ. Myœlê, ¿e bêdzie ci dobrze s³u¿yæ.
    CreateInvItems (self, Miecz2H1, 1);
    B_GiveInvItems (self, other, Miecz2H1, 1);
    AI_Output (self, other ,"DIA_Ashton_SUKCES_03_05"); //Je¿eli bêdziesz mnie kiedyœ szuka³, to bêdê w Nowym Obozie. Znajdê sobie jakieœ ciche miejsce.
    Npc_ExchangeRoutine (self, "camp");
	B_givexp (250);
    AI_StopProcessInfos	(self);
};


//========================================
//-----------------> AGAIN
//========================================

INSTANCE DIA_Ashton_AGAIN (C_INFO)
{
   npc          = NON_3089_Ashton;
   nr           = 1;
   condition    = DIA_Ashton_AGAIN_Condition;
   information  = DIA_Ashton_AGAIN_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Ashton_AGAIN_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Ashton_SUKCES))
    && (Npc_GetDistToWP (self, "NC_LO_11") < 3000)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Ashton_AGAIN_Info()
{
    AI_Output (self, other ,"DIA_Ashton_AGAIN_03_01"); //A wiêc znowu siê spotykamy! Wiedzia³em, ¿e tak siê stanie.
    AI_Output (other, self ,"DIA_Ashton_AGAIN_15_02"); //Widzê, ¿e zosta³eœ Najemnikiem. 
    AI_Output (self, other ,"DIA_Ashton_AGAIN_03_03"); //Tak, masz racjê. Wybra³em spokojne ¿ycie w Nowym Obozie. 
    AI_Output (self, other ,"DIA_Ashton_AGAIN_03_04"); //Zajmujê siê tu g³ównie stra¿¹ i wypatrywaniem zagro¿enia ze strony Starego Obozu.
    AI_Output (self, other ,"DIA_Ashton_AGAIN_03_05"); //Wprawdzie œpiê pod go³ym niebem, ale wielu mieszkañców Kolonii ma gorzej. Tym siê pocieszam i przy tej myœli zostanê.
    AI_Output (other, self ,"DIA_Ashton_AGAIN_15_06"); //Powodzenia.
};

//========================================
//-----------------> HELEOLLL
//========================================

INSTANCE DIA_Ashton_HELEOLLL (C_INFO)
{
   npc          = NON_3089_Ashton;
   nr           = 2;
   condition    = DIA_Ashton_HELEOLLL_Condition;
   information  = DIA_Ashton_HELEOLLL_Info;
   permanent	= TRUE;
   description	= "Jak leci?";
};

FUNC INT DIA_Ashton_HELEOLLL_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Ashton_AGAIN))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Ashton_HELEOLLL_Info()
{
    AI_Output (other, self ,"DIA_Ashton_HELEOLLL_15_01"); //Jak leci?
    AI_Output (self, other ,"DIA_Ashton_HELEOLLL_03_02"); //W porz¹dku. Nowy Obóz na razie jest bezpieczny.
};
*/
