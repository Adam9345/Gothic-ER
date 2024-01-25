/* AF_ItemPreview*
* Authors: Fawkes & Auronen
* Version: 0.01 first draft
*
* Description:
*     This feature allows you to preview items during dialogues, when 
*    choosing a reward (Torrez in G1, Fisk (digger's trousers G1))
* 
* How to use:
*     For "full" dialogues you have to declare a variable "var int AFIP_ShowItem"
*     and assign a item instance to it 
*         Example: var int AFIP_ShowItem; AFIP_ShowItem = ItMw_1h_Vlk_Dagger;
*
*     And that's it! 
* 
*     For Info_AddChoice types of dialogues it is a bit more elaborate
*         In the same function you are declaring your Info choices you have to use
*        AFIP_SetChoiceItem function, it takes two parameters:
*            1. function that runs when you choose that option
*            2. item instance
*        In the function that runs when you select the option you declare a variable "var int AFIP_ShowItem"
*
*     And that's it! 
*
*            
*
*
*
*/
 
/* NOTES:
* 
* 
* 
*/

/* TODO:
* 
*    
*     implement "rotate for inventory" function with user rotation?
*  
*     hook this to "oCItemContainer::DrawItemInfo" to have more rows for AF_EnhancedDamage.d?
*        - this would need a more detailed API to set individual rows and other stuff
* 
*/

/* Przyk³ady jak u¿ywaæ

instance DIA_Xardas_Reward (C_INFO)
{
    npc            = NONE_100_Xardas;
    nr            = 1; //3;
    condition    = DIA_Xardas_Reward_Condition;
    information    = DIA_Xardas_Reward_Info;
    permanent    = TRUE;
    description    = "I'll take the dagger.";
};

func int DIA_Xardas_Reward_Condition () {
    // This is how you define a item to be shown when this dialogue is highlighted
    var int AFIP_ShowItem; AFIP_ShowItem = ItMw_1h_Vlk_Dagger;
    
    return TRUE;
};

func void DIA_Xardas_Reward_Info () {
    CreateInvItem (other, ItMw_1h_Vlk_Dagger);
    AI_Output (other, self, "DIA_Xardas_Reward_14_00"); //I'll take dagger.
    AI_Output (self, other, "DIA_Xardas_Reward_15_01"); //Here it is.
    AI_StopProcessInfos    (self);
};


*/


// Kolejny przyk³ad

