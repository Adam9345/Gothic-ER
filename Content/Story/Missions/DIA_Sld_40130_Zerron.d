// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Zerron_EXIT(C_INFO)
{
	npc             = Sld_40130_Zerron;
	nr              = 999;
	condition	= DIA_Zerron_EXIT_Condition;
	information	= DIA_Zerron_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Zerron_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Zerron_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Zerron_HELLO1 (C_INFO)
{
   npc          = Sld_40130_Zerron;
   nr           = 1;
   condition    = DIA_Zerron_HELLO1_Condition;
   information  = DIA_Zerron_HELLO1_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Zerron_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Zerron_HELLO1_Info()
{
    AI_Output (self, other ,"DIA_Zerron_HELLO1_03_01"); //Nie czêsto tu ktoœ zagl¹da.
    AI_Output (other, self ,"DIA_Zerron_HELLO1_15_02"); //Co ty nie powiesz...
    AI_Output (self, other ,"DIA_Zerron_HELLO1_03_03"); //Mo¿e interesuje cie ma³a wymiana?
    AI_Output (other, self ,"DIA_Zerron_HELLO1_15_04"); //Mianowicie?
    AI_Output (self, other ,"DIA_Zerron_HELLO1_03_05"); //Móg³byœ mi przynieœæ jakieœ ksiêgi, cholernie mi siê nudzi na tej wie¿y. A i przy okazji mo¿e dowiem siê czegoœ ciekawego.
    AI_Output (other, self ,"DIA_Zerron_HELLO1_15_06"); //No to do kolekcji mamy jeszcze wszechstronnego bibliofila...
    AI_Output (other, self ,"DIA_Zerron_HELLO1_15_07"); //A ty masz te¿ jakieœ ksi¹¿ki do odsprzedania?
    AI_Output (self, other ,"DIA_Zerron_HELLO1_03_08"); //Có¿... Te które posiadam przeczyta³em nie jeden raz wiêc czemu nie.
};
//========================================
//-----------------> Trade
//========================================

INSTANCE DIA_Zerron_Trade (C_INFO)
{
   npc          = Sld_40130_Zerron;
   nr           = 1;
   condition    = DIA_Zerron_Trade_Condition;
   information  = DIA_Zerron_Trade_Info;
   permanent	= 1;
   trade        = 1;
   description	= "(Handel)";
};

FUNC INT DIA_Zerron_Trade_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Zerron_Trade_Info()
{
    AI_Output (other, self ,"DIA_Zerron_Trade_15_01"); //Masz coœ na wymianê?
    AI_Output (self, other ,"DIA_Zerron_Trade_03_02"); //Tylko spójrz.
	B_ClearTreaderAmmo(self);
};


//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Zerron_GiveBooks (C_INFO)
{
   npc          = Sld_40130_Zerron;
   nr           = 1;
   condition    = DIA_Zerron_GiveBooks_Condition;
   information  = DIA_Zerron_GiveBooks_Info;
   permanent	= TRUE;
   description  = "Mam dla ciebie ksi¹¿kê...";
};

FUNC INT DIA_Zerron_GiveBooks_Condition()
{
if (Npc_KnowsInfo(hero,DIA_Zerron_HELLO1))
//&& (Npc_HasItems (other, ItWr_HistoryOfKhorinis) >=1)
{
    return TRUE;
};
};
FUNC VOID DIA_Zerron_GiveBooks_Info()
{
    
    AI_Output (other, self ,"DIA_Zerron_GiveBooks_15_01"); //Mam dla ciebie ksi¹¿kê...
	Info_Addchoice (DIA_Zerron_GiveBooks, DIALOG_BACK, DIA_ZERRON_BACKB);
   
	if(Npc_HasItems(other,Lehren_der_Goetter1) > 0)
	{
		Info_AddChoice(DIA_Zerron_GiveBooks,"M¹droœæ Bogów. Tom I",DIA_ZERRON_GETBOOKLehren_der_Goetter1);
	};
	if(Npc_HasItems(other,Lehren_der_Goetter2) > 0)
	{
		Info_AddChoice(DIA_Zerron_GiveBooks,"M¹droœæ Bogów. Tom II",DIA_ZERRON_GETBOOKLehren_der_Goetter2);
	};
	if(Npc_HasItems(other,Lehren_der_Goetter2) > 0)
	{
		Info_AddChoice(DIA_Zerron_GiveBooks,"M¹droœæ Bogów. Tom III",DIA_ZERRON_GETBOOKLehren_der_Goetter3);
	};
	if(Npc_HasItems(other,ItWr_HeritageOfAncestors) > 0)
	{
		Info_AddChoice(DIA_Zerron_GiveBooks,"Dziedzictwo Pradawnych",DIA_ZERRON_GETBOOKHeritageOfAncestors);
	};
	if(Npc_HasItems(other,ItWr_Maritura) > 0)
	{
		Info_AddChoice(DIA_Zerron_GiveBooks,"Praktyki nekromanckie. Maritury",DIA_ZERRON_GETBOOKItWr_Maritura);
	};
	if(Npc_HasItems(other,ItWr_Gulderns) > 0)
	{
		Info_AddChoice(DIA_Zerron_GiveBooks,"Guldernowie z Dhirim",DIA_ZERRON_GETBOOKItWr_Gulderns);
	};
	if(Npc_HasItems(other,ItWr_NiczymCiosSztyletu) > 0)
	{
		Info_AddChoice(DIA_Zerron_GiveBooks,"Niczym cios sztyletu",DIA_ZERRON_GETBOOKItWr_NiczymCiosSztyletu);
	};
	if(Npc_HasItems(other,ItWr_SpiritsRecipte1) > 0)
	{
		Info_AddChoice(DIA_Zerron_GiveBooks,"Prawdziwe alkohole",DIA_ZERRON_GETBOOKItWr_SpiritsRecipte1);
	};
	if(Npc_HasItems(other,ItWr_SpiritsRecipte2) > 0)
	{
		Info_AddChoice(DIA_Zerron_GiveBooks,"Prawdziwe alkohole",DIA_ZERRON_GETBOOKItWr_SpiritsRecipte2);
	};
	if(Npc_HasItems(other,ItWr_SpiritsRecipte3) > 0)
	{
		Info_AddChoice(DIA_Zerron_GiveBooks,"Prawdziwe alkohole",DIA_ZERRON_GETBOOKItWr_SpiritsRecipte3);
	};
	if(Npc_HasItems(other,Astronomie) > 0)
	{
		Info_AddChoice(DIA_Zerron_GiveBooks,"Astronomia",DIA_ZERRON_GETBOOKAstronomie);
	};

	if(Npc_HasItems(other,Das_magische_Erz) > 0)
	{
		Info_AddChoice(DIA_Zerron_GiveBooks,"Magiczna ruda",DIA_ZERRON_GETBOOKDas_magische_Erz);
	};
	if(Npc_HasItems(other,ItWr_Sundmarians) > 0)
	{
		Info_AddChoice(DIA_Zerron_GiveBooks,"Sundmarczycy",DIA_ZERRON_GETBOOKItWr_Sundmarians);
	};
	if(Npc_HasItems(other,ItWr_LordEtienne) > 0)
	{
		Info_AddChoice(DIA_Zerron_GiveBooks,"Lord Etienne",DIA_ZERRON_GETBOOKItWr_LordEtienne);
	};
	if(Npc_HasItems(other,Kampfkunst) > 0)
	{
		Info_AddChoice(DIA_Zerron_GiveBooks,"Sztuka walki",DIA_ZERRON_GETBOOKKampfkunst);
	};
	if(Npc_HasItems(other,Jagd_und_Beute) > 0)
	{
		Info_AddChoice(DIA_Zerron_GiveBooks,"£owy i zwierzyna",DIA_ZERRON_GETBOOKJagd_und_Beute);
	};
	if(Npc_HasItems(other,ItWr_HowToTrainSoldiers) > 0)
	{
		Info_AddChoice(DIA_Zerron_GiveBooks,"O szkoleniu ¿o³nierzy",DIA_ZERRON_GETBOOKItWr_HowToTrainSoldiers);
	};
	if(Npc_HasItems(other,ItWr_HistoryOfNordmar1) > 0)
	{
		Info_AddChoice(DIA_Zerron_GiveBooks,"Nordmarczycy. Tom I",DIA_ZERRON_GETBOOKItWr_HistoryOfNordmar1);
	};
	if(Npc_HasItems(other,ItWr_HistoryOfNordmar2) > 0)
	{
		Info_AddChoice(DIA_Zerron_GiveBooks,"Nordmarczycy. Tom II",DIA_ZERRON_GETBOOKItWr_HistoryOfNordmar2);
	};
	if(Npc_HasItems(other,Myrtanas_Lyrik) > 0)
	{
		Info_AddChoice(DIA_Zerron_GiveBooks,"Poezja Myrtañska",DIA_ZERRON_GETBOOKMyrtanas_Lyrik);
	};
	if(Npc_HasItems(other,ItWr_Inferiusy) > 0)
	{
		Info_AddChoice(DIA_Zerron_GiveBooks,"Inferiusy",DIA_ZERRON_GETBOOKItWr_Inferiusy);
	};
	if(Npc_HasItems(other,ItWr_HeinarSceletons) > 0)
	{
		Info_AddChoice(DIA_Zerron_GiveBooks,"Heinara wiedza o szkieletach",DIA_ZERRON_GETBOOKItWr_HeinarSceletons);
	};
	if(Npc_HasItems(other,ItWr_DruidsOfMyrtana1) > 0)
	{
		Info_AddChoice(DIA_Zerron_GiveBooks,"Druidzi Myrtany. Tom I",DIA_ZERRON_GETBOOKItWr_DruidsOfMyrtana1);
	};
	if(Npc_HasItems(other,ItWr_DruidsOfMyrtana2) > 0)
	{
		Info_AddChoice(DIA_Zerron_GiveBooks,"Druidzi Myrtany. Tom II",DIA_ZERRON_GETBOOKItWr_DruidsOfMyrtana2);
	};
	if(Npc_HasItems(other,ItWr_LostThiefSigns) > 0)
	{
		Info_AddChoice(DIA_Zerron_GiveBooks,"Utracone znaki z³odziejskie",DIA_ZERRON_GETBOOKItWr_LostThiefSigns);
	};
	if(Npc_HasItems(other,Wahre_Macht) > 0)
	{
		Info_AddChoice(DIA_Zerron_GiveBooks,"Prawdziwa Moc",DIA_ZERRON_GETBOOKWahre_Macht);
	};
	if(Npc_HasItems(other,Elementare_Arcanei) > 0)
	{
		Info_AddChoice(DIA_Zerron_GiveBooks,"Arcanum ¯ywio³ów",DIA_ZERRON_GETBOOKElementare_Arcanei);
	};
	if(Npc_HasItems(other,ItWr_HaranHo1) > 0)
	{
		Info_AddChoice(DIA_Zerron_GiveBooks,"Haran Ho. Tom I",DIA_ZERRON_GETBOOKItWr_HaranHo1);
	};
    if(Npc_HasItems(other,ItWr_HaranHo2) > 0)
	{
		Info_AddChoice(DIA_Zerron_GiveBooks,"Haran Ho. Tom II",DIA_ZERRON_GETBOOKItWr_HaranHo2);
	};
	if(Npc_HasItems(other,ItWr_HaranHo3) > 0)
	{
		Info_AddChoice(DIA_Zerron_GiveBooks,"Haran Ho. Tom III",DIA_ZERRON_GETBOOKItWr_HaranHo3);
	};
	if(Npc_HasItems(other,ItWr_HaranHo4) > 0)
	{
		Info_AddChoice(DIA_Zerron_GiveBooks,"Haran Ho. Tom IV",DIA_ZERRON_GETBOOKItWr_HaranHo4);
	};
	if(Npc_HasItems(other,ItWr_HistoryOfVarant1) > 0)
	{
		Info_AddChoice(DIA_Zerron_GiveBooks,"Dzieje Varantu. Tom I",DIA_ZERRON_GETBOOKItWr_HistoryOfVarant1);
	};
	if(Npc_HasItems(other,ItWr_HistoryOfVarant2) > 0)
	{
		Info_AddChoice(DIA_Zerron_GiveBooks,"Dzieje Varantu. Tom II",DIA_ZERRON_GETBOOKItWr_HistoryOfVarant2);
	};
	if(Npc_HasItems(other,ItWr_HistoryOfVarant3) > 0)
	{
		Info_AddChoice(DIA_Zerron_GiveBooks,"Dzieje Varantu. Tom III",DIA_ZERRON_GETBOOKItWr_HistoryOfVarant3);
	};
	if(Npc_HasItems(other,ItWr_HistoryOfVarant4) > 0)
	{
		Info_AddChoice(DIA_Zerron_GiveBooks,"Dzieje Varantu. Tom IV",DIA_ZERRON_GETBOOKItWr_HistoryOfVarant4);
	};
	if(Npc_HasItems(other,ItWr_HistoryOfVarant5) > 0)
	{
		Info_AddChoice(DIA_Zerron_GiveBooks,"Dzieje Varantu. Tom V",DIA_ZERRON_GETBOOKItWr_HistoryOfVarant5);
	};
	if(Npc_HasItems(other,ItWr_HistoryOfVarant6) > 0)
	{
		Info_AddChoice(DIA_Zerron_GiveBooks,"Dzieje Varantu. Tom VI",DIA_ZERRON_GETBOOKItWr_HistoryOfVarant6);
	};
	if(Npc_HasItems(other,ItWr_HistoryOfVarant7) > 0)
	{
		Info_AddChoice(DIA_Zerron_GiveBooks,"Dzieje Varantu. Tom VII",DIA_ZERRON_GETBOOKItWr_HistoryOfVarant7);
	};
	if(Npc_HasItems(other,ItWr_HistoryOfVarant8) > 0)
	{
		Info_AddChoice(DIA_Zerron_GiveBooks,"Dzieje Varantu. Tom VIII",DIA_ZERRON_GETBOOKItWr_HistoryOfVarant8);
	};
	if(Npc_HasItems(other,ItWr_HistoryOfVarant9) > 0)
	{
		Info_AddChoice(DIA_Zerron_GiveBooks,"Dzieje Varantu. Tom IX",DIA_ZERRON_GETBOOKItWr_HistoryOfVarant9);
	};
	if(Npc_HasItems(other,ItWr_HistoryOfVarant10) > 0)
	{
		Info_AddChoice(DIA_Zerron_GiveBooks,"Dzieje Varantu. Tom X",DIA_ZERRON_GETBOOKItWr_HistoryOfVarant10);
	};	
	if(Npc_HasItems(other,ItWr_HistoryOfVarant11) > 0)
	{
		Info_AddChoice(DIA_Zerron_GiveBooks,"Dzieje Varantu. Tom XI",DIA_ZERRON_GETBOOKItWr_HistoryOfVarant11);
	};
	if(Npc_HasItems(other,ItWr_HistoryOfVarant12) > 0)
	{
		Info_AddChoice(DIA_Zerron_GiveBooks,"Dzieje Varantu. Tom XII",DIA_ZERRON_GETBOOKItWr_HistoryOfVarant12);
	};	
	if(Npc_HasItems(other,ItWr_WaterTry) > 0)
	{
		Info_AddChoice(DIA_Zerron_GiveBooks,"Próba Wody",DIA_ZERRON_GETBOOKItWr_WaterTry);
	};	
	if(Npc_HasItems(other,ItWr_VarensBook) > 0)
	{
		Info_AddChoice(DIA_Zerron_GiveBooks,"Klucz do Myrtany",DIA_ZERRON_GETBOOKItWr_VarensBook);
	};	
	if(Npc_HasItems(other,ItWr_BrotherhoodOfHolyBlades1) > 0)
	{
		Info_AddChoice(DIA_Zerron_GiveBooks,"Zaprzysiêgli. Tom I",DIA_ZERRON_GETBOOKItWr_BrotherhoodOfHolyBlades1);
	};	
	if(Npc_HasItems(other,ItWr_BrotherhoodOfHolyBlades2) > 0)
	{
		Info_AddChoice(DIA_Zerron_GiveBooks,"Zaprzysiêgli. Tom II",DIA_ZERRON_GETBOOKItWr_BrotherhoodOfHolyBlades2);
	};
		if(Npc_HasItems(other,ItWr_BrotherhoodOfHolyBlades3) > 0)
	{
		Info_AddChoice(DIA_Zerron_GiveBooks,"Zaprzysiêgli. Tom III",DIA_ZERRON_GETBOOKItWr_BrotherhoodOfHolyBlades3);
	};
		if(Npc_HasItems(other,ItWr_OurGods) > 0)
	{
		Info_AddChoice(DIA_Zerron_GiveBooks,"Rozwa¿ania o bogach",DIA_ZERRON_GETBOOKItWr_OurGods);
	};
		if(Npc_HasItems(other,ItWr_AlchemySprintPotions) > 0)
	{
		Info_AddChoice(DIA_Zerron_GiveBooks,"Mikstury szybkoœci",DIA_ZERRON_GETBOOKItWr_AlchemySprintPotions);
	};
		if(Npc_HasItems(other,ItWr_AlchemyPermPotions1) > 0)
	{
		Info_AddChoice(DIA_Zerron_GiveBooks,"Mikstury trwa³e. Tom I",DIA_ZERRON_GETBOOKItWr_AlchemyPermPotions1);
	};
		if(Npc_HasItems(other,ItWr_AlchemyPermPotions2) > 0)
	{
		Info_AddChoice(DIA_Zerron_GiveBooks,"Mikstury trwa³e. Tom II",DIA_ZERRON_GETBOOKItWr_AlchemyPermPotions2);
	};
		if(Npc_HasItems(other,ItWr_Markwart1) > 0)
	{
		Info_AddChoice(DIA_Zerron_GiveBooks,"Kodeks Markwarta. Tom I",DIA_ZERRON_GETBOOKItWr_Markwart1);
	};
		if(Npc_HasItems(other,ItWr_Markwart2) > 0)
	{
		Info_AddChoice(DIA_Zerron_GiveBooks,"Kodeks Markwarta. Tom II",DIA_ZERRON_GETBOOKItWr_Markwart2);
	};
		if(Npc_HasItems(other,ItWr_Markwart3) > 0)
	{
		Info_AddChoice(DIA_Zerron_GiveBooks,"Kodeks Markwarta. Tom III",DIA_ZERRON_GETBOOKItWr_Markwart3);
	};
		if(Npc_HasItems(other,ItWr_Markwart4) > 0)
	{
		Info_AddChoice(DIA_Zerron_GiveBooks,"Kodeks Markwarta. Tom IV",DIA_ZERRON_GETBOOKItWr_Markwart4);
	};
		if(Npc_HasItems(other,ItWr_Markwart5) > 0)
	{
		Info_AddChoice(DIA_Zerron_GiveBooks,"Kodeks Markwarta. Tom V",DIA_ZERRON_GETBOOKItWr_Markwart5);
	};
	/*	if(Npc_HasItems(other,ItWr_Markwart6) > 0)
	{
		Info_AddChoice(DIA_Zerron_GiveBooks,"Kodeks Markwarta. Tom VI",DIA_ZERRON_GETBOOK);
	};
		if(Npc_HasItems(other,ItWr_Markwart7) > 0)
	{
		Info_AddChoice(DIA_Zerron_GiveBooks,"Kodeks Markwarta. Tom VII",DIA_ZERRON_GETBOOK);
	};
	
		if(Npc_HasItems(other,ItWr_Markwart8) > 0)
	{
		Info_AddChoice(DIA_Zerron_GiveBooks,"Kodeks Markwarta. Tom VIII",DIA_ZERRON_GETBOOK);
	};
	*/
		if(Npc_HasItems(other,ItWr_Markwart9) > 0)
	{
		Info_AddChoice(DIA_Zerron_GiveBooks,"Kodeks Markwarta. Tom IX",DIA_ZERRON_GETBOOKItWr_Markwart9);
	};
		
			if(Npc_HasItems(other,ItWr_MerchantInheritance) > 0)
	{
		Info_AddChoice(DIA_Zerron_GiveBooks,"Przywilej kupiecki",DIA_ZERRON_GETBOOKItWr_MerchantInheritance);
	};
			if(Npc_HasItems(other,ItWr_UsouriusInheritance) > 0)
	{
		Info_AddChoice(DIA_Zerron_GiveBooks,"Przywilej lichwiarski",DIA_ZERRON_GETBOOKItWr_UsouriusInheritance);
	};
			if(Npc_HasItems(other,ItWr_PrivilegeInheritance) > 0)
	{
		Info_AddChoice(DIA_Zerron_GiveBooks,"Przywilej dziedziczenia",DIA_ZERRON_GETBOOKItWr_PrivilegeInheritance);
	};
			if(Npc_HasItems(other,ItWr_Bloodfly_01) > 0)
	{
		Info_AddChoice(DIA_Zerron_GiveBooks,"Krwiopijcy",DIA_ZERRON_GETBOOKItWr_Bloodfly_01);
	};
			if(Npc_HasItems(other,ItWr_Ascetic) > 0)
	{
		Info_AddChoice(DIA_Zerron_GiveBooks,"Przypowieœæ o dwóch ascetach",DIA_ZERRON_GETBOOKItWr_Ascetic);
	};
	
				if(Npc_HasItems(other,ItWr_Velladio) > 0)
	{
		Info_AddChoice(DIA_Zerron_GiveBooks,"Rzecz o mistrzu Velladio",DIA_ZERRON_GETBOOKItWr_Velladio);
	};
	
	if(Npc_HasItems(other,Geheimnisse_der_Zauberei) > 0)
	{
		Info_AddChoice(DIA_Zerron_GiveBooks,"Tajniki Magii",DIA_ZERRON_GETBOOKGeheimnisse_der_Zauberei);
	};
		if(Npc_HasItems(other,Goettergabe) > 0)
	{
		Info_AddChoice(DIA_Zerron_GiveBooks,"Dar od bogów",DIA_ZERRON_GETBOOKGoettergabe);
	};
			if(Npc_HasItems(other,ItWr_HeavyArmor) > 0)
	{
		Info_AddChoice(DIA_Zerron_GiveBooks,"Ciê¿ka zbroja",DIA_ZERRON_GETBOOKItWr_HeavyArmor);
	};
};
func void DIA_ZERRON_BACKB()
{
	Info_ClearChoices 	(DIA_Zerron_GiveBooks);
};

FUNC VOID DIA_ZERRON_GETBOOKLehren_der_Goetter1()
{
    AI_Output (other, self ,"DIA_ZERRON_GETBOOK_15_01"); //Trzymaj.
	Npc_RemoveInvItem	(Sld_40130_Zerron,Lehren_der_Goetter1);
	B_GiveInvItems (other,self, Lehren_der_Goetter1, 1);
	B_GiveInvItems (self,other, itminugget, 20);
    AI_Output (self, other ,"DIA_ZERRON_GETBOOK_03_02"); //Dziêki oto zap³ata.
    B_GiveXP(15);
	Npc_RemoveInvItem	(Sld_40130_Zerron,Lehren_der_Goetter1);

};
FUNC VOID DIA_ZERRON_GETBOOKLehren_der_Goetter2()
{
    AI_Output (other, self ,"DIA_ZERRON_GETBOOK_15_01"); //Trzymaj.
	B_GiveInvItems (other,self, Lehren_der_Goetter2, 1);
	B_GiveInvItems (self,other, itminugget, 20);
    AI_Output (self, other ,"DIA_ZERRON_GETBOOK_03_02"); //Dziêki oto zap³ata.
    B_GiveXP(15);
	Npc_RemoveInvItem	(Sld_40130_Zerron,Lehren_der_Goetter2);

};
FUNC VOID DIA_ZERRON_GETBOOKLehren_der_Goetter3()
{
    AI_Output (other, self ,"DIA_ZERRON_GETBOOK_15_01"); //Trzymaj.
	B_GiveInvItems (other,self, Lehren_der_Goetter3, 1);
	B_GiveInvItems (self,other, itminugget, 20);
    AI_Output (self, other ,"DIA_ZERRON_GETBOOK_03_02"); //Dziêki oto zap³ata.
    B_GiveXP(15);
	Npc_RemoveInvItem	(Sld_40130_Zerron,Lehren_der_Goetter3);

};
FUNC VOID DIA_ZERRON_GETBOOKHeritageOfAncestors()
{
    AI_Output (other, self ,"DIA_ZERRON_GETBOOK_15_01"); //Trzymaj.
	B_GiveInvItems (other,self, ItWr_HeritageOfAncestors, 1);
	B_GiveInvItems (self,other, itminugget, 20);
    AI_Output (self, other ,"DIA_ZERRON_GETBOOK_03_02"); //Dziêki oto zap³ata.
    B_GiveXP(15);
	Npc_RemoveInvItem	(Sld_40130_Zerron,ItWr_HeritageOfAncestors);

};
FUNC VOID DIA_ZERRON_GETBOOKItWr_Maritura()
{
    AI_Output (other, self ,"DIA_ZERRON_GETBOOK_15_01"); //Trzymaj.
	B_GiveInvItems (other,self, ItWr_Maritura, 1);
	B_GiveInvItems (self,other, itminugget, 20);
    AI_Output (self, other ,"DIA_ZERRON_GETBOOK_03_02"); //Dziêki oto zap³ata.
    B_GiveXP(15);
	Npc_RemoveInvItem	(Sld_40130_Zerron,ItWr_Maritura);

};
FUNC VOID DIA_ZERRON_GETBOOKItWr_Gulderns()
{
    AI_Output (other, self ,"DIA_ZERRON_GETBOOK_15_01"); //Trzymaj.
	B_GiveInvItems (other,self, ItWr_Gulderns, 1);
	B_GiveInvItems (self,other, itminugget, 20);
    AI_Output (self, other ,"DIA_ZERRON_GETBOOK_03_02"); //Dziêki oto zap³ata.
    B_GiveXP(15);
	Npc_RemoveInvItem	(Sld_40130_Zerron,ItWr_Gulderns);

};
FUNC VOID DIA_ZERRON_GETBOOKItWr_NiczymCiosSztyletu()
{
    AI_Output (other, self ,"DIA_ZERRON_GETBOOK_15_01"); //Trzymaj.
	B_GiveInvItems (other,self, ItWr_NiczymCiosSztyletu, 1);
	B_GiveInvItems (self,other, itminugget, 20);
    AI_Output (self, other ,"DIA_ZERRON_GETBOOK_03_02"); //Dziêki oto zap³ata.
    B_GiveXP(15);
	Npc_RemoveInvItem	(Sld_40130_Zerron,ItWr_NiczymCiosSztyletu);

};
FUNC VOID DIA_ZERRON_GETBOOKItWr_SpiritsRecipte1()
{
    AI_Output (other, self ,"DIA_ZERRON_GETBOOK_15_01"); //Trzymaj.
	B_GiveInvItems (other,self, ItWr_SpiritsRecipte1, 1);
	B_GiveInvItems (self,other, itminugget, 20);
    AI_Output (self, other ,"DIA_ZERRON_GETBOOK_03_02"); //Dziêki oto zap³ata.
    B_GiveXP(15);
	Npc_RemoveInvItem	(Sld_40130_Zerron,ItWr_SpiritsRecipte1);

};
FUNC VOID DIA_ZERRON_GETBOOKItWr_SpiritsRecipte2()
{
    AI_Output (other, self ,"DIA_ZERRON_GETBOOK_15_01"); //Trzymaj.
	B_GiveInvItems (other,self, ItWr_SpiritsRecipte2, 1);
	B_GiveInvItems (self,other, itminugget, 20);
    AI_Output (self, other ,"DIA_ZERRON_GETBOOK_03_02"); //Dziêki oto zap³ata.
    B_GiveXP(15);
Npc_RemoveInvItem	(Sld_40130_Zerron,ItWr_SpiritsRecipte2);
};
FUNC VOID DIA_ZERRON_GETBOOKItWr_SpiritsRecipte3()
{
    AI_Output (other, self ,"DIA_ZERRON_GETBOOK_15_01"); //Trzymaj.
	B_GiveInvItems (other,self, ItWr_SpiritsRecipte3, 1);
	B_GiveInvItems (self,other, itminugget, 20);
    AI_Output (self, other ,"DIA_ZERRON_GETBOOK_03_02"); //Dziêki oto zap³ata.
    B_GiveXP(15);
Npc_RemoveInvItem	(Sld_40130_Zerron,ItWr_SpiritsRecipte3);
};
FUNC VOID DIA_ZERRON_GETBOOKAstronomie()
{
    AI_Output (other, self ,"DIA_ZERRON_GETBOOK_15_01"); //Trzymaj.
	B_GiveInvItems (other,self, Astronomie, 1);
	B_GiveInvItems (self,other, itminugget, 20);
    AI_Output (self, other ,"DIA_ZERRON_GETBOOK_03_02"); //Dziêki oto zap³ata.
    B_GiveXP(15);
Npc_RemoveInvItem	(Sld_40130_Zerron,Astronomie);
};

FUNC VOID DIA_ZERRON_GETBOOKDas_magische_Erz()
{
    AI_Output (other, self ,"DIA_ZERRON_GETBOOK_15_01"); //Trzymaj.
	B_GiveInvItems (other,self, Das_magische_Erz, 1);
	B_GiveInvItems (self,other, itminugget, 20);
    AI_Output (self, other ,"DIA_ZERRON_GETBOOK_03_02"); //Dziêki oto zap³ata.
    B_GiveXP(15);
Npc_RemoveInvItem	(Sld_40130_Zerron,Das_magische_Erz);
};
FUNC VOID DIA_ZERRON_GETBOOKItWr_Sundmarians()
{
    AI_Output (other, self ,"DIA_ZERRON_GETBOOK_15_01"); //Trzymaj.
	B_GiveInvItems (other,self, ItWr_Sundmarians, 1);
	B_GiveInvItems (self,other, itminugget, 20);
    AI_Output (self, other ,"DIA_ZERRON_GETBOOK_03_02"); //Dziêki oto zap³ata.
    B_GiveXP(15);
Npc_RemoveInvItem	(Sld_40130_Zerron,ItWr_Sundmarians);
};
FUNC VOID DIA_ZERRON_GETBOOKItWr_LordEtienne()
{
    AI_Output (other, self ,"DIA_ZERRON_GETBOOK_15_01"); //Trzymaj.
	B_GiveInvItems (other,self, ItWr_LordEtienne, 1);
	B_GiveInvItems (self,other, itminugget, 20);
    AI_Output (self, other ,"DIA_ZERRON_GETBOOK_03_02"); //Dziêki oto zap³ata.
    B_GiveXP(15);
Npc_RemoveInvItem	(Sld_40130_Zerron,ItWr_LordEtienne);
};
FUNC VOID DIA_ZERRON_GETBOOKKampfkunst()
{
    AI_Output (other, self ,"DIA_ZERRON_GETBOOK_15_01"); //Trzymaj.
	B_GiveInvItems (other,self, Kampfkunst, 1);
	B_GiveInvItems (self,other, itminugget, 20);
    AI_Output (self, other ,"DIA_ZERRON_GETBOOK_03_02"); //Dziêki oto zap³ata.
    B_GiveXP(15);
Npc_RemoveInvItem	(Sld_40130_Zerron,Kampfkunst);
};
FUNC VOID DIA_ZERRON_GETBOOKJagd_und_Beute()
{
    AI_Output (other, self ,"DIA_ZERRON_GETBOOK_15_01"); //Trzymaj.
	B_GiveInvItems (other,self, Jagd_und_Beute, 1);
	B_GiveInvItems (self,other, itminugget, 20);
    AI_Output (self, other ,"DIA_ZERRON_GETBOOK_03_02"); //Dziêki oto zap³ata.
    B_GiveXP(15);
Npc_RemoveInvItem	(Sld_40130_Zerron,Jagd_und_Beute);
};
FUNC VOID DIA_ZERRON_GETBOOKItWr_HowToTrainSoldiers()
{
    AI_Output (other, self ,"DIA_ZERRON_GETBOOK_15_01"); //Trzymaj.
	B_GiveInvItems (other,self, ItWr_HowToTrainSoldiers, 1);
	B_GiveInvItems (self,other, itminugget, 20);
    AI_Output (self, other ,"DIA_ZERRON_GETBOOK_03_02"); //Dziêki oto zap³ata.
    B_GiveXP(15);
Npc_RemoveInvItem	(Sld_40130_Zerron,ItWr_HowToTrainSoldiers);
};
FUNC VOID DIA_ZERRON_GETBOOKItWr_HistoryOfNordmar1()
{
    AI_Output (other, self ,"DIA_ZERRON_GETBOOK_15_01"); //Trzymaj.
	B_GiveInvItems (other,self, ItWr_HistoryOfNordmar1, 1);
	B_GiveInvItems (self,other, itminugget, 20);
    AI_Output (self, other ,"DIA_ZERRON_GETBOOK_03_02"); //Dziêki oto zap³ata.
    B_GiveXP(15);
Npc_RemoveInvItem	(Sld_40130_Zerron,ItWr_HistoryOfNordmar1);
};
FUNC VOID DIA_ZERRON_GETBOOKItWr_HistoryOfNordmar2()
{
    AI_Output (other, self ,"DIA_ZERRON_GETBOOK_15_01"); //Trzymaj.
	B_GiveInvItems (other,self, ItWr_HistoryOfNordmar2, 1);
	B_GiveInvItems (self,other, itminugget, 20);
    AI_Output (self, other ,"DIA_ZERRON_GETBOOK_03_02"); //Dziêki oto zap³ata.
    B_GiveXP(15);
Npc_RemoveInvItem	(Sld_40130_Zerron,ItWr_HistoryOfNordmar2);
};
FUNC VOID DIA_ZERRON_GETBOOKMyrtanas_Lyrik()
{
    AI_Output (other, self ,"DIA_ZERRON_GETBOOK_15_01"); //Trzymaj.
	B_GiveInvItems (other,self, Myrtanas_Lyrik, 1);
	B_GiveInvItems (self,other, itminugget, 20);
    AI_Output (self, other ,"DIA_ZERRON_GETBOOK_03_02"); //Dziêki oto zap³ata.
    B_GiveXP(15);
Npc_RemoveInvItem	(Sld_40130_Zerron,Myrtanas_Lyrik);
};
FUNC VOID DIA_ZERRON_GETBOOKItWr_Inferiusy()
{
    AI_Output (other, self ,"DIA_ZERRON_GETBOOK_15_01"); //Trzymaj.
	B_GiveInvItems (other,self, ItWr_Inferiusy, 1);
	B_GiveInvItems (self,other, itminugget, 20);
    AI_Output (self, other ,"DIA_ZERRON_GETBOOK_03_02"); //Dziêki oto zap³ata.
    B_GiveXP(15);
Npc_RemoveInvItem	(Sld_40130_Zerron,ItWr_Inferiusy);
};
FUNC VOID DIA_ZERRON_GETBOOKItWr_HeinarSceletons()
{
    AI_Output (other, self ,"DIA_ZERRON_GETBOOK_15_01"); //Trzymaj.
	B_GiveInvItems (other,self, ItWr_HeinarSceletons, 1);
	B_GiveInvItems (self,other, itminugget, 20);
    AI_Output (self, other ,"DIA_ZERRON_GETBOOK_03_02"); //Dziêki oto zap³ata.
    B_GiveXP(15);
Npc_RemoveInvItem	(Sld_40130_Zerron,ItWr_HeinarSceletons);
};
FUNC VOID DIA_ZERRON_GETBOOKItWr_DruidsOfMyrtana1()
{
    AI_Output (other, self ,"DIA_ZERRON_GETBOOK_15_01"); //Trzymaj.
	B_GiveInvItems (other,self, ItWr_DruidsOfMyrtana1, 1);
	B_GiveInvItems (self,other, itminugget, 20);
    AI_Output (self, other ,"DIA_ZERRON_GETBOOK_03_02"); //Dziêki oto zap³ata.
    B_GiveXP(15);
Npc_RemoveInvItem	(Sld_40130_Zerron,ItWr_DruidsOfMyrtana1);
};
FUNC VOID DIA_ZERRON_GETBOOKItWr_DruidsOfMyrtana2()
{
    AI_Output (other, self ,"DIA_ZERRON_GETBOOK_15_01"); //Trzymaj.
	B_GiveInvItems (other,self, ItWr_DruidsOfMyrtana2, 1);
	B_GiveInvItems (self,other, itminugget, 20);
    AI_Output (self, other ,"DIA_ZERRON_GETBOOK_03_02"); //Dziêki oto zap³ata.
    B_GiveXP(15);
Npc_RemoveInvItem	(Sld_40130_Zerron,ItWr_DruidsOfMyrtana2);
};
FUNC VOID DIA_ZERRON_GETBOOKItWr_LostThiefSigns()
{
    AI_Output (other, self ,"DIA_ZERRON_GETBOOK_15_01"); //Trzymaj.
	B_GiveInvItems (other,self, ItWr_LostThiefSigns, 1);
	B_GiveInvItems (self,other, itminugget, 20);
    AI_Output (self, other ,"DIA_ZERRON_GETBOOK_03_02"); //Dziêki oto zap³ata.
    B_GiveXP(15);
Npc_RemoveInvItem	(Sld_40130_Zerron,ItWr_LostThiefSigns);
};
FUNC VOID DIA_ZERRON_GETBOOKWahre_Macht()
{
    AI_Output (other, self ,"DIA_ZERRON_GETBOOK_15_01"); //Trzymaj.
	B_GiveInvItems (other,self, Wahre_Macht, 1);
	B_GiveInvItems (self,other, itminugget, 20);
    AI_Output (self, other ,"DIA_ZERRON_GETBOOK_03_02"); //Dziêki oto zap³ata.
    B_GiveXP(15);
Npc_RemoveInvItem	(Sld_40130_Zerron,Wahre_Macht);
};
FUNC VOID DIA_ZERRON_GETBOOKElementare_Arcanei()
{
    AI_Output (other, self ,"DIA_ZERRON_GETBOOK_15_01"); //Trzymaj.
	B_GiveInvItems (other,self, Elementare_Arcanei, 1);
	B_GiveInvItems (self,other, itminugget, 20);
    AI_Output (self, other ,"DIA_ZERRON_GETBOOK_03_02"); //Dziêki oto zap³ata.
    B_GiveXP(15);
Npc_RemoveInvItem	(Sld_40130_Zerron,Elementare_Arcanei);
};
FUNC VOID DIA_ZERRON_GETBOOKItWr_HaranHo1()
{
    AI_Output (other, self ,"DIA_ZERRON_GETBOOK_15_01"); //Trzymaj.
	B_GiveInvItems (other,self, ItWr_HaranHo1, 1);
	B_GiveInvItems (self,other, itminugget, 20);
    AI_Output (self, other ,"DIA_ZERRON_GETBOOK_03_02"); //Dziêki oto zap³ata.
    B_GiveXP(15);
Npc_RemoveInvItem	(Sld_40130_Zerron,ItWr_HaranHo1);
};
FUNC VOID DIA_ZERRON_GETBOOKItWr_HaranHo2()
{
    AI_Output (other, self ,"DIA_ZERRON_GETBOOK_15_01"); //Trzymaj.
	B_GiveInvItems (other,self, ItWr_HaranHo2, 1);
	B_GiveInvItems (self,other, itminugget, 20);
    AI_Output (self, other ,"DIA_ZERRON_GETBOOK_03_02"); //Dziêki oto zap³ata.
    B_GiveXP(15);
Npc_RemoveInvItem	(Sld_40130_Zerron,ItWr_HaranHo2);
};
FUNC VOID DIA_ZERRON_GETBOOKItWr_HaranHo3()
{
    AI_Output (other, self ,"DIA_ZERRON_GETBOOK_15_01"); //Trzymaj.
	B_GiveInvItems (other,self, ItWr_HaranHo3, 1);
	B_GiveInvItems (self,other, itminugget, 20);
    AI_Output (self, other ,"DIA_ZERRON_GETBOOK_03_02"); //Dziêki oto zap³ata.
    B_GiveXP(15);
Npc_RemoveInvItem	(Sld_40130_Zerron,ItWr_HaranHo3);
};
FUNC VOID DIA_ZERRON_GETBOOKItWr_HaranHo4()
{
    AI_Output (other, self ,"DIA_ZERRON_GETBOOK_15_01"); //Trzymaj.
	B_GiveInvItems (other,self, ItWr_HaranHo4, 1);
	B_GiveInvItems (self,other, itminugget, 20);
    AI_Output (self, other ,"DIA_ZERRON_GETBOOK_03_02"); //Dziêki oto zap³ata.
    B_GiveXP(15);
Npc_RemoveInvItem	(Sld_40130_Zerron,ItWr_HaranHo4);
};
FUNC VOID DIA_ZERRON_GETBOOKItWr_HistoryOfVarant1()
{
    AI_Output (other, self ,"DIA_ZERRON_GETBOOK_15_01"); //Trzymaj.
	B_GiveInvItems (other,self, ItWr_HistoryOfVarant1, 1);
	B_GiveInvItems (self,other, itminugget, 20);
    AI_Output (self, other ,"DIA_ZERRON_GETBOOK_03_02"); //Dziêki oto zap³ata.
    B_GiveXP(15);
Npc_RemoveInvItem	(Sld_40130_Zerron,ItWr_HistoryOfVarant1);
};
FUNC VOID DIA_ZERRON_GETBOOKItWr_HistoryOfVarant2()
{
    AI_Output (other, self ,"DIA_ZERRON_GETBOOK_15_01"); //Trzymaj.
	B_GiveInvItems (other,self, ItWr_HistoryOfVarant2, 1);
	B_GiveInvItems (self,other, itminugget, 20);
    AI_Output (self, other ,"DIA_ZERRON_GETBOOK_03_02"); //Dziêki oto zap³ata.
    B_GiveXP(15);
Npc_RemoveInvItem	(Sld_40130_Zerron,ItWr_HistoryOfVarant2);
};
FUNC VOID DIA_ZERRON_GETBOOKItWr_HistoryOfVarant3()
{
    AI_Output (other, self ,"DIA_ZERRON_GETBOOK_15_01"); //Trzymaj.
	B_GiveInvItems (other,self, ItWr_HistoryOfVarant3, 1);
	B_GiveInvItems (self,other, itminugget, 20);
    AI_Output (self, other ,"DIA_ZERRON_GETBOOK_03_02"); //Dziêki oto zap³ata.
    B_GiveXP(15);
Npc_RemoveInvItem	(Sld_40130_Zerron,ItWr_HistoryOfVarant3);
};
FUNC VOID DIA_ZERRON_GETBOOKItWr_HistoryOfVarant4()
{
    AI_Output (other, self ,"DIA_ZERRON_GETBOOK_15_01"); //Trzymaj.
	B_GiveInvItems (other,self, ItWr_HistoryOfVarant4, 1);
	B_GiveInvItems (self,other, itminugget, 20);
    AI_Output (self, other ,"DIA_ZERRON_GETBOOK_03_02"); //Dziêki oto zap³ata.
    B_GiveXP(15);
Npc_RemoveInvItem	(Sld_40130_Zerron,ItWr_HistoryOfVarant4);
};
FUNC VOID DIA_ZERRON_GETBOOKItWr_HistoryOfVarant5()
{
    AI_Output (other, self ,"DIA_ZERRON_GETBOOK_15_01"); //Trzymaj.
	B_GiveInvItems (other,self, ItWr_HistoryOfVarant5, 1);
	B_GiveInvItems (self,other, itminugget, 20);
    AI_Output (self, other ,"DIA_ZERRON_GETBOOK_03_02"); //Dziêki oto zap³ata.
    B_GiveXP(15);
Npc_RemoveInvItem	(Sld_40130_Zerron,ItWr_HistoryOfVarant5);
};
FUNC VOID DIA_ZERRON_GETBOOKItWr_HistoryOfVarant6()
{
    AI_Output (other, self ,"DIA_ZERRON_GETBOOK_15_01"); //Trzymaj.
	B_GiveInvItems (other,self, ItWr_HistoryOfVarant6, 1);
	B_GiveInvItems (self,other, itminugget, 20);
    AI_Output (self, other ,"DIA_ZERRON_GETBOOK_03_02"); //Dziêki oto zap³ata.
    B_GiveXP(15);
Npc_RemoveInvItem	(Sld_40130_Zerron,ItWr_HistoryOfVarant6);
};
FUNC VOID DIA_ZERRON_GETBOOKItWr_HistoryOfVarant7()
{
    AI_Output (other, self ,"DIA_ZERRON_GETBOOK_15_01"); //Trzymaj.
	B_GiveInvItems (other,self, ItWr_HistoryOfVarant7, 1);
	B_GiveInvItems (self,other, itminugget, 20);
    AI_Output (self, other ,"DIA_ZERRON_GETBOOK_03_02"); //Dziêki oto zap³ata.
    B_GiveXP(15);
Npc_RemoveInvItem	(Sld_40130_Zerron,ItWr_HistoryOfVarant7);
};
FUNC VOID DIA_ZERRON_GETBOOKItWr_HistoryOfVarant8()
{
    AI_Output (other, self ,"DIA_ZERRON_GETBOOK_15_01"); //Trzymaj.
	B_GiveInvItems (other,self, ItWr_HistoryOfVarant8, 1);
	B_GiveInvItems (self,other, itminugget, 20);
    AI_Output (self, other ,"DIA_ZERRON_GETBOOK_03_02"); //Dziêki oto zap³ata.
    B_GiveXP(15);
Npc_RemoveInvItem	(Sld_40130_Zerron,ItWr_HistoryOfVarant8);
};
FUNC VOID DIA_ZERRON_GETBOOKItWr_HistoryOfVarant9()
{
    AI_Output (other, self ,"DIA_ZERRON_GETBOOK_15_01"); //Trzymaj.
	B_GiveInvItems (other,self, ItWr_HistoryOfVarant9, 1);
	B_GiveInvItems (self,other, itminugget, 20);
    AI_Output (self, other ,"DIA_ZERRON_GETBOOK_03_02"); //Dziêki oto zap³ata.
    B_GiveXP(15);
Npc_RemoveInvItem	(Sld_40130_Zerron,ItWr_HistoryOfVarant9);
};
FUNC VOID DIA_ZERRON_GETBOOKItWr_HistoryOfVarant10()
{
    AI_Output (other, self ,"DIA_ZERRON_GETBOOK_15_01"); //Trzymaj.
	B_GiveInvItems (other,self, ItWr_HistoryOfVarant10, 1);
	B_GiveInvItems (self,other, itminugget, 20);
    AI_Output (self, other ,"DIA_ZERRON_GETBOOK_03_02"); //Dziêki oto zap³ata.
    B_GiveXP(15);
Npc_RemoveInvItem	(Sld_40130_Zerron,ItWr_HistoryOfVarant10);
};
FUNC VOID DIA_ZERRON_GETBOOKItWr_HistoryOfVarant11()
{
    AI_Output (other, self ,"DIA_ZERRON_GETBOOK_15_01"); //Trzymaj.
	B_GiveInvItems (other,self, ItWr_HistoryOfVarant11, 1);
	B_GiveInvItems (self,other, itminugget, 20);
    AI_Output (self, other ,"DIA_ZERRON_GETBOOK_03_02"); //Dziêki oto zap³ata.
    B_GiveXP(15);
Npc_RemoveInvItem	(Sld_40130_Zerron,ItWr_HistoryOfVarant11);
};
FUNC VOID DIA_ZERRON_GETBOOKItWr_HistoryOfVarant12()
{
    AI_Output (other, self ,"DIA_ZERRON_GETBOOK_15_01"); //Trzymaj.
	B_GiveInvItems (other,self, ItWr_HistoryOfVarant12, 1);
	B_GiveInvItems (self,other, itminugget, 20);
    AI_Output (self, other ,"DIA_ZERRON_GETBOOK_03_02"); //Dziêki oto zap³ata.
    B_GiveXP(15);
Npc_RemoveInvItem	(Sld_40130_Zerron,ItWr_HistoryOfVarant12);
};
FUNC VOID DIA_ZERRON_GETBOOKItWr_WaterTry()
{
    AI_Output (other, self ,"DIA_ZERRON_GETBOOK_15_01"); //Trzymaj.
	B_GiveInvItems (other,self, ItWr_WaterTry, 1);
	B_GiveInvItems (self,other, itminugget, 20);
    AI_Output (self, other ,"DIA_ZERRON_GETBOOK_03_02"); //Dziêki oto zap³ata.
    B_GiveXP(15);
Npc_RemoveInvItem	(Sld_40130_Zerron,ItWr_WaterTry);
};
FUNC VOID DIA_ZERRON_GETBOOKItWr_VarensBook()
{
    AI_Output (other, self ,"DIA_ZERRON_GETBOOK_15_01"); //Trzymaj.
	B_GiveInvItems (other,self, ItWr_VarensBook, 1);
	B_GiveInvItems (self,other, itminugget, 20);
    AI_Output (self, other ,"DIA_ZERRON_GETBOOK_03_02"); //Dziêki oto zap³ata.
    B_GiveXP(15);
Npc_RemoveInvItem	(Sld_40130_Zerron,ItWr_VarensBook);
};
FUNC VOID DIA_ZERRON_GETBOOKItWr_BrotherhoodOfHolyBlades1()
{
    AI_Output (other, self ,"DIA_ZERRON_GETBOOK_15_01"); //Trzymaj.
	B_GiveInvItems (other,self, ItWr_BrotherhoodOfHolyBlades1, 1);
	B_GiveInvItems (self,other, itminugget, 20);
    AI_Output (self, other ,"DIA_ZERRON_GETBOOK_03_02"); //Dziêki oto zap³ata.
    B_GiveXP(15);
Npc_RemoveInvItem	(Sld_40130_Zerron,ItWr_BrotherhoodOfHolyBlades1);
};
FUNC VOID DIA_ZERRON_GETBOOKItWr_BrotherhoodOfHolyBlades2()
{
    AI_Output (other, self ,"DIA_ZERRON_GETBOOK_15_01"); //Trzymaj.
	B_GiveInvItems (other,self, ItWr_BrotherhoodOfHolyBlades2, 1);
	B_GiveInvItems (self,other, itminugget, 20);
    AI_Output (self, other ,"DIA_ZERRON_GETBOOK_03_02"); //Dziêki oto zap³ata.
    B_GiveXP(15);
Npc_RemoveInvItem	(Sld_40130_Zerron,ItWr_BrotherhoodOfHolyBlades2);
};
FUNC VOID DIA_ZERRON_GETBOOKItWr_BrotherhoodOfHolyBlades3()
{
    AI_Output (other, self ,"DIA_ZERRON_GETBOOK_15_01"); //Trzymaj.
	B_GiveInvItems (other,self, ItWr_BrotherhoodOfHolyBlades3, 1);
	B_GiveInvItems (self,other, itminugget, 20);
    AI_Output (self, other ,"DIA_ZERRON_GETBOOK_03_02"); //Dziêki oto zap³ata.
    B_GiveXP(15);
Npc_RemoveInvItem	(Sld_40130_Zerron,ItWr_BrotherhoodOfHolyBlades3);
};
FUNC VOID DIA_ZERRON_GETBOOKItWr_OurGods()
{
    AI_Output (other, self ,"DIA_ZERRON_GETBOOK_15_01"); //Trzymaj.
	B_GiveInvItems (other,self, ItWr_OurGods, 1);
	B_GiveInvItems (self,other, itminugget, 20);
    AI_Output (self, other ,"DIA_ZERRON_GETBOOK_03_02"); //Dziêki oto zap³ata.
    B_GiveXP(15);
Npc_RemoveInvItem	(Sld_40130_Zerron,ItWr_OurGods);
};
FUNC VOID DIA_ZERRON_GETBOOKItWr_AlchemySprintPotions()
{
    AI_Output (other, self ,"DIA_ZERRON_GETBOOK_15_01"); //Trzymaj.
	B_GiveInvItems (other,self, ItWr_AlchemySprintPotions, 1);
	B_GiveInvItems (self,other, itminugget, 20);
    AI_Output (self, other ,"DIA_ZERRON_GETBOOK_03_02"); //Dziêki oto zap³ata.
    B_GiveXP(15);
Npc_RemoveInvItem	(Sld_40130_Zerron,ItWr_AlchemySprintPotions);
};
FUNC VOID DIA_ZERRON_GETBOOKItWr_AlchemyPermPotions1()
{
    AI_Output (other, self ,"DIA_ZERRON_GETBOOK_15_01"); //Trzymaj.
	B_GiveInvItems (other,self, ItWr_AlchemyPermPotions1, 1);
	B_GiveInvItems (self,other, itminugget, 20);
    AI_Output (self, other ,"DIA_ZERRON_GETBOOK_03_02"); //Dziêki oto zap³ata.
    B_GiveXP(15);
Npc_RemoveInvItem	(Sld_40130_Zerron,ItWr_AlchemyPermPotions1);
};
FUNC VOID DIA_ZERRON_GETBOOKItWr_AlchemyPermPotions2()
{
    AI_Output (other, self ,"DIA_ZERRON_GETBOOK_15_01"); //Trzymaj.
	B_GiveInvItems (other,self, ItWr_AlchemyPermPotions2, 1);
	B_GiveInvItems (self,other, itminugget, 20);
    AI_Output (self, other ,"DIA_ZERRON_GETBOOK_03_02"); //Dziêki oto zap³ata.
    B_GiveXP(15);
Npc_RemoveInvItem	(Sld_40130_Zerron,ItWr_AlchemyPermPotions2);
};
FUNC VOID DIA_ZERRON_GETBOOKItWr_Markwart1()
{
    AI_Output (other, self ,"DIA_ZERRON_GETBOOK_15_01"); //Trzymaj.
	B_GiveInvItems (other,self, ItWr_Markwart1, 1);
	B_GiveInvItems (self,other, itminugget, 20);
    AI_Output (self, other ,"DIA_ZERRON_GETBOOK_03_02"); //Dziêki oto zap³ata.
    B_GiveXP(15);
Npc_RemoveInvItem	(Sld_40130_Zerron,ItWr_Markwart1);
};
FUNC VOID DIA_ZERRON_GETBOOKItWr_Markwart2()
{
    AI_Output (other, self ,"DIA_ZERRON_GETBOOK_15_01"); //Trzymaj.
	B_GiveInvItems (other,self, ItWr_Markwart2, 1);
	B_GiveInvItems (self,other, itminugget, 20);
    AI_Output (self, other ,"DIA_ZERRON_GETBOOK_03_02"); //Dziêki oto zap³ata.
    B_GiveXP(15);
Npc_RemoveInvItem	(Sld_40130_Zerron,ItWr_Markwart2);
};
FUNC VOID DIA_ZERRON_GETBOOKItWr_Markwart3()
{
    AI_Output (other, self ,"DIA_ZERRON_GETBOOK_15_01"); //Trzymaj.
	B_GiveInvItems (other,self, ItWr_Markwart3, 1);
	B_GiveInvItems (self,other, itminugget, 20);
    AI_Output (self, other ,"DIA_ZERRON_GETBOOK_03_02"); //Dziêki oto zap³ata.
    B_GiveXP(15);
Npc_RemoveInvItem	(Sld_40130_Zerron,ItWr_Markwart3);
};
FUNC VOID DIA_ZERRON_GETBOOKItWr_Markwart4()
{
    AI_Output (other, self ,"DIA_ZERRON_GETBOOK_15_01"); //Trzymaj.
	B_GiveInvItems (other,self, ItWr_Markwart4, 1);
	B_GiveInvItems (self,other, itminugget, 20);
    AI_Output (self, other ,"DIA_ZERRON_GETBOOK_03_02"); //Dziêki oto zap³ata.
    B_GiveXP(15);
Npc_RemoveInvItem	(Sld_40130_Zerron,ItWr_Markwart4);
};
FUNC VOID DIA_ZERRON_GETBOOKItWr_Markwart5()
{
    AI_Output (other, self ,"DIA_ZERRON_GETBOOK_15_01"); //Trzymaj.
	B_GiveInvItems (other,self, ItWr_Markwart5, 1);
	B_GiveInvItems (self,other, itminugget, 20);
    AI_Output (self, other ,"DIA_ZERRON_GETBOOK_03_02"); //Dziêki oto zap³ata.
    B_GiveXP(15);
Npc_RemoveInvItem	(Sld_40130_Zerron,ItWr_Markwart5);
};
FUNC VOID DIA_ZERRON_GETBOOKItWr_Markwart9()
{
    AI_Output (other, self ,"DIA_ZERRON_GETBOOK_15_01"); //Trzymaj.
	B_GiveInvItems (other,self, ItWr_Markwart9, 1);
	B_GiveInvItems (self,other, itminugget, 20);
    AI_Output (self, other ,"DIA_ZERRON_GETBOOK_03_02"); //Dziêki oto zap³ata.
    B_GiveXP(15);
Npc_RemoveInvItem	(Sld_40130_Zerron,ItWr_Markwart9);
};

FUNC VOID DIA_ZERRON_GETBOOKItWr_MerchantInheritance()
{
    AI_Output (other, self ,"DIA_ZERRON_GETBOOK_15_01"); //Trzymaj.
	B_GiveInvItems (other,self, ItWr_MerchantInheritance, 1);
	B_GiveInvItems (self,other, itminugget, 20);
    AI_Output (self, other ,"DIA_ZERRON_GETBOOK_03_02"); //Dziêki oto zap³ata.
    B_GiveXP(15);
Npc_RemoveInvItem	(Sld_40130_Zerron,ItWr_MerchantInheritance);
};
FUNC VOID DIA_ZERRON_GETBOOKItWr_UsouriusInheritance()
{
    AI_Output (other, self ,"DIA_ZERRON_GETBOOK_15_01"); //Trzymaj.
	B_GiveInvItems (other,self, ItWr_UsouriusInheritance, 1);
	B_GiveInvItems (self,other, itminugget, 20);
    AI_Output (self, other ,"DIA_ZERRON_GETBOOK_03_02"); //Dziêki oto zap³ata.
    B_GiveXP(15);
Npc_RemoveInvItem	(Sld_40130_Zerron,ItWr_UsouriusInheritance);
};
FUNC VOID DIA_ZERRON_GETBOOKItWr_PrivilegeInheritance()
{
    AI_Output (other, self ,"DIA_ZERRON_GETBOOK_15_01"); //Trzymaj.
	B_GiveInvItems (other,self, ItWr_PrivilegeInheritance, 1);
	B_GiveInvItems (self,other, itminugget, 20);
    AI_Output (self, other ,"DIA_ZERRON_GETBOOK_03_02"); //Dziêki oto zap³ata.
    B_GiveXP(15);
Npc_RemoveInvItem	(Sld_40130_Zerron,ItWr_PrivilegeInheritance);
};
FUNC VOID DIA_ZERRON_GETBOOKItWr_Bloodfly_01()
{
    AI_Output (other, self ,"DIA_ZERRON_GETBOOK_15_01"); //Trzymaj.
	B_GiveInvItems (other,self, ItWr_Bloodfly_01, 1);
	B_GiveInvItems (self,other, itminugget, 20);
    AI_Output (self, other ,"DIA_ZERRON_GETBOOK_03_02"); //Dziêki oto zap³ata.
    B_GiveXP(15);
Npc_RemoveInvItem	(Sld_40130_Zerron,ItWr_Bloodfly_01);
};
FUNC VOID DIA_ZERRON_GETBOOKItWr_Ascetic()
{
    AI_Output (other, self ,"DIA_ZERRON_GETBOOK_15_01"); //Trzymaj.
	B_GiveInvItems (other,self, ItWr_Ascetic, 1);
	B_GiveInvItems (self,other, itminugget, 20);
    AI_Output (self, other ,"DIA_ZERRON_GETBOOK_03_02"); //Dziêki oto zap³ata.
    B_GiveXP(15);
Npc_RemoveInvItem	(Sld_40130_Zerron,ItWr_Ascetic);
};

FUNC VOID DIA_ZERRON_GETBOOKItWr_Velladio()
{
    AI_Output (other, self ,"DIA_ZERRON_GETBOOK_15_01"); //Trzymaj.
	B_GiveInvItems (other,self, ItWr_Velladio, 1);
	B_GiveInvItems (self,other, itminugget, 20);
    AI_Output (self, other ,"DIA_ZERRON_GETBOOK_03_02"); //Dziêki oto zap³ata.
    B_GiveXP(15);
Npc_RemoveInvItem	(Sld_40130_Zerron,ItWr_Velladio);
};

FUNC VOID DIA_ZERRON_GETBOOKGeheimnisse_der_Zauberei()
{
    AI_Output (other, self ,"DIA_ZERRON_GETBOOK_15_01"); //Trzymaj.
	B_GiveInvItems (other,self, Geheimnisse_der_Zauberei, 1);
	B_GiveInvItems (self,other, itminugget, 20);
    AI_Output (self, other ,"DIA_ZERRON_GETBOOK_03_02"); //Dziêki oto zap³ata.
    B_GiveXP(15);
Npc_RemoveInvItem	(Sld_40130_Zerron,Geheimnisse_der_Zauberei);
};

FUNC VOID DIA_ZERRON_GETBOOKGoettergabe()
{
    AI_Output (other, self ,"DIA_ZERRON_GETBOOK_15_01"); //Trzymaj.
	B_GiveInvItems (other,self, Goettergabe, 1);
	B_GiveInvItems (self,other, itminugget, 20);
    AI_Output (self, other ,"DIA_ZERRON_GETBOOK_03_02"); //Dziêki oto zap³ata.
    B_GiveXP(15);
Npc_RemoveInvItem	(Sld_40130_Zerron,Goettergabe);
};


FUNC VOID DIA_ZERRON_GETBOOKItWr_HeavyArmor()
{
    AI_Output (other, self ,"DIA_ZERRON_GETBOOK_15_01"); //Trzymaj.
	B_GiveInvItems (other,self, ItWr_HeavyArmor, 1);
	B_GiveInvItems (self,other, itminugget, 20);
    AI_Output (self, other ,"DIA_ZERRON_GETBOOK_03_02"); //Dziêki oto zap³ata.
    B_GiveXP(15);
Npc_RemoveInvItem	(Sld_40130_Zerron,ItWr_HeavyArmor);
};

instance dia_zerron_pickpocket(c_info) {
    npc = sld_40130_zerron;
    nr = 900;
    condition = dia_zerron_pickpocket_condition;
    information = dia_zerron_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_zerron_pickpocket_condition() {
	e_beklauen(baseThfChanceSLD, 35);
};

func void dia_zerron_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_zerron_pickpocket);
	info_addchoice(dia_zerron_pickpocket, dialog_back, dia_zerron_pickpocket_back);
	info_addchoice(dia_zerron_pickpocket, dialog_pickpocket, dia_zerron_pickpocket_doit);
};

func void dia_zerron_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_zerron_pickpocket);
};

func void dia_zerron_pickpocket_back() {
    info_clearchoices(dia_zerron_pickpocket);
};