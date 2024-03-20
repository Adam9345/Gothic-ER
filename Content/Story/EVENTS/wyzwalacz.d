

var string s1,s2,s3,s4,s5;


///////////////////////////
//wyzwalacz - funkcja g��wna
/////////////////////
	func void fuckcja_ucieczka_scar ()
	{
	var c_npc torrez; 		torrez = Hlp_GetNpc (KDF_405_Torrez);
	var c_npc torwache213; 	torwache213 = Hlp_GetNpc (Grd_213_Torwache);
	var c_npc rodriguez; 	rodriguez = Hlp_GetNpc (KDF_400_Rodriguez);
	var c_npc torwache212; 	torwache212 = Hlp_GetNpc (Grd_212_Torwache);
	var c_npc torwache215; 	torwache215 = Hlp_GetNpc (Grd_215_Torwache);
	var c_npc torwache214; 	torwache214 = Hlp_GetNpc (Grd_214_Torwache);
	var c_npc torwache216; 	torwache216 = Hlp_GetNpc (Grd_216_Torwache);
	var c_npc torwache217; 	torwache217 = Hlp_GetNpc (Grd_217_Torwache);
	var c_npc grd232; 	grd232 = Hlp_GetNpc (Grd_232_Gardist);
	var c_npc grd252; 	grd252 = Hlp_GetNpc (Grd_252_Gardist);
	
	torwache213.Npctype = NPCTYPE_GUARD;
	torwache212.Npctype = NPCTYPE_GUARD;
	torwache215.Npctype = NPCTYPE_GUARD;
	torwache214.Npctype = NPCTYPE_GUARD;
	torwache216.Npctype = NPCTYPE_GUARD;
	torwache217.Npctype = NPCTYPE_GUARD;
	
	 Npc_SetPermAttitude (torrez, ATT_HOSTILE);
	 Npc_SetPermAttitude (torwache213, ATT_HOSTILE);
	 Npc_SetPermAttitude (rodriguez, ATT_HOSTILE);
	 Npc_SetPermAttitude (torwache212, ATT_HOSTILE);
	 Npc_SetPermAttitude (torwache215, ATT_HOSTILE);
	 Npc_SetPermAttitude (torwache214, ATT_HOSTILE);
	 Npc_SetPermAttitude (torwache216, ATT_HOSTILE);
	 Npc_SetPermAttitude (torwache217, ATT_HOSTILE);
	 Npc_SetPermAttitude (grd232, ATT_HOSTILE);
	 Npc_SetPermAttitude (grd252, ATT_HOSTILE);
	};
	
	func void fuckcja_ucieczka_scar2 ()
	{
	var c_npc torrez; 		torrez = Hlp_GetNpc (KDF_405_Torrez);
	var c_npc torwache213; 	torwache213 = Hlp_GetNpc (Grd_213_Torwache);
	var c_npc rodriguez; 	rodriguez = Hlp_GetNpc (KDF_400_Rodriguez);
	var c_npc torwache212; 	torwache212 = Hlp_GetNpc (Grd_212_Torwache);
	var c_npc torwache215; 	torwache215 = Hlp_GetNpc (Grd_215_Torwache);
	var c_npc torwache214; 	torwache214 = Hlp_GetNpc (Grd_214_Torwache);
	var c_npc torwache216; 	torwache216 = Hlp_GetNpc (Grd_216_Torwache);
	var c_npc torwache217; 	torwache217 = Hlp_GetNpc (Grd_217_Torwache);
	var c_npc grd232; 	grd232 = Hlp_GetNpc (Grd_232_Gardist);
	var c_npc grd252; 	grd252 = Hlp_GetNpc (Grd_252_Gardist);
	
	torwache213.Npctype = NPCTYPE_FRIEND;
	torwache212.Npctype = NPCTYPE_FRIEND;
	torwache215.Npctype = NPCTYPE_FRIEND;
	torwache214.Npctype = NPCTYPE_FRIEND;
	torwache216.Npctype = NPCTYPE_FRIEND;
	torwache217.Npctype = NPCTYPE_FRIEND;
	
	 Npc_SetPermAttitude (torrez, ATT_NEUTRAL);
	 Npc_SetPermAttitude (torwache213, ATT_NEUTRAL);
	 Npc_SetPermAttitude (rodriguez, ATT_NEUTRAL);
	 Npc_SetPermAttitude (torwache212, ATT_NEUTRAL);
	 Npc_SetPermAttitude (torwache215, ATT_NEUTRAL);
	 Npc_SetPermAttitude (torwache214, ATT_NEUTRAL);
	 Npc_SetPermAttitude (torwache216, ATT_NEUTRAL);
	 Npc_SetPermAttitude (torwache217, ATT_NEUTRAL);
	 Npc_SetPermAttitude (grd232, ATT_NEUTRAL);
	 Npc_SetPermAttitude (grd252, ATT_NEUTRAL);
	};
	