/*

instance DIA_Torrez_Belohnung(C_Info)
{
    npc         = NONE_100_Xardas;
    nr             = 5;
    condition     = DIA_Torrez_Belohnung_Condition;
    information = DIA_Torrez_Belohnung_Info;
    permanent     = 0;
    description = "I am here to choose my reward.";
};


func int DIA_Torrez_Belohnung_Condition()
{
    return TRUE;
};

func void DIA_Torrez_Belohnung_Info()
{
    AI_Output(other,self,"DIA_Torrez_Belohnung_15_00");    //I am here to choose my reward.
    AI_Output(self,other,"DIA_Torrez_Belohnung_04_01");    //Choose wisely.
    Info_ClearChoices(DIA_Torrez_Belohnung);

    Info_AddChoice(DIA_Torrez_Belohnung,     "Elixir of the spirit",        DIA_Torrez_Belohnung_ManaMax );
    // Assigns item to a choice
    AFIP_SetChoiceItem(DIA_Torrez_Belohnung_ManaMax, ItPo_Perm_Mana);
    
    Info_AddChoice(DIA_Torrez_Belohnung,     "Elixir of life",    DIA_Torrez_Belohnung_Scrolls );
    // Assigns item to a choice
    AFIP_SetChoiceItem(DIA_Torrez_Belohnung_Scrolls, ItPo_Perm_Health);
    
    Info_AddChoice(DIA_Torrez_Belohnung,     "Ring of dexterity",    DIA_Torrez_Belohnung_Dex );
    // Assigns item to a choice
    AFIP_SetChoiceItem(DIA_Torrez_Belohnung_Dex, ItRi_Dex_02);
    
    Info_AddChoice(DIA_Torrez_Belohnung,     "Ring of strength",            DIA_Torrez_Belohnung_Str );
    // Assigns item to a choice
    AFIP_SetChoiceItem(DIA_Torrez_Belohnung_Str, ItRi_Str_02);
};

func void DIA_Torrez_Belohnung_Str()
{
    var int AFIP_ShowItem; // You have to define a variable, that is going to contain the item
    AI_Output(other,self,"DIA_Torrez_Belohnung_Str_15_00");    //I'll take the ring of strength.
    AI_Output(self,other,"DIA_Torrez_Belohnung_Str_04_01");    //Experienced choice. Here it is.
    
    // A nice coincidence - we don't have to manually select which item to insert, since we have it in AFIP_ShowItem variable
    CreateInvItem (other, AFIP_ShowItem);
    
    Info_ClearChoices(DIA_Torrez_Belohnung);
};

func void DIA_Torrez_Belohnung_Dex()
{
    var int AFIP_ShowItem; // You have to define a variable, that is going to contain the item
    AI_Output(other,self,"DIA_Torrez_Belohnung_Dex_15_00");    //I would like this ring of dexterity.
    AI_Output(self,other,"DIA_Torrez_Belohnung_Dex_04_01");    //Dexterity wins against strength. Good choice.
    
    // A nice coincidence - we don't have to manually select which item to insert, since we have it in AFIP_ShowItem variable
    CreateInvItem (other, AFIP_ShowItem);
    
    Info_ClearChoices(DIA_Torrez_Belohnung);
};

func void DIA_Torrez_Belohnung_Scrolls()
{
    var int AFIP_ShowItem; // You have to define a variable, that is going to contain the item
    AI_Output(other,self,"DIA_Torrez_Belohnung_Scrolls_15_00");    //Give me the elixir of life .
    AI_Output(self,other,"DIA_Torrez_Belohnung_Scrolls_04_01");    //Use it well.
    
    // A nice coincidence - we don't have to manually select which item to insert, since we have it in AFIP_ShowItem variable
    CreateInvItem (other, AFIP_ShowItem);
    
    Info_ClearChoices(DIA_Torrez_Belohnung);
};

func void DIA_Torrez_Belohnung_ManaMax()
{
    var int AFIP_ShowItem; // You have to define a variable, that is going to contain the item
    AI_Output(other,self,"DIA_Torrez_Belohnung_ManaMax_15_00");    //I would like to have the elixir of spirit!
    AI_Output(self,other,"DIA_Torrez_Belohnung_ManaMax_04_01");    //A wise choice! You have picked the most precious of all gifts. Drink the potion and your power will grow!
    
    // A nice coincidence - we don't have to manually select which item to insert, since we have it in AFIP_ShowItem variable
    CreateInvItem (other, AFIP_ShowItem);
    
    Info_ClearChoices(DIA_Torrez_Belohnung);
};

*/


//========================================
// Some wrapper functions for easier 
// item positioning for LeGo Render.d
//========================================

