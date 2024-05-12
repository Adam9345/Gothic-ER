func void Update_Menu_Item(var string name, var string val) 
{
    var int itPtr;
    itPtr = MEM_GetMenuItemByString(name);    
    if (!itPtr) 
	{
        MEM_Error(ConcatStrings("Update_Menu_Item: Invalid Menu Item: ", name));
        return;
    };
    const int SetText = 5061760;
    CALL_IntParam(true);
    CALL_IntParam(0);
    CALL_zStringPtrParam(val);
    CALL__thiscall(itPtr, SetText);
};
    
func void Install_Character_Menu_Hook() 
{
    const int done	= 0; 
       
	
    if(!done) 
    {
        HookEngineF(4678400, 6, Update_Character_Menu);
        done = 1;
    };
};
//var int NPC_TALENT_MINING;
var int NPC_TALENT_SMITH;	
var int HERO_HACKCHANCE;
var int wert;
func void b_upgrade_hero_hackchance(var int wert)
{
	var string concattext;
	concattext = ConcatStrings(PRINT_ADDON_HACKCHANCE,IntToString(wert));
	concattext = ConcatStrings(concattext,")");
	PrintScreen(concattext,-1,34,"FONT_OLD_20_WHITE.tga",2);
	HERO_HACKCHANCE = HERO_HACKCHANCE + wert;
	//Snd_Play("Geldbeutel");
};
func void Update_Character_Menu() 
{
   // var int Mining;
    var string Smith;
    var string SmithSkill;
    Smith =  "Kowalstwo";
    SmithSkill = "-";                                
    Update_Menu_Item("MENU_ITEM_TALENT_14_TITLE", Smith);
    Update_Menu_Item("MENU_ITEM_TALENT_14_SKILL", SmithSkill);
    
	if (NPC_TALENT_SMITH == 1)
	{
        SmithSkill = "poz. 1/3";                          
        Update_Menu_Item("MENU_ITEM_TALENT_14_SKILL", SmithSkill);
	};

	if (NPC_TALENT_SMITH == 2)
	{
        SmithSkill = "poz. 2/3";                          
        Update_Menu_Item("MENU_ITEM_TALENT_14_SKILL", SmithSkill);
	};

	if (NPC_TALENT_SMITH == 3)
	{  
        SmithSkill = "poz. 3/3";          	
        Update_Menu_Item("MENU_ITEM_TALENT_14_SKILL", SmithSkill);
	};
		
	var int NPC_TALENT_MINING;
	
	//var string Hacking;
	var string Mining;
	var string MiningState;

	Mining           = "Wydobywanie";   
    MiningState      = ConcatStrings(IntToString(HERO_HACKCHANCE),"%");
	Update_Menu_Item("MENU_ITEM_TALENT_16_TITLE", Mining);
    Update_Menu_Item("MENU_ITEM_TALENT_16_SKILL", MiningState);
	
    Update_Menu_Item("MENU_ITEM_KAPITEL", IntToString(kapitel));
};