//////////////////////
//
//SZYBKA PODRӯ
//
/////////////////////

func void WYZWALACZ ()
{
 
 if (loc_OC == false) && (Npc_GetDistToWP (hero, "OW_PATH_1") < 1000)
 {
 loc_OC = true;
 PrintS_Ext ("Nowa lokacja szybkiej podr�y: Stary Ob�z!",COL_White) ;
 };
 
 if (loc_ricefields == false) && (Npc_GetDistToWP (hero, "NC_PATH55") < 1000)
 {
 loc_ricefields = true;
 PrintS_Ext ("Nowa lokacja szybkiej podr�y: Pola ry�owe!",COL_White) ;
 };
 
 if (loc_NC_cave == false) && (Npc_GetDistToWP (hero, "NC_PATH_TO_PIT_04") < 1000)
 {
 loc_NC_cave = true;
 PrintS_Ext ("Nowa lokacja szybkiej podr�y: Nowy Ob�z - jaskinia!",COL_White) ;
 };
 
 if (loc_FMC == false) && (Npc_GetDistToWP (hero, "FMC_PATH06") < 1000)
 {
 loc_FMC = true;
 PrintS_Ext ("Nowa lokacja szybkiej podr�y: Kocio�!",COL_White) ;
 };
 
  if (loc_OMC == false) && (Npc_GetDistToWP (hero, "OW_OM_ENTRANCE01") < 1000)
 {
 loc_OMC = true;
 PrintS_Ext ("Nowa lokacja szybkiej podr�y: Ob�z przy Starej Kopalni!",COL_White) ;
 };
 
 if (loc_QC == false) && (Npc_GetDistToWP (hero, "LOCATION_11_06") < 1000)
 {
 loc_QC = true;
 PrintS_Ext ("Nowa lokacja szybkiej podr�y: Ob�z Bandyt�w!",COL_White) ;
 };
 
 if (loc_hunters == false) && (Npc_GetDistToWP (hero, "SPAWN_TALL_PATH_BANDITOS2") < 1000)
 {
 loc_hunters = true;
 PrintS_Ext ("Nowa lokacja szybkiej podr�y: Ob�z my�liwych!",COL_White) ;
 };
 
 if (loc_abmine == false) && (Npc_GetDistToWP (hero, "OW_PATH_1_17") < 1000)
 {
 loc_abmine = true;
 PrintS_Ext ("Nowa lokacja szybkiej podr�y: Opuszczona kopalnia!",COL_White) ;
 };
 
 if (loc_orchunters == false) && (Npc_GetDistToWP (hero, "HUNTERS_LADDERR2") < 1000)
 {
 loc_orchunters = true;
 PrintS_Ext ("Nowa lokacja szybkiej podr�y: �owcy Ork�w!",COL_White) ;
 };
 
 if (loc_citadel == false) && (Npc_GetDistToWP (hero, "CASTLE_19") < 1000)
 {
 loc_citadel = true;
 PrintS_Ext ("Nowa lokacja szybkiej podr�y: Cytadela!",COL_White) ;
 };
 
  if (loc_cavalorn == false) && (Npc_GetDistToWP (hero, "PATH_OC_NC_4") < 1000)
 {
 loc_cavalorn = true;
 PrintS_Ext ("Nowa lokacja szybkiej podr�y: Chata Cavalorna!",COL_White) ;
 };
 
   if (loc_aidan == false) && (Npc_GetDistToWP (hero, "PATH_OC_NC_14") < 1000)
 {
 loc_aidan = true;
 PrintS_Ext ("Nowa lokacja szybkiej podr�y: Chata Aidana!",COL_White) ;
 };
 
    if (loc_klasztor == false) && (Npc_GetDistToWP (hero, "OW_PATH_BRIDGE_01") < 1000)
 {
 loc_klasztor = true;
 PrintS_Ext ("Nowa lokacja szybkiej podr�y: Most przy klasztorze!",COL_White) ;
 };
 
     if (loc_fogtower == false) && (Npc_GetDistToWP (hero, "OW_PATH_174") < 1000)
 {
 loc_fogtower = true;
 PrintS_Ext ("Nowa lokacja szybkiej podr�y: Wie�a Mgie�!",COL_White) ;
 };
 
      if (loc_klify == false) && (Npc_GetDistToWP (hero, "PATH_FOGTOWER_CLIFF04") < 1000)
 {
 loc_klify = true;
 PrintS_Ext ("Nowa lokacja szybkiej podr�y: Klify!",COL_White) ;
 };
 
       if (loc_psicamp == false) && (Npc_GetDistToWP (hero, "PSI_ENTRANCE") < 1000)
 {
 loc_psicamp = true;
 PrintS_Ext ("Nowa lokacja szybkiej podr�y: Ob�z Bractwa!",COL_White) ;
 };
 
 if (loc_swamp == false) && (Npc_GetDistToWP (hero, "OW_PATH_BLOODFLY08_SPAWN01") < 1000)
 {
 loc_swamp = true;
 PrintS_Ext ("Nowa lokacja szybkiej podr�y: Bagno!",COL_White) ;
 };
 
  if (loc_forest == false) && (Npc_GetDistToWP (hero, "OW_PATH_292") < 1000)
 {
 loc_forest = true;
 PrintS_Ext ("Nowa lokacja szybkiej podr�y: Wielki Las!",COL_White) ;
 };
 
   if (loc_orcdesert == false) && (Npc_GetDistToWP (hero, "OW_ORC_LOOKOUT_2_02_MOVE2") < 1000)
 {
 loc_orcdesert = true;
 PrintS_Ext ("Nowa lokacja szybkiej podr�y: Ziemie Ork�w!",COL_White) ;
 };





var int DannyHelp_var;
if (Npc_GetDistToWP (hero, "OM_CAVE1_93") < 1000) && (DannyHelp_var == false)
{
Snd_Play		("DannyHelp");
DannyHelp_var = true;
};







var int once_killJosh;
if (Npc_HasItems (hero, itmi_joshpocket) >=1) && (!Npc_KnowsInfo (hero, DIA_Hysen_Fight)) && (once_killJosh == false)
{
B_KillNpc (BAN_1606_Josh);
once_killJosh = true;
};



//************ZADANIE OD AIDANA
/*
if (Npc_GetDistToWP (hero, "ER_CAVE_AIDANQUEST") < 1000) && (hero_explore_aidanquestcave == false) && (MIS_Aidan_Quest == LOG_RUNNING)
{
hero_explore_aidanquestcave = true;
B_LogEntry                     (CH3_Aidan_Quest,"W miejscu o kt�rym m�wi� Aidan znalaz�em skrzyni�. Wygl�da na solidnie zamkni�t�. Musz� wr�ci� do Aidana i zapyta�, czy wie jak j� otworzy�.");
};
*/



//************JASKINIA HUGO
if (Npc_GetDistToWP (hero, "BOFUR") < 700) && (Bylem_wodospad == false) && (MIS_HunterHugo == LOG_RUNNING)
{
Bylem_wodospad = true; 
B_LogEntry        (CH1_HunterHugo,"Znalaz�em jaskini�, jednak wydaj� si� by� ona zupe�nie pusta.");
};

//GWM


//************RUDA EMANUELA


if (Npc_IsDead(BAN_40067_Victor)) && (Npc_KnowsInfo(hero,DIA_Victor_ZL_PRAY)) && (VictorZL_Dead == false)
{
    VictorZL_Dead = true;
	B_LogEntry               (KsiegaDlaVictora,"Zabi�em Victora i zako�czy�em jego chore obrz�dy. Chyba wiem co sta�o si� z moimi poprzednikami. Dziennik Victora to ostateczny dow�d jego zbrodni. Pora uda� si� do Quentina i wyja�ni� zagadk� znikaj�cych ludzi.");
};	

//************PO��W INFO
 if (Npc_GetDistToWP (hero, "POMOST") < 300) || (Npc_GetDistToWP (hero, "POMOST2") < 300) || (Npc_GetDistToWP (hero, "POMOST3") < 300) || (Npc_GetDistToWP (hero, "POMOST4") < 300) || (Npc_GetDistToWP (hero, "POMOST5") < 300)
|| (Npc_GetDistToWP (hero, "POMOST6") < 300) || (Npc_GetDistToWP (hero, "POMOST7") < 300) || (Npc_GetDistToWP (hero, "POMOST8") < 300) || (Npc_GetDistToWP (hero, "POMOST9") < 300) || (Npc_GetDistToWP (hero, "POMOST10") < 300)
 {
PrintScreen ("Mo�esz tu �owi�!", 1, 90, "Font_Old_10_White_Hi.TGA", 2);

};





//************UPICIE

//************PALISADA W OB	
	if (Kapitel == 4)
	{
	Wld_SendTrigger("PALISADA1");
	};
//************OKRADZIONY PRZEZ SZAKALA	
		if (odliczanie_po_kradziezy)
		{
		odliczanie_po_kradziezy = odliczanie_po_kradziezy - 1;
		
		if (odliczanie_po_kradziezy == 0)
		{
	
		PrintS_Ext("ZORIENTOWAOE� SI�, �E SZAKAL CI� OKRAD�", COL_RED);
		
		};
		
		};
//************ZAB�JSTWO BLIZNY		
	if (czas_ucieczki_scar)
    {
        czas_ucieczki_scar = czas_ucieczki_scar - 1;
		PrintScreen(ConcatStrings(ConcatStrings(IntToString(czas_ucieczki_scar / 60)," : "),IntToString(czas_ucieczki_scar % 60)),1,1,"font_old_10_white.tga",2);
        if (czas_ucieczki_scar == 0)
		{
            fuckcja_ucieczka_scar();
        };
    };

	
		if (czas_ucieczki_scar2)
		{
        czas_ucieczki_scar2 = czas_ucieczki_scar2 - 1;
		PrintScreen	("NIE WRACAJ DO OBOZU!", -1,-1,"font_new_10_red.tga",2);	
		PrintScreen(ConcatStrings(ConcatStrings(IntToString(czas_ucieczki_scar2 / 60)," : "),IntToString(czas_ucieczki_scar2 % 60)),50,25,"font_old_10_white.tga",2);
        if (czas_ucieczki_scar2 == 0)
		{
            fuckcja_ucieczka_scar2();
        };
    };

//************LICZNIK EXPA	
	if (LicznikExp == true)
	{
	s4	=IntToString(hero.exp);//z liczby jak� jest do�wiadczenie bohatera robimy ci�g znak�w (czyli z liczby tekst)
	s5	=IntToString(hero.exp_next);//to samo co wy�ej tyle ze co do punkt�w wymaganych do zdobycia
	s1	=ConcatStrings ("Do�wiadczenie ",s4); //tutaj ��czymy TEKST s4 czyli nasz exp w postaci tekstowej razem z wyrazem do�wiadczenia
	s2	=ConcatStrings (" / ", s5);//tutaj ��czymy nasz exp do zdobycia z wyrazem "na"

	s3	=ConcatStrings (s1,s2);//tutaj ��czymy 2 powy�sze w ca�o��

	PrintScreen ( s3, 1, 93, "Font_Old_10_White_Hi.TGA", 2);//tutaj wy�wietlamy s3 czyli ca�o�� naszej pracy
	};
	
	
//////////////////////
//
//WYWARY
//
////////////////////	
	
	
	
	// Strength	
	if (Pot_StrenghtTimeStart)
    {
        Pot_StrenghtTimeStart = Pot_StrenghtTimeStart - 1;
        //PrintScreen (ConcatStrings (ConcatStrings (IntToString(Pot_StrenghtTimeStart / 60)," : "),IntToString(Pot_StrenghtTimeStart % 60)), 1,5,"font_old_10_white.tga",2);
		//print ("str czasowa");
		var int seconds_amount_str;
		var int seconds_count_strr;
		var int jedenraz_str;
		seconds_amount_str = seconds_amount_str + 1;
		if jedenraz_str == false
		{
		jedenraz_str = true;
		seconds_count_strr = 10;
		};
		if (seconds_amount_str == seconds_count_strr)
		{
		var string czas_str;
		czas_str = ConcatStrings (ConcatStrings (IntToString(Pot_StrenghtTimeStart / 60)," : "),IntToString(Pot_StrenghtTimeStart % 60));
		var string text_mixture_str;
		text_mixture_str = "Mikstura si�y, pozosta�o: ";
		PrintS_Ext(ConcatStrings (text_mixture_str, czas_str), COL_White);
		seconds_count_strr = seconds_count_strr + 10;
		};
		
		Pot_StrenghtTimeStart_Activated = true;	
    };
	if (Pot_StrenghtTimeStart == 0) && (Pot_StrenghtTimeStart_Activated)
	{
		Pot_StrenghtTimeStart_Activated = false;
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] - 20;
		AI_RemoveWeapon (hero);
		AI_UnequipWeapons (hero);
		AI_EquipBestMeleeWeapon (hero);
		AI_EquipBestRangedWeapon (hero);
	};