/*
class zCViewDialogChoice {
	var int _vtbl; //0
	var int refctr; //4
	var int hashindex; //8
	var int hashNext; //12

	var string objectName; //16
      //}

	var int _zCViewBase_vtbl; //36

	var int virtualPositionX; //zPOS // sizeof 08h offset 28h
	var int virtualPositionY;
	var int virtualSizeX; //zPOS // sizeof 08h offset 30h
	var int virtualSizeY;

	var int pixelPositionX; //zPOS // sizeof 08h offset 38h
	var int pixelPositionY;
	var int pixelSizeX; //zPOS // sizeof 08h offset 40h
	var int pixelSizeY;

	var int ID; //unsigned long // sizeof 04h offset 48h
	var int viewParent; //zCViewObject* // sizeof 04h offset 4Ch

	//zCListSort<zCViewObject> ListChildren; // sizeof 0Ch offset 50h
	var int listChildren_compare;
	var int listChildren_data;
	var int listChildren_next;
     //}

	var int textureFuncAlpha; //zTRnd_AlphaBlendFunc // sizeof 04h offset 5Ch
	var int texture; //zCTexture* // sizeof 04h offset 60h
	var int textureColor; //zCOLOR // sizeof 04h offset 64h
	var int textureAlpha; //int // sizeof 04h offset 68h

	//zVEC2 TexturePosition[2]; // sizeof 10h offset 6Ch
	var int texturePosition_0[2];
	var int texturePosition_1[2];
    //}

	var int hasOpened; //int // sizeof 04h offset 7Ch
	var int hasClosed; //int // sizeof 04h offset 80h
	var int timeOpen; //float // sizeof 04h offset 84h
	var int timeClose; //float // sizeof 04h offset 88h
	var int durationOpen; //float // sizeof 04h offset 8Ch
	var int durationClose; //float // sizeof 04h offset 90h
	var int modeOpen; //unsigned long // sizeof 04h offset 94h
	var int modeClose; //unsigned long // sizeof 04h offset 98h
	//zVEC2 TextureOffset[2]; // sizeof 10h offset 9Ch
	var int textureOffset_0[2];
	var int textureOffset_1[2];
   //}

	//zCArray<zCViewText2*> ListTextLines; // sizeof 0Ch offset ACh
	var int listTextLines_array; //zCViewText2*
	var int listTextLines_numAlloc;  //int
	var int listTextLines_numInArray;//int

	//zCViewFont ViewFont; // sizeof 14h offset B8h
	//class zCViewFont {
	var int funcAlphaBlend; //zTRnd_AlphaBlendFunc // sizeof 04h offset 00h
	var int font; //zCFont* // sizeof 04h offset 04h
	var int color; //zCOLOR // sizeof 04h offset 08h
	var int alpha; //int // sizeof 04h offset 0Ch
	var int enabledBlend; //int // sizeof 04h offset 10h
	//};

	var int positionCursorX; //zPOS // sizeof 08h offset CCh
	var int positionCursorY;
	var int offsetTextPixelX; //zPOS // sizeof 08h offset D4h
	var int offsetTextPixelY;
	var int sizeMargin_0[2]; //zPOS // sizeof 10h offset DCh
	var int sizeMargin_1[2];
  //}

	var int zCInputCallback_vtbl; //236

	var int isDone; //int // sizeof 04h offset F0h
	var int isActivated; //int // sizeof 04h offset F4h
 //}

	var int colorSelected; //zCOLOR // sizeof 04h offset F8h
	var int colorGrayed; //zCOLOR // sizeof 04h offset FCh
	var int choiceSelected; //int // sizeof 04h offset 100h
	var int choices; //int // sizeof 04h offset 104h
	var int lineStart; //int // sizeof 04h offset 108h
};

*/
/*
func int oCInfoManager_GetInfoUnimportant (var int slfinstance, var int othinstance, var int index) {
	//0x00665120 public: class oCInfo * __thiscall oCInfoManager::GetInfoUnimportant(class oCNpc *,class oCNpc *,int)
	const int oCInfoManager__GetInfoUnimportant_G1 = 6705440;

	//0x00703030 public: class oCInfo * __thiscall oCInfoManager::GetInfoUnimportant(class oCNPC *,class oCNPC *,int)
	const int oCInfoManager__GetInfoUnimportant_G2 = 7352368;

	if (!MEM_Game.infoman) { return 0; };
	var oCNPC slf; slf = Hlp_GetNPC (slfinstance);
	if (!Hlp_IsValidNPC (slf)) { return 0; };
	var oCNPC oth; oth = Hlp_GetNPC (othinstance);
	if (!Hlp_IsValidNPC (oth)) { return 0; };

	var int slfPtr; slfPtr = _@ (slf);
	var int othPtr; othPtr = _@ (oth);

	const int call = 0;
	if (CALL_Begin(call)) {
		CALL_IntParam (_@ (index));
		CALL_PtrParam (_@ (slfPtr));
		CALL_PtrParam (_@ (othPtr));
		CALL__thiscall (_@ (MEM_Game.infoman), MEMINT_SwitchG1G2(oCInfoManager__GetInfoUnimportant_G1, oCInfoManager__GetInfoUnimportant_G2));
		call = CALL_End();
	};

	return CALL_RetValAsPtr();
};
*/

func int InfoManager_GetSelectedInfo () {
	if (InfoManager_HasFinished ()) { return 0; };

	var int choiceView; choiceView = MEM_InformationMan.DlgChoice;

	if (!choiceView) { return 0; };

	var zCViewDialogChoice dlg; dlg = _^ (choiceView);

	const int cINFO_MGR_MODE_IMPORTANT	= 0;
	const int cINFO_MGR_MODE_INFO		= 1;
	const int cINFO_MGR_MODE_CHOICE		= 2;
	const int cINFO_MGR_MODE_TRADE		= 3;

	var zCArray arr; arr = _^ (choiceView + 172);

	if (arr.array) {
		if (MEM_InformationMan.Mode == cINFO_MGR_MODE_INFO) {
			var C_NPC slf; slf = _^ (MEM_InformationMan.npc);
			var C_NPC her; her = _^ (MEM_InformationMan.player);

			return oCInfoManager_GetInfoUnimportant (slf, her, dlg.ChoiceSelected);
		} else
		//Choices - have to be extracted from oCInfo.listChoices_next
		//MEM_InformationMan.Info is oCInfo pointer
		if (MEM_InformationMan.Mode == cINFO_MGR_MODE_CHOICE) {
			return MEM_InformationMan.Info;
		};
	};

	return 0;
};

