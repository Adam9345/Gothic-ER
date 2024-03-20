// *Script was make in Easy Dialog Maker (EDM)
// **************************************************
// 						 EXIT 
// **************************************************
//sprawdzone przez gothic1210
INSTANCE DIA_SLD_3915_Gestath_Exit (C_INFO)
{
	npc			= SLD_3915_Gestath;
	nr			= 999;
	condition	= DIA_SLD_3915_Gestath_Exit_Condition;
	information	= DIA_SLD_3915_Gestath_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_SLD_3915_Gestath_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_SLD_3915_Gestath_Exit_Info()
{
	AI_StopProcessInfos	( self );
};
//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Gestath_HELLO1 (C_INFO)
{
   npc          = SLD_3915_Gestath;
   nr           = 1;
   condition    = DIA_Gestath_HELLO1_Condition;
   information  = DIA_Gestath_HELLO1_Info;
   permanent	= FALSE;
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Gestath_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Gestath_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Gestath_HELLO1_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Gestath_HELLO1_03_02"); //Nazywam siê Gestath. Jestem myœliwym.
    AI_Output (other, self ,"DIA_Gestath_HELLO1_15_03"); //Znasz siê na swoim fachu?
    AI_Output (self, other ,"DIA_Gestath_HELLO1_03_04"); //Jasne! Potrafiê te¿ szyæ pancerze. Razem z Wilkiem pracujemy nad zbroj¹, która wykorzystuje pancerze pe³zaczy.
    AI_Output (self, other ,"DIA_Gestath_HELLO1_03_05"); //To bêdzie dopiero coœ! Niestety, nie jesteœmy nawet w po³owie pracy nad konceptem. 
    AI_Output (self, other ,"DIA_Gestath_HELLO1_03_06"); //Wiesz... to bardzo trudny materia³ w obróbce, wiêc trzeba to wszystko dobrze rozplanowaæ...
};
//========================================
//-----------------> LAZY
//========================================

INSTANCE DIA_Gestath_LAZY (C_INFO)
{
   npc          = SLD_3915_Gestath;
   nr           = 1;
   condition    = DIA_Gestath_LAZY_Condition;
   information  = DIA_Gestath_LAZY_Info;
   permanent	= FALSE;
   description	= "Nie nudzisz siê tutaj?";
};

FUNC INT DIA_Gestath_LAZY_Condition()
{
if (Npc_KnowsInfo (hero, DIA_Gestath_HELLO1))
{
    return TRUE;
};
};
FUNC VOID DIA_Gestath_LAZY_Info()
{
    AI_Output (other, self ,"DIA_Gestath_LAZY_15_01"); //Nie nudzisz siê tutaj?
    AI_Output (self, other ,"DIA_Gestath_LAZY_03_02"); //Lubiê to miejsce I tych ludzi. Ale szczerze chcia³bym spróbowaæ czegoœ nowego.
    AI_Output (self, other ,"DIA_Gestath_LAZY_03_03"); //Wybiliœmy wiêkszoœæ okolicznej zwierzyny. Teraz ³owy w pobliskich górach i ska³ach nie s¹ ju¿ tak owocne.
    AI_Output (self, other ,"DIA_Gestath_LAZY_03_04"); //Potrzebuje nowych wyzwañ. Tak¿e ³owieckich.
    AI_Output (other, self ,"DIA_Gestath_LAZY_15_05"); //Co zamierzasz?
    AI_Output (other, self ,"DIA_Gestath_LAZY_15_06"); //Póki co posiedzê jeszcze tutaj, a potem nie wiem. Mo¿e pójdê tam gdzie mnie poniesie wiatr.
    AI_Output (other,self  ,"DIA_Gestath_LAZY_15_07"); //Rozumiem. Choæ tu zdaje siê, nie masz najgorzej.
    AI_Output (self, other ,"DIA_Gestath_LAZY_03_08"); //Gdyby by³o mi tu Ÿle, to bym tu nie tkwi³. Nie ma obowi¹zku siedzieæ tam gdzie nas kuje w dupê.
};


//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Gestath_HELLO2 (C_INFO)
{
   npc          = SLD_3915_Gestath;
   nr           = 2;
   condition    = DIA_Gestath_HELLO2_Condition;
   information  = DIA_Gestath_HELLO2_Info;
   permanent	= FALSE;
   description	= "Jak leci?";
};

FUNC INT DIA_Gestath_HELLO2_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Gestath_HELLO1))
	{
    return TRUE;
	};
};

FUNC VOID DIA_Gestath_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Gestath_HELLO2_15_01"); //Jak leci?
    AI_Output (self, other ,"DIA_Gestath_HELLO2_03_02"); //Nie jest Ÿle.. Zbli¿a siê zima, wiêc gromadzimy zapasy. 
};

//========================================
//-----------------> HELLO3
//========================================