// Dexterity
	if (Pot_DexTimeStart)
	{
		Pot_DexTimeStart = Pot_DexTimeStart - 1;
		
		var int seconds_amount_dex;
		var int seconds_count_dex;
		var int jedenraz_dex;
		seconds_amount_dex = seconds_amount_dex + 1;
		if jedenraz_dex == false
		{
		jedenraz_dex = true;
		seconds_count_dex = 10;
		};
		if (seconds_amount_dex == seconds_count_dex)
		{
		var string czas_dex;
		czas_dex = ConcatStrings (ConcatStrings (IntToString(Pot_DexTimeStart / 60)," : "),IntToString(Pot_DexTimeStart % 60));
										
		var string text_mixture_dex;
		text_mixture_dex = "Mikstura zr�czno�ci, pozosta�o: ";
		PrintS_Ext (ConcatStrings (text_mixture_dex, czas_dex),COL_White);
		seconds_count_dex = seconds_count_dex + 10;
		};
		
        //PrintScreen (ConcatStrings (ConcatStrings (IntToString(Pot_DexTimeStart / 60)," : "),IntToString(Pot_DexTimeStart % 60)), 1,7,"font_old_10_white.tga",2);
		Pot_DexTimeStart_Activated = true;
    };
	if (Pot_DexTimeStart == 0) && (Pot_DexTimeStart_Activated)
	{
		Pot_DexTimeStart_Activated = false;
		hero.attribute[ATR_DEXTERITY] = hero.attribute[ATR_DEXTERITY] - 20;
		AI_UnequipWeapons (hero);
		AI_EquipBestMeleeWeapon (hero);
		AI_EquipBestRangedWeapon (hero);
	};