func int InfoManager_GetSelectedInfoChoice () {
	if (InfoManager_HasFinished ()) { return 0; };

	var int choiceView; choiceView = MEM_InformationMan.DlgChoice;

	if (!choiceView) { return 0; };

	var zCViewDialogChoice dlg; dlg = _^ (choiceView);

	const int cINFO_MGR_MODE_IMPORTANT	= 0;
	const int cINFO_MGR_MODE_INFO		= 1;
	const int cINFO_MGR_MODE_CHOICE		= 2;
	const int cINFO_MGR_MODE_TRADE		= 3;

	var zCArray arr; arr = _^ (choiceView + 172);

	if (arr.array) {
		//Choices - have to be extracted from oCInfo.listChoices_next
		//MEM_InformationMan.Info is oCInfo pointer
		if (MEM_InformationMan.Mode == cINFO_MGR_MODE_CHOICE) {
			if (MEM_InformationMan.Info) {
				var oCInfo dlgInstance;
				dlgInstance = _^ (MEM_InformationMan.Info);

				if (dlgInstance.listChoices_next) {

					var int list; list = dlgInstance.listChoices_next;
					var zCList l;

					var int i; i = 0;
					while (list);
						l = _^ (list);

						if (l.data) {
							if (i == dlg.ChoiceSelected) {
								return l.data;
							};
						};

						list = l.next;
						i += 1;
					end;
				};
			};
		};
	};

	return 0;
};
/*
func int Render_AddItemCenter(var int itemInst, var int x, var int y, var int w, var int h) 
{
    return +Render_AddItemPrio(itemInst, x-(w>>1), y-(h>>1), x+((w+1)>>1), y+((h+1)>>1), 0);
};
*/

func int Render_AddItemCenterPrio(var int itemInst, var int x, var int y, var int w, var int h, var int priority) 
{
    return +Render_AddItemPrio(itemInst, x-(w>>1), y-(h>>1), x+((w+1)>>1), y+((h+1)>>1), priority);
};

func int Render_IsOpen(var int rndrHndl) 
{
    var RenderItem itm; itm = get(rndrHndl);
    if (itm.view_open) {
        return TRUE;
    } else {
        return FALSE;
    };
};

//========================================
// Constants
//========================================

/* NOTE: I got these values from the game 
* set to 1280x720 at 1.000 scale in SP
* This needs to be dynamic, but I do not 
* know, how to get to the real formula
*/
const int AFIP_view         = 0;
const int AFIP_rndObj         = 0;

// dimensions
const int AFIP_height         = 1845;
const int AFIP_width         = 4608;

// position
const int AFIP_x             = 1792;
const int AFIP_y             = 6006;

const int AFIP_currentItem    = 0;

const string AFIP_texture    = "DLG_CHOICE.tga";
const string AFIP_font        = "FONT_OLD_10_WHITE.TGA";
const string AFIP_varName    = "AFIP_SHOWITEM";


//========================================
// returns int value as string, returns 
// empty string, when 0
//========================================
func string countValue (var int val)
{
    if (val) { return IntToString(val); }
    else { return ""; };
};

//========================================
// Deletes both of the views
//========================================
func void AFIP_Delete()
{
    if (AFIP_rndObj) { Render_Remove(AFIP_rndObj); };
    if (AFIP_view) { View_Delete(AFIP_view); };
    AFIP_rndObj = 0;
    AFIP_view = 0;
};

//========================================
// Creates and shows the item preview
//========================================

/* NOTES: 
    - item is passed into the function as a parser ID 
    (just the name of the item instance)
    - it fits one more row (not used here)
    - it is set up (hardcoded) to mimic the in game item preview (roughly)
*/

