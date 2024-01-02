
func int b_teachmagiccircle(var C_NPC slf,var C_NPC oth,var int circle)
{

	var int kosten;
	kosten = b_getlearncosttalent(oth,NPC_TALENT_MAGE,circle);
	if((circle < 1) || (circle > 6))
	{
		Print("*** B��d: Z�y parametr ***");
		return FALSE;
	};
	if(oth.lp < kosten)
	{
		PrintScreen("Za ma�o punkt�w umiej�tno�ci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		b_say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	oth.lp = oth.lp - kosten;
	Npc_SetTalentSkill(oth,NPC_TALENT_MAGE,circle);
	Log_CreateTopic("Kr�gi magii",LOG_NOTE);
	b_logentry("Kr�gi magii","Magiczne runy, do kt�rych mam dost�p, s� podzielone na kr�gi. Nie mog� korzysta� z zakl�� wymagaj�cych stopnia wtajemniczenia przekraczaj�cego moj� aktualn� wiedz�.");
	if(circle == 1)
	{
		PrintScreen("Nauczono: Pierwszy kr�g magii",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		b_logentry("Kr�gi magii","Zakl�cia z pierwszego kr�gu to: �wiat�o, Ognista strza�a, Ma�a b�yskawica, Leczenie lekkich ran i Przyzwanie szkieletu-goblina.");
		return TRUE;
	};
	if(circle == 2)
	{
		PrintScreen("Nauczono: Drugi kr�g magii",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		b_logentry("Kr�gi magii","Zakl�cia z drugiego kr�gu to: Kula ognia, Lodowa strza�a, Przyzwanie wilka, Pi�� wichru i Sen.");
		return TRUE;
	};
	if(circle == 3)
	{
		PrintScreen("Nauczono: Trzeci kr�g magii",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		b_logentry("Kr�gi magii","Zakl�cia z trzeciego kr�gu to: Leczenie �rednich ran, Piorun kulisty, Ma�a burza ognista, Tworzenie szkieletu, Strach i Bry�a lodu.");
		return TRUE;
	};
	if(circle == 4)
	{
		PrintScreen("Nauczono: Czwarty kr�g magii",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		b_logentry("Kr�gi magii","Zakl�cia z czwartego kr�gu to: B�yskawica, Tworzenie kamiennego golema, Zniszczenie o�ywie�ca i Du�a kula ognia.");
		return TRUE;
	};
	if(circle == 5)
	{
		PrintScreen("Nauczono: Pi�ty kr�g magii",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		b_logentry("Kr�gi magii","Zakl�cia z pi�tego kr�gu to: Du�a burza ognista, Lodowa fala, Przyzwanie demona i Leczenie ci�kich ran.");
		return TRUE;
	};
	if(circle == 6)
	{
		PrintScreen("Nauczono: Sz�sty kr�g magii",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		b_logentry("Kr�gi magii","Zakl�cia z sz�stego kr�gu to: Deszcz ognia, Tchnienie �mierci, �miertelna fala, Armia ciemno�ci i Zmniejszenie potwora.");
		return TRUE;
	};
};

