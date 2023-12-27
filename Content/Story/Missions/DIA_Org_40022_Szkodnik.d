

//========================================
//-----------------> Cenny Kwarcyt
//========================================

INSTANCE DIA_Org_40022_Szkodnik_Alcohol (C_INFO)
{
   npc          = Org_40022_Szkodnik;
   nr           = 1;
   condition    = DIA_Org_40022_Szkodnik_Alcohol_Condition;
   information  = DIA_Org_40022_Szkodnik_Alcohol_Info;
   permanent	= 0;
   description	= "Witam panowie.";
};

FUNC INT DIA_Org_40022_Szkodnik_Alcohol_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Jeremiah_Trunek_End))  
    && (Npc_HasItems (hero, ItFo_Potion_Sleep)>=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Org_40022_Szkodnik_Alcohol_Info()
{
    AI_Output (other, self ,"DIA_Org_40022_Szkodnik_Alcohol_15_01"); //Witam panowie.
    AI_Output (self, other ,"DIA_Org_40022_Szkodnik_Alcohol_03_02"); //Wynoœ siê st¹d ³achmyto!
    AI_Output (other, self ,"DIA_Org_40022_Szkodnik_Alcohol_15_03"); //Mam dla was flachê bimbru!
    AI_Output (self, other ,"DIA_Org_40022_Szkodnik_Alcohol_03_04"); //A sk¹d ta nag³a szczodroœæ??
	AI_Output (other, self ,"DIA_Org_40022_Szkodnik_Alcohol_15_05"); //Chcê wkupiæ siê w ³askê Laresa. Muszê zjednaæ sobie jego ludzi.
	B_GiveInvItems (other,self, ItFo_Potion_Sleep,  1);
	AI_Output (self, other ,"DIA_Org_40022_Szkodnik_Alcohol_03_06"); //Aaaa... Rozumiem. W takim razie chyba skorzystamy z propozycji.
	AI_UseItem (self, ItFo_Potion_Sleep);
	AI_Output (other, self ,"DIA_Org_40022_Szkodnik_Alcohol_15_07"); //Czêstujcie siê ch³opaki.
	CreateInvItem (ORG_40023_Szkodnik, ItFo_Potion_Sleep);
	AI_UseItem    (ORG_40023_Szkodnik, ItFo_Potion_Sleep);
	AI_Output (self, other ,"DIA_Org_40022_Szkodnik_Alcohol_03_08"); //Dziêki. 
	AI_Output (other, self ,"DIA_Org_40022_Szkodnik_Alcohol_15_09"); //Bardzo dobry, chocia¿ lekko inny ni¿ zazwyczaj. To jakiœ nowy smak.
	CreateInvItem (ORG_40021_Szkodnik, ItFo_Potion_Sleep);
	AI_UseItem    (ORG_40021_Szkodnik, ItFo_Potion_Sleep);
	AI_Output (self, other ,"DIA_Org_40022_Szkodnik_Alcohol_03_10"); //Macie skosztujcie ch³opaki! Powiedzcie czy wolicie taki czy zwyczajny.
	AI_Output (other, self ,"DIA_Org_40022_Szkodnik_Alcohol_15_11"); //(Szeptem) Teraz tylko muszê dostaæ siê do skrzyni...
	B_LogEntry               (CennyKwarcyt,"Poda³em napój usypiaj¹cy Szkodnikom. Zasnêli jak sus³y. Dobra³em siê do skrzyni i zgarn¹³em ca³y kwarcyt jaki siê w niej znajdowa³.");
	AI_StopProcessInfos	(self);
		 
};

instance dia_org_40022_pickpocket(c_info) {
    npc = org_40022_szkodnik;
    nr = 900;
    condition = dia_org_40022_pickpocket_condition;
    information = dia_org_40022_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_org_40022_pickpocket_condition() {
	e_beklauen(baseThfChanceORG, 30);
};

func void dia_org_40022_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_org_40022_pickpocket);
	info_addchoice(dia_org_40022_pickpocket, dialog_back, dia_org_40022_pickpocket_back);
	info_addchoice(dia_org_40022_pickpocket, dialog_pickpocket, dia_org_40022_pickpocket_doit);
};

func void dia_org_40022_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_org_40022_pickpocket);
};

func void dia_org_40022_pickpocket_back() {
    info_clearchoices(dia_org_40022_pickpocket);
};