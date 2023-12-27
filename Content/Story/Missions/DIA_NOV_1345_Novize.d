// *Script was make in Easy Dialog Maker (EDM)
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Novize_EXIT1345(C_INFO)
{
	npc             = NOV_1345_Novize;
	nr              = 999;
	condition	= DIA_Novize_EXIT1345_Condition;
	information	= DIA_Novize_EXIT1345_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Novize_EXIT1345_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Novize_EXIT1345_Info()
{
	AI_StopProcessInfos	(self);
};
//========================================
//-----------------> HowAreYou
//========================================

INSTANCE DIA_Novize_HowAreYou1345 (C_INFO)
{
   npc          = NOV_1345_Novize;
   nr           = 1;
   condition    = DIA_Novize_HowAreYou1345_Condition;
   information  = DIA_Novize_HowAreYou1345_Info;
   permanent	= FALSE;
   description	= "Jak leci?";
};

FUNC INT DIA_Novize_HowAreYou1345_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Novize_HowAreYou1345_Info()
{
    AI_Output (other, self ,"DIA_Novize_HowAreYou1345_15_01"); //Jak leci?
    AI_Output (self, other ,"DIA_Novize_HowAreYou1345_03_02"); //Witaj, jestem Kendrom - uczeñ Baal Cadara.
    AI_Output (self, other ,"DIA_Novize_HowAreYou1345_03_03"); //A ty kim jesteœ?
    AI_Output (other, self ,"DIA_Novize_HowAreYou1345_15_04"); //Jestem...
    AI_Output (self, other ,"DIA_Novize_HowAreYou1345_03_05"); //A zreszt¹ niewa¿ne. W Bractwie Œni¹cego nie liczy siê imiê, a wiara.
    AI_Output (self, other ,"DIA_Novize_HowAreYou1345_03_06"); //To ona daje nam si³ê by pokonywaæ przeciwnoœci losu.
};

//========================================
//-----------------> PermDia
//========================================

INSTANCE DIA_Novize_PermDia (C_INFO)
{
   npc          = NOV_1345_Novize;
   nr           = 1;
   condition    = DIA_Novize_PermDia_Condition;
   information  = DIA_Novize_PermDia_Info;
   permanent	= TRUE;
   description	= "Czym siê zajmujesz?";
};

FUNC INT DIA_Novize_PermDia_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Novize_HowAreYou1345))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Novize_PermDia_Info()
{
    AI_Output (other, self ,"DIA_Novize_PermDia_15_01"); //Czym siê zajmujesz?
    AI_Output (self, other ,"DIA_Novize_PermDia_03_02"); //Przewa¿nie medytujê wraz z moim mistrzem, ale w wolnym czasie lubiê spacerowaæ po Kolonii.
    AI_Output (self, other ,"DIA_Novize_PermDia_03_03"); //Odkry³em w okolicy naprawdê wiele ciekawych miejsc.
    AI_Output (other, self ,"DIA_Novize_PermDia_15_04"); //Na przyk³ad jakich?

    Info_ClearChoices		(DIA_Novize_PermDia);
    Info_AddChoice		(DIA_Novize_PermDia, DIALOG_BACK, DIA_Novize_PermDia_BACK);
    Info_AddChoice		(DIA_Novize_PermDia, "Opowiedz mi o okolicach Obozu.", DIA_Novize_PermDia_NearbyCamp);
    Info_AddChoice		(DIA_Novize_PermDia, "Co znajdê w g³êbi bagien?", DIA_Novize_PermDia_Swamp);
    Info_AddChoice		(DIA_Novize_PermDia, "Co znajdê na wybrze¿u?", DIA_Novize_PermDia_Cliff);
    Info_AddChoice		(DIA_Novize_PermDia, "Jest coœ ciekawego w górach?", DIA_Novize_PermDia_Mountains);
    Info_AddChoice		(DIA_Novize_PermDia, "Co znajdê w lesie? ", DIA_Novize_PermDia_Forest);
};

FUNC VOID DIA_Novize_PermDia_BACK()
{
    Info_ClearChoices		(DIA_Novize_PermDia);
};

FUNC VOID DIA_Novize_PermDia_NearbyCamp()
{
    AI_Output (other, self ,"DIA_Novize_PermDia_NearbyCamp_15_01"); //Opowiedz mi o okolicach Obozu.
    AI_Output (self, other ,"DIA_Novize_PermDia_NearbyCamp_03_02"); //Okolice obozu na bagnie to œwietny teren ³owiecki.
    AI_Output (self, other ,"DIA_Novize_PermDia_NearbyCamp_03_03"); //Krêci siê tutaj sporo dzikich zwierz¹t. Wychodz¹ z lasu by napiæ siê wody z rzeki.
    AI_Output (self, other ,"DIA_Novize_PermDia_NearbyCamp_03_04"); //S¹ to g³ównie dziki, wilki i œcierwojady.
};