func void AFIP_Create(var int itemIn)
{
    AFIP_currentItem = itemIn;
    var int itemPtr; itemPtr = Itm_GetPtr(itemIn);
    var oCItem itm; itm = _^(itemPtr);
    Print_GetScreenSize();
    
    if (!AFIP_view) // not really needed, but just to be sure
    {
        AFIP_view = View_Create(1, 1, 1000, 1000);
    };
    
    View_SetTexture(AFIP_view, AFIP_texture);
    
    var string heading; heading = itm.description;
    
    var int width; width     = Print_ToVirtual(Print_GetStringWidth(heading, AFIP_font), PS_X) * PS_VMAX / AFIP_width;
    var int height; height  = 900; // this should be calculated based on the height of the view?
    
    var int head; head = PS_VMax/30;
    var int marg; marg = PS_VMax/64;
    var int marg1; marg1 = PS_VMax/32;
    
    View_AddText(AFIP_view, PS_VMax/2 - width / 2, head, heading, AFIP_font);
    var string txt;
    
    // Lines - left side (text)
    
    repeat(i, 6); var int i;
        txt = MEM_ReadStringArray(_@s(itm.text), i);
        View_AddText(AFIP_view, PS_VMax/15 - head, head + marg + (i+2)*height, txt, AFIP_font);    
    end;

    // Lines - right side (values)
    
    repeat(j, 6); var int j;
        txt = countValue(MEM_ReadIntArray(_@(itm.count), j));
        View_AddText(AFIP_view, PS_VMax - marg1 - 2*Print_ToVirtual(Print_GetStringWidth(txt, AFIP_font), PS_X), head + marg + (j+2)*height,txt , AFIP_font);    
    end;
    
    // Resizing and moving 
    View_Resize(AFIP_view, AFIP_width, AFIP_height);
    View_Move  (AFIP_view, AFIP_x, PS_VMax/2);
    
    if (!AFIP_rndObj) // not really needed, but just to be sure
    {
        AFIP_rndObj = Render_AddItemCenterPrio(itemIn , PS_VMax/2 + 1300, PS_VMax/2 + AFIP_height/2, AFIP_height - 800, Print_ToRatio(AFIP_height - 800, PS_Y), 1);
    };
    
    Render_AddView(AFIP_view);
};

// Taken from Ikarus_doc.d
func void SetVarTo (var string variableName, var int value) {
    var int symPtr;
    symPtr = MEM_GetParserSymbol (variableName);
    
    if (symPtr) { //!= 0 
        var zCPar_Symbol sym;
        sym = MEM_PtrToInst (symPtr);
        
        if ((sym.bitfield & zCPar_Symbol_bitfield_type)
                                    == zPAR_TYPE_INT) {
            sym.content = value;
        } else {
            MEM_Error ("SetVarTo: Die Variable ist kein Integer!");
        };
    } else {
        MEM_Error ("SetVarTo: Das Symbol existiert nicht!");
    };
};

//========================================
// Sets the item, for Info_AddChoice type 
// dialogues
//========================================
func void AFIP_SetChoiceItem(var func action, var int item )
{
    var int fncID; fncID = MEM_GetFuncID(action);
    
    var zCPar_Symbol symfunc; symfunc = _^(MEM_ReadIntArray (contentSymbolTableAddress, fncID));
    
    var string infoFuncName; infoFuncName = symfunc.name;
    
    // building the symbol name
    var string symbName; symbName = ConcatStrings(infoFuncName, ".");
    symbName = ConcatStrings(symbName, AFIP_varName);
    
    SetVarTo(symbName, item);
};

//========================================
// Unused because it doesn't work, but it 
// would be cleaner (I think :) )
//========================================
func void AFIP_Info_AddChoice(var int menu, var string text, var func action, var int item )
{
    // this doesn't work for this particular technique - func action has a different symbol -> AFIP_Info_AddChoice.action
    MEM_Info("== AFIP_Info_AddChoice ==");
};

