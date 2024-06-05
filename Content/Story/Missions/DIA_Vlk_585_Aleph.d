//poprawione i sprawdzone -  

// ************************ EXIT **************************

instance  VLK_585_Aleph_Exit (C_INFO)
{
	npc			=  VLK_585_Aleph;
	nr			=  999;
	condition	=  VLK_585_Aleph_Exit_Condition;
	information	=  VLK_585_Aleph_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  VLK_585_Aleph_Exit_Condition()
{
	return 1;
};

FUNC VOID  VLK_585_Aleph_Exit_Info()
{
	if	!Npc_KnowsInfo (hero, GRD_261_Brandick_ALEPH)
	{
		AI_Output (other, self,"VLK_585_Aleph_Exit_Info_15_01"); //Powodzenia!
		AI_Output (self, other,"VLK_585_Aleph_Exit_Info_05_02"); //Có¿, wiesz, gdzie mnie znaleŸæ.
	};
	
	AI_StopProcessInfos	( self );

};
// ***************** ALEPH IST EIN FAULPELZ *****************************
instance VLK_585_Aleph_CLEVER (C_INFO)
{
	npc				= VLK_585_Aleph;
	condition		= VLK_585_Aleph_CLEVER_Condition;
	information		= VLK_585_Aleph_CLEVER_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  VLK_585_Aleph_CLEVER_Condition()
{
	return 1;
};

func void  VLK_585_Aleph_CLEVER_Info()
{
	AI_Output (self,other,"VLK_585_Aleph_CLEVER_Info_05_01"); //He he he, Stra¿nicy nigdy mnie nie z³api¹!
};
// ***************** ALEPH ERKLÄRT SEINE ARBEITSHALTUNG *****************************

instance  VLK_585_Aleph_GUARDS (C_INFO)
{
	npc				= VLK_585_Aleph;
	condition		= VLK_585_Aleph_GUARDS_Condition;
	information		= VLK_585_Aleph_GUARDS_Info;
	important		= 0;
	permanent		= 0;
	description		= "Co masz na myœli?"; 
};

FUNC int  VLK_585_Aleph_GUARDS_Condition()
{	
	if Npc_KnowsInfo (hero,VLK_585_Aleph_CLEVER) && (kapitel < 4)
	{
		return 1;
	};
};

FUNC void  VLK_585_Aleph_GUARDS_Info()
{
	AI_Output (other, self,"VLK_585_Aleph_GUARDS_Info_15_01"); //Co masz na myœli?
	AI_Output (self, other,"VLK_585_Aleph_GUARDS_Info_05_02"); //Pracujê tylko wtedy, gdy w pobli¿u jest jakiœ Stra¿nik, który mo¿e mnie zobaczyæ. Poza tym tylko sobie odpoczywam.
	AI_Output (other, self,"VLK_585_Aleph_GUARDS_Info_15_03"); //I nie robi¹ siê podejrzliwi?
	AI_Output (self, other,"VLK_585_Aleph_GUARDS_Info_05_04"); //Oczywiœcie, ¿e tak! Wydobywam mniej rudy ni¿ inny Kopacze, wiêc muszê nadrabiaæ braki drobnym handlem wymiennym.
	AI_Output (self, other,"VLK_585_Aleph_GUARDS_Info_05_05"); //Mam oczy szeroko otwarte, wiêc dowiedzia³em siê kilku ciekawych rzeczy. Masz mo¿e przy sobie trochê rudy? Jakieœ 10 bry³ek?

	Npc_ExchangeRoutine (self,"BUSY");
	
	var C_Npc Brandick; 				
	Brandick = Hlp_GetNpc(GRD_261_Brandick);
	Npc_ExchangeRoutine (Brandick,"WATCH");
	AI_ContinueRoutine(Brandick);	// TEST!!!
};
// ***************** ALEPH BIETET INFO *****************************

instance VLK_585_Aleph_INFO (C_INFO)
{
	npc				= VLK_585_Aleph;
	condition		= VLK_585_Aleph_INFO_Condition;
	information		= VLK_585_Aleph_INFO_Info;
	important		= 0;
	permanent		= 0;
	description		= "(daj 10 bry³ek rudy)";
};

FUNC int  VLK_585_Aleph_INFO_Condition()
{
	if ( Npc_HasItems (hero,ItMinugget) ) >= 10 &&  (Npc_KnowsInfo (hero, VLK_585_Aleph_GUARDS) )  && (kapitel < 4)
	{
		return 1;
	};
};

func void  VLK_585_Aleph_INFO_Info()
{
	AI_Output (other,self,"VLK_585_Aleph_INFO_Info_15_01"); //Jasne, oto 10 bry³ek.
	AI_Output (self,other,"VLK_585_Aleph_INFO_Info_05_02"); //Dziêki. IdŸ do g³ównego szybu i zejdŸ na dó³ po rusztowaniu. Powinieneœ trafiæ na dwie boczne jaskinie.
	AI_Output (self,other,"VLK_585_Aleph_INFO_Info_05_03"); //W drugiej z nich jest Stra¿nik i stary rozdrabniacz.
	AI_Output (self,other,"VLK_585_Aleph_INFO_Info_05_04"); //Gdzieœ niedaleko znajdziesz napój uzdrawiaj¹cy, tylko uwa¿aj na pe³zacze!
	AI_Output (self,other,"VLK_585_Aleph_INFO_Info_05_05"); //Gdybyœ potrzebowa³ najœwie¿szych informacji zg³oœ siê do mnie. Na pewno bêdê móg³ ci pomóc.
	
	B_GiveInvItems (hero, other, ItMiNugget,10);
};
// ***************** WIRD ALEPH ANGESCHWÄRZT IST ER SAUER*****************************
instance VLK_585_Aleph_ANGRY (C_INFO)
{
	npc				= VLK_585_Aleph;
	condition		= VLK_585_Aleph_ANGRY_Condition;
	information		= VLK_585_Aleph_ANGRY_Info;
	important		= 1;
	permanent		= 0;
};	

FUNC int  VLK_585_Aleph_ANGRY_Condition()
{
	if ( Npc_KnowsInfo (hero,GRD_261_Brandick_ALEPH) ) && (kapitel < 4)
	{
		return 1;
	};
};

func void  VLK_585_Aleph_ANGRY_Info()
{
	
	AI_Output (self,other,"VLK_585_Aleph_ANGRY_Info_05_01"); //Donios³eœ na mnie Brandickowi? Spadaj st¹d!
	
	AI_StopProcessInfos	( self );
	Npc_SetTempAttitude (self,ATT_ANGRY);
};
//***************** LOCKPICKS*****************************
instance VLK_585_Aleph_KEY (C_INFO)
{
	npc				= VLK_585_Aleph;
	condition		= VLK_585_Aleph_KEY_Condition;
	information		= VLK_585_Aleph_KEY_Info;
	important		= 0;
	permanent		= 0;
	description     = "Masz dla mnie jeszcze jakieœ po¿yteczne informacje?";
};
FUNC int  VLK_585_Aleph_KEY_Condition()
{
	if ! ( Npc_KnowsInfo (hero,GRD_261_Brandick_ALEPH) ) &&  ( Npc_KnowsInfo (hero, VLK_585_Aleph_INFO)) && (kapitel < 4)
	{
		return 1;
	};
};

func void  VLK_585_Aleph_KEY_Info()
{
	AI_Output (other,self,"VLK_585_Aleph_KEY_Info_15_01"); //Masz dla mnie jeszcze jakieœ po¿yteczne informacje?
	AI_Output (self,other,"VLK_585_Aleph_KEY_Info_05_02"); //Jasne, a masz 10 bry³ek rudy?
};

//***************** LOCKPICKS*****************************
instance VLK_585_Aleph_GLEN (C_INFO)
{
	npc				= VLK_585_Aleph;
	condition		= VLK_585_Aleph_GLEN_Condition;
	information		= VLK_585_Aleph_GLEN_Info;
	important		= 0;
	permanent		= 0;
	description     = "(daj 10 bry³ek rudy)";
};
FUNC int  VLK_585_Aleph_GLEN_Condition()
{
	if ( Npc_HasItems (hero,ItMinugget) ) >= 10 &&  ( Npc_KnowsInfo (hero,VLK_585_Aleph_KEY) ) && (kapitel < 4)
	{
		return 1;
	};
};

func void  VLK_585_Aleph_GLEN_Info()
{
	
	AI_Output (other,self,"VLK_585_Aleph_GLEN_Info_15_01"); //Za tak¹ cenê oczekujê czegoœ naprawdê dobrego!
	AI_Output (self,other,"VLK_585_Aleph_GLEN_Info_05_02"); //W kopalni mo¿na znaleŸæ mnóstwo zamkniêtych skrzyñ. Glen, jeden z Kopaczy na górze, mo¿e ci dostarczyæ parê wytrychów.
	
	B_GiveInvItems (hero, self, ItMinugget,10); 
};
//***************** LAGERSCHUPPENSCHLÜSSEL*****************************
func void B_Aleph_StorageShedKey()
{
	B_LogEntry		(CH2_StorageShed,	"Aleph sprzeda³ mi klucz do skrzyñ ze sk³adowiska!");
};

instance VLK_585_Aleph_SCHUPPEN (C_INFO)
{
	npc				= VLK_585_Aleph;
	condition		= VLK_585_Aleph_SCHUPPEN_Condition;
	information		= VLK_585_Aleph_SCHUPPEN_Info;
	important		= 0;
	permanent		= 0;
	description     = "Wiesz mo¿e coœ o kluczu do skrzyni ze sk³adowiska?";
};
FUNC int  VLK_585_Aleph_SCHUPPEN_Condition()
{
	if ( Npc_KnowsInfo (hero, GRD_271_ULBERT_DRUNK) ) && ( !Npc_KnowsInfo (hero, GRD_261_Brandick_ALEPH) ) && (kapitel < 4)
	{
		return 1;
	};
};

func void  VLK_585_Aleph_SCHUPPEN_Info()
{
	
	AI_Output (other,self,"VLK_585_Aleph_SCHUPPEN_Info_15_01"); //Wiesz mo¿e coœ o kluczu do skrzyni ze sk³adowiska?
	AI_Output (self,other,"VLK_585_Aleph_SCHUPPEN_Info_05_02"); //Có¿... To zale¿y...
	AI_Output (other,self,"VLK_585_Aleph_SCHUPPEN_Info_15_03"); //Od iloœci bry³ek rudy, które jestem gotów zap³aciæ?
	AI_Output (self,other,"VLK_585_Aleph_SCHUPPEN_Info_05_04"); //Szybko siê uczysz.
	
	Info_ClearChoices ( VLK_585_Aleph_SCHUPPEN );
	
	Info_AddChoice ( VLK_585_Aleph_SCHUPPEN,DIALOG_BACK 	   ,VLK_585_Aleph_SCHUPPEN_Back);
	Info_AddChoice ( VLK_585_Aleph_SCHUPPEN,"Zap³aæ 50 bry³ek rudy.",VLK_585_Aleph_SCHUPPEN_50 );
	Info_AddChoice ( VLK_585_Aleph_SCHUPPEN,"Zap³aæ 30 bry³ek rudy.",VLK_585_Aleph_SCHUPPEN_30 );
	Info_AddChoice ( VLK_585_Aleph_SCHUPPEN,"Zap³aæ 15 bry³ek rudy.",VLK_585_Aleph_SCHUPPEN_15 );
};


func void VLK_585_Aleph_SCHUPPEN_50 ()
{
	
	if (Npc_HasItems (hero, ItMiNugget) >= 50)
	{ 
		AI_Output			(other,self,"VLK_585_Aleph_SCHUPPEN_50_15_01"); //50 bry³ek to chyba uczciwa cena!
		AI_Output			(self,other,"VLK_585_Aleph_SCHUPPEN_50_05_02"); //Jesteœ bardzo hojny! Oto klucz. WeŸ te¿ ten pierœcieñ. Zawsze przynosi³ mi szczêœcie.

		CreateInvItems		(self, ItKe_OM_03,	1);			// nur für die korrekte Textausgaben!!!
		B_GiveInvItems      (self, hero, ItKe_OM_03, 2);
		Npc_RemoveInvItem	(hero, ItKe_OM_03);

		Npc_RemoveInvItem	(self, Staerkering);
		CreateInvItem		(hero, Staerkering);

		B_GiveInvItems	    (hero, self, ItMinugget,50);  

		Npc_SetPermAttitude (self, ATT_FRIENDLY ); 
		Info_ClearChoices	(VLK_585_Aleph_SCHUPPEN);
		VLK_585_Aleph_SCHUPPEN.permanent = 0;
		B_Aleph_StorageShedKey();
	}
	else
	{
		AI_Output (self,other,"VLK_585_Aleph_SCHUPPEN_50_05_03"); //Nie masz tyle przy sobie!
		VLK_585_Aleph_SCHUPPEN.permanent = 1;
	};
};

func void VLK_585_Aleph_SCHUPPEN_30 ()
{
	
	
	if (Npc_HasItems (hero, ItMiNugget) >= 30)
	{ 
		CreateInvItem		(self, ItKe_OM_03);
		B_GiveInvItems      (self, other, ItKe_OM_03, 1);
		B_GiveInvItems	(hero, self, ItMinugget,30);  
		Info_ClearChoices	(VLK_585_Aleph_SCHUPPEN );
		AI_Output (other,self,"VLK_585_Aleph_SCHUPPEN_30_15_01"); //30 bry³ek powinno wystarczyæ.
		AI_Output (self,other,"VLK_585_Aleph_SCHUPPEN_30_05_02"); //W porz¹dku. Tak siê sk³ada, ¿e mam ten klucz przy sobie.
		VLK_585_Aleph_SCHUPPEN.permanent = 0;
		B_Aleph_StorageShedKey();
	}
	else
	{
		AI_Output (self,other,"VLK_585_Aleph_SCHUPPEN_30_05_03"); //Nie masz tyle przy sobie!
		VLK_585_Aleph_SCHUPPEN.permanent = 1;
	}; 
};	
func void VLK_585_Aleph_SCHUPPEN_15 ()
{
	AI_Output (other,self,"VLK_585_Aleph_SCHUPPEN_15_15_01"); //15 bry³ek wystarczy?
	AI_Output (self,other,"VLK_585_Aleph_SCHUPPEN_15_05_02"); //15 bry³ek? Za 15 bry³ek nie mam pojêcia o jakim kluczu mówisz!
	VLK_585_Aleph_SCHUPPEN.permanent = 0;
};	
func void VLK_585_Aleph_SCHUPPEN_Back ()
{
	Info_ClearChoices	(  VLK_585_Aleph_SCHUPPEN );
	VLK_585_Aleph_SCHUPPEN.permanent = 1;
};

// WENN DER SPIELER ALEPH BEI BRANDICK ANGESCHWÄRZT HAT
instance  VLK_585_Aleph_DIRTY (C_INFO)
{
	npc				= VLK_585_Aleph;
	condition		= VLK_585_Aleph_DIRTY_Condition;
	information		= VLK_585_Aleph_DIRTY_Info;
	important		= 0;
	permanent		= 0;
	description		= "Wiesz mo¿e coœ o kluczu do skrzyni ze sk³adowiska?"; 
};

FUNC int  VLK_585_Aleph_DIRTY_Condition()
{
	if ( Npc_KnowsInfo (hero, GRD_271_ULBERT_DRUNK) ) && ( Npc_KnowsInfo (hero, GRD_261_Brandick_ALEPH) ) && (kapitel < 4)
	{
		return 1;
	};
};


FUNC void  VLK_585_Aleph_DIRTY_Info()
{
	AI_Output (other,self,"VLK_585_Aleph_DIRTY_Info_15_01"); //Wiesz mo¿e coœ o kluczu do skrzyni ze sk³adowiska?
	AI_Output (self,other,"VLK_585_Aleph_DIRTY_Info_05_02"); //Có¿, to zale¿y...
	AI_Output (other,self,"VLK_585_Aleph_DIRTY_Info_15_03"); //Od iloœci bry³ek rudy, które jestem gotów zap³aciæ?
	AI_Output (self,other,"VLK_585_Aleph_DIRTY_Info_05_04"); //Szybko siê uczysz. To ciê bêdzie kosztowaæ 100 bry³ek.
	
	Info_ClearChoices ( VLK_585_Aleph_DIRTY );
	
	Info_AddChoice ( VLK_585_Aleph_DIRTY,"(Zap³aæ 100 bry³ek rudy)",VLK_585_Aleph_DIRTY_100 );
	Info_AddChoice ( VLK_585_Aleph_DIRTY,"(Nie p³aæ)",VLK_585_Aleph_DIRTY_NO );
};  
func void VLK_585_Aleph_DIRTY_100()
{
	if Npc_HasItems (hero,ItMinugget)>=100
	{ 
		AI_Output (other,self,"VLK_585_Aleph_DIRTY_100_Info_15_01"); //Niech bêdzie, ty zdzierco. Masz tu swoje 100 bry³ek.
		AI_Output (self,other,"VLK_585_Aleph_DIRTY_100_Info_05_02"); //Trzeba by³o ze mn¹ nie zadzieraæ. Oto twój klucz.
		B_GiveInvItems	(hero, self, ItMinugget,100);
		CreateInvItem		(self, ItKe_OM_03);
		B_GiveInvItems      (self, other, ItKe_OM_03, 1);
		Info_ClearChoices	( VLK_585_Aleph_DIRTY );
		VLK_585_Aleph_DIRTY.permanent = 0;	
		B_Aleph_StorageShedKey();
	}
	else
	{
		AI_Output (self,other,"VLK_585_Aleph_DIRTY_100_Info_05_03"); //Masz mnie za g³upca?! 100 bry³ek, to moje ostatnie s³owo!
		VLK_585_Aleph_DIRTY.permanent = 1;
	};
};
func void VLK_585_Aleph_DIRTY_NO()
{
	AI_Output (other,self,"VLK_585_Aleph_DIRTY_NO_Info_15_01"); //Nie bêdê wyrzuca³ w b³oto takiej iloœci rudy!
	AI_Output (self,other,"VLK_585_Aleph_DIRTY_NO_Info_05_02"); //To po co mnie w ogóle zaczepiasz?
	VLK_585_Aleph_DIRTY.permanent = 0;	
};

//========================================
//-----------------> MAGZYN
//========================================

INSTANCE DIA_Aleph_MAGZYN (C_INFO)
{
   npc          = VLK_585_Aleph;
   nr           = 8;
   condition    = DIA_Aleph_MAGZYN_Condition;
   information  = DIA_Aleph_MAGZYN_Info;
   permanent	= FALSE;
   description	= "Garp pyta, czy zajmiesz siê skrzyniami.";
};

FUNC INT DIA_Aleph_MAGZYN_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Garp_AKSZYN)) && (kapitel < 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Aleph_MAGZYN_Info()
{
    AI_Output (other, self ,"DIA_Aleph_MAGZYN_15_01"); //Garp pyta, czy zajmiesz siê skrzyniami.
    AI_Output (self, other ,"DIA_Aleph_MAGZYN_03_02"); //Chyba do reszty zg³upia³.
    AI_Output (self, other ,"DIA_Aleph_MAGZYN_03_03"); //Nie jestem samobójc¹. 
    AI_Output (other, self ,"DIA_Aleph_MAGZYN_15_04"); //Podobno ju¿ siê zgodzi³eœ. 
    AI_Output (self, other ,"DIA_Aleph_MAGZYN_03_05"); //To, co mówi³em przy piwie dwa dni temu to inna sprawa.
    AI_Output (self, other ,"DIA_Aleph_MAGZYN_03_06"); //Oni naprawdê myœl¹, ¿e mog¹ coœ zdzia³aæ.
    AI_Output (self, other ,"DIA_Aleph_MAGZYN_03_07"); //Przecie¿ to oczywiste, ¿e jeœli to siê wyda, wszyscy zawisn¹.
    AI_Output (self, other ,"DIA_Aleph_MAGZYN_03_08"); //Ja umywam od tego rêce. Niech szukaj¹ innego frajera.
    B_LogEntry                     (CH1_ActionOM,"Krótko mówi¹c, Aleph ma gdzieœ ca³¹ tê akcje Kopaczy. Uwa¿a, ¿e s¹ z góry skazani na pora¿kê. Garp nie bêdzie zadowolony.");

    B_GiveXP (130);
};

//========================================
//-----------------> ZAMKI
//========================================

INSTANCE DIA_Aleph_ZAMKI (C_INFO)
{
   npc          = VLK_585_Aleph;
   nr           = 9;
   condition    = DIA_Aleph_ZAMKI_Condition;
   information  = DIA_Aleph_ZAMKI_Info;
   permanent	= FALSE;
   description	= "Nauczysz mnie otwieraæ zamki?";
};

FUNC INT DIA_Aleph_ZAMKI_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Aleph_MAGZYN)) && (kapitel < 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Aleph_ZAMKI_Info()
{
    AI_Output (other, self ,"DIA_Aleph_ZAMKI_15_01"); //Nauczysz mnie otwieraæ zamki?
    AI_Output (self, other ,"DIA_Aleph_ZAMKI_03_02"); //Nie. Spadaj! Nie mieszam siê w te wasze bunty.
    B_LogEntry                     (CH1_ActionOM,"Aleph nie nauczy mnie otwierania zamków. Muszê pogadaæ z kimœ z zewn¹trz.");
};


//========================================
//-----------------> KAPITEL4_DIALOG
//========================================

INSTANCE DIA_Aleph_KAPITEL4_DIALOG (C_INFO)
{
   npc          = VLK_585_Aleph;
   nr           = 1;
   condition    = DIA_Aleph_KAPITEL4_DIALOG_Condition;
   information  = DIA_Aleph_KAPITEL4_DIALOG_Info;
   permanent	= FALSE;
   description	= "No, no... Jak zawsze wykaza³eœ siê sprytem.";
};

FUNC INT DIA_Aleph_KAPITEL4_DIALOG_Condition()
{
    if (kapitel >= 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Aleph_KAPITEL4_DIALOG_Info()
{
    AI_Output (other, self ,"DIA_Aleph_KAPITEL4_DIALOG_15_01"); //No, no... Jak zawsze wykaza³eœ siê sprytem.
    AI_Output (self, other ,"DIA_Aleph_KAPITEL4_DIALOG_03_02"); //Taa... Ledwo nam siê uda³o zbiec z kopalni. Na szczêœcie ci przebrzydli Stra¿nicy, z Brandickiem na czele dostali nauczkê.
    AI_Output (self, other ,"DIA_Aleph_KAPITEL4_DIALOG_03_03"); //Stara Kopalnia jest teraz jednym wielkim grobem. Niemal wszyscy zginêli. Jak tylko woda opadnie, ich zw³oki na zawsze tam zostan¹.
};

//========================================
//-----------------> ABOUT_GOMEZ
//========================================

INSTANCE DIA_Aleph_ABOUT_GOMEZ (C_INFO)
{
   npc          = VLK_585_Aleph;
   nr           = 2;
   condition    = DIA_Aleph_ABOUT_GOMEZ_Condition;
   information  = DIA_Aleph_ABOUT_GOMEZ_Info;
   permanent	= FALSE;
   description	= "Myœlisz, ¿e Gomez bêdzie chcia³ odbudowaæ kopalnie?";
};

FUNC INT DIA_Aleph_ABOUT_GOMEZ_Condition()
{
    var C_NPC whodie0; 	whodie0 = Hlp_GetNpc(ebr_100_gomez);
    if (Npc_KnowsInfo (hero, DIA_Aleph_KAPITEL4_DIALOG))
    && (!Npc_IsDead(whodie0))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Aleph_ABOUT_GOMEZ_Info()
{
    AI_Output (other, self ,"DIA_Aleph_ABOUT_GOMEZ_15_01"); //Nie s¹dzisz, ¿e z czasem Gomez bêdzie chcia³ odbudowaæ kopalniê?
    AI_Output (self, other ,"DIA_Aleph_ABOUT_GOMEZ_03_02"); //Nie wiem. Teraz o ile dobrze s³ysza³em zamierza zaj¹æ Woln¹ Kopalnie. Jeœli mu siê, uda nie bêdzie potrzebowa³ ¿adnych innych kopalñ.
    AI_Output (self, other ,"DIA_Aleph_ABOUT_GOMEZ_03_03"); //Z tego co mi mówi³ mój kumpel Senyan z Nowego Obozu, ta kopalnia jest niezmiernie bogata w surowce.
};

//========================================
//-----------------> NEW_CAMP
//========================================

INSTANCE DIA_Aleph_NEW_CAMP (C_INFO)
{
   npc          = VLK_585_Aleph;
   nr           = 3;
   condition    = DIA_Aleph_NEW_CAMP_Condition;
   information  = DIA_Aleph_NEW_CAMP_Info;
   permanent	= TRUE;
   description	= "Jak siê maj¹ sprawy?";
};

FUNC INT DIA_Aleph_NEW_CAMP_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Aleph_KAPITEL4_DIALOG))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Aleph_NEW_CAMP_Info()
{
    AI_Output (other, self ,"DIA_Aleph_NEW_CAMP_15_01"); //Jak siê maj¹ sprawy?
    AI_Output (self, other ,"DIA_Aleph_NEW_CAMP_03_02"); //Na razie odpoczywamy. Potem pewnie udamy siê do Nowego Obozu.
    AI_Output (other, self ,"DIA_Aleph_NEW_CAMP_15_03"); //Odpoczynek to twoja specjalnoœæ.
    AI_Output (self, other ,"DIA_Aleph_NEW_CAMP_03_04"); //Hehe... No jasne. 
};



//========================================
//-----------------> NEW_CAMP
//========================================

INSTANCE DIA_Aleph_Srebrny_Grom (C_INFO)
{
   npc          = VLK_585_Aleph;
   nr           = 3;
   condition    = DIA_Aleph_Srebrny_Grom_Condition;
   information  = DIA_Aleph_Srebrny_Grom_Info;
   permanent	= FALSE;
   description	= "Masz surowiec zwany srebrnym gromem?";
};

FUNC INT DIA_Aleph_Srebrny_Grom_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Alberto_Silver_Nugget))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Aleph_Srebrny_Grom_Info()
{
    AI_Output (other, self ,"DIA_Aleph_Srebrny_Grom_15_01"); //Masz surowiec zwany srebrnym gromem?
    AI_Output (self, other ,"DIA_Aleph_Srebrny_Grom_03_02"); //Mia³em dopóki ten g³upi dupek Brandick nie odebra³ mi go kiedy mia³em iœæ do Alberto, ¿eby mu to sprzedaæ.
    AI_Output (self, other ,"DIA_Aleph_Srebrny_Grom_03_03"); //Trzyma to przy dupie jak go znam. Ale ciê¿ko ci bêdzie go okraœæ bo ostatnio jest bardziej czujny ni¿ zwykle.
    AI_Output (other, self ,"DIA_Aleph_Srebrny_Grom_15_04"); //Pogadam z nim.
	AI_Output (self, other ,"DIA_Aleph_Srebrny_Grom_03_05"); //Jak chcesz. Na razie.
    AI_Output (other, self ,"DIA_Aleph_Srebrny_Grom_15_06"); //Do zobaczenia.
	B_LogEntry               (MieczGorBoby,"Aleph nie ma ju¿ srebrnego gromu. Zarekwirowa³ mu go Brandick za ci¹g³e lenistwo i wymigiwanie siê od pracy. Zatem ju¿ wiem co mam zrobiæ...");
	
};


