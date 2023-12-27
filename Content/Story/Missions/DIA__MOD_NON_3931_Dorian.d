//***** WIÊZIEÑ DORIAN ********
//***** DIALOGI *******
//POPRAWIONE, RUTYNY DODANE, WP W ŒWIECIE
//****** OK **************

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Dorian_EXIT(C_INFO)
{
	npc             = NON_3931_Dorian;
	nr              = 999;
	condition	= DIA_Dorian_EXIT_Condition;
	information	= DIA_Dorian_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Dorian_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Dorian_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Dorian_HELLO1 (C_INFO)
{
   npc          = NON_3931_Dorian;
   nr           = 1;
   condition    = DIA_Dorian_HELLO1_Condition;
   information  = DIA_Dorian_HELLO1_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Dorian_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Dorian_HELLO1_Info()
{
    AI_Output (self, other ,"DIA_Dorian_HELLO1_03_01"); //Czego chcesz? Myœla³em, ¿e to Bullit idzie z jedzeniem dla mnie, albo z zaproszeniem do sali tortur dla mojego kumpla z celi (pogardliwie).
    AI_Output (other, self ,"DIA_Dorian_HELLO1_15_02"); //By³em po prostu ciekaw, czy w lochach s¹ zamkniêci skazañcy.
    AI_Output (self, other ,"DIA_Dorian_HELLO1_03_03"); //Jak widzisz s¹. Co lepsze, nikt z nas nie zosta³ tu zamkniêty bez powodu. 
    AI_Output (other, self ,"DIA_Dorian_HELLO1_15_04"); //A ty? Dlaczego ciê zamknêli?
    AI_Output (self, other ,"DIA_Dorian_HELLO1_03_05"); //By³em kurierem magów. Drago, Mag Ognia który jest instruktorem magii, wys³a³ mnie z misj¹ do Zewnêtrznego Pierœcienia.
	AI_Output (self, other ,"DIA_Dorian_HELLO1_03_06"); //Ale to nie twoja sprawa, co to za zadanie, wiêc lepiej daj mi spokój!
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Dorian_HELLO2 (C_INFO)
{
   npc          = NON_3931_Dorian;
   nr           = 2;
   condition    = DIA_Dorian_HELLO2_Condition;
   information  = DIA_Dorian_HELLO2_Info;
   permanent	= FALSE;
   description	= "Jestem jeszcze ciekaw, za co trafi³eœ do Kolonii.";
};

FUNC INT DIA_Dorian_HELLO2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Dorian_HELLO1))

    {
    return TRUE;
    };
};


FUNC VOID DIA_Dorian_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Dorian_HELLO2_15_01"); //Jestem jeszcze ciekaw za co trafi³eœ do Kolonii.
    AI_Output (self, other ,"DIA_Dorian_HELLO2_03_02"); //Bo przespa³em siê z owc¹ Betsy... Przestañ zadawaæ g³upie pytania!
    AI_Output (other, self ,"DIA_Dorian_HELLO2_15_03"); //Nie mo¿esz po prostu powiedzieæ?
    AI_Output (self, other ,"DIA_Dorian_HELLO2_03_04"); //Dobra opowiem ci. Pracowa³em na farmie Onara, tu na wyspie Khorinis. Pewnego dnia po¿ar³em siê mocno z Thekl¹, kuchark¹ Onara. 
	AI_Output (self, other ,"DIA_Dorian_HELLO2_03_05"); //Nie chcia³a mi potem wydaæ obiadu, a kiszki a¿ mi siê skrêca³y. No to wzi¹³em ³y¿kê i waln¹³em j¹ w ³eb. I tyle.
    AI_Output (self, other ,"DIA_Dorian_HELLO2_03_06"); //Onar jednak siê trochê wœciek³ i da³ mi ultimatum. Albo pójdê do Khorinis i zg³oszê siê dobrowolnie do Sêdziego, albo mogê wiêcej nie pokazywaæ siê na farmie. 
	AI_Output (self, other ,"DIA_Dorian_HELLO2_03_07"); //Z dwojga z³ego wybra³em niestety t¹ pierwsz¹ opcjê.
    AI_Output (self, other ,"DIA_Dorian_HELLO2_03_08"); //Sêdzia okaza³ siê kawa³em sukinsyna, sku³ mnie w kajdany i wys³a³ do koszar, gdzie zosta³em zamkniêty przez Wulfgara, dowódcê stra¿y miejskiej. 
	AI_Output (self, other ,"DIA_Dorian_HELLO2_03_09"); //Dwa dni póŸniej wys³ano mnie z karnym konwojem do Górniczej Doliny. Ot ca³a historia. Szkoda, ¿e nie uciek³em wtedy z farmy Onara.
    AI_Output (self, other ,"DIA_Dorian_HELLO2_03_10"); //Mog³em zaszyæ siê na przyk³ad na farmie Akila, posiedzieæ w "Martwej Harpii" lub nawet wst¹piæ do Klasztoru. Przynajmniej by³bym wolny. 
	/* ****OD KIEDY W KOLONI ROZDAJE SIÊ PREZENTY? ***** ~Facebook
	if (Npc_HasItems (other, ItMiJoint_2) >=1)
    {
	B_GiveInvItems (other, self, ItMiJoint_2, 1);   
	AI_Output (other, self ,"DIA_Dorian_HELLO2_15_11"); //Dziêki skazañcu, tylko tyle chcia³em wiedzieæ. Zapal sobie na poprawê humoru.
    AI_UseItem (self, ItMiJoint_2);
    AI_Output (self, other ,"DIA_Dorian_HELLO2_03_12"); //Dziêki, mam nadzieje, ¿e Bullit nie wyczuje dymu ze skrêta, bo inaczej bêdê mia³ k³opoty.
	};*/
};