INSTANCE DIA_Gestath_HELLO3 (C_INFO)
{
   npc          = SLD_3915_Gestath;
   nr           = 3;
   condition    = DIA_Gestath_HELLO3_Condition;
   information  = DIA_Gestath_HELLO3_Info;
   permanent	= FALSE;
   description	= "Skupujesz jakieœ skóry?";
};

FUNC INT DIA_Gestath_HELLO3_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Gestath_HELLO1))
	{
    return TRUE;
	};
};

FUNC VOID DIA_Gestath_HELLO3_Info()
{
    AI_Output (other, self ,"DIA_Gestath_HELLO3_15_01"); //Skupujesz jakieœ skóry?
    AI_Output (self, other ,"DIA_Gestath_HELLO3_03_02"); //Tak. Chêtnie kupiê skóry orkowych psów, oczywiœcie za rozs¹dn¹ cenê.
    AI_Output (self, other ,"DIA_Gestath_HELLO3_03_03"); //Tylko nie zawracaj mi dupy pojedynczymi sztukami. Przynieœ mi chocia¿ z piêæ. 
    AI_Output (other, self ,"DIA_Gestath_HELLO3_15_04"); //No dobra, jak bêdê coœ mia³ to wpadnê.
    B_LogEntry          (GE_Skup,"Gestath skupuje skóry orkowych psów. Jeœli bêdê mia³ przynajmniej piêæ sztuk, chêtnie je ode mnie odkupi.");
};

//========================================
//-----------------> HELLO4
//========================================

INSTANCE DIA_Gestath_HELLO4 (C_INFO)
{
   npc          = SLD_3915_Gestath;
   nr           = 4;
   condition    = DIA_Gestath_HELLO4_Condition;
   information  = DIA_Gestath_HELLO4_Info;
   permanent	= TRUE;
   description	= "Mam piêæ skór orkowych psów!";
};

FUNC INT DIA_Gestath_HELLO4_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Gestath_HELLO3))
    && (Npc_HasItems (other, ItAt_Wolf_02) >=5)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gestath_HELLO4_Info()
{
    AI_Output (other, self ,"DIA_Gestath_HELLO4_15_01"); //Mam piêæ skór orkowych psów!
    AI_Output (self, other ,"DIA_Gestath_HELLO4_03_02"); //Dobra robota. Przydadz¹ siê.
    CreateInvItems (self, ItMiNugget, 200);
    B_GiveInvItems (self, other, ItMiNugget, 200);
    b_givexp (50);
    B_GiveInvItems (other, self, ItAt_Wolf_02, 5);
	Npc_RemoveInvItems (self, ItAt_Wolf_02, 5);
};

//========================================
//-----------------> LOWCA
//========================================

INSTANCE DIA_Gestath_LOWCA (C_INFO)
{
   npc          = SLD_3915_Gestath;
   nr           = 1;
   condition    = DIA_Gestath_LOWCA_Condition;
   information  = DIA_Gestath_LOWCA_Info;
   permanent	= FALSE;
   description	= "£owcy orków poszukuj¹ nowych ludzi.";
};