// Mana
	if (Pot_ManaTimeStart)
	{
		Pot_ManaTimeStart = Pot_ManaTimeStart - 1;
		
		var int seconds_amount_mana;
		var int seconds_count_mana;
		var int jedenraz_mana;
		seconds_amount_mana = seconds_amount_mana + 1;
		if jedenraz_mana == false
		{
		jedenraz_mana = true;
		seconds_count_mana = 10;
		};
		if (seconds_amount_mana == seconds_count_mana)
		{
		var string czas_mana;
		czas_mana = ConcatStrings (ConcatStrings (IntToString(Pot_ManaTimeStart / 60)," : "),IntToString(Pot_ManaTimeStart % 60));
										
		var string text_mixture_mana;
		text_mixture_mana = "Mikstura many, pozosta�o: ";
		PrintS_Ext (ConcatStrings (text_mixture_mana, czas_mana), COL_White);
		seconds_count_mana = seconds_count_mana + 10;
		};
		
		
        //PrintScreen (ConcatStrings (ConcatStrings (IntToString(Pot_ManaTimeStart / 60)," : "),IntToString(Pot_ManaTimeStart % 60)), 1,9,"font_old_10_white.tga",2);
		Pot_ManaTimeStart_Activated = true;
    };
	if (Pot_ManaTimeStart == 0) && (Pot_ManaTimeStart_Activated)
	{
		Pot_ManaTimeStart_Activated = false;
		hero.attribute[ATR_MANA_MAX] = hero.attribute[ATR_MANA_MAX] - 20;
	};
