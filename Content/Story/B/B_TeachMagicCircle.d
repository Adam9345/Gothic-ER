
func int b_teachmagiccircle(var C_NPC slf,var C_NPC oth,var int circle)
{

	var int kosten;
	kosten = b_getlearncosttalent(oth,NPC_TALENT_MAGE,circle);
	if((circle < 1) || (circle > 6))
	{
		Print("*** B³¹d: Z³y parametr ***");
		return FALSE;
	};
	if(oth.lp < kosten)
	{
		PrintScreen("Za ma³o punktów umiejêtnoœci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		b_say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	oth.lp = oth.lp - kosten;
	Npc_SetTalentSkill(oth,NPC_TALENT_MAGE,circle);
	Log_CreateTopic("Krêgi magii",LOG_NOTE);
	b_logentry("Krêgi magii","Magiczne runy, do których mam dostêp, s¹ podzielone na krêgi. Nie mogê korzystaæ z zaklêæ wymagaj¹cych stopnia wtajemniczenia przekraczaj¹cego moj¹ aktualn¹ wiedzê.");
	if(circle == 1)
	{
		PrintScreen("Nauczono: Pierwszy kr¹g magii",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		b_logentry("Krêgi magii","Zaklêcia z pierwszego krêgu to: œwiat³o, Ognista strza³a, Ma³a b³yskawica, Leczenie lekkich ran i Przyzwanie szkieletu-goblina.");
		return TRUE;
	};
	if(circle == 2)
	{
		PrintScreen("Nauczono: Drugi kr¹g magii",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		b_logentry("Krêgi magii","Zaklêcia z drugiego krêgu to: Kula ognia, Lodowa strza³a, Przyzwanie wilka, Piêœæ wichru i Sen.");
		return TRUE;
	};
	if(circle == 3)
	{
		PrintScreen("Nauczono: Trzeci kr¹g magii",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		b_logentry("Krêgi magii","Zaklêcia z trzeciego krêgu to: Leczenie œrednich ran, Piorun kulisty, Ma³a burza ognista, Tworzenie szkieletu, Strach i Bry³a lodu.");
		return TRUE;
	};
	if(circle == 4)
	{
		PrintScreen("Nauczono: Czwarty kr¹g magii",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		b_logentry("Krêgi magii","Zaklêcia z czwartego krêgu to: B³yskawica, Tworzenie kamiennego golema, Zniszczenie o¿ywieñca i Du¿a kula ognia.");
		return TRUE;
	};
	if(circle == 5)
	{
		PrintScreen("Nauczono: Pi¹ty kr¹g magii",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		b_logentry("Krêgi magii","Zaklêcia z pi¹tego krêgu to: Du¿a burza ognista, Lodowa fala, Przyzwanie demona i Leczenie ciê¿kich ran.");
		return TRUE;
	};
	if(circle == 6)
	{
		PrintScreen("Nauczono: Szósty kr¹g magii",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		b_logentry("Krêgi magii","Zaklêcia z szóstego krêgu to: Deszcz ognia, Tchnienie œmierci, Œmiertelna fala, Armia ciemnoœci i Zmniejszenie potwora.");
		return TRUE;
	};
};

