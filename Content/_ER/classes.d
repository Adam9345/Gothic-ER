class c_recipe {
    var int recipeitem;
    var int mintalent;
    var int recId;
    var int totalrequired;
    var int requireditem[7];
    var int requireditemamount[7];
    var int reqitem_ismultiuse[7];
    var int docinst;
    var string description;
};

/*class zCViewDialogChoice {
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
};*/
/*
class zcviewdialogchoice {
    var int _vtbl;
    var int refctr;
    var int hashindex;
    var int next;
    var string ustring;
    var int _zcviewbase_vtbl;
    var int vposx;
    var int vposy;
    var int vsizex;
    var int vsizey;
    var int pposx;
    var int pposy;
    var int psizex;
    var int psizey;
    var int key;
    var int parent;
    var int childs_compare;
    var int childs_count;
    var int childs_last;
    var int childs_wurzel;
    var int backtex;
    var int color;
    var int alpha;
    var int texpos_0[2];
    var int texpos_1[2];
    var int isopen;
    var int isclosed;
    var int timeopen;
    var int timeclose;
    var int duropen;
    var int durclose;
    var int fxopen;
    var int fxclose;
    var int texoffset_0[2];
    var int texoffset_1[2];
    var int m_listlines_array;
    var int m_listlines_numalloc;
    var int m_listlines_numinarray;
    var int alphafunc;
    var int font;
    var int fontcolor;
    var int fontalpha;
    var int u200;
    var int cursorx;
    var int cursory;
    var int offsettextpx;
    var int offsettextpy;
    var int sizemargin_0[2];
    var int sizemargin_1[2];
    var int event;
    var int isdone;
    var int isactivated;
    var int colorselected;
    var int colorgrayed;
    var int choiceselected;
    var int choices;
    var int linestart;
    var int u268;
    var int u272;
    var int u276;
};
*/
