//poprawione i sprawdzone -  

/*------------------------------------------------------------------------
//							EXIT									//
------------------------------------------------------------------------*/

instance  Org_873_Cipher_Exit (C_INFO)
{
	npc			=  Org_873_Cipher;
	nr			=  999;
	condition	=  Org_873_Cipher_Exit_Condition;
	information	=  Org_873_Cipher_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description =  DIALOG_ENDE;
};                       

FUNC int  Org_873_Cipher_Exit_Condition()
{
	return TRUE;
};

FUNC VOID  Org_873_Cipher_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// ******************************
// 			Hallo
// ******************************

instance  Org_873_Cipher_Hello (C_INFO)
{
	npc			=  Org_873_Cipher;
	nr			=  1;
	condition	=  Org_873_Cipher_Hello_Condition;
	information	=  Org_873_Cipher_Hello_Info;
	permanent	=  0;
	description = "Co s³ychaæ?";
};                       

FUNC int  Org_873_Cipher_Hello_Condition()
{
	//if (Balor_TellsNCDealer == TRUE)
	//{
		return 1;
	//};
};

FUNC VOID  Org_873_Cipher_Hello_Info()
{
	AI_Output (other, self,"DIA_Cipher_Hello_15_00"); //Co s³ychaæ?
	AI_Output (self, other,"DIA_Cipher_Hello_12_01"); //Nasypaliœmy trochê piasku w machinê Gomeza.
	AI_Output (self, other,"DIA_Cipher_Hello_12_02"); //Trzech zabitych Stra¿ników i mnóstwo towaru na sprzeda¿. Trzeba to opiæ!
	AI_Output (other, self,"DIA_Cipher_Hello_15_03"); //Jesteœ jednym z ludzi, którzy bez przerwy napadaj¹ Stary Obóz?
	AI_Output (self, other,"DIA_Cipher_Hello_12_04"); //Nie. Napadamy go tylko wtedy, kiedy siê to op³aca.
};

// ******************************
// 			Fisk
// ******************************

instance  Org_873_Cipher_Fisk (C_INFO)
{
	npc			=  Org_873_Cipher;
	nr			=  1;
	condition	=  Org_873_Cipher_Fisk_Condition;
	information	=  Org_873_Cipher_Fisk_Info;
	permanent	=  1;
	description = "Fisk ze Starego Obozu szuka nowego partnera do interesów.";
};                       