//========================================
//-----------------> DWMN
//========================================

INSTANCE DIA_Aleph_DWMN (C_INFO)
{
   npc          = VLK_585_Aleph;
   nr           = 1;
   condition    = DIA_Aleph_DWMN_Condition;
   information  = DIA_Aleph_DWMN_Info;
   permanent	= FALSE;
   description	= "S³ysza³eœ nowe wieœci?";
};

FUNC INT DIA_Aleph_DWMN_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Robin_DWNM))
{
    return TRUE;
};
};
FUNC VOID DIA_Aleph_DWMN_Info()
{
    AI_Output (other, self ,"DIA_Aleph_DWMN_15_01"); //S³ysza³eœ nowe wieœci?
    AI_Output (self, other ,"DIA_Aleph_DWMN_03_02"); //Jakie? 
    AI_Output (other, self ,"DIA_Aleph_DWMN_15_03"); //Chodzi o dostawê rudy do Starego Obozu Gomez zarobi na niej fortunê.
    AI_Output (self, other ,"DIA_Aleph_DWMN_03_04"); //Ciekawe. Na pewno zarz¹dcy kopalni dostan¹ niez³e premie. 
    AI_Output (self, other ,"DIA_Aleph_DWMN_03_05"); //Ale w³aœciwie po co mi o tym mówisz?
    AI_Output (other, self ,"DIA_Aleph_DWMN_15_06"); //Uzna³em, ¿e lubisz du¿o wiedzieæ.
    AI_Output (self, other ,"DIA_Aleph_DWMN_03_07"); //Rozumiem. I masz trochê racji.
    AI_Output (other, self ,"DIA_Aleph_DWMN_15_08"); //Có¿, do zobaczenia...
    AI_Output (self, other ,"DIA_Aleph_DWMN_03_09"); //Na razie.
    AI_StopProcessInfos	(self);
};

instance dia_aleph_pickpocket(c_info) {
    npc = vlk_585_aleph;
    nr = 900;
    condition = dia_aleph_pickpocket_condition;
    information = dia_aleph_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_aleph_pickpocket_condition() {
	e_beklauen(baseThfChanceVLK, 20);
};

func void dia_aleph_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_aleph_pickpocket);
	info_addchoice(dia_aleph_pickpocket, dialog_back, dia_aleph_pickpocket_back);
	info_addchoice(dia_aleph_pickpocket, dialog_pickpocket, dia_aleph_pickpocket_doit);
};

func void dia_aleph_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_aleph_pickpocket);
};

func void dia_aleph_pickpocket_back() {
    info_clearchoices(dia_aleph_pickpocket);
};