FUNC VOID DIA_Novize_PermDia_Swamp()
{
    AI_Output (other, self ,"DIA_Novize_PermDia_Swamp_15_01"); //Co znajdê w g³êbi bagien?
    AI_Output (self, other ,"DIA_Novize_PermDia_Swamp_03_02"); //Bagna to tak¿e dobry teren ³owiecki, s¹ jednak bardzo niebezpieczne.
    AI_Output (self, other ,"DIA_Novize_PermDia_Swamp_03_03"); //¯yj¹ tu g³ównie b³otne wê¿e oraz krwiopijce.
    AI_Output (self, other ,"DIA_Novize_PermDia_Swamp_03_04"); //Na szczêœcie nasi Stra¿nicy dobrze wiedz¹, jak je odstraszyæ.
    AI_Output (self, other ,"DIA_Novize_PermDia_Swamp_03_05"); //Na bagnie przebywaj¹ równie¿ dwie grupy zbieraczy ziela.
    AI_Output (self, other ,"DIA_Novize_PermDia_Swamp_03_06"); //Dowodz¹ nimi Balor i Viran.
    AI_Output (self, other ,"DIA_Novize_PermDia_Swamp_03_07"); //Jest tam tak¿e tartak, oraz stara chata.
};

FUNC VOID DIA_Novize_PermDia_Cliff()
{
    AI_Output (other, self ,"DIA_Novize_PermDia_Cliff_15_01"); //Co znajdê na wybrze¿u?
    AI_Output (self, other ,"DIA_Novize_PermDia_Cliff_03_02"); //Przede wszystkim jest tam bardzo niebezpiecznie.
    AI_Output (self, other ,"DIA_Novize_PermDia_Cliff_03_03"); //Wybrze¿e jest zamieszkiwane przez ogniste jaszczury.
    AI_Output (self, other ,"DIA_Novize_PermDia_Cliff_03_04"); //Nie radzê siê do nich zbli¿aæ. Mog¹ ciê nieŸle przypiec.
    AI_Output (self, other ,"DIA_Novize_PermDia_Cliff_03_05"); //Poza tym znajduj¹ siê tam wraki okrêtów. Pewnie jacyœ marynarze rozbili siê, gdy przep³ywali przez Barierê.
    AI_Output (self, other ,"DIA_Novize_PermDia_Cliff_03_06"); //Jest tam tak¿e zrujnowana wie¿a, ale dobrze ci radzê - nie zbli¿aj siê do niej.
    AI_Output (self, other ,"DIA_Novize_PermDia_Cliff_03_07"); //Z jej wnêtrza dobiegaj¹ okropne ha³asy, a w okolicy czuæ zew œmierci.
};

FUNC VOID DIA_Novize_PermDia_Mountains()
{
    AI_Output (other, self ,"DIA_Novize_PermDia_Mountains_15_01"); //Jest coœ ciekawego w górach?
    AI_Output (self, other ,"DIA_Novize_PermDia_Mountains_03_02"); //Oczywiœcie, stara Forteca.
    AI_Output (self, other ,"DIA_Novize_PermDia_Mountains_03_03"); //Niegdyœ zamieszkiwa³ j¹ Bergmar, Burgrabia Zachodnich Terytoriów.
    AI_Output (self, other ,"DIA_Novize_PermDia_Mountains_03_04"); //Stamt¹d kontrolowa³ Górnicz¹ Dolinê oraz wszystkie kopalnie.
    AI_Output (self, other ,"DIA_Novize_PermDia_Mountains_03_05"); //Odk¹d jednak Kolonia jest w rêkach wiêŸniów, Forteca jest opuszczona.
    AI_Output (self, other ,"DIA_Novize_PermDia_Mountains_03_06"); //Nieopodal jest tak¿e stare orkowe miejsce kultu, jednak nie polecam ci tam chodziæ. Ci¹gle krêc¹ siê tam orkowi zwiadowcy.
};

FUNC VOID DIA_Novize_PermDia_Forest()
{
    AI_Output (other, self ,"DIA_Novize_PermDia_Forest_15_01"); //Co znajdê w lesie? 
    AI_Output (self, other ,"DIA_Novize_PermDia_Forest_03_02"); //Pe³no stworzeñ, z którymi s¹dz¹c po twojej posturze na pewno sobie nie poradzisz.
    AI_Output (self, other ,"DIA_Novize_PermDia_Forest_03_03"); //W kniei czaj¹ siê cieniostwory i orkowe psy.
    AI_Output (self, other ,"DIA_Novize_PermDia_Forest_03_04"); //Wokó³ lasu kr¹¿¹ groŸne watahy wilków. Lepiej nie atakowaæ ich samemu. 
};



