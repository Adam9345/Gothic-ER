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
	description = "Co s�ycha�?";
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
	AI_Output (other, self,"DIA_Cipher_Hello_15_00"); //Co s�ycha�?
	AI_Output (self, other,"DIA_Cipher_Hello_12_01"); //Nasypali�my troch� piasku w machin� Gomeza.
	AI_Output (self, other,"DIA_Cipher_Hello_12_02"); //Trzech zabitych Stra�nik�w i mn�stwo towaru na sprzeda�. Trzeba to opi�!
	AI_Output (other, self,"DIA_Cipher_Hello_15_03"); //Jeste� jednym z ludzi, kt�rzy bez przerwy napadaj� Stary Ob�z?
	AI_Output (self, other,"DIA_Cipher_Hello_12_04"); //Nie. Napadamy go tylko wtedy, kiedy si� to op�aca.
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
	description = "Fisk ze Starego Obozu szuka nowego partnera do interes�w.";
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
	AI_Output (other, self,"DIA_Cipher_Fisk_15_00"); //Fisk ze Starego Obozu szuka nowego partnera do interes�w.
	AI_Output (self, other,"DIA_Cipher_Fisk_12_01"); //Nie jestem zainteresowany.
	AI_Output (self, other,"DIA_Cipher_Fisk_12_02"); //Ale powiniene� porozmawia� z Sharkym. Mo�e on na to p�jdzie.
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
	AI_Output (self, other,"DIA_Cipher_FromBalor_12_01"); //Nie, nie! Pytanie brzmi: co TY masz do zaoferowania! Interesuj� mnie wy��cznie powa�ne dostawy.
	if (Balor_TellsNCDealer == TRUE)
	{
		AI_Output (other, self,"DIA_Cipher_FromBalor_15_02"); //Balor powiedzia� mi, �e interesuje ci� bagienne ziele.
		AI_Output (self, other,"DIA_Cipher_FromBalor_12_03"); //Mhm. Masz co� na sprzeda�?
		Cipher_Trade = TRUE;
	}
	else
	{
		AI_Output (other, self,"DIA_Cipher_FromBalor_15_04"); //Niestety nie.
		AI_Output (self, other,"DIA_Cipher_FromBalor_12_05"); //Wi�c wr�� do mnie, jak b�dziesz mia� co� co mnie zainteresuje.
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
//	Zadanie: Sprzeda� eliksir�w
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
   description	= "Sprzedajesz eliksir z wydzieliny pe�zaczy?";
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
    AI_Output (other, self ,"DIA_Cipher_WhoSellElixier_15_01"); //Sprzedajesz eliksir z wydzieliny pe�zaczy?
    AI_Output (self, other ,"DIA_Cipher_WhoSellElixier_03_02"); //Tak, a co ci do tego?
    AI_Output (other, self ,"DIA_Cipher_WhoSellElixier_15_03"); //Chc� wiedzie�, od kogo go kupi�e�.
    AI_Output (self, other ,"DIA_Cipher_WhoSellElixier_03_04"); //Od kogo� od was. To chyba jasne!
    AI_Output (other, self ,"DIA_Cipher_WhoSellElixier_15_05"); //Nie mam czasu na twoje gierki. Gadaj z kim wsp�pracujesz.
    AI_Output (self, other ,"DIA_Cipher_WhoSellElixier_03_06"); //Ty naprawd� nie wiesz?
    AI_Output (other, self ,"DIA_Cipher_WhoSellElixier_15_07"); //Czemu ci� to tak dziwi?
	AI_Output (self, other ,"DIA_Cipher_WhoSellElixier_03_08"); //Powiniene� wiedzie�, co si� dzieje w obozie do kt�rego nale�ysz. Nie s�dzisz? 
	AI_Output (other, self ,"DIA_Cipher_WhoSellElixier_15_09"); //Pos�uchaj mnie, cz�owiek, kt�ry robi z tob� interesy robi to wbrew woli Guru. Chyba nie chcia�by� ich rozgniewa�?
	AI_Output (self, other ,"DIA_Cipher_WhoSellElixier_03_10"); //A co mnie obchodz� jacy� Guru? S� daleko st�d. Chyba sam Cor Kalom nie pofatyguje si� tutaj, �eby skopa� mi ty�ek?
	AI_Output (other, self ,"DIA_Cipher_WhoSellElixier_15_11"); //Nie, ale mo�e przys�a� na przyk�ad mnie.
	AI_Output (self, other ,"DIA_Cipher_WhoSellElixier_03_12"); //My�lisz, �e si� ciebie boj�? Rusz mnie tylko, a nie masz �ycia w tym Obozie.
	AI_Output (other, self ,"DIA_Cipher_WhoSellElixier_15_13"); //Je�li wyprowadzisz mnie z r�wnowagi postawi� ca�e bagna na g�owie, �eby tylko znale�� twoich dostawc�w i pozby� si� ich.
	AI_Output (self, other ,"DIA_Cipher_WhoSellElixier_03_14"); //Poczekaj, zostaw m�j interes w spokoju. 
	AI_Output (other, self ,"DIA_Cipher_WhoSellElixier_15_15"); //W takim razie powiedz mi, co wiesz.
	AI_Output (self, other ,"DIA_Cipher_WhoSellElixier_03_16"); //Nasza wymiana odbywa si� bez zb�dnych s��w. Jest pewna skrzynia... Zostawiam w niej na noc rud�, a nast�pnego dnia znajduj� tam eliksiry.
	AI_Output (self, other ,"DIA_Cipher_WhoSellElixier_03_17"); //Wiem, jest to do�� ryzykowne, ale ufam moim tajemniczym wsp�lnikom. Jeszcze mnie nie oszukali, wi�c chyba tego nie planuj�. 
	AI_Output (other, self ,"DIA_Cipher_WhoSellElixier_15_18"); //Gdzie jest ta skrzynia? 
	AI_Output (self, other ,"DIA_Cipher_WhoSellElixier_03_19"); //W ma�ym w�wozie, pod starym mostem. T� drog� mo�na si� dosta� do obozu Aidana. Zazwyczaj stoj� tam jakie� zbiry. 
	AI_Output (self, other ,"DIA_Cipher_WhoSellElixier_03_20"); //Zjaw si� tam w nocy, a mo�e spotkasz mojego wsp�lnika. Ja si� z nim nie widuj�. Tylko tyle mog� ci powiedzie�. 
	
    B_LogEntry                     (CH3_SellElixer,"Cipher wreszcie da� mi jak�� wskaz�wk�. Nie zna on to�samo�ci swojego wsp�lnika, jednak zdradzi� mi, �e dochodzi mi�dzy nimi do wymiany pod starym mostem dzi�ki, kt�remu mo�na si� �atwo dosta� do obozowiska Aidana. Znam to miejsce. Widzia�em tam niegdy� dw�ch rabusi�w. Pod owym mostem mam szuka� starej skrzyni. To w niej Cipher zostawia rud�, a jego wsp�lnik eliksiry. Musz� si� tam uda� p�n� noc� i spr�bowa� przy�apa� handlarza.");

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
   description	= "Nowicjusze z Bractwa maj� na sprzeda� ca�kiem nowe ziele.";
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
    AI_Output (other, self ,"DIA_Cipher_NovizeJoints_15_01"); //Nowicjusze z Bractwa maj� na sprzeda� ca�kiem nowe ziele.
    AI_Output (self, other ,"DIA_Cipher_NovizeJoints_03_02"); //Doprawdy?
    AI_Output (other, self ,"DIA_Cipher_NovizeJoints_15_03"); //Nie chcia�by� mo�e wej�� w trwa�y uk�ad? 
    AI_Output (self, other ,"DIA_Cipher_NovizeJoints_03_04"); //Masz jakie� pr�bki tego ziela? Domy�lam si�, �e Guru o niczym nie wiedz�.
    AI_Output (other, self ,"DIA_Cipher_NovizeJoints_15_05"); //W rzeczy samej. Oto pr�bka.
	B_GiveInvItems (hero,self, MegaJoint,1);
	AI_UseItem (self, MegaJoint);
    AI_Output (self, other ,"DIA_Cipher_NovizeJoints_03_06"); //O cholera, ma niez�ego kopa... Przeka� temu, kto ci� przys�a�, �e dobijemy targu.
    B_LogEntry                     (CH1_NewWeed,"Cipher po spr�bowaniu jednego skr�ta od razu przysta� na uk�ad. ");

    AI_StopProcessInfos	(self);
};














