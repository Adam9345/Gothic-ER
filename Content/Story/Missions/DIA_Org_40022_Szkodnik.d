

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
    AI_Output (self, other ,"DIA_Org_40022_Szkodnik_Alcohol_03_02"); //Wyno� si� st�d �achmyto!
    AI_Output (other, self ,"DIA_Org_40022_Szkodnik_Alcohol_15_03"); //Mam dla was flach� bimbru!
    AI_Output (self, other ,"DIA_Org_40022_Szkodnik_Alcohol_03_04"); //A sk�d ta nag�a szczodro��??
	AI_Output (other, self ,"DIA_Org_40022_Szkodnik_Alcohol_15_05"); //Chc� wkupi� si� w �ask� Laresa. Musz� zjedna� sobie jego ludzi.
	B_GiveInvItems (other,self, ItFo_Potion_Sleep,  1);
	AI_Output (self, other ,"DIA_Org_40022_Szkodnik_Alcohol_03_06"); //Aaaa... Rozumiem. W takim razie chyba skorzystamy z propozycji.
	AI_UseItem (self, ItFo_Potion_Sleep);
	AI_Output (other, self ,"DIA_Org_40022_Szkodnik_Alcohol_15_07"); //Cz�stujcie si� ch�opaki.
	CreateInvItem (ORG_40023_Szkodnik, ItFo_Potion_Sleep);
	AI_UseItem    (ORG_40023_Szkodnik, ItFo_Potion_Sleep);
	AI_Output (self, other ,"DIA_Org_40022_Szkodnik_Alcohol_03_08"); //Dzi�ki. 
	AI_Output (other, self ,"DIA_Org_40022_Szkodnik_Alcohol_15_09"); //Bardzo dobry, chocia� lekko inny ni� zazwyczaj. To jaki� nowy smak.
	CreateInvItem (ORG_40021_Szkodnik, ItFo_Potion_Sleep);
	AI_UseItem    (ORG_40021_Szkodnik, ItFo_Potion_Sleep);
	AI_Output (self, other ,"DIA_Org_40022_Szkodnik_Alcohol_03_10"); //Macie skosztujcie ch�opaki! Powiedzcie czy wolicie taki czy zwyczajny.
	AI_Output (other, self ,"DIA_Org_40022_Szkodnik_Alcohol_15_11"); //(Szeptem) Teraz tylko musz� dosta� si� do skrzyni...
	B_LogEntry               (CennyKwarcyt,"Poda�em nap�j usypiaj�cy Szkodnikom. Zasn�li jak sus�y. Dobra�em si� do skrzyni i zgarn��em ca�y kwarcyt jaki si� w niej znajdowa�.");
	AI_StopProcessInfos	(self);
		 
};

