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
    AI_Output (self, other ,"DIA_Fallon_ZL_ERENS_03_01"); //Widzê, ¿e robisz interesiki z Erensem!
    AI_Output (other, self ,"DIA_Fallon_ZL_ERENS_15_02"); //I co z tego?
    AI_Output (self, other ,"DIA_Fallon_ZL_ERENS_03_03"); //Dziwny ostatnio z niego goœæ. Nocami mówi coœ w nieznanym jêzyku i odprawia jakieœ mini-rytua³y.
    AI_Output (other, self ,"DIA_Fallon_ZL_ERENS_15_04"); //Rytua³y?
    AI_Output (self, other ,"DIA_Fallon_ZL_ERENS_03_05"); //Z pewnoœci¹ mroczne. Widzia³em jak zrobi³ sobie ranê i upuszcza³ w³asn¹ krew, wyj¹c coœ niezrozumiale.
    AI_Output (self, other ,"DIA_Fallon_ZL_ERENS_03_06"); //Jak dla mnie to ju¿ od jakiegoœ czasu powinni go zamkn¹æ w lochu albo wywaliæ na zbity pysk z obozu.
    AI_Output (other, self ,"DIA_Fallon_ZL_ERENS_15_07"); //Interesuj¹ce...
    AI_Output (self, other ,"DIA_Fallon_ZL_ERENS_03_08"); //Drobiazg...
	B_LogEntry               (KsiegaDlaVictora,"Kopacz Fallon powiedzia³, ¿e Erens by³ zamieszany w podejrzane rytua³y. Zapewne chodzi te¿ o t¹ ksiêgê, któr¹ w³aœnie mam przy sobie...");
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
    AI_Output (self, other ,"DIA_Fallon_HI_FALLO_03_02"); //Jestem Fallon. Niegdyœ by³em bednarzem w Trellis I ¿y³em dosyæ dobrze.
    AI_Output (other, self ,"DIA_Fallon_HI_FALLO_15_03"); //Domyœlam siê, ¿e coœ ci siê przytrafi³o.
    AI_Output (self, other ,"DIA_Fallon_HI_FALLO_03_04"); //Pewien idiota.
    AI_Output (other, self ,"DIA_Fallon_HI_FALLO_15_05"); //Jaki idiota?
    AI_Output (self, other ,"DIA_Fallon_HI_FALLO_03_06"); //Któregoœ dnia zamieszka³ ko³o mnie pewien cz³owiek. W dzieñ I w nocy urz¹dza³ libacje alkohole z kole¿kami.
    AI_Output (self, other ,"DIA_Fallon_HI_FALLO_03_07"); //Wydzieraj¹c siê, przeklinaj¹c I przygrywaj¹c sobie na lutni. Naskar¿y³em na niego do w³adz ale ¿aden po¿¹dkowy siê nie pojawi³.
    AI_Output (self, other ,"DIA_Fallon_HI_FALLO_03_08"); //I pewnego dnia przebra³a siê miara. Zak³u³em dokucznika sztyletem. I zrzucono mnie tutaj. O ile siê nie mylê dwa I pó³ roku temu.
    AI_Output (other, self ,"DIA_Fallon_HI_FALLO_15_09"); //Dlaczego do³¹czy³eœ do Kopaczy?
    AI_Output (self, other ,"DIA_Fallon_HI_FALLO_03_10"); //A do kogo mia³em? To by³ najlepszy wœród z³ych wyborów. Bo wszêdzie by³o bardziej lub mniej Ÿle.
    AI_Output (self, other ,"DIA_Fallon_HI_FALLO_03_11"); //Jedynie Magnaci... ale oni s¹ poza wszelk¹ kategori¹. Ponoæ kiedyœ byli zwyk³ymi skazañcami.
    AI_Output (self, other ,"DIA_Fallon_HI_FALLO_03_12"); //Chcia³bym zobaczyæ Gomeza w ³achmanach. To by³by ciekawy widok.
    AI_Output (other, self ,"DIA_Fallon_HI_FALLO_15_13"); //Z pewnoœci¹. Ale obawiam siê, ¿e sam Gomez nie chêtnie znów przywdzia³by taki strój.
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
   description	= "Ponoæ od dawna zalegasz pewn¹ sumkê rudy Stra¿nikowi imieniem John!";
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
    AI_Output (other, self ,"DIA_Fallon_JOHN_NUGGET_15_01"); //Ponoæ od dawna zalegasz pewn¹ sumkê rudy Stra¿nikowi imieniem John!
    AI_Output (self, other ,"DIA_Fallon_JOHN_NUGGET_03_02"); //To bzdura. Ta ³achudra zwyczajnie k³amie. Zawsze by³em na bie¿¹co z wszystkimi op³atami u niego gdy mia³ ten rewir podatkowy!
    AI_Output (other, self ,"DIA_Fallon_JOHN_NUGGET_15_03"); //John twierdzi, ¿e jesteœ mu winny 50 bry³ek rudy.
    AI_Output (self, other ,"DIA_Fallon_JOHN_NUGGET_03_04"); //Mówiê ci, ¿e to nie prawda.
    AI_Output (other, self ,"DIA_Fallon_JOHN_NUGGET_15_05"); //Dawaj t¹ rudê! I to migiem.
    AI_Output (self, other ,"DIA_Fallon_JOHN_NUGGET_03_06"); //Nie ma mowy. Nie zgodzê siê na to!
	Info_ClearChoices	(DIA_Fallon_JOHN_NUGGET);
    Info_AddChoice		(DIA_Fallon_JOHN_NUGGET, "I tak nic nie wskórasz. Jeœli nawet nie dasz mi rudy to John...", DIA_Fallon_JOHNN);
    Info_AddChoice		(DIA_Fallon_JOHN_NUGGET, "Dawaj t¹ rudê œmieciu.", DIA_Fallon_JOHNY);
};