//========================================
//-----------------> HELLO3
//========================================

INSTANCE DIA_Dorian_HELLO3 (C_INFO)
{
   npc          = NON_3931_Dorian;
   nr           = 3;
   condition    = DIA_Dorian_HELLO3_Condition;
   information  = DIA_Dorian_HELLO3_Info;
   permanent	= FALSE;
   description	= "Jesteœ wolny.";
};

FUNC INT DIA_Dorian_HELLO3_Condition()
{
    var C_NPC whodie0; 	whodie0 = Hlp_GetNpc(EBR_100_Gomez);
    if (Npc_KnowsInfo (hero, DIA_Dorian_HELLO2))
    && (Npc_IsDead(EBR_100_Gomez))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Dorian_HELLO3_Info()
{
    AI_Output (other, self ,"DIA_Dorian_HELLO3_15_01"); //Jesteœ wolny, Gomez dosta³ nauczkê. Podobnie jak reszta Stra¿ników i Magnatów.
    AI_Output (self, other ,"DIA_Dorian_HELLO3_03_02"); //No proszê, kto by siê spodziewa³. A co z Drago i Magami Ognia? 
	AI_Output (self, other ,"DIA_Dorian_HELLO3_03_03"); //Za³o¿ê siê, ¿e po œmierci Gomeza, sytuacja zostanie wykorzystana i zjawi¹ siê tu ludzie Lee i Laresa, zajmuj¹c Obóz. 
    AI_Output (other, self ,"DIA_Dorian_HELLO3_15_04"); //Magowie Ognia nie ¿yj¹. Jakiœ czas temu zawali³a siê Stara Kopalnia, przez co Gomez zamierza³ zaj¹æ Woln¹ Kopalniê nale¿¹c¹ do Nowego Obozu. 
	AI_Output (other, self ,"DIA_Dorian_HELLO3_15_05"); //Corristo i jego ludzie sprzeciwili siê Gomezowi i kaza³ Stra¿nikom ich zamordowaæ.
    AI_Output (other, self ,"DIA_Dorian_HELLO3_15_06"); //Tylko Corristo i Milten wyszli z tego ca³o, z pewnoœci¹ nie wróc¹ oni do Starego Obozu, nawet po zajêciu go przez Lee. 
    AI_Output (self, other ,"DIA_Dorian_HELLO3_03_07"); //Dziêki za informacje. Widzê, ¿e sporo siê wydarzy³o. Idê na górê dowiedzieæ siê wszystkiego. Powodzenia!
	Npc_ExchangeRoutine	(NON_3931_Dorian, "free");
	NON_3931_Dorian.flags = 2;
};