// Master
	if (Pot_MasterTimeStart)
    {
        Pot_MasterTimeStart = Pot_MasterTimeStart - 1;
		
		var int seconds_amount_master;
		var int seconds_count_master;
		var int jedenraz_master;
		seconds_amount_master = seconds_amount_master + 1;
		if jedenraz_master == false
		{
		jedenraz_master = true;
		seconds_count_master = 10;
		};
		if (seconds_amount_master == seconds_count_master)
		{
		var string czas_master;
		czas_master = ConcatStrings (ConcatStrings (IntToString(Pot_masterTimeStart / 60)," : "),IntToString(Pot_masterTimeStart % 60));
										
		var string text_mixture_master;
		text_mixture_master = "Mikstura pot�gi, pozosta�o: ";
		PrintS_Ext (ConcatStrings (text_mixture_master, czas_master),COL_White);
		seconds_count_master = seconds_count_master + 10;
		};
		
		
       // PrintScreen (ConcatStrings (ConcatStrings (IntToString(Pot_MasterTimeStart / 60)," : "),IntToString(Pot_MasterTimeStart % 60)), 1,11,"font_old_10_white.tga",2);
		Pot_MasterTimeStart_Activated = true;
	};
	if (Pot_MasterTimeStart == 0) && (Pot_MasterTimeStart_Activated)
	{
		Pot_MasterTimeStart_Activated = false;
		hero.attribute[ATR_DEXTERITY] = hero.attribute[ATR_DEXTERITY] - 20;
		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] - 20;
		AI_UnequipWeapons (hero);
		AI_EquipBestMeleeWeapon (hero);
		AI_EquipBestRangedWeapon (hero);
    };