FUNC VOID DIA_Fallon_JOHNN()
{
    AI_Output (other, self ,"DIA_Fallon_JOHNN_15_01"); //I tak nic nie wskórasz. Jeœli nawet nie dasz mi rudy to John sam siê o ni¹ upomni. I rozwali ci makówkê.
	AI_Output (self,  other,"DIA_Fallon_JOHNN_03_02"); //Ahh No nie. W sumie masz racje, mo¿e byæ tylko gorzej.
	AI_Output (self,  other,"DIA_Fallon_JOHNN_03_03"); //WeŸ t¹ rudê.
	AI_Output (self,  other,"DIA_Fallon_JOHNN_03_04"); //Mam nadzieje, ¿e ten podstêpny sukinsyn o mnie zapomni.
	AI_Output (other, self ,"DIA_Fallon_JOHNN_15_05"); //To ju¿ wasza wewnêtrzna sprawa. Do zobaczenia
	AI_Output (self,  other,"DIA_Fallon_JOHNN_03_06"); //Na twoim miejscu... Dobra nie wa¿ne...
	Fallon_Dlug = TRUE;
	B_GiveInvItems (self,other, itminugget, 50);
	
	B_LogEntry               (Blachostka,"Przekona³em Fallona do dobrowolnego oddania rudy.");
	
	
	
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Fallon_JOHNY()
{
    AI_Output (other, self ,"DIA_Fallon_JOHNY_15_01"); //Dawaj t¹ rudê œmieciu.
    AI_Output (self, other ,"DIA_Fallon_JOHNY_03_02"); //Wyszczekany jesteœ kundelku. Teraz stary Fallon nauczy ciê odpowiednio szacunku!
    AI_Output (other, self ,"DIA_Fallon_JOHNY_15_03"); //Mam nadzieje, ¿e nie umrê ze staroœci za nim wyci¹gniesz broñ I bêdziesz ni¹ wymachiwa³...
    AI_Output (self, other ,"DIA_Fallon_JOHNY_03_04"); //Stawaj do walki Ty nieopierzona m¹dralo...
	B_LogEntry               (Blachostka,"Fallon nie chce oddaæ rudy Johna, chyba muszê byæ nieco bardziej dosadny...");
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
    AI_Output (self, other ,"DIA_Fallon_Bojka_03_01"); //O bogowie... Moje koœci...
    AI_Output (other, self ,"DIA_Fallon_Bojka_15_02"); //Gdzie ruda dla Johna?
    AI_Output (self, other ,"DIA_Fallon_Bojka_03_03"); //Trzymaj. I zejdŸ mi z oczu!
    AI_Output (other, self ,"DIA_Fallon_Bojka_15_04"); //W sumie wykonuje tylko polecenia.
    AI_Output (self, other ,"DIA_Fallon_Bojka_03_05"); //Poszukujesz zapewne wszêdzie poparcia m³okosie. Ale John to pod³a gnida I z pewnoœci¹ daleko nie zajdziesz z takimi konszachtami.
    AI_Output (other, self ,"DIA_Fallon_Bojka_15_06"); //To ju¿ moja sprawa. A ty jakoœ zbierz siê do kupy.
	Fallon_Dlug = TRUE;
	B_LogEntry               (Blachostka,"Kopacz odda³ zaleg³¹ rudê, mogê wracaæ do Johna.");
	B_GiveInvItems (self,other, itminugget, 50);
    AI_StopProcessInfos	(self);
};