FUNC int  Org_873_Cipher_Fisk_Condition()
{
	if (Fisk_GetNewHehler==LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID  Org_873_Cipher_Fisk_Info()
{
	AI_Output (other, self,"DIA_Cipher_Fisk_15_00"); //Fisk ze Starego Obozu szuka nowego partnera do interesów.
	AI_Output (self, other,"DIA_Cipher_Fisk_12_01"); //Nie jestem zainteresowany.
	AI_Output (self, other,"DIA_Cipher_Fisk_12_02"); //Ale powinieneœ porozmawiaæ z Sharkym. Mo¿e on na to pójdzie.
};

// ******************************
// 			Balor sent Me
// ******************************
	var int Cipher_Trade;
// ******************************

instance  Org_873_Cipher_FromBalor (C_INFO)
{
	npc			=  Org_873_Cipher;
	nr			=  1;
	condition	=  Org_873_Cipher_FromBalor_Condition;
	information	=  Org_873_Cipher_FromBalor_Info;
	permanent	=  1;
	description = "Co masz do zaoferowania?";
};                       

FUNC int  Org_873_Cipher_FromBalor_Condition()
{
	if ( Npc_KnowsInfo(hero,Org_873_Cipher_Hello))
	{
		return 1;
	};
};

FUNC VOID  Org_873_Cipher_FromBalor_Info()
{
	AI_Output (other, self,"DIA_Cipher_FromBalor_15_00"); //Co masz do zaoferowania?
	AI_Output (self, other,"DIA_Cipher_FromBalor_12_01"); //Nie, nie! Pytanie brzmi: co TY masz do zaoferowania! Interesuj¹ mnie wy³¹cznie powa¿ne dostawy.
	if (Balor_TellsNCDealer == TRUE)
	{
		AI_Output (other, self,"DIA_Cipher_FromBalor_15_02"); //Balor powiedzia³ mi, ¿e interesuje ciê bagienne ziele.
		AI_Output (self, other,"DIA_Cipher_FromBalor_12_03"); //Mhm. Masz coœ na sprzeda¿?
		Cipher_Trade = TRUE;
	}
	else
	{
		AI_Output (other, self,"DIA_Cipher_FromBalor_15_04"); //Niestety nie.
		AI_Output (self, other,"DIA_Cipher_FromBalor_12_05"); //Wiêc wróæ do mnie, jak bêdziesz mia³ coœ co mnie zainteresuje.
	};
};

// ******************************
// 			TRADE
// ******************************

instance  Org_873_Cipher_TRADE (C_INFO)
{
	npc			=  Org_873_Cipher;
	nr			=  1;
	condition	=  Org_873_Cipher_TRADE_Condition;
	information	=  Org_873_Cipher_TRADE_Info;
	permanent	=  1;
	description = "Dobijmy targu.";
	trade		= 1;
};                       

FUNC int  Org_873_Cipher_TRADE_Condition()
{
	if ( Cipher_Trade == TRUE)
	{
		return 1;
	};
};

FUNC VOID  Org_873_Cipher_TRADE_Info()
{
	AI_Output (other, self,"DIA_Cipher_TRADE_15_00"); //Dobijmy targu.
	AI_Output (self, other,"DIA_Cipher_TRADE_12_01"); //Czego chcesz?
	B_ClearTreaderAmmo(self);
};

//////////////////////////////////////////////
//	Zadanie: Sprzeda¿ eliksirów
//////////////////////////////////////////////

//========================================
//-----------------> WhoSellElixier
//========================================

INSTANCE DIA_Cipher_WhoSellElixier (C_INFO)
{
   npc          = Org_873_Cipher;
   nr           = 1;
   condition    = DIA_Cipher_WhoSellElixier_Condition;
   information  = DIA_Cipher_WhoSellElixier_Info;
   permanent	= FALSE;
   description	= "Sprzedajesz eliksir z wydzieliny pe³zaczy?";
};

FUNC INT DIA_Cipher_WhoSellElixier_Condition()
{
    if (MIS_SellElixer == LOG_RUNNING)
    && (HeroKnowCipherSellElixier == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Cipher_WhoSellElixier_Info()
{
    AI_Output (other, self ,"DIA_Cipher_WhoSellElixier_15_01"); //Sprzedajesz eliksir z wydzieliny pe³zaczy?
    AI_Output (self, other ,"DIA_Cipher_WhoSellElixier_03_02"); //Tak, a co ci do tego?
    AI_Output (other, self ,"DIA_Cipher_WhoSellElixier_15_03"); //Chcê wiedzieæ, od kogo go kupi³eœ.
    AI_Output (self, other ,"DIA_Cipher_WhoSellElixier_03_04"); //Od kogoœ od was. To chyba jasne!
    AI_Output (other, self ,"DIA_Cipher_WhoSellElixier_15_05"); //Nie mam czasu na twoje gierki. Gadaj z kim wspó³pracujesz.
    AI_Output (self, other ,"DIA_Cipher_WhoSellElixier_03_06"); //Ty naprawdê nie wiesz?
    AI_Output (other, self ,"DIA_Cipher_WhoSellElixier_15_07"); //Czemu ciê to tak dziwi?
	AI_Output (self, other ,"DIA_Cipher_WhoSellElixier_03_08"); //Powinieneœ wiedzieæ, co siê dzieje w obozie do którego nale¿ysz. Nie s¹dzisz? 
	AI_Output (other, self ,"DIA_Cipher_WhoSellElixier_15_09"); //Pos³uchaj mnie, cz³owiek, który robi z tob¹ interesy robi to wbrew woli Guru. Chyba nie chcia³byœ ich rozgniewaæ?
	AI_Output (self, other ,"DIA_Cipher_WhoSellElixier_03_10"); //A co mnie obchodz¹ jacyœ Guru? S¹ daleko st¹d. Chyba sam Cor Kalom nie pofatyguje siê tutaj, ¿eby skopaæ mi ty³ek?
	AI_Output (other, self ,"DIA_Cipher_WhoSellElixier_15_11"); //Nie, ale mo¿e przys³aæ na przyk³ad mnie.
	AI_Output (self, other ,"DIA_Cipher_WhoSellElixier_03_12"); //Myœlisz, ¿e siê ciebie bojê? Rusz mnie tylko, a nie masz ¿ycia w tym Obozie.
	AI_Output (other, self ,"DIA_Cipher_WhoSellElixier_15_13"); //Jeœli wyprowadzisz mnie z równowagi postawiê ca³e bagna na g³owie, ¿eby tylko znaleŸæ twoich dostawców i pozbyæ siê ich.
	AI_Output (self, other ,"DIA_Cipher_WhoSellElixier_03_14"); //Poczekaj, zostaw mój interes w spokoju. 
	AI_Output (other, self ,"DIA_Cipher_WhoSellElixier_15_15"); //W takim razie powiedz mi, co wiesz.
	AI_Output (self, other ,"DIA_Cipher_WhoSellElixier_03_16"); //Nasza wymiana odbywa siê bez zbêdnych s³ów. Jest pewna skrzynia... Zostawiam w niej na noc rudê, a nastêpnego dnia znajdujê tam eliksiry.
	AI_Output (self, other ,"DIA_Cipher_WhoSellElixier_03_17"); //Wiem, jest to doœæ ryzykowne, ale ufam moim tajemniczym wspólnikom. Jeszcze mnie nie oszukali, wiêc chyba tego nie planuj¹. 
	AI_Output (other, self ,"DIA_Cipher_WhoSellElixier_15_18"); //Gdzie jest ta skrzynia? 
	AI_Output (self, other ,"DIA_Cipher_WhoSellElixier_03_19"); //W ma³ym w¹wozie, pod starym mostem. T¹ drog¹ mo¿na siê dostaæ do obozu Aidana. Zazwyczaj stoj¹ tam jakieœ zbiry. 
	AI_Output (self, other ,"DIA_Cipher_WhoSellElixier_03_20"); //Zjaw siê tam w nocy, a mo¿e spotkasz mojego wspólnika. Ja siê z nim nie widujê. Tylko tyle mogê ci powiedzieæ. 
	
    B_LogEntry                     (CH3_SellElixer,"Cipher wreszcie da³ mi jak¹œ wskazówkê. Nie zna on to¿samoœci swojego wspólnika, jednak zdradzi³ mi, ¿e dochodzi miêdzy nimi do wymiany pod starym mostem dziêki, któremu mo¿na siê ³atwo dostaæ do obozowiska Aidana. Znam to miejsce. Widzia³em tam niegdyœ dwóch rabusiów. Pod owym mostem mam szukaæ starej skrzyni. To w niej Cipher zostawia rudê, a jego wspólnik eliksiry. Muszê siê tam udaæ póŸn¹ noc¹ i spróbowaæ przy³apaæ handlarza.");

    AI_StopProcessInfos	(self);
	
	Npc_ExchangeRoutine (NOV_1301_Caine,"badguy");
};

//////////////////////////////////////////////
//	Zadanie: Nowe ziele
//////////////////////////////////////////////

//========================================
//-----------------> NovizeJoints
//========================================

INSTANCE DIA_Cipher_NovizeJoints (C_INFO)
{
   npc          = Org_873_Cipher;
   nr           = 1;
   condition    = DIA_Cipher_NovizeJoints_Condition;
   information  = DIA_Cipher_NovizeJoints_Info;
   permanent	= FALSE;
   description	= "Nowicjusze z Bractwa maj¹ na sprzeda¿ ca³kiem nowe ziele.";
};

FUNC INT DIA_Cipher_NovizeJoints_Condition()
{
    if (MIS_NewWeed == LOG_RUNNING) && ( Cipher_Trade == TRUE)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Cipher_NovizeJoints_Info()
{
    AI_Output (other, self ,"DIA_Cipher_NovizeJoints_15_01"); //Nowicjusze z Bractwa maj¹ na sprzeda¿ ca³kiem nowe ziele.
    AI_Output (self, other ,"DIA_Cipher_NovizeJoints_03_02"); //Doprawdy?
    AI_Output (other, self ,"DIA_Cipher_NovizeJoints_15_03"); //Nie chcia³byœ mo¿e wejœæ w trwa³y uk³ad? 
    AI_Output (self, other ,"DIA_Cipher_NovizeJoints_03_04"); //Masz jakieœ próbki tego ziela? Domyœlam siê, ¿e Guru o niczym nie wiedz¹.
    AI_Output (other, self ,"DIA_Cipher_NovizeJoints_15_05"); //W rzeczy samej. Oto próbka.
	B_GiveInvItems (hero,self, MegaJoint,1);
	AI_UseItem (self, MegaJoint);
    AI_Output (self, other ,"DIA_Cipher_NovizeJoints_03_06"); //O cholera, ma niez³ego kopa... Przeka¿ temu, kto ciê przys³a³, ¿e dobijemy targu.
    B_LogEntry                     (CH1_NewWeed,"Cipher po spróbowaniu jednego skrêta od razu przysta³ na uk³ad. ");

    AI_StopProcessInfos	(self);
};














func void convoy_attack()
{
//--------------------------------------Resp eskorty i zmiana rutyny in¿yniera-----------------------------------------------------------------

    Wld_InsertNpc                (GRD_40048_Straznik,"ESKORTA1");
    Wld_InsertNpc                (GRD_40049_Straznik,"PACHOL1");
    Wld_InsertNpc                (GRD_40050_Straznik,"PACHOL3");
    Wld_InsertNpc                (VLK_40044_Inzynier,"PACHOL3");
 
 
   

};
//========================================
//-----------------> Brothers
//========================================

INSTANCE DIA_CIPHER_ATAK_LAS (C_INFO)
{
   npc          = Org_873_Cipher;
   nr           = 1;
   condition    = DIA_CIPHER_ATAK_LAS_Condition;
   information  = DIA_CIPHER_ATAK_LAS_Info;
   permanent    = FALSE;
   important    = true;
};

FUNC INT DIA_CIPHER_ATAK_LAS_Condition()
{
   // if     (Konwoj_Day != Wld_GetDay())
  //  &&     !(Konwoj_Day <=(Wld_GetDay()-2)) 	//(Konwoj_Day!=Wld_GetDay())
	 if    (Npc_KnowsInfo (hero, DIA_Roscoe_Konwoj))

    {
    return TRUE;
    };
};


FUNC VOID DIA_CIPHER_ATAK_LAS_Info()
{

    AI_Output (self, other ,"DIA_CIPHER_ATAK_LAS_15_01");    //Jesteœ. Zajmij pozycje i czekaj a¿ eskorta podejdzie wystarczaj¹co blisko. I pamiêtaj by in¿ynier nie wyszed³ z tego ¿ywy.
    AI_Output (other,self  ,"DIA_CIPHER_ATAK_LAS_03_02");    //Jasne!

    //ewentualny wpis do dziennika !
    convoy_attack();

};




//========================================
//-----------------> Brothers
//========================================

INSTANCE DIA_CIPHER_ATAK_LAS1 (C_INFO)
{
   npc          = Org_873_Cipher;
   nr           = 1;
   condition    = DIA_CIPHER_ATAK_LAS1_Condition;
   information  = DIA_CIPHER_ATAK_LAS1_Info;
   permanent	= FALSE;
   description = "In¿ynier chyba nie wykorzysta...";
};

FUNC INT DIA_CIPHER_ATAK_LAS1_Condition()
{
    if (Npc_IsDead(VLK_40044_Inzynier))
	&& (Npc_KnowsInfo (hero, DIA_CIPHER_ATAK_LAS))
    {
    return TRUE;
    };
};


FUNC VOID DIA_CIPHER_ATAK_LAS1_Info()
{
    AI_Output (other, self  ,"DIA_CIPHER_ATAK_LAS1_03_01");  //In¿ynier chyba nie wykorzysta ju¿ swojej technicznej smyka³ki do naprawienia czegokolwiek.
    AI_Output (self,  other ,"DIA_CIPHER_ATAK_LAS1_15_02");  //I bardzo dobrze! Zamelduj Laresowi, ¿e gryzie ju¿ piach. 
    B_LogEntry                     (Zawirowania,"In¿ynier nie ¿yje. Wykonaliœmy swoje zadanie nale¿ycie. Teraz pora z³o¿yæ koñcowy meldunek Laresowi i odebraæ nagrodê.");
    MIS_ZWSK_TEND = LOG_SUCCESS;
    Npc_ExchangeRoutine (Org_873_Cipher,"start");
    Npc_ExchangeRoutine (Org_843_Sharky,"start");
    Npc_ExchangeRoutine (Org_851_Butch,"start");	

    ORG_843_Sharky.aivar[AIV_PARTYMEMBER] = FALSE;
	ORG_851_Butch.aivar [AIV_PARTYMEMBER] = FALSE;
	ORG_873_Cipher.aivar[AIV_PARTYMEMBER] = FALSE;


};



//========================================
//-----------------> Brothers
//========================================

INSTANCE DIA_CIPHER_ATAK_LAS2 (C_INFO)
{
   npc          = Org_873_Cipher;
   nr           = 1;
   condition    = DIA_CIPHER_ATAK_LAS2_Condition;
   information  = DIA_CIPHER_ATAK_LAS2_Info;
   permanent	= FALSE;
   important    = TRUE;
};

FUNC INT DIA_CIPHER_ATAK_LAS2_Condition()
{
     if     (Konwoj_Day <=(Wld_GetDay()-2))
	 &&     (Npc_KnowsInfo (hero, DIA_Roscoe_Konwoj))
	 &&     !(MIS_ZWSK_TEND == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_CIPHER_ATAK_LAS2_Info() 
{
    AI_Output (self,  other ,"DIA_CIPHER_ATAK_LAS2_15_01");     //Cholera stary, spóŸni³eœ siê!
    AI_Output (other, self  ,"DIA_CIPHER_ATAK_LAS2_03_02");     //Wiem. Zatrzyma³y mnie sprawy w terenie.
    AI_Output (self,  other ,"DIA_CIPHER_ATAK_LAS2_15_03");     //Tak czy siak Lares nie bêdzie zadowolony...
    AI_Output (other, self  ,"DIA_CIPHER_ATAK_LAS2_03_04");     //Niestety, domyœlam siê.
    Mis_Zawirowania = LOG_FAILED;
    Npc_ExchangeRoutine (VLK_40044_Inzynier,"Kopalnia");
    VLK_40044_Inzynier.guild  = GIL_VLK;
    Npc_SetTrueGuild	(VLK_40044_Inzynier,GIL_VLK);
	Wld_InsertNpc				(VLK_40044_Inzynier,"Oc1");
		
    Npc_ExchangeRoutine (Org_873_Cipher,"start");
    Npc_ExchangeRoutine (Org_843_Sharky,"start");
    Npc_ExchangeRoutine (Org_851_Butch,"start");	

    ORG_843_Sharky.aivar[AIV_PARTYMEMBER] = FALSE;
	ORG_851_Butch.aivar [AIV_PARTYMEMBER] = FALSE;
	ORG_873_Cipher.aivar[AIV_PARTYMEMBER] = FALSE;
};