// HP
	if (Pot_HPTimeStart)
    {
        Pot_HPTimeStart = Pot_HPTimeStart - 1;
		
		var int seconds_amount_hp;
		var int seconds_count_hp;
		var int jedenraz_hp;
		seconds_amount_hp = seconds_amount_hp + 1;
		if jedenraz_hp == false
		{
		jedenraz_hp = true;
		seconds_count_hp = 10;
		};
		if (seconds_amount_hp == seconds_count_hp)
		{
		var string czas_hp;
		czas_hp = ConcatStrings(ConcatStrings (IntToString(Pot_HPTimeStart / 60)," : "),IntToString(Pot_HPTimeStart % 60));
										
		var string text_mixture_hp;
		text_mixture_hp = "Mikstura �ycia, pozosta�o: ";
		PrintS_Ext (ConcatStrings (text_mixture_hp, czas_hp),COL_White);
		seconds_count_hp = seconds_count_hp + 10;
		};
		
		
        //PrintScreen (ConcatStrings (ConcatStrings (IntToString(Pot_HPTimeStart / 60)," : "),IntToString(Pot_HPTimeStart % 60)), 1,11,"font_old_10_white.tga",2);
        Pot_HPTimeStart_Activated = true;
    };
	if (Pot_HPTimeStart == 0) && (Pot_HPTimeStart_Activated)
	{
		Pot_HPTimeStart_Activated = false;
        hero.attribute[ATR_HITPOINTS_MAX] = hero.attribute[ATR_HITPOINTS_MAX] - 50;
    };

//////////////////////////
//
//
//************WILL KRYJ�WKI
//
//
//////////////////////////	
    var int skrytka1LOC;
	var int skrytka2LOC;
	var int skrytka3LOC;


if (Npc_GetDistToWP (hero, "KRYJOWKA1") < 1500) && (MIS_Treasury == LOG_RUNNING) && (Npc_HasItems (hero, ItWrWorldmap) >=1) && (skrytka1LOC == false)
{
B_GiveXP (400);
PrintS_Ext ("To miejsce pasuje na kryj�wk�! Oznacz� je na mapie.",COL_WHITE);
CreateInvItems (hero, ItWrWorldmap_Edit1, 1);
skrytka1LOC = true;
};
if (Npc_GetDistToWP (hero, "KRYJOWKA2") < 1500) && (MIS_Treasury == LOG_RUNNING) && (Npc_HasItems (hero, ItWrWorldmap) >=1) && (skrytka2LOC == false)
{
PrintS_Ext ("To miejsce pasuje na kryj�wk�! Oznacz� je na mapie.",COL_WHITE);
B_GiveXP (400);
 CreateInvItems (hero, ItWrWorldmap_Edit2, 1);
skrytka2LOC = true;
};
if (Npc_GetDistToWP (hero, "KRYJOWKA3") < 1500) && (MIS_Treasury == LOG_RUNNING) && (Npc_HasItems (hero, ItWrWorldmap) >=1) && (skrytka3LOC == false)
{
//Print ("Zlokalizowano kryj�wk�!");
//PrintScreen	("Kryj�wka oznaczona na mapie!", -1,70,"FONT_OLD_20_WHITE.TGA",3);
PrintS_Ext ("To miejsce pasuje na kryj�wk�! Oznacz� je na mapie.",COL_WHITE);
B_GiveXP (400);
CreateInvItems (hero, ItWrWorldmap_Edit3, 1);
skrytka3LOC = true;
};
//************O�TARZ OCZYSZCZENIA
if (Npc_GetDistToWP (hero, "OLTARZ_OCZYSZCZENIA") < 1500) && (oltarzLOC == false) && (finf_olt == true)
{
PrintS_Ext ("To mi wygl�da na o�tarz oczyszczenia.",COL_WHITE);
B_GiveXP (250);
oltarzLOC = true;
B_LogEntry    (CH1_NieSpelnionaZemsta,"Uda�o mi si� odnale�� o�tarz oczyszczenia przy Orkowym Cmentarzysku. Mog� wr�ci� z t� informacj� do Merdariona.");
};