FUNC INT DIA_Gestath_LOWCA_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_SZEFU_ROBOTA)) && (Npc_KnowsInfo (hero, DIA_Gestath_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gestath_LOWCA_Info()
{
    AI_Output (other, self ,"DIA_Gestath_LOWCA_15_01"); //£owcy orków poszukuj¹ nowych ludzi.
    AI_Output (self, other ,"DIA_Gestath_LOWCA_03_02"); //Hmm? Dlaczego mi to mówisz?

    Info_ClearChoices		(DIA_Gestath_LOWCA);
    Info_AddChoice		(DIA_Gestath_LOWCA, "Jesteœ doœwiadczonym myœliwym. To szansa na nowe trofea.", DIA_Gestath_LOWCA_EXPERIENCE);
    Info_AddChoice		(DIA_Gestath_LOWCA, "Oni naprawdê potrzebuj¹ twojej pomocy.", DIA_Gestath_LOWCA_HELP);
};

FUNC VOID DIA_Gestath_LOWCA_EXPERIENCE()
{
    AI_Output (other, self ,"DIA_Gestath_LOWCA_EXPERIENCE_15_01"); //Jesteœ doœwiadczonym myœliwym. To szansa na nowe trofea.
    AI_Output (self, other ,"DIA_Gestath_LOWCA_EXPERIENCE_03_02"); //W sumie... Jakby nie patrzeæ w okolicy s¹ tylko wilki i œcierwojady.
    AI_Output (other, self ,"DIA_Gestath_LOWCA_EXPERIENCE_15_03"); //Pomyœl jaki zyska³byœ szacunek, gdybyœ posiada³ pancerz ze skóry orkowego psa.
    AI_Output (self, other ,"DIA_Gestath_LOWCA_EXPERIENCE_03_04"); //Ha! Przekona³eœ mnie. To by by³o wspania³e.
    AI_Output (self, other ,"DIA_Gestath_LOWCA_EXPERIENCE_03_05"); //Gdzie dok³adnie jest ten obóz ³owców?
    AI_Output (other, self ,"DIA_Gestath_LOWCA_EXPERIENCE_15_06"); //£owcy orków obozuj¹ we wnêce skalnej œciany.
    AI_Output (self, other ,"DIA_Gestath_LOWCA_EXPERIENCE_03_07"); //Której skalnej œciany?
    AI_Output (other, self ,"DIA_Gestath_LOWCA_EXPERIENCE_15_08"); //Tej przy przejœciu na ziemie orków. To naturalna granica dziel¹ca nasze ziemi od tych bestii.
    AI_Output (self, other ,"DIA_Gestath_LOWCA_EXPERIENCE_03_09"); //Ach, ju¿ wiem o czym mówisz. Wkrótce siê tam wybiorê.

    Npc_ExchangeRoutine (self, "hunters");//fix
    B_LogEntry                     (CH3_NewBloodForOrcHunters,"Przekona³em Gestatha, ¿e obóz ³owców orków to jego miejsce. Mogê pogadaæ z Wilsonem. ");
	gestah_lowca = true;
    B_GiveXP (250);
    Info_ClearChoices		(DIA_Gestath_LOWCA);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Gestath_LOWCA_HELP()
{
    AI_Output (other, self ,"DIA_Gestath_LOWCA_HELP_15_01"); //Oni naprawdê potrzebuj¹ twojej pomocy.
    AI_Output (self, other ,"DIA_Gestath_LOWCA_HELP_03_02"); //A co mnie to obchodzi? Czy ja ci wygl¹dam na dobrodzieja?
    AI_Output (self, other ,"DIA_Gestath_LOWCA_HELP_03_03"); //Jak tam nie daj¹ rady to niech siê stamt¹d wynosz¹. Te¿ mi coœ!
    Info_ClearChoices		(DIA_Gestath_LOWCA);
    AI_StopProcessInfos	(self);
	gestah_lowca = false;
};

//========================================
//-----------------> OBOZ_BANDYTOW
//========================================

INSTANCE DIA_Gestath_OBOZ_BANDYTOW (C_INFO)
{
   npc          = SLD_3915_Gestath;
   nr           = 1;
   condition    = DIA_Gestath_OBOZ_BANDYTOW_Condition;
   information  = DIA_Gestath_OBOZ_BANDYTOW_Info;
   permanent	= FALSE;
   description	= "Nie wybierasz siê do Obozu Bandytów?";
};

FUNC INT DIA_Gestath_OBOZ_BANDYTOW_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_SZEFU_Quest12))
    && (Npc_KnowsInfo (hero, DIA_SZEFU_DAVOR))
	&& (gestah_lowca == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gestath_OBOZ_BANDYTOW_Info()
{
    AI_Output (other, self ,"DIA_Gestath_OBOZ_BANDYTOW_15_01"); //Nie wybierasz siê do Obozu Bandytów?
    AI_Output (self, other ,"DIA_Gestath_OBOZ_BANDYTOW_03_02"); //Ja? Nie jestem tam potrzebny. Poza tym nie mam ochoty nadstawiaæ karku za tych samobójców!
    AI_Output (self, other ,"DIA_Gestath_OBOZ_BANDYTOW_03_03"); //Gdy wszystko siê nieco uspokoi, planujê uciec w góry, schroniæ siê w jakieœ jaskini i nieco zapolowaæ.
    AI_Output (self, other ,"DIA_Gestath_OBOZ_BANDYTOW_03_04"); //Prêdzej czy póŸniej Bariera padnie, a wtedy bêde bogaty. 
};

instance dia_gestath_pickpocket(c_info) {
    npc = sld_3915_gestath;
    nr = 900;
    condition = dia_gestath_pickpocket_condition;
    information = dia_gestath_pickpocket_info;
    permanent = 1;
    description = pickpocket_final;
};

func int dia_gestath_pickpocket_condition() {
	e_beklauen(baseThfChanceSLD, 35);
};

func void dia_gestath_pickpocket_info() {
	b_steal_message();
	info_clearchoices(dia_gestath_pickpocket);
	info_addchoice(dia_gestath_pickpocket, dialog_back, dia_gestath_pickpocket_back);
	info_addchoice(dia_gestath_pickpocket, dialog_pickpocket, dia_gestath_pickpocket_doit);
};

func void dia_gestath_pickpocket_doit() {
    d_beklauen();
    info_clearchoices(dia_gestath_pickpocket);
};

func void dia_gestath_pickpocket_back() {
    info_clearchoices(dia_gestath_pickpocket);
};