func int AFIP_HasItem()
{
    // get selected oCInfo
    var int infoPtr; infoPtr = InfoManager_GetSelectedInfo();
    // get selected oCInfoChoice
    var int infoChoicePtr; infoChoicePtr = InfoManager_GetSelectedInfoChoice();
    if (infoPtr && !infoChoicePtr) 
    {
        // MEM_Info("Info");
        var oCInfo diaInfo; diaInfo = _^(infoPtr);
        
        // getting the name of dialogues condition function 
        /*
            Ideally this would in the info function (it would work even for Info_AddChoice dialogues) but in that 
            case the var is only initialized by Ikarus (to be 0), since the function didn't run - no value assigned
            Should I be saving oCInfo* and oCInfoChoice* in a hash table?? Similarly like I do in AF_EnhancedDamage
        */
        var zCPar_Symbol symfunc; symfunc = _^(MEM_ReadIntArray (contentSymbolTableAddress,  /*diaInfo.information */ diaInfo.conditions));
        
        var string infoFuncName; infoFuncName = symfunc.name;
        // building the variables symbol name
        var string symbName; symbName = ConcatStrings(infoFuncName, ".");
        symbName = ConcatStrings(symbName, AFIP_varName);

        // getting and checking if symbol with this name exists (if user defined item to be shown)
        var int symPtr; symPtr = MEM_GetParserSymbol (symbName);
        if (symPtr == 0) 
        {
            return 0;
        } 
        else 
        {
            var zCPar_Symbol sym;
            sym = _^(symPtr);
            return sym.content;
        };
    } 
    else if ((infoPtr && infoChoicePtr) || (!infoPtr  && infoChoicePtr))
    {
        /*    class oCInfoChoice {
                var string Text;    //zSTRING 
                var int Function;    //int     //symbolindex    
            };*/
        var oCInfoChoice diaInfoChoice; diaInfoChoice = _^(infoChoicePtr);
        var zCPar_Symbol symChoiceFunc; symChoiceFunc = _^(MEM_ReadIntArray (contentSymbolTableAddress, diaInfoChoice.Function));
        
        var string infoChoiceFuncName; infoChoiceFuncName = symChoiceFunc.name;
        
        // building the variables symbol name
        var string symbChoiceName; symbChoiceName = ConcatStrings(infoChoiceFuncName, ".");
        symbChoiceName = ConcatStrings(symbChoiceName, AFIP_varName);
        
        // getting and checking if symbol with this name exists (if user defined item to be shown)
        var int symbPtr; symbPtr = MEM_GetParserSymbol (symbChoiceName);
        if (symbPtr == 0) 
        {
            return 0;
        } 
        else 
        {
            var zCPar_Symbol symb;
            symb = _^(symbPtr);
            return symb.content;
        };
    }
    else
    {
        return 0;
    };    
};

//========================================
// HOOK: runs the frame function at the
// beginning of the dialogue
//========================================
func void _hook_oCInformationManager__OnInfoBegin()
{

    

    FF_ApplyOnce(FF_AF_ItemPreview);
};

//========================================
// HOOK: removes the frame function at the
// end of the dialogue
//========================================
func void _hook_oCInformationManager__OnTermination()
{
    FF_Remove(FF_AF_ItemPreview);
};

//========================================
// FF: checks if there is item to be 
// shown and shows it
//========================================
func void FF_AF_ItemPreview()
{
    // show only when the dialogue selection is active
    if (MEM_InformationMan.IsWaitingForSelection) 
    {
        // get the item, if there is any
        var int itm; itm = AFIP_HasItem();
        if (itm == 0 ) // if there is no item, delete view (if there's one) and end
        {
            AFIP_currentItem = 0;
            AFIP_Delete();
            return;
        }
        if (AFIP_currentItem != itm) // if the item changed delete the old view and create new one
        {
            AFIP_Delete();
            AFIP_currentItem = 0;
            AFIP_Create(itm);
            return;
        }
        else // there is item to show
        {
            if (!AFIP_view) // == 0 // if the view doesn't already exists
            {
                AFIP_Create(itm);
            };
        };
    }
    else // if dialogue selection is inactive delete the view (checks are in the AFIP_Delete function)
    {
        AFIP_currentItem = 0;
        AFIP_Delete();
        return;
    };
};

//========================================
// Init function
//========================================
func void AF_ItemPreview_Init() 
{
    const int once = 0;
    if (!once) {
        // 0072E430  .text     Debug data           ?OnTermination@oCInformationManager@@IAIXXZ
        // 0x006631A0 protected: void __fastcall oCInformationManager::OnTermination(void)
        HookEngine(MEMINT_SwitchG1G2(7529520, 6697376), MEMINT_SwitchG1G2(6, 7), "_hook_oCInformationManager__OnTermination");
        // 0072D2E0  .text     Debug data           ?OnInfoBegin@oCInformationManager@@IAIXXZ
        // 0x00661FF0 protected: void __fastcall oCInformationManager::OnInfoBegin(void)
        HookEngine(MEMINT_SwitchG1G2(7525088, 6692848), 6, "_hook_oCInformationManager__OnInfoBegin");
        
        if (GOTHIC_BASE_VERSION == 1) {
            // in G2 OnInfoBegin is sometimes not called.
            // oCInformationManager::SetNpc @ 00660b74, size 6 <- always called at the beginning of a dialog
            HookEngine(7519816, 6, "_hook_oCInformationManager__OnInfoBegin");
        };
        
        once = 1;
    };
};