func void convoy_attack()
{
//--------------------------------------Resp eskorty i zmiana rutyny in�yniera-----------------------------------------------------------------

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

    AI_Output (self, other ,"DIA_CIPHER_ATAK_LAS_15_01");    //Jeste�. Zajmij pozycje i czekaj a� eskorta podejdzie wystarczaj�co blisko. I pami�taj by in�ynier nie wyszed� z tego �ywy.
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
   description = "In�ynier chyba nie wykorzysta...";
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
    AI_Output (other, self  ,"DIA_CIPHER_ATAK_LAS1_03_01");  //In�ynier chyba nie wykorzysta ju� swojej technicznej smyka�ki do naprawienia czegokolwiek.
    AI_Output (self,  other ,"DIA_CIPHER_ATAK_LAS1_15_02");  //I bardzo dobrze! Zamelduj Laresowi, �e gryzie ju� piach. 
    B_LogEntry                     (Zawirowania,"In�ynier nie �yje. Wykonali�my swoje zadanie nale�ycie. Teraz pora z�o�y� ko�cowy meldunek Laresowi i odebra� nagrod�.");
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
    AI_Output (self,  other ,"DIA_CIPHER_ATAK_LAS2_15_01");     //Cholera stary, sp�ni�e� si�!
    AI_Output (other, self  ,"DIA_CIPHER_ATAK_LAS2_03_02");     //Wiem. Zatrzyma�y mnie sprawy w terenie.
    AI_Output (self,  other ,"DIA_CIPHER_ATAK_LAS2_15_03");     //Tak czy siak Lares nie b�dzie zadowolony...
    AI_Output (other, self  ,"DIA_CIPHER_ATAK_LAS2_03_04");     //Niestety, domy�lam si�.
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