//***********************************************
//***************  QUESTY
//**********************************************
//************** ER 1.4 29 sty 13
	
	if (timer_grd1)
    {
        timer_grd1 = timer_grd1 - 1;
		PrintScreen	("2 ", 1,10,"Font_Old_10_WhiteStats.tga",2);	
        PrintScreen (ConcatStrings (ConcatStrings (IntToString(timer_grd1 / 60)," : "),IntToString(timer_grd1 % 60)), 3,10,"font_old_10_white.tga",2);
        if (timer_grd1 == 0)
		{
           liczba_straznikow = liczba_straznikow + 10;
		    CreateInvItems (hero, ItMiNugget, 200);
			PrintScreen	("Zadanie wykonane! Zysk: 200 bry�ek rudy!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
        };
    };
	
		if (timer_grd2)
    {
        timer_grd2 = timer_grd2 - 1;
		PrintScreen	("2 ", 1,12,"Font_Old_10_WhiteStats.tga",2);	
        PrintScreen (ConcatStrings (ConcatStrings (IntToString(timer_grd2 / 60)," : "),IntToString(timer_grd2 % 60)), 3,12,"font_old_10_white.tga",2);
        if (timer_grd2 == 0)
		{
           liczba_straznikow = liczba_straznikow + 15;
		    CreateInvItems (hero, ItMiNugget, 300);
			PrintScreen	("Zadanie wykonane! Zysk: 300 bry�ek rudy!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
        };
    };
	
	if (timer_grd3)
    {
        timer_grd3 = timer_grd3 - 1;
		PrintScreen	("2 ", 1,14,"Font_Old_10_WhiteStats.tga",2);	
        PrintScreen (ConcatStrings (ConcatStrings (IntToString(timer_grd3 / 60)," : "),IntToString(timer_grd3 % 60)), 3,14,"font_old_10_white.tga",2);
        if (timer_grd3 == 0)
		{
           liczba_straznikow = liczba_straznikow + 10;
		    CreateInvItems (hero, ItAt_Wolf_01, 10);
			PrintScreen	("Zadanie wykonane! Zysk: 10 wilczych sk�r!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
       };
    };
	if (timer_grd4)
    {
        timer_grd4 = timer_grd4 - 1;
		PrintScreen	("2 ", 1,16,"Font_Old_10_WhiteStats.tga",2);	
        PrintScreen (ConcatStrings (ConcatStrings (IntToString(timer_grd4 / 60)," : "),IntToString(timer_grd4 % 60)), 3,16,"font_old_10_white.tga",2);
        if (timer_grd4 == 0)
		{
           liczba_straznikow = liczba_straznikow + 10;
		    CreateInvItems (hero, ItFoMuttonRaw, 40);
			PrintScreen	("Zadanie wykonane! Zysk: 40 sztuk mi�sa!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
       };
    };	
	
		if (timer_grd5)
    {
        timer_grd5 = timer_grd5 - 1;
		PrintScreen	("2 ", 1,18,"Font_Old_10_WhiteStats.tga",2);	
        PrintScreen (ConcatStrings (ConcatStrings (IntToString(timer_grd5 / 60)," : "),IntToString(timer_grd5 % 60)), 3,18,"font_old_10_white.tga",2);
        if (timer_grd5 == 0)
		{
           liczba_straznikow = liczba_straznikow + 5;
		    CreateInvItems (hero, ItMiNugget, 15);
			PrintScreen	("Zadanie wykonane! Zysk: 150 bry�ek rudy!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
       };
    };	
	
			if (timer_grd6)
    {
        timer_grd6 = timer_grd6 - 1;
		PrintScreen	("2 ", 1,20,"Font_Old_10_WhiteStats.tga",2);	
        PrintScreen (ConcatStrings (ConcatStrings (IntToString(timer_grd6 / 60)," : "),IntToString(timer_grd6 % 60)), 3,20,"font_old_10_white.tga",2);
        if (timer_grd6 == 0)
		{
           liczba_straznikow = liczba_straznikow + 20;
		    CreateInvItems (hero, ItMiNugget, 550);
			PrintScreen	("Zadanie wykonane! Zysk: 550 bry�ek rudy!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
       };
    };	
	
			if (timer_grd7nc)
    {
        timer_grd7nc = timer_grd7nc - 1;
		PrintScreen	("2 ", 1,22,"Font_Old_10_WhiteStats.tga",2);	
        PrintScreen (ConcatStrings (ConcatStrings (IntToString(timer_grd7nc / 60)," : "),IntToString(timer_grd7nc % 60)), 3,22,"font_old_10_white.tga",2);
        if (timer_grd7nc == 0)
		{
           liczba_straznikow = liczba_straznikow + 5;
			PrintScreen	("Zadanie wykonane! Z Nowego Obozu powr�ci�o 5 stra�nik�w!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
			quest1_grd_log = true;
       };
    };		
				if (timer_grd8nc)
    {
        timer_grd8nc = timer_grd8nc - 1;
		PrintScreen	("2 ", 1,24,"Font_Old_10_WhiteStats.tga",2);	
        PrintScreen (ConcatStrings (ConcatStrings (IntToString(timer_grd8nc / 60)," : "),IntToString(timer_grd8nc % 60)), 3,24,"font_old_10_white.tga",2);
        if (timer_grd8nc == 0)
		{
           liczba_straznikow = liczba_straznikow + 5;
			PrintScreen	("Zadanie wykonane! Stra�nicy wygrali bitw� ze szkodnikami!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
			//quest1_grd_log = true;
       };
    };	
					if (timer_grd9nc)
    {
        timer_grd9nc = timer_grd9nc - 1;
		PrintScreen	("2 ", 1,26,"Font_Old_10_WhiteStats.tga",2);	
        PrintScreen (ConcatStrings (ConcatStrings (IntToString(timer_grd9nc / 60)," : "),IntToString(timer_grd9nc % 60)), 3,26,"font_old_10_white.tga",2);
        if (timer_grd9nc == 0)
		{
           liczba_straznikow = liczba_straznikow + 5;
			PrintScreen	("Zadanie wykonane! Stra�nicy wycofali si� z teren�w Nowego Obozu!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);

       };
    };	
	
	
	
// ER 1.4 9 marzec 2013
///////////////////////
//
//  CLAW 
//
///////////////////////	
	// Claw Quest Func 
	if (timer_ClawQuest)
    {
        timer_ClawQuest = timer_ClawQuest - 1;
		//PrintScreen	("2 ", 1,10,"Font_Old_10_WhiteStats.tga",2);	
       // PrintScreen (ConcatStrings (ConcatStrings (IntToString(timer_ClawQuest / 60)," : "),IntToString(timer_ClawQuest % 60)), 3,10,"font_old_10_white.tga",2);
		
		var int seconds_amount_claw;
		var int seconds_count_claw;
		var int jedenraz_claw;
		seconds_amount_claw = seconds_amount_claw + 1;
		if jedenraz_claw == false
		{
		jedenraz_claw = true;
		seconds_count_claw = 20;
		};
		if (seconds_amount_claw == seconds_count_claw)
		{
		var string czas_claw;
		czas_claw =	ConcatStrings(ConcatStrings (IntToString(timer_ClawQuest / 60)," : "),IntToString(timer_ClawQuest % 60));
										
		var string text_clawTime;
		text_clawTime = "Zadanie: Chory my�liwy, pozosta�o czasu: ";
		PrintS_Ext(ConcatStrings (text_clawTime, czas_claw), COL_Red);
		seconds_count_claw = seconds_count_claw + 20;
		};
		
        if (timer_ClawQuest == 0) && (MIS_SickHunter == LOG_RUNNING)
		{
			MIS_SickHunter = LOG_FAILED;
			Log_SetTopicStatus       (CH2_SickHunter, LOG_FAILED);
		    B_LogEntry                     (CH2_SickHunter,"Sp�ni�em si�! Wszystko na marne.");
			B_KillNPC (NON_5603_Claw);
			PrintS_Ext("Sp�ni�e� si�! Calaw nie �yje!", COL_Red);
			}
			else if (timer_ClawQuest == 0) && (MIS_SickHunter == LOG_SUCCESS)
			{
			
        };
    };
	
	
	};
	
