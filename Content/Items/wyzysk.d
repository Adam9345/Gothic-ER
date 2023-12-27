
/////////////////////////////////////////////////////////////////////

// DRUDZI MYRTANY. TOM I

// SUGEROWANA LOKACJA: OB”Z MYåLIWYCH, NA STOLE ALCHEMICZNYM, ALBO NIEOPODAL; WAØNE BY BY£Y W POBLIØU CLAWA, BO W ZA£OØENIU TE KSIEGI NALEØ• DO NIEGO 

// ALTERNATYWNIE CLAW M”G£BY NAM DA∆ JE RAZEM Z 250 BRY£KAMI RUDY JAKO NAGROD  ZA ANTIDOTUM NA JAD JASZCZURA. 

// KATEGORIA: ZWYCZAJNE - MOØNA T• KSI G  DOSTA∆ U HANDLARZY, LUB ZNALEè∆ W OG”LNODOST PNYCH MIEJSCACH

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_DruidsOfMyrtana1 (C_ITEM)

{

name ="Druidzi Myrtany. Tom I";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_03.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autor: Tertulian z Ardei";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_DruidsOfMyrtana1;

};

FUNC VOID Use_Book_DruidsOfMyrtana1()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "BOOK_ER_L.tga", 0);

Doc_SetPage ( nDocID,  1, "BOOK_ER_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Druidzi Myrtany. Tom I");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Traktat o druidzkich kap≥anach Myrtany, opisujπcy druidzki kult i jego historiÍ]");

Doc_SetMargins( nDocID,  -1,  15, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_DruidsOfMyrtana1,LOG_NOTE);

B_LogEntry(BookLog_DruidsOfMyrtana1,"Druidzi Myrtany. Tom I");

B_LogEntry(BookLog_DruidsOfMyrtana1,"Druidzi Myrtany to prymitywni magowie natury, bÍdπcy kap≥anami Adanosa - boga natury i rÛwnowagi. Mimo to niewiele majπ wspÛlnego z magami wody, gdyø ci zwykli postrzegaÊ druidzkich kap≥anÛw jako pÛ≥pogaÒskich parweniuszy, nazywajπc ich przy tym pogardliwie szamanami. Podobnie lekcewaøπcy stosunek majπ do nich kap≥ani Innosa, jednak ani magowie ognia, ani magowie wody nie podejmujπ siÍ przeúladowania druidÛw. Przynajmniej od czasu, gdy owi magowie natury wyrzekli siÍ pogaÒskich bÛstw i powrÛcili do zarzuconego przed wiekami kultu Adanosa.†");

B_LogEntry(BookLog_DruidsOfMyrtana1,"Domem druida jest las, gdzie ukryty przed cywilizacjπ mag natury, moøe w spokoju kontemplowaÊ przyrodÍ, opiekowaÊ siÍ zwierzynπ leúnπ i w prastarym obrzÍdzie oddawaÊ czeúÊ Panu Natury. Przychodzπ do nich rÛwnieø ludzie z okolicznych wiosek jako do uzdrowicieli. ");

B_LogEntry(BookLog_DruidsOfMyrtana1,"WokÛ≥ druida, lub grupy druidÛw tworzy siÍ zazwyczaj niewielka wspÛlnota goÒcÛw leúnych, liczπca sobie nie wiÍcej niø trzydziestu cz≥onkÛw. Przypomina ona poniekπd plemiona sprzed wiekÛw, kiedy to kult druidzki dominowa≥ w ca≥ej Myrtanie. Jednak zarÛwno goÒcy leúni, jak i druidzi wokÛ≥ ktÛrych siÍ skupiajπ, stanowiπ juø jedynie relikt przesz≥oúci, trzymajπcy siÍ resztkami si≥ i nieuchronnie ustÍpujπcy z areny dziejÛw. Zapewne dlatego inkwizycja magÛw ognia toleruje jeszcze ostatki obecnoúci druidÛw na tych ziemiach.†");

B_LogEntry(BookLog_DruidsOfMyrtana1,"Pierwotnie Krainy Centralne Kontynentu, a takøe niewyja≥owiony jeszcze przez wody potopu Varant, mia≥y powszechnie czciÊ Adanosa na mod≥Í druidzkπ. Owi prymitywni magowie pe≥niπc funkcje kap≥aÒskie, cieszyli siÍ najwiÍkszym obok wodzÛw pos≥uchem w plemionach rzπdzπcych tymi krajami. ");

B_LogEntry(BookLog_DruidsOfMyrtana1,"Od poczπtku druidyzm myrtaÒski úciúle by≥ zwiπzany z kultem przyrody, zaú Adanos odbiera≥ czeúÊ jako bÛstwo øyciodajnej wody i natury. Z biegiem wiekÛw ludzie odchodzili jednak od pierwotnej czystoúci, a wiara ich zaczÍ≥a ulegaÊ podobnej degeneracji. Coraz czÍúciej obok Adanosa pojawiali siÍ fa≥szywi bogowie, ktÛrzy najpierw odbierali wspÛlnπ z prawdziwym bÛstwem czeúÊ, a nastÍpnie je wypierali. Obiektem kultu stawa≥y siÍ jeziora i doliny, ska≥y i úwiÍte gaje, a Adanos odchodzi≥ w zapomnienie.");

B_LogEntry(BookLog_DruidsOfMyrtana1,"Sta≥o siÍ to na d≥ugo przed powo≥aniem Wiecznego WÍdrowca i powstaniem Imperium Pradawnych w Varancie. Gdy wiÍc wyznajπcy Innosa Pradawni zetknÍli siÍ w Myrtanie z druidyzmem, ten by≥ juø kultem pogaÒskim i jako pogaÒski kult, by≥ przez nich zwalczany.");

B_LogEntry(BookLog_DruidsOfMyrtana1,"Tak oto upad≥ kult Adanosa w druidyzmie, ustÍpujπc miejsca pogaÒstwu i fa≥szywym bÛstwom.");

B_LogEntry(BookLog_DruidsOfMyrtana1,"KONIEC TOMU I");


};


/////////////////////////////////////////////////////////////////////

// DRUDZI MYRTANY. TOM II

// ALTERNATYWNIE CLAW M”G£BY NAM DA∆ JE RAZEM Z 250 BRY£KAMI RUDY JAKO NAGROD  ZA ANTIDOTUM NA JAD JASZCZURA. 

// KATEGORIA: ZWYCZAJNE - MOØNA T• KSI G  DOSTA∆ U HANDLARZY, LUB ZNALEè∆ W OG”LNODOST PNYCH MIEJSCACH

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////




INSTANCE ItWr_DruidsOfMyrtana2 (C_ITEM)

{

name ="Druidzi Myrtany. Tom II";


mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_03.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autor: Tertulian z Ardei";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_DruidsOfMyrtana2;

};

FUNC VOID Use_Book_DruidsOfMyrtana2()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "BOOK_ER_L.tga", 0);

Doc_SetPage ( nDocID,  1, "BOOK_ER_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Druidzi Myrtany. Tom II");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Traktat o druidzkich kap≥anach Myrtany, opisujπcy druidzki kult i jego historiÍ]");

Doc_SetMargins( nDocID,  -1,  15, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_DruidsOfMyrtana2,LOG_NOTE);

B_LogEntry(BookLog_DruidsOfMyrtana2,"Druidzi Myrtany. Tom II");

B_LogEntry(BookLog_DruidsOfMyrtana2,"ChoÊ pierwotnie druidzi wyznawali Adanosa, to z biegiem wiekÛw, zaczÍli czciÊ rÛwnieø fa≥szywych bogÛw. Niebawem teø zastπpili nimi Pana Wody, lub sprowadzili go do roli pomniejszego bÛstwa w druidzkim panteonie. Juø Pradawni za czasÛw Imperium Varanckiego nie rozpoznawali w nich adanosytÛw, lecz traktowali ich jak pogan. Nie inaczej czynili w≥adcy w dobie ukszta≥towanych, monarchii myrtaÒskich. KrÛlowie ci zrozumiawszy jednak, øe nie zdo≥ajπ wypleniÊ druidyzmu mieczem, postanowili uczyniÊ go wyznaniem innosyckim.");

B_LogEntry(BookLog_DruidsOfMyrtana2,"Groüny Pan Ognia, strzegπcy krÛlewskiego prawa i niezrozumia≥ego dla pogaÒskiej ludnoúci porzπdku, by≥ dla druidÛw bogiem obcym i nie potrafili go przyjπÊ. Magowie ognia dojrzawszy wtedy w druidyzmie ukryty pierwiastek adanosycki, postanowili przyjúÊ do druidÛw z bardziej zrozumia≥ym dla tych pogan bÛstwem.");

B_LogEntry(BookLog_DruidsOfMyrtana2,"Wpierw przeto odnawiano kult Adanosa poúrÛd bÛstw pogaÒskich, a gdy Adanos na trwale zagoúci≥ w panteonie druidzkim, krÛlowie i magowie ognia dok≥adali wszelkich staraÒ by sta≥ siÍ nastÍpnie najwaøniejszym, a potem jedynym bÛstwem - rzecz jasna obok Innosa. Tak oto kult druidzki oczyúci≥ siÍ z nalecia≥oúci pogaÒskich i powrÛci≥ do wiary, od ktÛrej przed wiekami odstπpi≥.†Z czasem jednak dominujπce wyznanie wypiera≥o druidyzm i coraz wiÍcej ludzi decydowa≥o siÍ przyjπÊ kult Innosa. Do dziú na ziemiach Myrtany osta≥y siÍ nieliczne wspÛlnoty druidzkie.†");

B_LogEntry(BookLog_DruidsOfMyrtana2,"Piszπc o druidach nie sposÛb nie wspomnieÊ o tym, øe czÍúÊ z nich posiada umiejÍtnoúÊ, czy raczej moc przemiany w zwierzÍta. UmoøliwiaÊ im to majπ magiczne kamienie, o ktÛrych pochodzeniu trudno dziú przesπdzaÊ. Sπ one niezwykle rzadkie i jako relikwie sπ od wiekÛw przekazywane w obrÍbie krÍgu druidzkiego.");

B_LogEntry(BookLog_DruidsOfMyrtana2,"Kaødy kamieÒ ma posiadaÊ swego zwierzÍcego patrona, ktÛrego postaÊ moøe przyjπÊ osoba dzierøπca Ûw magiczny artefakt. Uøywanie ich wiπøe siÍ jednak z ryzykiem, gdyø podania g≥oszπ, øe niejeden cz≥owiek przybrawszy postaÊ zwierzÍcia nie mia≥ juø powrotu do swojej ludzkiej postaci. ");

B_LogEntry(BookLog_DruidsOfMyrtana2,"Pos≥ugiwanie siÍ wiÍc tym rodzajem magii wymaga ogromnej wiedzy i odwagi na ktÛrπ mÛg≥by siÍ zdobyÊ jedynie ktoú úwiÍcie wierzπcy w system wartoúci wyznawany przez druidÛw. Dla nich øycia w skÛrze zwierzÍcia by≥oby jedynie innπ formπ zespolenia z czczonπ przez nich naturπ i jej opiekunem - Adanosem.");

B_LogEntry(BookLog_DruidsOfMyrtana2,"Kamienie te mia≥y jeszcze tπ w≥aúciwoúÊ, øe w pobliøe miejsca pobytu ich posiadacza przybywa≥y owe zwierzÍta. Nie czyni≥y mu jednak szkody, gdyø moc kamienia uspokaja≥a nawet krwioøercze bestie, tak, øe stawa≥y sie niegroüne dla cz≥owieka. I bez tego jednak druidzi potrafili od zawsze oswoiÊ leúne zwierzÍta.");

B_LogEntry(BookLog_DruidsOfMyrtana2,"WiÍksze niebezpieczeÒstwo stanowili pojawiajπcy siÍ od czasu do czasu moønow≥adcy, pragnπcy zdobyÊ kamienie przemian. Osaczony druid zazwyczaj wola≥ zniszczyÊ ten magiczny przedmiot niø pozwoliÊ, by ten dosta≥ siÍ w niepowo≥ane rÍce.");

B_LogEntry(BookLog_DruidsOfMyrtana2,"Niekiedy teø zaklinali owe kamienie, tego ktÛry je zdoby≥. W kaødym razie, w wiÍkszoúci legend prÛba zdobycia kamienia przemiany koÒczy≥a sie øa≥oúnie dla chciwca.†Mimo to wszystko wskazuje na to, øe wiele wiekÛw po koÒcu ery druidÛw, nadchodzi czas, gdy zaniknπ teø ocala≥e dotπd wspÛlnoty druidzkie.");

B_LogEntry(BookLog_DruidsOfMyrtana2,"Nawet jednak wtedy, gdy na ziemiach myrtaÒskich nie bÍdzie juø ani jednego spoúrÛd tych prymitywnych magÛw, to ruch druidzki odcisnπ≥ trwa≥e piÍtno na historii naszego Kontynentu i jako taki, nigdy nie zginie, gdyø bÍdzie trwaÊ w pieúni i w s≥owie kronikarza. ");

B_LogEntry(BookLog_DruidsOfMyrtana2,"KONIEC TOMU II, OSTATNIEGO ");

};


/////////////////////////////////////////////////////////////////////

// ZAPRZYSI GLI. TOM I

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG”W WODY/BIBLIOTEKA XARDASA 

// RACZEJ NIEDOST PNA U HANDLARZY 

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_BrotherhoodOfHolyBlades1 (C_ITEM)

{

name ="ZaprzysiÍgli. Tom I";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_03.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autor: Dunarda Caniana z Trellis";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_BrotherhoodOfHolyBlades1;

};

FUNC VOID Use_Book_BrotherhoodOfHolyBlades1()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "BOOK_ER_L.tga", 0);

Doc_SetPage ( nDocID,  1, "BOOK_ER_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "ZaprzysiÍgli. Tom I");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Historia jednej z najniebezpieczniejszych varanckich sekt, ktÛra wierzy≥a w rych≥e objawienie siÍ ludzkiej manifestacji Beliara i stawia≥a sobie za cel unicestwienie kaødorazowej cz≥owieczej inkarnacji boga ciemnoúci.]");

Doc_SetMargins( nDocID,  -1,  15, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_BrotherhoodOfHolyBlades1,LOG_NOTE);

B_LogEntry(BookLog_BrotherhoodOfHolyBlades1,"ZaprzysiÍgli. Tom I");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades1,"Historia ZaprzysiÍg≥ych zaczyna siÍ w doúÊ trudnej do okreúlenia przesz≥oúci. Niepodobna jest ustaliÊ za czyjego panowania owo bractwo siÍ zrodzi≥o. Wiadomym jest jednak, øe po wiekach swego istnienia, zosta≥o z≥amane i rozbite przez wielkiego emira Khalima z Mora Sul.");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades1,"Od wiekÛw smagane pustynnym s≥oÒcem, posiadajπce nieprzyjazny dla cz≥owieka  klimat, po≥udniowe kraÒce Varantu, by≥y gniazdem sekciarstwa i odszczepieÒstwa. Na owe ziemie wyruszali rÛwnieø ascetyczni mÍøowie w samotnoúci i wyrzeczeniu siÍ wygÛd poszukujπcy bliskoúci z Adanosem. Jednym z nich by≥ Ayam. ");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades1,"Niewiele wiadomo o tej postaci, po za wπtpliwπ informacjπ jakoby by≥ magiem wody i kap≥anem Adanosa. Przebywajπc w swej pustelni, mia≥ doznaÊ tajemniczej wizji, w ktÛrej ujrza≥ Beliara i ludzkie dzieciÍ pos≥ane przez niego na úwiat. Owa istota mia≥a sprowadziÊ na ludzi liczne nieszczÍúcia i zjednoczywszy ich w Beliarze, rozpoczπÊ panowanie mrocznego boga na ziemi. Zapowiadany w wizji cz≥owiek mia≥ w przysz≥oúci siÍ narodziÊ i staÊ siÍ Patriarchπ Cienia. Wed≥ug wierzeÒ sekty ZaprzysiÍg≥ych w kolejnych objawieniach, Adanos poleci≥ Ayamowi powo≥aÊ do øycia zakon, majπcy przygotowaÊ siÍ na przyjúcie i walkÍ z Patriarchπ Cienia. Natchniony owymi wizjami pustelnik, zgromadzi≥ wokÛ≥ siebie krπg uczniÛw, ktÛrzy uwierzyli w jego pos≥annictwo. ");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades1,"Gdy sekta siÍ juø zawiπza≥a, do Ayama mia≥ znÛw przemÛwiÊ Pan Wody. Odpowiadajπc na modlitwy o powstrzymanie przyjúcia S≥ugi Beliara, Adanos mia≥ rzec, øe biegu wydarzeÒ nie moøna odwrÛciÊ i Patriarcha Cienia musi przyjúÊ na úwiat. Pan Wody, wskaza≥ im jednak ratunek. Mia≥o nim piÍÊ úwiÍtych sztyletÛw, ktÛre wed≥ug wierzeÒ ZaprzysiÍg≥ych, jako rytualne ostrza kap≥aÒskie by≥y przechowywane w úwiπtyniach, wyznajπcych Innosa, Pradawnych. Ostrza te zaginÍ≥y, gdy przed wiekami Pan Wody ukara≥ potopem pychÍ staroøytnych VarantczykÛw.");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades1,"ZaprzysiÍgli uwaøajπ, øe Patriarcha Cienia ma przychodziÊ na úwiat przyobleczony w cia≥o ludzkie, do czasu gdy w rytualny sposÛb owych piÍÊ ostrzy nie zostanie wbitych w jego cia≥o. Ma to byÊ jedyna broÒ zdolna uúmierciÊ Pos≥aÒca Ciemnoúci. Wbicie niekompletnej liczby sztyletÛw wiπza≥o siÍ jedynie ze zniszczeniem jedynie jego cz≥owieczej pow≥oki, z zachowaniem ducha tej plugawej istoty. W takim przypadku, Patriarcha Ciemnoúci w stosownej godzinie mia≥ objawiaÊ siÍ w kolejnym wcieleniu.");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades1,"Ayam i do koÒca swych dni sta≥ na czele sekty ZaprzysiÍg≥ych, poszerzajπc jej krπg i poszukujπc owych artefaktÛw. Jego nastÍpcy zdo≥ali ponoÊ zgromadziÊ wszystkie piÍÊ sztyletÛw, choÊ rÛwnie dobrze mog≥y byÊ one falsyfikatami. Nie trudno sobie przecieø wyobraziÊ sytuacje, gdy przywÛdcy sekty obawiajπc siÍ konsekwencji odkrycia, øe sztylety z wizji za≥oøyciela zakonu nigdy nie istnia≥y, kazali jakiemuú nadzwyczaj zdolnemu kowalowi wykuÊ fa≥szywe ostrza. ");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades1,"Jakkolwiek by nie by≥o, dziú zarÛwno badacze z krÍgÛw kap≥aÒskich, jak i niezwiπzani z nimi uczeni, sk≥onni sπ widzieÊ w Ayamie nie tylko heretyka, ale rÛwnieø cz≥owieka niezrÛwnowaøonego, ktÛry da≥ poczπtek groünej sekcie. Historia ta nie koÒczy siÍ jednak na szalonym pustelnikuÖ");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades1,"KONIEC TOMU I");

};


/////////////////////////////////////////////////////////////////////

// ZAPRZYSI GLI. TOM II

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG”W WODY/BIBLIOTEKA XARDASA (WAØNE BY CA£Y KOMPLET ZNALAZ£ SI  W JEDNEJ Z TYCH DW”CH BIBLIOTEK)

// RACZEJ NIEDOST PNA U HANDLARZY 

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_BrotherhoodOfHolyBlades2 (C_ITEM)

{

name ="ZaprzysiÍgli. Tom II";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_03.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autor: Canian z Trellis";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_BrotherhoodOfHolyBlades2;

};

FUNC VOID Use_Book_BrotherhoodOfHolyBlades2()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "BOOK_ER_L.tga", 0);

Doc_SetPage ( nDocID,  1, "BOOK_ER_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "ZaprzysiÍgli. Tom II");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Historia jednej z najniebezpieczniejszych varanckich sekt, ktÛra wierzy≥a w rych≥e objawienie siÍ ludzkiej manifestacji Beliara i stawia≥a sobie za cel unicestwienie kaødorazowej cz≥owieczej inkarnacji boga ciemnoúci.]");

Doc_SetMargins( nDocID,  -1,  15, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_BrotherhoodOfHolyBlades2,LOG_NOTE);

B_LogEntry(BookLog_BrotherhoodOfHolyBlades2,"ZaprzysiÍgli. Tom II");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades2,"W ciπgu wiekÛw zaprzysiÍgli odnajdywali w rÛønych znacznych osobistoúciach postaÊ Patriarchy Cienia. Mieli ich rozpoznawaÊ po czynach, lub znamionach na ciele. Ofiarπ zakonu, czy raczej wielu rÛønych zakonÛw, gdyø w ciπgu wiekÛw wewnπtrz sekty dochodzi≥o do licznych podzia≥Ûw, pad≥o wiele znamienitych ludzi. WúrÛd ich ofiar by≥o miÍdzy innymi kilku dowÛdcÛw wojskowych z Mora Sul i Bragi, a takøe wielu znacznych kupcÛw z ca≥ego Varantu. NajwiÍkszym jednak ich Ñdokonaniemî, a zarazem tym ktÛry przyniÛs≥ im tyle s≥awy, co i zguby, by≥o uúmiercenie w≥adcy Bragi - emira Bilyi i jego dwÛch synÛw. ");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades2,"Na fali rozruchÛw i fanatyzmu, podsycanego plotkami o czarnoksiÍskich praktykach na dworze emira, rozjuszony t≥um ruszy≥ przeciwko przyrodzonym panom. W wyniku buntu do w≥adzy zostali wyniesieni ZaprzysiÍgli pod wodzπ maga Abdahela. Podczas rebelii emir Bilyia i jego synowie zostali bestialsko zasztyletowani przez cz≥onkÛw sekty, a ich cia≥a spalone na g≥Ûwnym placu miasta. ZaprzysiÍg≥ym nie uda≥o siÍ jednak dope≥niÊ rytua≥u w ca≥oúci, gdyø jedno z ostrzy mia≥o zaginπÊ w ferworze walk toczonych na ulicach z wojskami broniπcego siÍ emira.");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades2,"Po przejÍciu w≥adzy, ZaprzysiÍgli wygnali tych spoúrÛd magÛw wody, ktÛrzy im siÍ sprzeciwiali i wespÛ≥ z przychylnymi im kap≥anami, zaczÍli otwarcie propagowaÊ swe doktryny w zdobytym mieúcie. Do zakonu do≥πczali kolejni cz≥onkowie, a w Bradze zaczÍ≥y siÍ szerzyÊ heretyckie pisma. ");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades2,"Wnet zaczÍto poszukiwaÊ rzekomych winnych nieudanego rytua≥u, gdyø sπdzono, øe do zakonu przeniknÍli zdrajcy. Wierzono, øe to wyznawcy Beliara pragnπc za wszelkπ cenÍ zapobiec unicestwieniu Pos≥aÒca, mieli wykraúÊ jedno brakujπce ostrze. CieÒ podejrzenia pad≥ rÛwnieø na ludzi posπdzanych o sprzyjanie emirom.");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades2,"Z rozkazu Abdahela kaøde z narodzonych dzieci musia≥o byÊ sprawdzane pod kπtem znamion, ktÛre mog≥yby wskazywaÊ na to, øe ich cia≥a sta≥y siÍ domem Pos≥aÒca Beliara. Praktyki te poch≥onÍ≥y niejedno istnienie, podobnie jak przeúladowanie wszystkich ludzi podejrzanych o sprzyjanie zamordowanemu w≥adcy. ");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades2,"Powracajπcy z wojny Hakim ñ w≥adca Mora Sul, obleg≥ BragÍ i zdobywszy jπ po dwÛch dniach, pomúci≥ úmierÊ emira i przywrÛci≥ porzπdek w mieúcie. Osadziwszy na tronie towarzyszπcego mu podczas wyprawy syna zabitego emira Bilyi ñ Nuwasa, wyruszy≥ w drogÍ powrotnπ do swojego krÛlestwa. ");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades2,"ZaprzysiÍgli ponieúli wtedy klÍskÍ podwÛjnπ, gdyø z jednej strony zostali przetrzebieni i utracili swe sztylety, a z drugiej nie dokonali w pe≥ni rytua≥u. Nowa w≥adca do≥oøy≥ wszelkich staraÒ by wypleniÊ tπ sektÍ ze swojego miasta i ukaraÊ tych kap≥anÛw Adanosa, ktÛrzy opowiedzieli siÍ po stronie Abdahela. ");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades2,"Nie wiadomo co siÍ sta≥o z przywÛdcπ ZaprzysiÍg≥ych, gdyø nie odnaleziono jego zw≥ok. Po upadku rzπdÛw sekty w Bradze, historia g≥ucho milczy na temat dalszych losÛw Abdahela. Moøna wiÍc przyjπÊ, øe nie odegra≥ juø w niej øadnej znaczπcej roli. ChoÊ kto wie, jakπ wiedzÍ mogπ posiadaÊ tu sami ZaprzysiÍgli.");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades2,"Pewnym jest, øe Hakim po zdobyciu Bragi i przywrÛceniu jej prawowitemu emirowi, uwiÛz≥ zdobyte sztylety ze sobπ. Od tej pory cztery z nich przez wiele wiekÛw, spoczywa≥y w skarbcu w wielkim mieúcie Mora Sul.");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades2,"KONIEC TOMU II");

};


/////////////////////////////////////////////////////////////////////

// ZAPRZYSI GLI. TOM III

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG”W WODY/BIBLIOTEKA XARDASA (WAØNE BY CA£Y KOMPLET ZNALAZ£ SI  W JEDNEJ Z TYCH DW”CH BIBLIOTEK)

// RACZEJ NIEDOST PNA U HANDLARZY 

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_BrotherhoodOfHolyBlades3 (C_ITEM)

{

name ="ZaprzysiÍgli. Tom III";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_03.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autor: Canian z Trellis";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_BrotherhoodOfHolyBlades3;

};

FUNC VOID Use_Book_BrotherhoodOfHolyBlades3()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "BOOK_ER_L.tga", 0);

Doc_SetPage ( nDocID,  1, "BOOK_ER_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "ZaprzysiÍgli. Tom III");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Historia jednej z najniebezpieczniejszych varanckich sekt, ktÛra wierzy≥a w rych≥e objawienie siÍ ludzkiej manifestacji Beliara i stawia≥a sobie za cel unicestwienie kaødorazowej cz≥owieczej inkarnacji boga ciemnoúci.]");

Doc_SetMargins( nDocID,  -1,  15, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_BrotherhoodOfHolyBlades3,LOG_NOTE);

B_LogEntry(BookLog_BrotherhoodOfHolyBlades3,"ZaprzysiÍgli. Tom III");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades3,"Od czasÛw emira Hakima cztery rytualne sztylety ZaprzysiÍg≥ych przebywa≥y w Mora Sul, bÍdπc niemym úwiadectwem straszliwych wydarzeÒ z przesz≥oúci. Taki stan rzeczy trwa≥ do czasÛw, gdy Lukkor i Gellon zostali pokonani przez Rhobara II, a Varant zosta≥ dosta≥ siÍ pod panowanie krÛlÛw Myrtany. Jednak wojska Rhobara zdobywszy Mora Sul i wkroczywszy do skarbca wielkiego emira, znalaz≥y w zamku tylko trzy spoúrÛd czterech z≥oøonych tam rytualnych sztyletÛw. To co sta≥o siÍ z czwartym oraz piπtym z úwiÍtych ostrzy Zakonu ZaprzysiÍg≥ych, do dziú pozostaje zagadkπ. ");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades3,"Znam uczonych, ktÛrzy twierdzπ, øe sam Lukkor podarowa≥ ZaprzysiÍg≥ym jeden ze sztyletÛw, majπc nadziejÍ, øe ci obiorπ sobie za cel innosyckiego w≥adcÍ wkraczajπcego do adanosyckiego Varantu. Sπ teø tacy, co obstajπ przy tym, øe zakon zdo≥a≥ wykraúÊ jedno z ostrzy ze skarbca i do dziú kontynuuje swe dzie≥o.");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades3,"Z ciekawszych hipotez, niektÛrzy sπ sk≥onni domniemywaÊ, øe krÛlewski wywiad Myrtany zdo≥a≥ zinfiltrowaÊ szeregi bractwa i wykorzystuje zakon w swoich grach, eliminujπc osoby stanowiπce zagroøenie dla paÒstwa RhobarÛw. Ze wzglÍdu na stopieÒ tajnoúci zwiπzany z wywiadem, moøna o tym jedynie domniemywaÊ.");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades3,"Inne zakony wywodzπce siÍ z ZaprzysiÍg≥ych, zachowujπc pod≥oøe religijne, pada≥y ofiarπ manipulacji ze strony moønych, pragnπcych siÍ pozbyÊ konkretnych ludzi. ");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades3,"Jako poparcie twierdzeÒ jakoby ta sekta w dalszym ciπgu dzia≥a≥a, przywo≥uje siÍ rozmaite przypadki morderstw znamienitych osÛb, lecz úledztwa prowadzone przez straø krÛlewskπ i inkwizycjÍ magÛw ognia, nie potwierdzi≥y zwiπzkÛw tych zabÛjstw ze staroøytnπ sektπ varanckπ. Moøe poza jednym przypadkiem, gdy jakiú wariat wdar≥ siÍ na przyjÍcie vengardzkiego kupca Elberta i prÛbowa≥ go zasztyletowaÊ 'staroøytnym ostrzem'. ”w artefakt okaza≥ siÍ jedynie stylizowanym noøem, wykutym kilka tygodni wczeúniej  w kuüni miejscowego kowala. ");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades3,"Mimo to wciπø wielu ludzi, nawet powaønych, utrzymujÍ, øe sekta ZaprzysiÍg≥ych dzia≥a do dziú i jako taka ma mieÊ niema≥y wp≥yw na wydarzenia w naszym KrÛlestwieÖ ");

B_LogEntry(BookLog_BrotherhoodOfHolyBlades3,"KONIEC TOMU III, OSTATNIEGO");


};



/////////////////////////////////////////////////////////////////////

// GULDERNOWIE Z DHIRIM

// SUGEROWANA LOKACJA: REGA£ NIEOPODAL BULITA

// KATEGORIA: ZWYCZAJNE - MOØNA T• KSI G  DOSTA∆ U HANDLARZY, LUB ZNALEè∆ W OG”LNODOST PNYCH MIEJSCACH

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_Gulderns (C_ITEM)

{

name ="Guldernowie z Dhirim";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_03.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autor: Hungard z Brennus";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_Gulderns;

};

FUNC VOID Use_Book_Gulderns()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "BOOK_ER_L.tga", 0);

Doc_SetPage ( nDocID,  1, "BOOK_ER_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Guldernowie z Dhirim");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Historia GuldernÛw - przodkÛw dzisiejszych mieszkaÒcÛw Geldern]");

Doc_SetMargins( nDocID,  -1,  15, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_Gulderns,LOG_NOTE);

B_LogEntry(BookLog_Gulderns,"Guldernowie z Dhirim");

B_LogEntry(BookLog_Gulderns,"Dumne KrÛleswto Gothy nie by≥o jedynym, ktÛre mog≥o roúciÊ sobie prawa do tytu≥u spadkobiercy Imperium Pradawnych. W staroøytnoúci tereny, nad ktÛrymi gÛruje dziú wielkie miasto Geldern, zamieszkane by≥y przez barbarzyÒskie ludy GuldernÛw. Plemiona te niejednokrotnie najeødøa≥y varanckie posiad≥oúci, a takøe sam Varant Pradawnych. To w≥aúnie owym plemionom, miasto Geldern zawdziÍcza swojπ nazwÍ.†U schy≥ku Imperium tereny te posiada≥y juø oøywione kontakty handlowe z Varantem. Wraz z towarami i dobrami materialnymi, na ziemie te dociera≥y rÛwnieø wp≥ywy kulturalne i religijne. Za sprawπ zetkniÍcia siÍ z zaawansowanπ cywilizacjπ zaczÍ≥y powstawaÊ oúrodki miejskie, a w ostatnich dekadach Imperium rÛwnieø pierwsze paÒstwa. ");

B_LogEntry(BookLog_Gulderns,"KrÛtki epizod podboju tych ziem przez sπsiadÛw w okresie wÍdrÛwki ludÛw po upadku Imperium przyhamowa≥ ten proces. Ostatecznie jednak na tych terenach powsta≥o potÍøne krÛlestwo, ktÛre przyjÍ≥o jako swojπ, varanckπ nazwÍ tej krainy, czyli Dhirim. W≥adcy zjednoczonej krainy na znak swojej potÍgi postanowili wybudowaÊ wspania≥π stolicÍ, ktÛrπ nazwali Geldern, to jest 'miasto GuldernÛw'. Kraj ten opar≥ siÍ na dwÛch zasadniczych filarach - †eksploatacji wielkich kopalÒ i zachowywaniu dziedzictwa Imperium Varantu.†");

B_LogEntry(BookLog_Gulderns,"Mimo rozkwitu i bogactwa krÛlestwa nie powiod≥y siÍ podejmowane przez krÛlÛw Dhirim prÛby ekspansji, ktÛre napotyka≥y na silny opÛr ze strony potÍønych krÛlÛw Gothy i przeøywajπcych swÛj z≥oty wiek TrellijczykÛw. W obliczu kolejnych klÍsk, Dhirimijczycy porzucili myúl o podbojach i skupili siÍ na rozwoju w≥asnych ziem. Zapewniwszy sobie w ciπgu wiekÛw dobrobyt i republikaÒskie instytucje, krÛlestwo postanowi≥o trwaÊ w izolacjonizmie. ChoÊ zdarzali siÍ w≥adcy aktywnie angaøujπcy siÍ w walki na Kontynencie, to jednak aø po kres niepodleg≥ego bytu pozosta≥o wierne drodze dominacji handlowej i wystrzegania siÍ wojen. ");

B_LogEntry(BookLog_Gulderns,"SwÛj dobrobyt w ogromnej mierze Dhirimijczycy zawdziÍczali handlowi i wydobyciu, organizowanemu przez miejscowych kupcÛw. Zrzeszeni w wielkiej gelderyjskiej gildii Menthes, rozpoczÍli d≥ugi marsz zmierzajπcy wpierw do wspÛ≥udzia≥u we w≥adzy, a nastÍpnie do marginalizacji siedzπcych w stolicy krÛlÛw. ");

B_LogEntry(BookLog_Gulderns,"Wraz z wykszta≥ceniem siÍ republikaÒskich form rzπdÛw, coraz czÍúciej KrÛlestwo Dhirim nazywano od miasta KrÛlestwem Geldern, a nawet Republikπ Kupieckπ Geldern.†W schy≥kowej fazie niepodleg≥ego bytu, mia≥ miejsce kryzys istniejπcych w Dhirim instytucji republikaÒskich. ");

B_LogEntry(BookLog_Gulderns,"Wzrost znaczenia oligarchii wielkich kupcÛw z gildii Menthes budzi≥ sprzeciw obywateli miasta. Na fali owego niezadowolenia w≥adzÍ przechwytywali rozmaici tyranii. Nie mogπc powstrzymaÊ kryzysu paÒstwa i spe≥niÊ pok≥adanych w nich przez t≥um nadziei, w≥adza tyranÛw by≥a nieustannie zagroøona. ");

B_LogEntry(BookLog_Gulderns,"Przeciwko nim nieustannie spiskowali wielcy kupcy, pragnπcy powrotu oligarchii. W tej sytuacji tyrani szukali wsparcia potÍønych krÛlÛw Myrtany. Za tyrana Sangero, nastπpi≥o jednak odwrÛcenie przymierzy. Za cenÍ powrotu republikaÒsko-oligarchicznych form w Geldern i zagwarantowanie przywilejÛw kupcom, gildia zgodzi≥a siÍ uznaÊ w≥adzÍ krÛla Myrtany.†Od tej pory kraina ta sta≥a siÍ czÍúciπ nordmarskiej monarchii RhobarÛw. ");

B_LogEntry(BookLog_Gulderns,"KONIEC");

};


/////////////////////////////////////////////////////////////////////

// SUNDMARCZYCY

// LOKALIZACJA: DOWOLNA (NP. REGA£ W KOMNACIE GDZIE åPI M.IN. THORUS)

// KATEGORIA: ZWYCZAJNE - MOØNA T• KSI G  DOSTA∆ U HANDLARZY, LUB ZNALEè∆ W OG”LNODOST PNYCH MIEJSCACH

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_Sundmarians (C_ITEM)

{

name ="Sundmarczycy";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_03.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autor: Hanorf z Vengardu";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_Sundmarians;

};

FUNC VOID Use_Book_Sundmarians()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "BOOK_ER_L.tga", 0);

Doc_SetPage ( nDocID,  1, "BOOK_ER_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Sundmarczycy");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Traktat o Sundmarczykach - pobratymcach NordmarczykÛw, zamieszkujπcych tereny wokÛ≥ twierdzy Faring.]");

Doc_SetMargins( nDocID,  -1,  15, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_Sundmarians,LOG_NOTE);

B_LogEntry(BookLog_Sundmarians,"Sundmarczycy");

B_LogEntry(BookLog_Sundmarians,"Sundmarczycy to lud zamieszkujπcy pÛ≥nocne ziemie Krain Centralnych. Do Sundmaru mieli przybyÊ wiele wiekÛw temu, prowadzeni przez swego praojca ñ Rangulda. Ich praojczyznπ mia≥y byÊ wiecznie skute lodem Mroüne Wyspy, leøπce na pÛ≥nocny-wschÛd od KrÛlestwa Myrtany, ktÛre dziú sπ domem pÛ≥dzikich piratÛw. ");

B_LogEntry(BookLog_Sundmarians,"Wed≥ug chÍtnie powtarzanej przez SundmarczykÛw legendy, Sundmar jest ziemiπ powierzonπ Ranguldowi i jego potomkom przez bogÛw. Bogowie mieli jπ im obiecaÊ, po tym jak Sundmarczycy pokonali plemiÍ jaszczuroludzi, ktÛre to stworzenia obok z orkÛw w najdawniejszych czasach zamieszkiwa≥y te ziemie. ");

B_LogEntry(BookLog_Sundmarians,"Po wyparciu smoczego potomstwa, przez wieki Sundmarczycy toczyli walki ze swymi sπsiadami z po≥udnia - Jelkalami, czyli przodkami dzisiejszych VengardczykÛw, GothÛw i w mniejszym stopniu mieszkaÒcÛw Montery. Wobec poniesionej klÍski, czÍúÊ plemion sundmarskich pod wodzπ Dagonarda porzuci≥o swe ojczyste strony i wyruszy≥o do Nordmaru. Wydarzenia te ginπ jednak w mrokach dziejÛw i trudno rzec, w jakiej wojnie ponieúli oni klÍskÍ i jakich poraøka by≥a rozmiarÛw. ");

B_LogEntry(BookLog_Sundmarians,"Ci Sundmarczycy, ktÛrzy podπøyli za Dagonardem, mieli ponoÊ uchodziÊ przed niewolπ. Wiadomym jednak jest za sprawπ legendy o Bardorze, øe po rozpadzie pierwotnego ludu na dwa narody, Sundmarczycy jeszcze przez wiele lat toczyli wojny z Jelkalami jak rÛwny z rÛwnym.†");

B_LogEntry(BookLog_Sundmarians,"W ciπgu wiekÛw Sundmarczycy zostali podbici przez JelkalÛw z Gothy i zmuszeni do poddaÒstwa. Po serii powstaÒ i buntÛw, ostatecznie zapanowa≥ pokÛj. PÛ≥tora wieku po ostatecznej klÍsce, rozpoczÍ≥a siÍ era ≥upieøczych najazdÛw NordmarczykÛw na tereny po≥oøone w centralnej Myrtanie. Kaøda z takich wypraw przechodzi≥a przez tereny zamieszkane przez SundmarczykÛw, przynoszπc temu ludowi wielkie szkody. W czasach Merigi II Gockiego, powsta≥a twierdza Farung, ktÛra mia≥a umocniÊ jego panowanie nad tπ krainπ i postawiÊ tamÍ dla NordmarczykÛw. Ataki barbarzyÒcÛw z pÛ≥nocy jednak nie usta≥y.");

B_LogEntry(BookLog_Sundmarians,"Za Merigi IV, przyzwani przez toczπcego z krÛlem GothÛw wojnÍ Monteriusa II z Montery, Nordmarczycy pod wodzπ Hrothgara zdobyli Farung i obsadzili swojπ za≥ogπ. DowÛdca NordmarczykÛw prÍdko mianowa≥ siÍ jarlem, tworzπc udzielne paÒstwo w Farung. On i jego przodkowie rozpoczÍli proces kolonizacji Sundmaru przez osadnikÛw sprowadzonych z pÛ≥nocy, pragnπcych øyÊ w ≥agodniejszym klimacie. Tym sposobem zmienia≥a siÍ substancja tworzπca lud SundmarzczykÛw, gdyø przybysze z Nordmaru zasilili jego populacjÍ.");

B_LogEntry(BookLog_Sundmarians,"Poczπtkowe walki jarlÛw z nordmarskimi najazdami ≥upieøczymi usta≥y wraz z pobiciem wodza Vurlsena Niedüwiedzia, po ktÛrym to Sundmarczycy i Nordmarczycy rozpoczÍli erÍ krucjat pÛ≥nocnych, wiodπcych na ziemie orkÛw. W pogodzeniu dwÛch ga≥Ízi Rangulda ogromne zas≥ugi mieli kap≥ani Innosa skupieni w klasztorze w Nordmarze.†");

B_LogEntry(BookLog_Sundmarians,"KONIEC");

};


///////////////////////////////////////////////////////

// O PRADAWNYCH

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG”W WODY

// RANGA RELIGIJNA TEJ OPOWIEåCI JEST ZBYT DUØA BY KSI G  T• MOØNA BY£O KUPOWA∆ U HANDLARZY, LUB ZNAJDOWA∆ W DOMACH SKAZA—C”W

// NAPISANE PRZEZ WYZYSKKA

/////////////////////////////////////////////////////////////////////


INSTANCE ItWr_AncientKnowledge (C_ITEM)

{

name ="O Pradawnych";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_03.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="åwiÍte pisma";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_AncientKnowledge;

};

FUNC VOID Use_Book_AncientKnowledge()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "BOOK_ER_L.tga", 0);

Doc_SetPage ( nDocID,  1, "BOOK_ER_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "O Pradawnych");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[åwiÍte pisma o powstaniu i zag≥adzie staroøytnego ludu Pradawnych z Varantu]");

Doc_SetMargins( nDocID,  -1,  15, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_AncientKnowledge,LOG_NOTE);

B_LogEntry(BookLog_AncientKnowledge,"O Pradawnych");

B_LogEntry(BookLog_AncientKnowledge,"Na poczπtku krainÍ tÍ zamieszkiwali koczownicy i Wieczny WÍdrowiec wskaza≥ im drogÍ. I Innos przemÛwi≥ do Wiecznego WÍdrowca: ëOd≥Ûø swÛj kostur.í I w jego miejsce Innos da≥ mu ber≥o. I Wieczny WÍdrowiec zosta≥ jego s≥ugπ. I Innos obdaøy≥ go czÍúciπ swej boskiej mocy, by mÛg≥ powstrzymaÊ Beliara.");

B_LogEntry(BookLog_AncientKnowledge,"I mocπ tπ by≥ ogieÒ. I mia≥ nad nim w≥adzÍ. Ale niektÛrzy spoúrÛd koczownikÛw nie podπøyli za Innosem. I lud koczownikÛw podzieli≥ siÍ na dwie czÍúci. Ci, ktÛrzy podπøyli za Innosem, stali siÍ ludem Varantu. ");

B_LogEntry(BookLog_AncientKnowledge,"A s≥udzy Innosa pokonali armiÍ istot Beliara i wznieúli wspania≥e úwiπtynie ku chwale Innosa, a ber≥o sta≥o siÍ symbolem ich w≥adzy. I triumfowa≥ Innos, gdyø kraina ta sta≥a siÍ mu pos≥usznπ, a jej w≥adcami byli odtπd jego s≥udzy.");

B_LogEntry(BookLog_AncientKnowledge,"I Innos przemÛwi≥ do swych s≥ug: ëWznieúcie dla mnie portal, abym mÛg≥ rzπdziÊ w tej czÍúci úwiata przez ca≥π wiecznoúÊ.í I jego s≥udzy spe≥nili to øπdanie. A kiedy Beliar zobaczy≥, co robili s≥udzy Innosa, uniÛs≥ siÍ gniewem. I istota pe≥na staroøytnej mocy przyby≥a na jego wezwanie i powsta≥a z ziemi. ");

B_LogEntry(BookLog_AncientKnowledge,"A wraz z niπ inne potÍøne istoty. Ale nadszed≥ kres potÍønych istot, albowiem taka by≥a wola Adanosa. I Adanos zes≥a≥ powÛdü, a ta zmy≥a je z powierzchni ziemi. Kiedy s≥uga Innosa zobaczy≥, co siÍ dzieje, zamknπ≥ w úwiπtyniach piÍÊ boskich artefaktÛw Adanosa. ");

B_LogEntry(BookLog_AncientKnowledge,"I lud Varantu zginπ≥, a kostur i ber≥o pogrπøy≥y siÍ w wodzie. I rzek≥ Adanos do swych braci: ëNigdy wiÍcej wasza stopa nie postanie na mej ziemi, albowiem jest ona úwiÍta! Oto moja wola.í");


};







/////////////////////////////////////////////////////////////////////

// LORD ETIENNE

// SUGEROWANA LOKACJA: NA ZAMKU W KOMNACIE GOMEZA 

// KSI GA TA MOG£ABY ZAINTERESOWA∆ TYCH LUDZI, KT”RZY MAJ• OØYWIONE STOSUNKI ZE åWIATEM ZEWN TRZNYM. NIE PRZEZNACZONA RACZEJ DLA HANDLARZY, GDYØ ZWYK£YCH SKAZA—C”W ONA NIE ZAINTERESUJE. 

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_LordEtienne (C_ITEM)

{

name ="Lord Etienne";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_03.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autor: Taurinus Accalia";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_LordEtienne;

};

FUNC VOID Use_Book_LordEtienne()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "BOOK_ER_L.tga", 0);

Doc_SetPage ( nDocID,  1, "BOOK_ER_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Lord Etienne");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[KsiÍga z cyklu 'Najwaøniejsze postacie KrÛlestwa Myrtany', traktujπca o obecnym wielkim mistrzu Zakonu PaladynÛw.]");

Doc_SetMargins( nDocID,  -1,  15, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_LordEtienne,LOG_NOTE);

B_LogEntry(BookLog_LordEtienne,"Lord Etienne");

B_LogEntry(BookLog_LordEtienne,"Lord Etienne to wielki mistrz Zakonu PaladynÛw. Jest panem na zamku w Reveran ñ g≥Ûwnej siedzibie paladynÛw i ich najwaøniejszym oúrodku szkoleniowym. Stamtπd teø sprawuje dowÛdztwo nad podleg≥ymi Zakonowi zamkami paladynÛw w ca≥ym KrÛlestwiem Myrtany. Jest przy tym niezwykle ambitny, co czyni z niego jednπ z najbardziej wp≥ywowych postaci w paÒstwie RhobarÛw. Wed≥ug niektÛrych, mÛg≥ braÊ udzia≥ w zamordowaniu krÛlowej, choÊ úledztwo prowadzone na dworze krÛlewskim nie potwierdzi≥o tych pog≥osek.");

B_LogEntry(BookLog_LordEtienne,"Przysz≥y zwierzchnik paladynÛw urodzi≥ siÍ w ubogiej rodzinie na jednej z leøπcych na po≥udniowy-wschÛd wysp ñ na Bodermarze. Wychowany na ulicach, by≥ na dobrej drodze, by skoÒczyÊ øycie w szeregach portowej biedoty. Los siÍ jednak do niego uúmiechnπ≥. Pewien potencja≥ dostrzeg≥ w nim jeden z rycerzy przebywajπcych czasowo na Bodermarze. Ten zaprowadzi≥ go do rezydujπcego w mieúcie maga ognia ñ Loukanisa, proszπc úwiπtobliwego kap≥ana by zgodzi≥ siÍ nauczaÊ m≥odego Etienne.");

B_LogEntry(BookLog_LordEtienne,"Mag ognia siÍ zgodzi≥, choÊ wieúÊ niesie, øe niechÍtnie. Szybko siÍ jednak okaza≥o siÍ, øe oddany na naukÍ m≥odzieniec jest nader pojÍtnym uczniem. Etienne szczegÛlnie upodoba≥ sobie ksiÍgi o paladynach i wyprawach na orkÛw. Pasjonowa≥y go szczegÛlnie krucjaty pÛ≥nocne prowadzone przez jarlÛw Farung. Mag Loukanis spostrzeg≥szy zainteresowanie ch≥opca tematykπ wojen z orkami oraz rycerstwem, pomÛg≥ mu trafiÊ do g≥Ûwnego oúrodka szkoleniowego dla paladynÛw na zamku Revaran. Tak rozpoczÍ≥a siÍ kariera przysz≥ego wielkiego mistrza w Zakonie PaladynÛw. ");

B_LogEntry(BookLog_LordEtienne,"Lord Etienne jako rycerz Zakonu bra≥ udzia≥ w wielu walkach z orkami, w czasie ktÛrych odznaczy≥ siÍ odwagπ i mÍstwem. Pozwoli≥o mu to awansowaÊ na kolejne stopnie zakonnej hierarchii. W wieku 38 lat, jako zas≥uøony i szanowany cz≥onek bractwa, zosta≥ wybrany na zwierzchnika Zakonu PaladynÛw. Od tej pory stoi na ich czeleÖ");

};

































































/////////////////////////////////////////////////////////////////////

// KLUCZ DO MYRTANY

// SUGEROWANA LOKACJA: NA REGALE W JEDNEJ Z KOMNAT KWATERY MAGNAT”W

// KATEGORIA: ZWYCZAJNE - MOØNA T• KSI G  DOSTA∆ U HANDLARZY, LUB ZNALEè∆ W OG”LNODOST PNYCH MIEJSCACH

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_VarensBook (C_ITEM)

{

name ="Klucz do Myrtany";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_03.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autor: Varen z Faring";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_VarensBook;

};

FUNC VOID Use_Book_VarensBook()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "BOOK_ER_L.tga", 0);

Doc_SetPage ( nDocID,  1, "BOOK_ER_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Klucz do Myrtany");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[KrÛtki traktat o roli magicznej rudy w powstaniu i ekspansji Myrtany]");

Doc_SetMargins( nDocID,  -1,  15, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_VarensBook,LOG_NOTE);

B_LogEntry(BookLog_VarensBook,"Klucz do Myrtany");

B_LogEntry(BookLog_VarensBook,"Przez wiele wiekÛw magiczna ruda cieszy≥a siÍ uznaniem jedynie alchemikÛw i magÛw, ktÛrzy postrzegali jπ wy≥πcznie jako ürÛd≥o magicznej energii. ChoÊ niektÛrzy podejmowali prÛby zastosowania owego kruszcu w kowalstwie, to efekty takich eksperymentÛw by≥y nader mizerne. ");

B_LogEntry(BookLog_VarensBook,"Dopiero na wiek przed przybyciem Rhobara I do Myrtany, kowale nordmarscy odkryli metodÍ obrÛbki rudy pozwalajπcπ na wykorzystanie jej do produkcji broni.†Dokonanie to przypisuje siÍ niejakiemu Angirowi, mistrzowi kuüni pochodzπcemu Klanu M≥ota.");

B_LogEntry(BookLog_VarensBook,"Wynalazek ten znaczπco wp≥ynπ≥ na bieg naszej historii, gdyø Rhobarowie potrafili wykorzystaÊ go do zapewnienia swym armiom przewagi nad wojskami wrogÛw. Dziú juø z pewnoúciπ moøna rzec, øe gdyby nie magiczna ruda, nigdy nie powsta≥aby zjednoczona Myrtana.");

B_LogEntry(BookLog_VarensBook,"KONIEC");

};























































/////////////////////////////////////////////////////////////////////

// NORDMARCZYCY. TOM I

// SUGEROWANA LOKACJA: OB”Z £OWC”W ORK”W (NA STOLE W JASKINI)

// KATEGORIA: ZWYCZAJNE - MOØNA T• KSI G  DOSTA∆ U HANDLARZY, LUB ZNALEè∆ W OG”LNODOST PNYCH MIEJSCACH

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_HistoryOfNordmar1 (C_ITEM)

{

name ="Nordmarczycy. Tom I";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_03.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autor: Hanorf z Vengardu";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_HistoryOfNordmar1;

};

FUNC VOID Use_Book_HistoryOfNordmar1()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "BOOK_ER_L.tga", 0);

Doc_SetPage ( nDocID,  1, "BOOK_ER_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Nordmarczycy. Tom I");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Historia NordmarczykÛw]");

Doc_SetMargins( nDocID,  -1,  15, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_HistoryOfNordmar1,LOG_NOTE);

B_LogEntry(BookLog_HistoryOfNordmar1,"Nordmarczycy. Tom I");

B_LogEntry(BookLog_HistoryOfNordmar1,"Wed≥ug najstarszych podaÒ przodkowie NordmarczykÛw pierwotnie byli pogaÒskim ludem zamieszkujπcym Mroüne Wyspy, po≥oøone na pÛ≥nocny-wschÛd od Myrtany. Stamtπd ich przodkowie przybyli na ziemie, ktÛre dziú zwiemy Sundmarem, a nad ktÛrymi w naszych czasach gÛruje zbudowana przez krÛlÛw Gothy twierdza Faring.");

B_LogEntry(BookLog_HistoryOfNordmar1,"BarbarzyÒcy mieli przyp≥ynπÊ na Kontynent w poszukiwaniu ziemi, prowadzeni przez pÛ≥-legendarnego Rangulda, ktÛry sta≥ siÍ wspÛlnym przodkiem dzisiejszych NordmarczykÛw i SundmarczykÛw. ZarÛwno jedni jak i drudzy wierzπ, øe obie te krainy, po dwÛch stronach prze≥Íczy, nadane im zosta≥y przez przez bogÛw.");

B_LogEntry(BookLog_HistoryOfNordmar1,"To przekonanie wywodzi siÍ widocznie jeszcze z czasÛw wspÛlnoty obu ga≥Ízi ludu przyby≥ego z Mroünych Wysp. Z tym, øe o ile dawniej bogowie ci musieli byÊ pogaÒscy, o tyle dziú miejsce starych w tej opowieúci zajmuje myrtaÒski Innos, ktÛrego kult przyby≥ do ludÛw pÛ≥nocy dopiero wiele wiekÛw pÛüniej.");

B_LogEntry(BookLog_HistoryOfNordmar1,"Z przybyciem Rangulda na Kontynent wiπøe siÍ pewna legenda. W dniach nieurodzaju jaki dotknπ≥ Mroüne Wyspy, Ranguld uda≥ sie do wyroczni, gdzie us≥ysza≥ o ëzielonym lπdzie na Po≥udniuí. Praprzodek dzisiejszych ludÛw pÛ≥nocy u boku swych towarzyszy, wyruszy≥ wiÍc na wyprawÍ, we wskazanym przez bogÛw kierunku.");

B_LogEntry(BookLog_HistoryOfNordmar1,"Tak dotar≥ do Sundmaru, gdzie pokonawszy plemiÍ jaszczuroludzi, mia≥ w nagrodÍ otrzymaÊ od bogÛw dla swoich potomkÛw owe ziemie. Tyle przekazuje nam legenda.†Wiadomym jest jednak, øe przodkowie dzisiejszych ludÛw pÛ≥nocy od niepamiÍtnych czasÛw toczyli zaøarte boje ze swymi jelkalskimi sπsiadami.");

B_LogEntry(BookLog_HistoryOfNordmar1,"Na d≥ugo jeszcze przed narodzinami krÛla GothÛw, Troghdana, ktÛry zjednoczy≥ liczne szczepy JelkalÛw, przodkowie NordmarczykÛw zostali przez nich pokonani. Potomkom Rangulda grozi≥a niewola. W dniach klÍski dzia≥alnoúÊ swπ rozpoczπ≥ niejaki Dorganard, pochodzπcy najpewniej z jednego z zagroøonych plemion.");

B_LogEntry(BookLog_HistoryOfNordmar1,"Wed≥ug nordmarskiej tradycji, Dorganard mia≥ byÊ wybraÒcem bogÛw, ktÛremu bogowie polecili ocalenie jego ludu i poprowadzenie go ku ziemiom pÛ≥nocy. Z woli bogÛw, bezkresne ziemie za prze≥Íczπ mia≥y na wieki staÊ siÍ ich dziedzictwem. Z tπ nowinπ Dorganard przemierza≥ wioski i osady, g≥oszπc obietnicÍ bogÛw. ");

B_LogEntry(BookLog_HistoryOfNordmar1,"Za sprawπ jego nauk, rozpoczπ≥ siÍ wielki exodus, podczas ktÛrego ca≥e rodziny zostawia≥y swe domy i biorπc ze sobπ wszelki dobytek przeprawi≥y siÍ na pÛ≥noc. Przodkowie dzisiejszych NordmarczykÛw spotkali tam plemiona orkÛw, ktÛre dziesiπtkowane nieznanπ zarazπ, uleg≥y pod naporem przybyszÛw z po≥udnia.");

B_LogEntry(BookLog_HistoryOfNordmar1,"Potomkowie Rangulda wkrÛtce rozciπgnÍli swe posiadanie na ca≥π krainÍ, opierajπc jej granicÍ o po≥udniowe kraÒce niezbadanych ziem orkÛw. Kolejne wyprawy na pÛ≥noc majπce poszerzyÊ ich w≥adztwo, a napotykajπc na coraz silniejszy opÛr orkÛw uúwiadomi≥y Nordmarczykom, øe granica pozostanie niezmienna.");

B_LogEntry(BookLog_HistoryOfNordmar1,"KONIEC TOMU I");

};























































/////////////////////////////////////////////////////////////////////

// NORDMARCZYCY. TOM II

// SUGEROWANA LOKACJA: OB”Z £OWC”W ORK”W (NA STOLE W JASKINI)

// KATEGORIA: ZWYCZAJNE - MOØNA T• KSI G  DOSTA∆ U HANDLARZY, LUB ZNALEè∆ W OG”LNODOST PNYCH MIEJSCACH

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_HistoryOfNordmar2 (C_ITEM)

{

name ="Nordmarczycy. Tom II";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_03.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autor: Hanorf z Vengardu";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_HistoryOfNordmar2;

};

FUNC VOID Use_Book_HistoryOfNordmar2()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "BOOK_ER_L.tga", 0);

Doc_SetPage ( nDocID,  1, "BOOK_ER_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Nordmarczycy. Tom II");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Historia NordmarczykÛw]");

Doc_SetMargins( nDocID,  -1,  15, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_HistoryOfNordmar2,LOG_NOTE);

B_LogEntry(BookLog_HistoryOfNordmar2,"Nordmarczycy. Tom II");

B_LogEntry(BookLog_HistoryOfNordmar2,"Mija≥y wieki, a lud ten wzrasta≥ w si≥Í i liczebnoúÊ. W tym czasie jedne klany siÍ rodzi≥y, a inne znÛw zamiera≥y i odchodzi≥y do przesz≥oúci. Ostatecznie ukszta≥towa≥y siÍ trzy szczepy: Klan Ognia, Klan Wilka i Klan M≥ota. Nordmar, choÊ ogromny nie by≥ jednak w stanie wyøywiÊ coraz wiÍkszej populacji.");

B_LogEntry(BookLog_HistoryOfNordmar2,"Rusza≥y wiÍc kolejne wyprawy ku ziemiom po≥udnia, docierajπce aø po w≥oúci podleg≥e Monterze. Nie uwaøali siÍ jednak za ≥upieøcÛw, gdyø wierzyli, øe sami bogowie nadali im Sundmar. Plπdrujπc tamte ziemie mieli wiÍc, jedynie zbieraÊ plony odebranej im ziemi. Nie byli jednak na tyle silni by jπ odzyskaÊ.");

B_LogEntry(BookLog_HistoryOfNordmar2,"Trudno powiedzieÊ kiedy Nordmarczycy stali siÍ ludem czczπcym Innosa. Jest jednak pewnym, øe poczπtki tego kultu muszπ siÍ wiπzaÊ z ≥upieøczymi wyprawami na myrtaÒskie posiad≥oúci Pradawnych. PrzyjÍta z po≥udnia wiara na≥oøy≥a siÍ na prastary kult przodkÛw, tworzπc w≥aúciwπ dla Nordmaru odmianÍ kultu Innosa.");

B_LogEntry(BookLog_HistoryOfNordmar2,"Waøna wydaje siÍ byÊ tu postaÊ Akaschy, ktÛremu w Nordmarze mia≥ siÍ objawiÊ sam Pan Ognia. NiektÛrzy chcieliby widzieÊ w nim postaÊ, ktÛrej Nordmarczycy zawdziÍczajπ okie≥znanie skutej lodem krainy. Pewne podania prÛbujπ go przedstawiÊ nawet jako ucznia Wiecznego WÍdrowca øyjπcego kilkaset lat przed Akashπ.");

B_LogEntry(BookLog_HistoryOfNordmar2,"RÛwnie niedorzeczna wydaje siÍ myúl, øe Klan Ognia jest najstarszym miejscem w ca≥ym Nordmarze. Niewπtpliwie jednak Akascha by≥ postaciπ zwiπzanπ z Klanem Ognia, a byÊ moøe nawet jego protoplastπ. Ten bohater nordmarskich legend, jako barbarzyÒski wÛdz stoczy≥ liczne zwyciÍskie wojny z orkowymi plemionami.");

B_LogEntry(BookLog_HistoryOfNordmar2,"Jeøeli wierzyÊ tamtejszym podaniom, Akascha prowadzπc swych towarzyszy do kolejnych bojÛw mia≥ znacznie rozszerzyÊ granicÍ Nordmaru. Niosπc ogieÒ na ziemie orkÛw, wydziera≥ owe tereny z ich ≥ap i oddawa≥ we w≥adanie ludziom. Rozszerzy≥ tym samym znacznie granicÍ krainy opanowanej przez potomkÛw Rangulda.");

B_LogEntry(BookLog_HistoryOfNordmar2,"Na tym przyjdzie zakoÒczyÊ opis najstarszych dziejÛw NordmarczykÛw, nie opisawszy krucjat prowadzonych przez jarlÛw Farung na ziemie orkÛw, czy nie wspomniawszy wreszcie o zejúciu z gÛr Rhobara Wielkiego i powstaniu KrÛlestwa Myrtany. RÛwnieø obecne wojny Rhobara II z tym ludem dopiero czekajπ na kronikarza.");

B_LogEntry(BookLog_HistoryOfNordmar2,"Piszπcy te s≥owa ma jednak nadziejÍ, øe ksiÍga ta choÊ w niewielkim stopniu przybliøy chÍtnym dzieje ludÛw pÛ≥nocy, ktÛre choÊ dziú nazywane sπ najczÍúciej barbarzyÒskimi, to wyda≥y spoúrÛd siebie krÛlÛw i jednoczycieli KrÛlestwa Myrtany.");

B_LogEntry(BookLog_HistoryOfNordmar2,"KONIEC TOMU II, OSTATNIEGO");


};






















































/////////////////////////////////////////////////////////////////////

// HARAN HO. TOM I

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG”W WODY

// KATEGORIA: ZWYCZAJNE - MOØNA T• KSI G  DOSTA∆ U HANDLARZY, LUB ZNALEè∆ W OG”LNODOST PNYCH MIEJSCACH

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_HaranHo1 (C_ITEM)

{

name ="Haran Ho. Tom I";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_03.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autor: Thorun";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_HaranHo1;

};

FUNC VOID Use_Book_HaranHo1()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "BOOK_ER_L.tga", 0);

Doc_SetPage ( nDocID,  1, "BOOK_ER_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Haran Ho. Tom I");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[OpowieúÊ o bohaterze-renegacie z czasÛw Imperium Pradawnych w Varancie.]");

Doc_SetMargins( nDocID,  -1,  15, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_HaranHo1,LOG_NOTE);

B_LogEntry(BookLog_HaranHo1,"Haran Ho. Tom I");

B_LogEntry(BookLog_HaranHo1,"Ojciec Harana Ho pochodzi≥ z jednej z wysp, ktÛre tak obficie obsypujπ Wielkie Morze ciπgnπce siÍ na wschÛd od Kontynentu. Niewiele wiadomo o tym, co sk≥oni≥o go do przybycia do Varantu. Jedni powiadajπ, øe by≥ on jednym z wielu, ktÛrzy postanowili szukaÊ szczÍúcia w armii Imperium Pradawnych. Inni, øe mia≥ byÊ jakoby jednym z jeÒcÛw, ktÛry dziÍki swej nadzwyczajnej mπdroúci zdo≥a≥ zjednaÊ sobie uznanie wp≥ywowych osÛb i dziÍki temu zyskaÊ wolnoúÊ. Znajdπ siÍ teø tacy, co bÍdπ twierdziÊ, øe ojciec mÍczennika urodzi≥ siÍ w rodzinie urzÍdnika, blisko zwiπzanego ze úwiπtyniπ magÛw ognia.");

B_LogEntry(BookLog_HaranHo1,"Trudno tu rozstrzygnπÊ, ktÛrej wersji naleøa≥oby daÊ pos≥uch. Tym bardziej, øe nawet prawdziwe imiÍ rodzica Harana ginie w mrokach dziejÛw, a to znane z legend pochodzi najpewniej z o wiele pÛüniejszej, juø koczowniczo-varanckiej tradycji.†Legenda przyjmowana zarÛwno przez wyznawcÛw Adanosa, jak rÛwnieø przez nieprzychylny mu KoúciÛ≥ Innosa g≥osi, øe Haran Ho mia≥ byÊ jednym z najznamienitszych wojownikÛw czasÛw Nelezara I. Mia≥ przyjúÊ na úwiat w domu poboønego urzÍdnika, pozostajπcego w Innosyckich krÍgach úwiπtynnych. ");

B_LogEntry(BookLog_HaranHo1,"W przeddzieÒ narodzin Harana, jego ojciec mia≥ straszliwy sen. Oto objawi≥ mu siÍ czerwony gryf - zwierze poúwiÍcone Innosowi. Majestatyczne stworzenie wzrokiem groünym i pe≥nym niewypowiedzianej nienawiúci spoglπda≥o na rodzπce siÍ dziecko. Ojciec zrozumia≥, øe Haran nie jest mi≥ym Panu Ognia. Mi≥oúÊ rodzicielska jednak w nim zwyciÍøy≥a. Uklπk≥ przed ognistym gryfem, oddzielajπc go od dzieciÍcia, a wiedzπc, øe jest to zwierze Innosa, poczπ≥ b≥agaÊ:†ëOszczÍdü mego syna, a darujÍ go Twej úwiπtyni, Innosie! Jeúli z≥π mia≥a byÊ latoroúl moja, niechaj pod Twπ opiekπ wzrasta i s≥uøbπ swπ winÍ okupií");

B_LogEntry(BookLog_HaranHo1,"Majestatyczne stworzenie skierowa≥o swÛj wzrok na b≥agajπcego go cz≥owieka. Ojciec Harana by≥ wiernym i gorliwym Innosytπ, øyjπcym wed≥ug praw ludzkich i boskich. Sam Pan Ognia wiedzia≥, øe w sercu tym p≥onie ogieÒ niewzruszonej wiary. Najstarszy z BogÛw widzπc rozpaczliwe wo≥ania ojca, rozkaza≥ swemu zwierzÍciu by oszczÍdzi≥o ch≥opca. Gryf pos≥uszny woli Innosa, powoli siÍ oddala≥. Krzyk przebudzonego dzieciÍcia zwiastowa≥ koniec snu i rozpoczyna≥ øywot Harana Ho. Dla jednych mia≥ siÍ staÊ kiedyú úwiÍtym, dla innych znÛw przeklÍtym...");

B_LogEntry(BookLog_HaranHo1,"KONIEC TOMU I");

};





























































/////////////////////////////////////////////////////////////////////

// HARAN HO. TOM II

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG”W WODY

// KATEGORIA: ZWYCZAJNE - MOØNA T• KSI G  DOSTA∆ U HANDLARZY, LUB ZNALEè∆ W OG”LNODOST PNYCH MIEJSCACH

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_HaranHo2 (C_ITEM)

{

name ="Haran Ho. Tom II";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_03.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autor: Thorun";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_HaranHo2;

};

FUNC VOID Use_Book_HaranHo2()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "BOOK_ER_L.tga", 0);

Doc_SetPage ( nDocID,  1, "BOOK_ER_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Haran Ho. Tom II");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[OpowieúÊ o bohaterze-renegacie z czasÛw Imperium Pradawnych w Varancie]");

Doc_SetMargins( nDocID,  -1,  15, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_HaranHo2,LOG_NOTE);

B_LogEntry(BookLog_HaranHo2,"Haran Ho. Tom II");

B_LogEntry(BookLog_HaranHo2,"”smego dnia po narodzinach, ojciec Harana zaniÛs≥ syna do úwiπtyni, by tam ofiarowaÊ go Innosowi. Tym czynem ch≥opiec zosta≥ przeznaczony do stanu kap≥aÒskiego, czym rodzic dope≥ni≥ úlubÛw z≥oøonych Innosowi.†Gdy nadszed≥ czas, ojciec odda≥ Harana na nauki i wychowanie magom ognia. W miarÍ dorastanie stawa≥o siÍ jasne, øe Haran nie nadaje siÍ na kap≥ana. M≥odzieniec bardziej od mπdroúci ksiπg, ceni≥ sobie si≥Í orÍøa. Niejednokrotnie wdawa≥ siÍ w bÛjki z innymi nowicjuszami, czym bynajmniej nie zaskarbi≥ sobie wzglÍdÛw uczonych magÛw. Czas pokaza≥, øe jego prawdziwym powo≥aniem jest s≥uøba wojskowa. Nie ≥amiπc úlubÛw zaprzesta≥ nauki magii i pog≥Íbionych studiÛw teologicznych. WkrÛtce kap≥ani zezwolili mu na wziÍcie udzia≥u w dzia≥aniach wojennych krÛla Nelezara, ktÛry to w≥adca wielkπ ufnoúÊ pok≥ada≥ w Koúciele Innosa.");

B_LogEntry(BookLog_HaranHo2,"Wyprawia≥ sie wiÍc Haran przeciw PraveÒczykom, co w b≥Ídzie pogaÒskim hardo trwali. Lud ten urπga≥ mocy Pradwanych, urzπdzajπc ≥upieøcze wyprawy na ziemie pograniczne, nieustannie im zagraøajπc.†I tu Haran Ho dowiÛd≥ niezbicie, øe powo≥aniem rzemios≥o wojenne to jego prawdziwe powo≥anie. W czasie jednej z bitew z PraveÒczykiem, dokona≥ rzeczy, ktÛra przynios≥a mu s≥awÍ i zwrÛci≥a na niego uwagÍ samego w≥adcy. W trakcie niepomyúlnego dla wojsk imperialnych boju, jeden z oddzia≥Ûw dowodzonych przez krÛlewskiego przyjaciela zosta≥ okrπøony przez wrogÛw. Owym monarszym druhem, a zarazem dowÛdcπ oddzia≥u by≥ Bargalla, pod ktÛrym s≥uøy≥ teø Haran. M≥ody nowicjusz magÛw ognia zobaczy≥, øe jego dowÛdca leøy na ziemi bez ducha. Zdoby≥ siÍ wtedy na czyn bohaterski i przedzierajπc siÍ przez zastÍpy wroga, pochwyci≥ nieprzytomnego i wyniÛs≥ z wrogiego okrπøenia.");

B_LogEntry(BookLog_HaranHo2,"W dowÛd wdziÍcznoúci za uratowanie krÛlewskiego przyjaciela wezwa≥ go imperator Nelzar przed swoje oblicze:†ëDowiod≥eú swego mÍstwa nowicjuszu Haranie! Czyn wielki bez nagrody ujúÊ nie moøe, przeto proú o co chcesz, a ja Ci to darujÍ!í. Haran nie prosi≥ o skarby, czy uczone ksiegi. Nie chcia≥ ani zaszczytÛw, ani tytu≥Ûw i majπtkÛw. Poprosi≥ tylko o pozwolenie mu na opuszczenie úwiπtyni i zamieszkanie na po≥udniowym pograniczu, gdzie jako wolny straønik strzeg≥by tamtejszych ziem przed ≥upieøczymi najazdami orkÛw i jaszczuroludzi. ChoÊ Nelzar by≥ nieco zdziwiony takim niecodziennym øyczeniem, zgodzi≥ siÍ. Od tej pory Haran Ho s≥uøy≥ na po≥udniowych stepach Varantu, gdzie na czele konnego oddzia≥u walczy≥ z zielonoskÛrymi rabusiami ñ pozosta≥oúciπ mrocznego przymierza, ktÛre to kilka wiekÛw wczeúniej pokona≥ Semmir I åwiÍty.");

B_LogEntry(BookLog_HaranHo2,"KONIEC TOMU II");

};
























































/////////////////////////////////////////////////////////////////////

// HARAN HO. TOM III

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG”W WODY

// KATEGORIA: ZWYCZAJNE - MOØNA T• KSI G  DOSTA∆ U HANDLARZY, LUB ZNALEè∆ W OG”LNODOST PNYCH MIEJSCACH

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_HaranHo3 (C_ITEM)

{

name ="Haran Ho. Tom III";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_03.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autor: Thorun";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_HaranHo3;

};

FUNC VOID Use_Book_HaranHo3()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "BOOK_ER_L.tga", 0);

Doc_SetPage ( nDocID,  1, "BOOK_ER_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Haran Ho. Tom III");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[OpowieúÊ o bohaterze-renegacie z czasÛw Imperium Pradawnych w Varancie].");

Doc_SetMargins( nDocID,  -1,  15, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_HaranHo3,LOG_NOTE);

B_LogEntry(BookLog_HaranHo3,"Haran Ho. Tom III");

B_LogEntry(BookLog_HaranHo3,"Kolejne lata spÍdzi≥ Haran Ho na po≥udniowych kraÒcach Imperium, broniπc mieszkaÒcÛw pogranicza przed luünymi bandami orkÛw, grasujπcymi w tych stronach. PoúrÛd orkowej zarazy, prym wiod≥a zgraja pod przywÛdztwem Osh-Gereba, ktÛry zdo≥a≥ zgromadziÊ przy sobie wielu podobnych rabusiÛw. Wiedziony øπdzπ ≥upu i krwi ork wyprawia≥ siÍ raz po raz na wioski, siejπc postrach i zniszczenie. Nim na ratunek mieszkaÒcom przybywali straønicy pogranicza, by≥o zazwyczaj juø po wszystkim. ");

B_LogEntry(BookLog_HaranHo3,"Orkowie nawiedzali wioski, by splπdrowawszy je, zbiec z ≥upem daleko na po≥udnie, gdzie przez wzglπd na niechÍtne Varantowi plemiona koczownikÛw i odleg≥oúÊ od varanckich siedzib, bali siÍ zapuszczaÊ nawet øo≥nierze imperium. NiektÛre osady za cenÍ bezpieczeÒstwa decydowa≥y siÍ p≥aciÊ daninÍ Osh-Gerebowi, lecz nawet to nie zawsze je chroni≥o przed najazdami orkÛw.†Sta≥ siÍ przeto herszt orkÛw, kryjπcy siÍ daleko w swych siedzibach na po≥udniu, panem niema≥ej czÍúci pogranicza, dzielπc niemal na rÛwni swπ w≥adzami varanckimi.");

B_LogEntry(BookLog_HaranHo3,"W Haranie Ho znalaz≥ on jednak godnego przeciwnika. Haran nakaza≥ postawiÊ dzwony w kaødej wiosce i wybudowaÊ liczne wieøe obserwacyjne, tworzπc sprawny system alarmowania na wypadek orkowych atakÛw. Ponadto przybysz nie ba≥ siÍ w pogoni za ≥upieøcπ zapuszczaÊ siÍ na niezbadane tereny po≥udnia. IlekroÊ ktÛrπú osadÍ nawiedzili orkowie, dzielny wojownik podπøa≥ na miejsce i krwawo rozprawia≥ siÍ z najeüdücπ. Swπ nieustÍpliwoúciπ i zaciÍciem, wla≥ ducha odwagi w straønikÛw pogranicza, skutecznie stawiajπc czo≥a orkowym bandytom. Z tego powodu prÍdko wiÍc zaskarbi≥ sobie wdziÍcznoúÊ ludzi øyjπcych na pograniczu.†");

B_LogEntry(BookLog_HaranHo3,"Zdarzy≥o siÍ czwartego roku s≥uøby na rubieøach, øe Haran Ho kierowany rosnπcπ ambicjπ uda≥ siÍ w dalekπ pogoÒ za jednym z orkowych podjazdÛw. Im dalej straønicy gnali za wataøkami, tym dalej byli od krain znanych kartografom imperialnym. Na tych ziemiach, to orkowie mieli w swych rÍkach ten niezwykle cenny atut, jakim jest znajomoúÊ terenu. Zwabiwszy Harana Ho do wπwozu, orkowie rozbili jego oddzia≥. Pomimo mÍstwa z jakim rycerz siÍ broni≥, jego los zdawa≥ siÍ byÊ przesπdzony.");

B_LogEntry(BookLog_HaranHo3,"Gdy juø si≥y dowodzone przez Harana Ho niemal ca≥kowicie stopnia≥y, na pomoc przybyli koczownicy - mieszkaÒcy owych nietkniÍtych w≥adzπ InnosytÛw ziem. Nomadzi pod wodzπ maga wody Istvana, zmusili orkÛw do odwrotu, zaú rannego Harana i tych z jego oddzia≥u, ktÛrzy przeøyli zabrali ze sobπ do obozowiska. Tam koczownicy opatrzywszy ich, poczÍli naradzaÊ siÍ, co naleøy zrobiÊ z ocala≥ymi Varantczykami. MieszkaÒcy tych ziem z niechÍciπ spoglπdali na Pradawnych, gdyø pamiÍtali, øe pÛ≥nocni sπsiedzi nieraz prÛbowali podporzπdkowaÊ sobie koczownikÛw.††");

B_LogEntry(BookLog_HaranHo3,"Za radπ Istvana, plemiÍ zdecydowa≥o siÍ poddaÊ przywÛdcÍ oddzia≥u prÛbie. Oto koczownicy ustawili ze swych dzid i oszczepÛw krπg, poczym wprowadzili do niego Harana i jego ocala≥ych towarzyszy. NastÍpnie mag Istvan wprowadzi≥ do krÍgu dwa lwy, naleøπce do plemienia i stanowiπce jakoby czÍúÊ owej wspÛlnoty. Tak oto los uratowanych z zasadzki VarantczykÛw zosta≥ poddany pod osπd Adanosa. Lwy okrπøy≥y trzykrotnie Harana Ho i jego towarzyszy, badajπc ich wzrokiem i gotujπc siÍ do ataku. Zatoczywszy jednak trzeci krπg gwa≥townie rzuci≥y siÍ w kierunku Varantczyka, by obrÛciwszy siÍ na zewnπtrz ko≥a, zajπÊ miejsce u prawego i lewego boku Harana.†ëTen oto cz≥owiek cieszy siÍ ≥askπ Adanosaí ñ rzek≥ mag wody Istvan, wstÍpujπc do owego krÍgu.");

B_LogEntry(BookLog_HaranHo3,"KONIEC TOMU III");

};



























































/////////////////////////////////////////////////////////////////////

// HARAN HO. TOM IV

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG”W WODY

// KATEGORIA: ZWYCZAJNE - MOØNA T• KSI G  DOSTA∆ U HANDLARZY, LUB ZNALEè∆ W OG”LNODOST PNYCH MIEJSCACH

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_HaranHo4 (C_ITEM)

{

name ="Haran Ho. Tom IV";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_03.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autor: Thorun";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_HaranHo4;

};

FUNC VOID Use_Book_HaranHo4()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "BOOK_ER_L.tga", 0);

Doc_SetPage ( nDocID,  1, "BOOK_ER_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Haran Ho. Tom IV");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[OpowieúÊ o bohaterze-renegacie z czasÛw Imperium Pradawnych w Varancie.]");

Doc_SetMargins( nDocID,  -1,  15, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_HaranHo4,LOG_NOTE);

B_LogEntry(BookLog_HaranHo4,"Haran Ho. Tom IV");

B_LogEntry(BookLog_HaranHo4,"Haran Ho w wyniku potyczki z orkami, odniÛs≥ powaøne rany, ktÛre przez wiele tygodni nie pozwala≥y mu na powrÛt do domu. Podobnie rzecz siÍ mia≥a z tymi spoúrÛd jego towarzyszy, ktÛrym uda≥o siÍ przeøyÊ bitwÍ. Øy≥ wiÍc poúrÛd koczownikÛw, obserwujπc przy ich przy tym i nasiπkajπc ich kulturπ. Nawet gdy kompani Harana opuúcili juø ziemie koczownikÛw i powrÛcili do Varantu, on zdecydowa≥ siÍ pozostaÊ wúrÛd nomadÛw, ktÛrzy uratowali mu øycie. Z czasem sta≥ siÍ jednym z nich i jako uczeÒ maga Istvana postanowi≥ kroczyÊ drogπ Adanosa. Z≥ama≥ tym samym úluby, ktÛre z≥oøy≥ niegdyú w úwiπtyni Innosa.");

B_LogEntry(BookLog_HaranHo4,"Na d≥ugo zapomniano wtedy o Haranie, ktÛry przez wiele lat øy≥ poúrÛd nomadÛw. Mimo to wieúÊ o konwersji dotar≥a w koÒcu do arcykap≥ana Salviana, rezydujπcego w pa≥acu úwiπtynnym magÛw w Al Shedim, wywo≥ujπc w Salvianie wúciek≥oúÊ. Wysoki mag ognia postanowi≥ wiÍc wys≥aÊ do Harana Ho ludzi, ktÛrzy namÛwiliby go do odmiany decyzji. Haran odmÛwi≥, wydajπc tym samym na siebie wyrok úmierci. Od tamtej pory s≥udzy arcykap≥ana rozpoczÍli poúcig za konwertytπ, ukrywajπcym siÍ wraz z nomadami poúrÛd dzikich krain, nieznanych dla VarantczykÛw. ");

B_LogEntry(BookLog_HaranHo4,"Wiele lat ludzie úwiπtyni tropili Harana, lecz ten dziÍki umiejÍtnoúciom bojowym i magii Adanosa wychodzi≥ ca≥o ze wszystkich zasadzek. W czasie jednej z takich potyczek, koczownicy ponieúli dotkliwe straty i dla ratowania siÍ, byli zmuszeni wydaÊ Harana. Pojmanego, zawleczono do Al Shedim, gdzie postawionego przed sπdem prÛbowano zmusiÊ do wyrzeczenia siÍ Adanosa. Haran Ho pozosta≥ jednak niez≥omny. Z rozkazu arcykap≥ana Salvina zosta≥ wiÍc stracony, a dla poniøenia pochwyconego, cia≥u konwertyty odmÛwiono pochÛwku i wrzucono do rzeki.");

B_LogEntry(BookLog_HaranHo4,"Zosta≥o ono jednak wy≥owione przez jego rodzinÍ i z≥oøone w kamiennym grobie. Tam teø zasta≥ je potop, ktÛry zmiÛt≥ z powierzchni ziemi ca≥π cywilizacjÍ Pradawnych i otworzy≥ Koczownikom drogÍ do osiedlenia siÍ na opustosza≥ych ziemiach Varantu. Tak oto koÒczπ siÍ dzieje Harana Ho, ktÛry dla Pradawnych zdrajcπ bÍdπc i renegatem, sta≥ siÍ bohaterem i mÍczennikiem dla ludÛw, ktÛre przyjúÊ po upadku Imperium mia≥y. ");

B_LogEntry(BookLog_HaranHo4,"KONIEC TOMU IV, OSTATNIEGO");

};






















































/////////////////////////////////////////////////////////////////////

// FRAGMENT KRONIK DOMINACJI

// SUGEROWANA LOKALIZACJA: WIEØA XARDASA, DOPIERO W V ROZDZIALE/G”RSKA TWIERDZA

// ZAKAZANA W KR”LESTWIE MYRTANY HERETYCKA KSI GA. BARDZO RZADKA. 

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_ChroniclesOfDomination (C_ITEM)

{

name ="Fragment Kronik Dominacji";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_03.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autor: Anonim";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_ChroniclesOfDomination;

};

FUNC VOID Use_Book_ChroniclesOfDomination()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "BOOK_ER_L.tga", 0);

Doc_SetPage ( nDocID,  1, "BOOK_ER_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Fragment Kronik Dominacji");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Rzadkie, heretyckie oficjalnie zakazane w KrÛlestwie Myrtany. Jeden z ostatnich ocala≥ych rÍkopisÛw.]");

Doc_SetMargins( nDocID,  -1,  15, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_ChroniclesOfDomination,LOG_NOTE);

B_LogEntry(BookLog_ChroniclesOfDomination,"Fragment Kronik Dominacji");

B_LogEntry(BookLog_ChroniclesOfDomination,"W dniu prÛby ognia dostπpi≥em zaszczytu wejrzenia do Kronik Dominacji - dzie≥a przechowywanego w Klasztorze Innosa w Nordmarze. KsiÍga ta zawiera jednak wiele tajemnic Zakonu MagÛw Ognia, dlatego zosta≥a zapieczÍtowana przy pomocy niezwykle potÍønej magii. Tylko najwyøsi magowie posiedli wiedzÍ pozwalajπcπ jπ czytaÊ, a przede mnπ postawiono jedynie zadanie otworzenia choÊby fragmentu tej ksiÍgi, czym mia≥em udowodniÊ, øe jestem godny przywdziania szaty maga ognia.");

B_LogEntry(BookLog_ChroniclesOfDomination,"Po wielu miesiπcach przygotowaÒ, kiedy zg≥Íbia≥em wiedzÍ majπcπ pomÛc mi podo≥aÊ zadaniu, zosta≥em wezwany przez arcymaga Sevolda i o zachodzie s≥oÒca zaprowadzony na najniøsze piÍtra Biblioteki Klasztornej, gdzie przechowywana by≥a owa relikwia. RozpoczÍ≥a siÍ prÛba. ChoÊ prÛbowa≥em odkryÊ jak najwiÍcej jej tajemnic, to zdo≥a≥em odczytaÊ jedynie niewielki jej fragment. To co jednak ukaza≥o siÍ mym oczom, sprawi≥o, øe zwπtpi≥em w nauki g≥oszone przez KoúciÛ≥ Innosa. ");

B_LogEntry(BookLog_ChroniclesOfDomination,"Mimo, øe przeszed≥em prÛbÍ ognia i sta≥em siÍ jednym z magÛw, niebawem porzuci≥em swych braci, ktÛrzy stali siÍ mi obcymi. Od tej pory musia≥em uchodziÊ przed ich gniewem. ChoÊ ≥amiÍ przysiÍgÍ z≥oøonπ Innosowi i Koúcio≥owi Ognia, postanowi≥em utrwaliÊ na papierze, to co wtedy ujrza≥em:");

B_LogEntry(BookLog_ChroniclesOfDomination,"ëI powo≥a≥ Innos do øycia potÍøne istoty, lecz one znajπc moc danπ im przez stwÛrcÍ, odrzuci≥y go i zwrÛci≥y siÍ przeciw niemu. A by≥o to jeszcze nim z Innosa powsta≥ Beliar i Adanos. I mocarne potÍgπ niepodzielnego Innosa, sta≥y siÍ nieúmiertelne.í ");

B_LogEntry(BookLog_ChroniclesOfDomination,"ëA Trzej powstali z Jednego, jednoczπc swπ wolÍ i moc raz jeszcze, przemogli potÍøne istoty i...í Tutaj koÒczy siÍ fragment, ktÛry ksiÍga przede mnπ ods≥oni≥a. ");

B_LogEntry(BookLog_ChroniclesOfDomination,"Czy wiÍc to moøliwe, øe magowie ognia ukrywali przed nami istnienie Przedwiecznych Istot, powo≥anych do øycia mocπ niepodzielonego wÛwczas jeszcze Innosa? Czy ci wszyscy herezjarchowie g≥oszπcy ich istnienie byli bliøsi prawdy niø magowie ognia g≥oszπcy ludowi nieistnienie tych bytÛw?");

B_LogEntry(BookLog_ChroniclesOfDomination,"Nigdy juø ani Innos, ani Beliar, ani Adanos nie mia≥ w≥adaÊ mocπ wszystkich Trojga, wiÍc jako istoty stworzone przez Innosa sprzed podzia≥u, by≥yby najpotÍøniejszymi ze stworzonych bytÛw i ustÍpowa≥yby jedynie bogom. Moøe nawet stanowi≥yby dla nich zagroøenie? Czy te przedwieczne istoty przetrwa≥y jak pozwala≥aby przypuszczaÊ wzmianka o ich nieúmiertelnoúci? A moøe zosta≥y uwiÍzione? Tylko przez kogo i kiedy? Przez pierwotnego Innosa, czy przez wszystkich Innosa i dwÛch jego Braci? Czy ludzie juø wtedy istnieli? Rodzi siÍ teø pytanie najwaøniejsze: czy te potÍøne istoty majπ wp≥yw na nasz úwiat? A jeúli tak, to jaki? ");

B_LogEntry(BookLog_ChroniclesOfDomination,"Jak wiemy, KoúciÛ≥ Innosa g≥osi, øe wszelka moc magiczna pochodzi od bogÛw. Jednak nie tylko czciciele bÛstw prawdziwych potrafiπ pos≥ugiwaÊ siÍ magiπ, by wspomnieÊ choÊby o pogaÒskich magach. NiektÛre krÍgi innosyckie w kaødym pogaÒskim bÛstwie chcia≥yby widzieÊ o ile nie pustπ figurkÍ, to chocby jednπ z kolejnych masek Beliara. Czemu wiÍc magia, ktÛrπ pos≥ugujπ siÍ poganie okazuje siÍ rÛøna od tej w≥aúciwej dla Beliara? Czy demony Beliara jako czπstka jego mocy, nie pos≥ugiwa≥yby siÍ magiπ swego stwÛrcy? Czy wiÍc za pogaÒskimi bÛstwami nie kryjπ siÍ w≥aúnie owe przedwieczne istoty? ");

B_LogEntry(BookLog_ChroniclesOfDomination,"Nim KrÛlowie Myrtany wprowadzili w øycie postanowienia soboru vengardzkiego reformujπcego i ujednolicajπcego Kult MyrtaÒski, w niektÛrych innosyckich i adanosyckiech krÍgach kap≥aÒskich istnia≥y doktryny, ktÛre w rÛønym stopniu uznawa≥y istnienie Przedwiecznych Istot. Czemu wiÍc odrzucono te tradycje? ByÊ moøe dlatego, øe prym na obradach soboru wiedli niechÍtni im kap≥ani z Gothy. Zapewne obawiano siÍ teø, by ludzie wierzπc w realnoúÊ tych bytÛw, nie szukali w nich alternatywy do trzech w≥aúciwych bogÛw.");

B_LogEntry(BookLog_ChroniclesOfDomination,"ChoÊ wiem, øe ksiÍga ta zostanie uznana przez úwiπtobliwych magÛw ognia za heretyckπ, a ci co wejdπ w jej posiadanie naraøπ siÍ na gniew inkwizytorÛw, to nie mog≥em odrzuciÊ i skazaÊ na zapomnienie tej wiedzy. Musi ona przetrwaÊ, gdyø okupiono jπ ogromnπ cenπ.");

B_LogEntry(BookLog_ChroniclesOfDomination,"KONIEC");


};
























































/////////////////////////////////////////////////////////////////////

// OPACTWO NORDMARSKIE

// SUEROWANA LOKACJA: BIBLIOTEKA MAG”W OGNIA

// KATEGORIA: ZWYCZAJNE - MOØNA T• KSI G  DOSTA∆ U HANDLARZY, LUB ZNALEè∆ W OG”LNODOST PNYCH MIEJSCACH

// NAPISANE NA PODSTAWIE GOTHICPEDII Z ROZWINIECIEM T£A HISTORYCZNEGO

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_NordmarAbbey (C_ITEM)

{

name ="Opactwo w Nordmarze";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_03.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;


TEXT[2] ="Autor: Aidep Thigo";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_NordmarAbbey;

};

FUNC VOID Use_Book_NordmarAbbey()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "BOOK_ER_L.tga", 0);

Doc_SetPage ( nDocID,  1, "BOOK_ER_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Opactwo Nordmarskie");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[O historii i architekturze opactwa magÛw ognia w Nordmarze.]");

Doc_SetMargins( nDocID,  -1,  15, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_NordmarAbbey,LOG_NOTE);

B_LogEntry(BookLog_NordmarAbbey,"Opactwo Nordmarskie");

B_LogEntry(BookLog_NordmarAbbey,"Jeden z najwaøniejszych klasztorÛw magÛw ognia znajduje siÍ w Nordmarze. Sam obiekt nie grzeszy rozmiarami, lecz posiada grotÍ z posπgiem Innosa, gdzie Pan Ognia niegdyú objawi≥ siÍ ludziom. Ponadto klasztor posiada imponujπcy zasÛb wiedzy w postaci s≥awnej biblioteki.");

B_LogEntry(BookLog_NordmarAbbey,"Stare opowieúci przedstawiajπ takowπ historiÍ powstania klasztoru: Nordmarczyk imieniem Rhobar pewnego dnia zapuúci≥ siÍ w okoliczne gÛry na polowanie. Jednak niespodziewanie na jego drodze stanÍ≥a tajemnicza bestia. M≥ody wojownik po ucieczce skry≥ siÍ przed potworem w jaskini. Jednak ten podπøy≥ za nim.Kiedy Rhobar myúla≥, øe to koniec, niespodziewanie w jego rÍkach znalaz≥o siÍ magiczne ostrze, ktÛre pos≥uøy≥ mu w walce. Po zabiciu bestii miejsce to wype≥ni≥o úwiat≥o, a z niebios wydoby≥ siÍ g≥os Innosa. BÛg sprawiedliwych kaza≥ swemu wybraÒcowi poprowadziÊ swÛj lud na rÛwniny i tam za≥oøyÊ krÛlestwo jego wyznawcÛw. Niebawem teø magowie ognia postanowili w tym miejscu za≥oøyÊ g≥Ûwne sanktuarium Innosa, a w jaskini gdzie objawi≥ siÍ Innos wznieúli o≥tarz bogu úwiat≥a.");

B_LogEntry(BookLog_NordmarAbbey,"Klasztor powsta≥y w miejscu, gdzie rozpoczyna siÍ historia KrÛlestwa Myrtany zosta≥ otoczony szczegÛlnπ opiekπ jej w≥adcÛw. Wspierany przez krÛlÛw mia≥ staÊ siÍ centralnym miejscem myrtaÒskiego Innosytyzmu. Niebawem teø sta≥ siÍ celem wÍdrÛwek pielgrzymÛw, tak z Myrtany jak i z innych zakπtkÛw úwiata.  W tym miejscu znajdowa≥a siÍ niema≥a iloúÊ pism oraz wiele magicznych artefaktÛw, choÊ wiÍkszoúÊ z nich w czasie wojny zosta≥o odes≥anych na po≥udnie, do Myrtany. W klasztornej bibliotece ma siÍ jednak znajdowaÊ rÛwnieø Kronika Dominacji, opisujπca historiÍ magÛw ognia i zawierajπca wiele tajemnic zakonu. Z tego teø powodu zosta≥a zapieczÍtowana niezwykle potÍønymi zaklÍciami, chroniπcymi jπ przed profanami pragnπcymi bezprawnie wejúÊ w posiadanie zarezerwowanej dla magÛw wiedzy. Do ksiÍgi tej majπ prawo zbliøyÊ siÍ jedynie najwyøsi spoúrÛd magÛwÖ");

B_LogEntry(BookLog_NordmarAbbey,"Biblioteka. To tu znajduje siÍ ksiÍgozbiÛr, ktÛry swego czasu przewyøsza≥ nawet ten z klasztoru na wyspie Khorinis. Biblioteka ma spiralnπ, schodzπcπ w dÛ≥ budowÍ, im niøej siÍ schodzi tym starsze ksiÍgi moøna znaleüÊ. Wzd≥uø schodÛw jest wiele pokoikÛw, w ktÛrych magowie mogπ poúwiÍcaÊ siÍ lekturze. Na najniøszym poziomie biblioteki znajdujπ niedostÍpne dla pielgrzymÛw tajne archiwa, w ktÛrych przechowywane sπ ksiÍgi przeznaczone jedynie dla magÛw.");

B_LogEntry(BookLog_NordmarAbbey,"åwiπtynia. Jest to najwiÍkszy budynek w Klasztorze, a takøe cel wÍdrÛwki pielgrzymÛw przybywajπcych do Nordmaru. Magowie przychodzπ tu co dzieÒ by modliÊ siÍ w tym miejscu do Innosa.");

B_LogEntry(BookLog_NordmarAbbey,"Dom magÛw. Jest to siedziba Rady Ognia z≥oøonej z piÍciu wysokich arcymagÛw klasztoru. Mieúci siÍ tu rÛwnieø nominalna siedziba najwyøszego arcymaga KrÛlestwa Myrtany, choÊ od dawna utar≥ siÍ juø zwyczaj, øe g≥owa Koúcio≥a Innosa na sta≥e zwyk≥a rezydowaÊ w sto≥ecznym Vengardzie.");

B_LogEntry(BookLog_NordmarAbbey,"Jaskinia oúwiecenia. To najwaøniejszy obiekt, do ktÛrego wstÍp majπ jedynie arcymagowie ognia oraz wybrani. Jest to w≥aúciwie centrum myrtaÒskiego Innosytyzmu. Znajduje siÍ w sporym pÍkniÍciu ska≥y, w ktÛrej wykuto ogromny pomnik Innosa w miejscu, gdzie wed≥ug tradycji, Pan Ognia objawi≥ siÍ Rhobarowi.");

B_LogEntry(BookLog_NordmarAbbey,"ChoÊ klasztor, bÍdπcy celem wÍdrÛwek licznych pielgrzymÛw, po≥oøony jest na ziemiach barbarzyÒskich NordmarczykÛw, ktÛry to lud w s≥ynπ≥ w przesz≥oúci z ≥upieøczych wypraw na po≥udnie, to jednak mieszkaÒcy pÛ≥nocy nie zwykli krzywdziÊ pielgrzymÛw zmierzajπcych do úwiÍtego przybytku. Sami Nordmarczycy, jako gorliwi wyznawcy Innosa, otaczajπ magÛw ognia oraz sam klasztor ogromnym szacunkiem i gotowi sπ go broniÊ za wszelkπ cenÍ. Dlatego teø, mimo, øe sanktuarium znajduje siÍ w krainie sπsiadujπcej z ziemiami orkÛw, to nigdy orkowie nie zdo≥ali mu realnie zagroziÊ.");

B_LogEntry(BookLog_NordmarAbbey,"Tu koÒczÍ swÛj opis klasztoru w Nordmarze, skreúlony piÛrem skromnego pielgrzyma, Aidepa Thigo");

B_LogEntry(BookLog_NordmarAbbey,"KONIEC");

};






















































/////////////////////////////////////////////////////////////////////

// LEGENDY ARGAA—SKIE

// SUGEROWANA LOKACJA: OPUSZCZONY SKALNY POK”J NIEOPODAL G”RSKIEJ TWIERDZY

// KATEGORIA: ZWYCZAJNE - MOØNA T• KSI G  DOSTA∆ U HANDLARZY, LUB ZNALEè∆ W OG”LNODOST PNYCH MIEJSCACH

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_LegendsofArgaania (C_ITEM)

{

name ="Legendy argaaÒskie";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_03.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autor: Ulran Plautis";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_LegendsofArgaania;

};

FUNC VOID Use_Book_LegendsofArgaania()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "BOOK_ER_L.tga", 0);

Doc_SetPage ( nDocID,  1, "BOOK_ER_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Legendy argaaÒskie");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[KsiÍga opisujπca pogaÒskie legendy i wierzenia Wysp Po≥udniowych oraz Argaani.]");

Doc_SetMargins( nDocID,  -1,  15, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_LegendsofArgaania,LOG_NOTE);

B_LogEntry(BookLog_LegendsofArgaania,"Legendy argaaÒskie");

B_LogEntry(BookLog_LegendsofArgaania,"MieszkaÒcy Wysp Po≥udniowych od wiekÛw juø wyznajπ bogÛw, ktÛrych czci≥o i czci siÍ w KrÛlestwie Myrtany. Mimo to, jak w wiÍkszoúci krain, tak i tu, na wyspie Argaan, moøna znaleüÊ pozosta≥oúci dawnych kultÛw. G≥Ûwnym bÛstwem pogaÒskiego panteonu ArgaaÒczykÛw by≥a Bogini, ktÛra wed≥ug wierzeÒ staroøytnych mieszkaÒcÛw Wysp Po≥udniowych mia≥a staÊ na straøy harmonii i strzec rÛwnowagi we wszechúwiecie. Bogini by≥a wiÍc nieco podobna do Adanosa i pewnie dlatego dzisiejsi mieszkaÒcy wyspy chÍtniej oddajπ czeúÊ Panu Wody, niø jego boskiemu bratu bÍdπcemu Panem Ognia. Ciekawym rysem tej mitologii jest to, øe owe bÛstwo mia≥o ≥πczyÊ w sobie nawzajem zwalczajπce i rÛwnowaøπce siÍ pierwiastki chaosu i porzπdku. ");

B_LogEntry(BookLog_LegendsofArgaania,"Niekiedy z owych wierzeÒ pogaÒskich ewoluowa≥y niezwykle obrazoburcze doktryny religijne. W wyniku docierania na wyspÍ wp≥ywÛw innosyckich i adanosyckich, a byÊ moøe rÛwnieø beliaryckich, wúrÛd niektÛrych pogan wykszta≥ci≥o siÍ przekonanie, øe pod postaciπ Adanosa kryje siÍ w≥aúnie Bogini. Konsekwencjπ tego typu przekonaÒ by≥o uznanie Innosa i Beliara za spersonifikowane si≥y wewnπtrz umys≥u Bogini, majπce reprezentowaÊ elementy anarchii i ≥adu. To niezwykle obrazoburcze oczywiúcie twierdzenie, mia≥y pokutowaÊ jeszcze d≥ugo po tym jak Wyspy Po≥udniowe sta≥y siÍ krainπ adanosyckπ. Nawet dziú dziwnie øywe sπ pog≥oski jakoby w prastarym Klasztorze na Skale, zamieszka≥ym przez magÛw wody, potajemnie praktykowano kult Bogini. Niemniej inkwizycja magÛw ognia zbadawszy sprawÍ zaprzeczy≥a takowym rewelacjom, wiÍc naleøa≥oby je w≥oøyÊ miÍdzy bajkiÖ");

B_LogEntry(BookLog_LegendsofArgaania,"Jednπ z najbardziej znanych legend z Wysp Po≥udniowych, jest ta o pogaÒskim bÛstwie, zwanym Boginiπ i wojnie jakπ wyznawczynie tego bÛstwa toczy≥y miÍdzy sobπ. Legenda g≥osi, øe jeszcze zanim ludzie zaczÍli rzπdziÊ úwiatem, na Argaanii panowa≥ kult Bogini. By≥a ona symbolem harmonii i opiekunem natury. S≥uøy≥y jej demonice Ahn'Bael, bÍdπce ucieleúnieniem chaosu oraz siostry Ahn'Nosiri, strzegπce porzπdku. Bogini kierowa≥a swoimi s≥uøebnicami, tak by na úwiecie panowa≥a harmonia. DziÍki rÛwnowadze ludzie nie cierpieli ani niewoli chaosu, ani tyranii praw, a Bogini odbiera≥a od ludzi czeúÊ.");

B_LogEntry(BookLog_LegendsofArgaania,"PÛ≥boskie s≥uøebnice wyrwa≥y siÍ jednak spod kontroli Bogini i dosz≥o miÍdzy nimi do wojny, ktÛra by≥a bardzo wyczerpujπca dla obu stron. Wed≥ug legendy mia≥a przeøyÊ tylko jedna Ahn'Nosiri - Selena, a Ahn'Bael mia≥y pogrπøyÊ siÍ we únie i czekaÊ na czas przebudzenia. Wed≥ug legendy po wojnie kult bogini zaczπ≥ podupadaÊ i ostatecznie wypar≥a go wiara w trzy bÛstwa. Po latach na Argaanii na czo≥o wysunπ≥ siÍ rÛd z Setarrif, a jego przywÛdca, Ethorn I, podporzπdkowa≥ sobie ca≥π ArgaaniÍ oraz z nieznanych przyczyn toczy≥ zwyciÍskπ wojnÍ z Jarkendarem. ");

B_LogEntry(BookLog_LegendsofArgaania,"W ciπgu nastÍpnych wiekÛw KrÛlestwo Argaanii sprawnie prosperowa≥o, osiπgajπc coraz wyøszy poziom rozwoju. Kres potÍgi KrÛlestwu Argaanii przynios≥a dopiero ekspansja krÛla Myrtany Rhobara II, ktÛry podbi≥ Wyspy Po≥udniowe i ustanowi≥ w nich krÛlewskπ prowincjÍ. Rozpoczyna≥a siÍ nowa era w dziejach Argaani.");

B_LogEntry(BookLog_LegendsofArgaania,"KONIEC");

};






















































/////////////////////////////////////////////////////////////////////

// PER£A WYSP PO£UDNIOWYCH

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG”W OGNIA

// NAPISANE NA GRUNCIE ARTYKU£U Z GOTHICPEDII Z ROZWINI CIEM HISTORII LORDA DOMINIQUE

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_Argaania (C_ITEM)

{

name ="Per≥a Wysp Po≥udniowych";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_03.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autor: Aidep Thigo";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_Argaania;

};

FUNC VOID Use_Book_Argaania()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "BOOK_ER_L.tga", 0);

Doc_SetPage ( nDocID,  1, "BOOK_ER_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Per≥a Wysp Po≥udniowych");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Historia i opis geograficzny Argaani, z uwzglÍdnieniem podboju przez KrÛlestwo Myrtany.]");

Doc_SetMargins( nDocID,  -1,  15, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_Argaania,LOG_NOTE);

B_LogEntry(BookLog_Argaania,"Per≥a Wysp Po≥udniowych");

B_LogEntry(BookLog_Argaania,"Argaan, zwana teø Argaaniπ to wysuniÍta najbardziej na pÛ≥noc wyspa archipelagu Wysp Po≥udniowych, a dziú czÍúÊ KrÛlestwa Myrtany. Do krÛlestwa przy≥πczy≥ jπ krÛl Rhobar w czasie przes≥awnej kampanii wojennej, w czasie ktÛrej odznaczyÊ siÍ mia≥ Lord Dominique.");

B_LogEntry(BookLog_Argaania,"Argaania posiada gÛrzystπ rzeübÍ terenu o skalistym pod≥oøu. Jest zapewne wyspπ pochodzenia wulkanicznego, o czym úwiadczy jej stopniowo obniøajπca siÍ od centrum wyspy wysokoúÊ bezwzglÍdna nad poziomem morza oraz bogata rzeüba, urozmaicona licznymi wzgÛrzami, nierÛwnoúciami, urwiskami, kotlinami i klifami. Znamiennπ czÍúÊ wyspy zajmuje pasmo GÛry Bia≥ookiej, ktÛrej niedostÍpne szczyty nie zosta≥y zbadane przez cz≥owieka. Zdecydowanπ wiÍkszoúÊ linii brzegowej wyspy stanowiπ klify. Plaø i ≥agodnych brzegÛw jest bardzo ma≥o i sπ niewielkich rozmiarÛw. Eksploracja Argaanii jest utrudniona ze wzglÍdu na wystÍpowanie licznych pasm wzgÛrz oraz ska≥, ktÛrych uniemoøliwiajπcymi piechurowi przemarsz. PoszczegÛlne jej krainy oddzielone sπ od siebie wπskimi prze≥Íczami, ktÛre ze strategicznego punktu widzenia, stwarzajπ wiele moøliwoúci ataku oraz obrony.");

B_LogEntry(BookLog_Argaania,"W pÛ≥nocnej oraz zachodniej czÍúci Argaanii dominuje klimat umiarkowany. PodstawÍ roúlinnoúci stanowiπ gÍste trawy, niskie krzewy oraz lasy iglaste, liúciaste i mieszane. Pospolicie spotykanymi roúlinami sπ ziela lecznicze, ziela many i ogrzyliúcie. Powszechnie wystÍpujπcπ zwierzynπ sπ wilki, úcierwojady, dziki i krwiopijcy. Stale wzrasta takøe populacja goblinÛw. Klimat sprzyja osadnictwu oraz uprawie roli, a okoliczne wody zasobne sπ w ryby. Dlatego w  tej strefie klimatycznej wystÍpuje najwiÍcej skupisk ludnoúci argaaÒskiej ñ miÍdzy innymu miasta: Stewark oraz Thorniara, Zamek SrebrowÛd czy obozowiska na po≥y adanosyckich GoÒcÛw Leúnych, ktÛrzy niegdyú zamieszkiwali rÛwnieø MyrtanÍ.");

B_LogEntry(BookLog_Argaania,"Po≥udnie oraz wschÛd wyspy zdominowa≥ klimat tropikalny. Na po≥udniu wykszta≥ci≥o siÍ wielkie bagno, ponad ktÛrym wznosi siÍ ogromne drzewo Tooshoo, ktÛremu przypisuje siÍ w≥aúciwoúci magiczne ñ zapewne wiara takowa wywodzi siÍ jeszcze z czasÛw pogaÒskich. Na owych bagnach wystÍpuje bardzo bujna szata roúlinnoúci ñ od paproci, przez palmy, po ogromne drzewa o roz≥oøystych koronach i rozwarstwiajπcych siÍ u nasady pniach. Rejon ten zasobny jest takøe w bagienne ziele, ktÛre stanowi sk≥adnik zanej uøywki. Na nieprzygotowanego wÍdrowca w terenach czai siÍ tam jednak wiele niebezpieczeÒstw: podmok≥e pod≥oøe, gorπca temperatura, bardzo wysoka wilgotnoúÊ powietrza oraz wiele okazÛw egzotycznych zwierzπt, takich jak wÍøe b≥otne, jaszczury, topielce, zÍbacze oraz krwiopijce.");

B_LogEntry(BookLog_Argaania,"WschÛd wyspy z kolei pokrywa gÍsta oraz niebezpieczna døungla. Ze wzglÍdu na bardzo ciÍøkie warunki klimatyczne oraz terenowe w wiÍkszoúci jest ona niezamieszka≥a. Døungla jest natomiast domem dla wielu egzotycznych gatunkÛw zwierzπt, m.in. brzytwiakÛw, úcierwojadÛw, koúciojadÛw, szuwarnikÛw, a nawet cieniostworÛw i trolli. Mimo wszystko w sercu døungli zlokalizowane jest prastare miasto Setarrif, bÍdπce jednoczeúnie stolicπ wyspy.");

B_LogEntry(BookLog_Argaania,"Po≥udniowo-wschodni kraniec wyspy to ja≥owy oraz wulkaniczny obszar Czarnych JarÛw ñ sieci stromych wzgÛrz, wπwozÛw oraz klifÛw. Ten obszar prawdopodobnie w ogÛle nie pozwala na osadnictwo, jednak na wyskoim klifie na skraju wyspy po≥oøony jest pradawny klasztor, znajdujπcy siÍ w posiadaniu tamtejszych magÛw wody.");

B_LogEntry(BookLog_Argaania,"Samo centrum Argaani stanowi pasmo GÛry Bia≥ookiej. Wysokie po≥oøenie nad poziomem morza sprawia, øe pasmo gÛrskie pokrywa warstwa wiecznego úniegu, a obszar nie nadaje siÍ do zamieszkania.");

B_LogEntry(BookLog_Argaania,"NajwiÍksze skupiska ludnoúci zlokalizowane sπ w miastach i osadach oraz ich okolicach. NajwiÍcej skupisk ludnoúci znajduje siÍ w zachodniej oraz pÛ≥nocnej czÍúci wyspy, w ktÛrej to warunki klimatyczne sπ najdogodniejsze. Tutaj teø powsta≥y najwiÍksze ludzkie osady na wyspie. MieszkaÒcy Argaanii trudniπ siÍ rÛønorodnymi zawodami. Dominujπcymi sπ kupiectwo, ≥owiectwo oraz alchemia, lecz spora czÍúÊ ludnoúci zajmuje siÍ rÛwnieø uprawπ roli i rybo≥Ûwstwem. W Setarrif z kolei powaønπ rolÍ odgrywa tkactwo oraz zdobnictwo, o czym úwiadczπ wyjπtkowo ozdobione szaty setarrifczykÛw. ");

B_LogEntry(BookLog_Argaania,"Podzia≥ spo≥eczny obejmuje klasy moønow≥adztwa, do ktÛrego wliczajπ siÍ przede wszystkim rycerstwo, magowie, osoby z krÍgÛw rzπdzπcych miastami i spokrewnione z dworem setarrifskim, oraz klas niøszych, takich jak szeroko rozumiane mieszczaÒstwo, ch≥opstwo, rybacy czy myúliwi. Niewielkπ czÍúÊ populacji stanowiπ rÛwnieø imigranci z Myrtany oraz Khorinis, ktÛrzy w wiÍkszoúci nap≥ynÍli tu juø po podboju Wysp Po≥udniowych przez krÛla Rhobara. CzÍúÊ z nich to urzÍdnicy, lub rzadziej osadnicy wojskowi, choÊ coraz czÍúciej moøna tu teø spotkaÊ cywilnych MyrtaÒczykÛw. ");

B_LogEntry(BookLog_Argaania,"Na Argaanii swe naturalne siedziby majπ rÛwnieø orkowie. Rasa orkÛw argaaÒskich stoi na zdecydowanie niøszym poziomie od orkÛw z kontynentu, lecz nieznacznie wyøszym od odmiany z Khorinis. Dwa orkowe szczepy majπ swoje siedziby w jaskiniach w Srebrowodzie oraz w jaskinich miÍdzy bagnami a Czarnymi Jarami.");

B_LogEntry(BookLog_Argaania,"Granice jednostek admnistracyjnych Argaanii zosta≥y oparte w przybliøeniu na podstawie rzek, pasm gÛrskich oraz wπwozÛw. Prawdopodobnie zosta≥y wytyczane wraz z rozwojem KrÛlestwa Argaanii, jednak po podboju przez MyrtanÍ zosta≥y zachowane. ");

B_LogEntry(BookLog_Argaania,"Na wyspie znajdujπ siÍ rÛwnieø wieøe straønicze, ktÛre zosta≥y postawione przez jednego z krÛlÛw Wysp Po≥udniowych. Ich system ostrzegawczy polega na tym, øe gdy straønicy bÍdπ widzieli z jednej z wieø statki nieprzyjaciela, zapalπ ogieÒ ostrzegawczy. Wtedy zauwaøa to druga wieøa, potem trzecia i tak sygna≥ dociera do najbliøszego miasta, gdzie organizowano oddzia≥y do obrony. Takie wieøe do dziú znajdujπ siÍ na terenie wokÛ≥ brzegÛw wyspy Argaan, a krÛl Rhobar II do≥oøy≥ wszelkich staraÒ by je odbudowaÊ i odnowiÊ ich system.");

B_LogEntry(BookLog_Argaania,"G≥Ûwnym miastem wyspy i za razem stolicπ przedmyrtaÒskiego KrÛlestwa jest Setarrif ñ po≥oøony na wschodzie wyspy kompleks pa≥acÛw, bÍdπcy siedzibπ g≥owy paÒstwa, dworu krÛlewskiego oraz moønow≥adztwa. Miasto oprÛcz funkcji reprezentacyjnej, pe≥ni rÛwnieø funkcjÍ obronnπ. W obrÍbie Setariff znajduje siÍ rÛwnieø kopalnia licznych szlachetnych minera≥Ûw, m.in. z≥ota i magicznej rudy, co od wiekÛw zapewnia≥o miastu dostatek.");

B_LogEntry(BookLog_Argaania,"Na pÛ≥wyspie na pÛ≥nocy leøy najwiÍksze miasto wyspy ñ Thorniara. Osada sta≥a siÍ siedzibπ w≥adz myrtaÒskich po podboju Argaanii. Po wygranej kampanii, osiad≥ w niej pierwszy krÛlewski namiestnik wysp, Lord Dominique.");

B_LogEntry(BookLog_Argaania,"W czasie krÛtkiego okresu swego panowania Lorda Dominique, prÛbowa≥ on nak≥oniÊ jej mieszkaÒcÛw wysp do wiÍkszego poszanowania dla Innosa, gdyø dotychczas kult po≥udniowcÛw skupia≥ siÍ na Adanosie, a Innos pozostawa≥ niejako w cieniu swego boskiego brata. W celu nawrÛcenia mieszkaÒcÛw Wysp Po≥udniowych, pochowa≥ z≥ote posπøki Innosa po ca≥ej wyspie. Lud Argaanii jednak nie wykaza≥ siÍ znacznym zapa≥em w poszukiwaniach; znalezionymi posπøkami zaczÍto handlowaÊ. Lord Dominique siÍ tym bardzo zasmuci≥. Bohater wojenny nie czujπc siÍ dobrze w roli zarzπdcy, a takøe czujπc niechÍÊ czy nawet nienawiúÊ mieszkaÒcÛw wysp do jego osoby prosi krÛla o odebranie mu jego funkcji i oddelegowanie go do walk na froncie.");

B_LogEntry(BookLog_Argaania,"Rhobar II przysta≥ na proúbÍ zas≥uøonego paladyna i namiestnikiem Argaani, a co za tym idzie rÛwnieø wszystkich pozosta≥ych wysp archipelagu mianowa≥ Lorda Trontera. Rycerz ten, choÊ nie by≥ czÍúciπ paladynem, to sprawowa≥ namiestnictwo nad Srebrowodem, bÍdπcym jednπ z prowincji argaaÒskich. W przysz≥oúci Lord Dominique mia≥ powrÛciÊ na ArganiÍ, gdyø po tym jak poleg≥ w czasie walk z orkami, szczπtki jego zosta≥y sprowadzone na wyspÍ, na ktÛrej odniÛs≥ swe najwiÍksze zwyciÍstwo, ktÛre zapewni≥o mu nieúmiertelnoúÊ wúrÛd potomnych. Zosta≥ pochowany w grobowcu niedaleko Thorniary. ");

B_LogEntry(BookLog_Argaania,"Ze wzglÍdu na duøy port oraz po≥oøenie na szlaku handlowym, Thorniara ma kluczowe znaczenie gospodarcze, a dziÍki potÍønej twierdzy i murom obronnym, posiada ogromne walory obronne i militarne. Miastu podlegajπ rÛwnieø okoliczne wioski i farmy.");

B_LogEntry(BookLog_Argaania,"ZachÛd wyspy obejmuje Baronia Stewark. Po≥oøony na przeciÍciu szlakÛw handlowych region jest rÛwnieø zapleczem rolniczym i rybackim ca≥ej wyspy. PieczÍ nad prowincjπ sprawuje silnie ufortyfikowane miasto-twierdza Stewark.");

B_LogEntry(BookLog_Argaania,"W centralnej czÍúci wyspy leøy Baronia SrebrowÛd. W jej obrÍbie znajduje siÍ siedziba GoÒcÛw Leúnych, siedlisko orkÛw, stolicÍ administracyjnπ regionu stanowi zaú Zamek SrebrowÛd. Prowincja ta nastawiona jest przede wszystkim na ≥owiectwo oraz wymianÍ handlowπ z przyjaünie nastawionym do ludzi klanem orkÛw.");

B_LogEntry(BookLog_Argaania,"Na klifie na po≥udniowo-wschodnim pÛ≥wyspie Argaanii mieúci siÍ klasztor, w ktÛrym mnisi oddajπ czeúÊ Adanosowi, choÊ niektÛre pog≥oski uporczywie twierdzπ, jakoby w murach tych mia≥ przetrwaÊ pogaÒski kult Bogini wyznawanej niegdyú na wyspie.");

B_LogEntry(BookLog_Argaania,"KONIEC");

};
























































/////////////////////////////////////////////////////////////////////

// R”D FOLKMAR”W

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG”W OGNIA. JEDEN EGZEMPLARZ NA CA£• KOLONI  W ZUPE£NOåCI WYSTARCZY.

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_FolkmarFamily (C_ITEM)

{

name ="RÛd FolkmarÛw";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_03.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autor: Mag Ognia Eudamon";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_FolkmarFamily;

};

FUNC VOID Use_Book_FolkmarFamily()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "BOOK_ER_L.tga", 0);

Doc_SetPage ( nDocID,  1, "BOOK_ER_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "RÛd FolkmarÛw");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[PrÛba rekonstrukcji rodu posiadaczy ziemskich w Khorinis na podstawie zapiskÛw wyrytych na rodzinnych mogi≥ach.]");

Doc_SetMargins( nDocID,  -1,  15, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_FolkmarFamily,LOG_NOTE);

B_LogEntry(BookLog_FolkmarFamily,"RÛd FolkmarÛw");

B_LogEntry(BookLog_FolkmarFamily,"Niejednokrotnie bywa≥em z wizytπ w majπtku ziemskim w Khorinis, od pokoleÒ naleøπcym do dumnego rodu FolkmarÛw. Gospodarze zawsze wtedy potrafili mnie godnie ugoúciÊ, nie uchybiajπc godnoúci mojej jako maga ani dobremu imieniu swego domu. Bodücem do napisania tej ksiÍgi by≥o jednak nader smutne wydarzenie. Oto do Innosa odchodzi≥ sÍdziwy senior rodu i w≥aúciciel majπtku ziemskiego ñ szanowny Pan Buvran. ZarÛwno owego statecznego gospodarza, jak i jego rodzinÍ zna≥em doúÊ dobrze i úmierÊ Pana Buvrana wielce mnie zasmuci≥a. Zrozumia≥em wtedy w pe≥ni jak ulotnπ rzeczπ jest ludzkie øycie i ludzka pamiÍÊ. To sk≥oni≥o mnie do tego, by przeúledziÊ napisy z nagrobkÛw widniejπce na rodzinnym cmentarzu. Czas odbiera nam pamiÍÊ, a s≥owa wyryte w kamieniu powoli siÍ zacierajπ. Dlatego teø postanowi≥em spisaÊ widniejπce na nagrobkach s≥owa, by utrwaliÊ dla potomnych dzieje owego waønego dla Khorinis rodu.");

B_LogEntry(BookLog_FolkmarFamily,"1. Gebhard Niedüwiedzia Tarcza.†Mocarz poleg≥y w bitwie z ciemiÍøcπ, w walce o wolnoúÊ ludu Kahr.");

B_LogEntry(BookLog_FolkmarFamily,"2. Folkmar syn Gebharda. Towarzysz Dietmara Ukary i pierwszy posiadacz majπtku ziemskiego.");

B_LogEntry(BookLog_FolkmarFamily,"3. Gerlach syn Folkmara. Zostawi≥ swym synom majπtek po trzykroÊ pomnoøony.");

B_LogEntry(BookLog_FolkmarFamily,"4. Humbert syn Gerlacha. KtÛø jeúli nie on, siÍgnπ≥by aø po prze≥Ícz?");

B_LogEntry(BookLog_FolkmarFamily,"5. Lutbert syn Gerlacha.†M≥odszym bÍdπc, najstarszym siÍ sta≥. Po bracie objπ≥ majπtek ziemski w posiadanie, gospodarzπc aø po kres swych d≥ugich dni.");

B_LogEntry(BookLog_FolkmarFamily,"6. Ekbert syn Lutberta. Mπø stateczny, ojciec po dwakroÊ nieszczÍúciem dotkniÍty. Przedwczeúnie zgas≥, úmierciπ swych ukochanych dzieci strapiony. ");

B_LogEntry(BookLog_FolkmarFamily,"7. Emilda cÛrka Ekberta. DziewczÍ nadzwyczajnej urody, posiadajπce dar widzenia. Rozstrzyga≥a spory, wskazywa≥a przestÍpcÛw, leczy≥a chorych. Los zawistnie strzegπcy swych tajemnic, w zemúcie zes≥a≥ na jej umys≥ szaleÒstwo.†");

B_LogEntry(BookLog_FolkmarFamily,"8. Manfred syn Ekberta. Ukochawszy gonitwÍ i pe≥ny zwierzyny las, nad sierp i z≥oto zboøa, rozszarpany przez dzikπ bestiπ myúliwy skona≥ na leúnej polanie.");

B_LogEntry(BookLog_FolkmarFamily,"9. Mourin Z≥oty Sierpiec. Ziarno przez siewce odtrπcone, wyda≥o plon stukrotny. PoboønoúÊ i pracowitoúÊ zapewni≥a majπtkowi ziemskiemu dobrobyt. W klasztorze osiad≥szy na staroúÊ, tam dokona≥ øywota.");

B_LogEntry(BookLog_FolkmarFamily,"10. Hereward syn Mourina. M≥odzieniec ros≥y, odwagÍ i honor noszπcy w sercu. Zginπ≥ úmierciπ bohatera w walce z najeüdücπ z zachodu, broniπc swego kraju u boku dzielnych synÛw Kahr.");

B_LogEntry(BookLog_FolkmarFamily,"11. Folkward syn Mourina. Poszed≥ w úlady brata, zasiliwszy szeregi wojsk KrÛlestwa Kahr. MÍstwem i walecznoúciπ siÍ odznaczywszy, zosta≥ przez samego w≥adcÍ wybrany do osobistej Gwardii.");

B_LogEntry(BookLog_FolkmarFamily,"12. Caspar syn Folkwarda. Po ojcu swego rodziciela wziπ≥ w posiadanie majπtek ziemski, panujπc przez lat wiele dziesiπtkÛw. ålepcem bÍdπc na staroúÊ, nigdy nie ujrza≥ swego jedynego syna.");

B_LogEntry(BookLog_FolkmarFamily,"13. Adalbert syn Caspara. Ziemie ukocha≥ on szczerze, serce swe oddajπc ca≥kowicie sprawom majπtku ziemskiego. Na dziedzica przez Caspara namaszczony zmar≥ przedwczeúnie chorobπ zmoøony. ");

B_LogEntry(BookLog_FolkmarFamily,"14. Udo syn Caspara. Potomek Folkmara, ktÛremu sπdzone by≥o øyÊ w czasach powolnego upadku KrÛlestwa Kahr i zmierzchu krÛlewskiej dynastii UkarÛw. Poleg≥y w walkach toczonych o tron KrÛlestwa.");

B_LogEntry(BookLog_FolkmarFamily,"Tu nastÍpuje kilkupokoleniowa wyrwa, gdyø po úmierci synÛw Caspara brak juø nagrobkÛw aø do pochÛwku Hugona. W tym czasie, zapewne za sprawπ nowinek religijnych rozpowszechnianych przez szerzπce siÍ wÛwczas na wyspie sekty, w≥aúciciele majπtku ziemskiego przyjÍli nieznany wczeúniej zwyczaj palenia zmar≥ych. Wobec braku nagrobkÛw, nie sposÛb odtworzyÊ w tym miejscu historii rodu. W tradycji rodzinnej przetrwa≥o jednak echo o jakimú wÍdrownym mÍdrcu przyby≥ym z po≥udnia i przez wiele lat cieszπcym siÍ goúcinπ tutejszych gospodarzy. Kim by≥, ani jakim doktrynom s≥uøy≥, na wieki pewnie pozostanie tajemnicπ. Oto kolejni Folkmarowie:");

B_LogEntry(BookLog_FolkmarFamily,"15. Hugon syn Widukinda. W cieniu brata wyros≥y, wiÍcej by≥ mnichem, niø gospodarzem. Nad ksiÍgami nieustannie pochylony, nie zwyk≥ doglπdaÊ swego majπtku. W wiedzÍ tedy wzrastajπc, na dobytku swym zaniedbaniem uszczerbek czyni≥.");

B_LogEntry(BookLog_FolkmarFamily,"16. Ordulf syn Hugona. Zmar≥ op≥akiwany przez rodzinÍ i licznych przyjaciÛ≥. Za swego øycia odnowi≥ zabudowÍ majπtku ziemskiego i wybudowa≥ nowy m≥yn. Doøywszy starczego wieku, do ostatnich dni zachowa≥ zdrowie i jasnoúÊ umys≥u.");

B_LogEntry(BookLog_FolkmarFamily,"17. Dietwin syn Ordulfa.†Gospodarz stateczny i cieszπcy siÍ szacunkiem. Zjednawszy sobie mπdroúciπ sπsiadÛw, zyska≥ rolÍ rozjemcy nie z prawa, lecz ze zwyczaju. Zmar≥ doøywszy wieku sÍdziwego");

B_LogEntry(BookLog_FolkmarFamily,"18. Bernard syn Dietwina. Godny potomek Gebharda DÍbowej Tarczy, ktÛry wzorem swego praprzodka potrafi≥ wyginaÊ podkowy. S≥awny swπ si≥π, ≥eb warga by≥ w stanie zmiaødøyÊ w uúcisku swej piÍúci. Gospodarz majπtku ziemskiego");

B_LogEntry(BookLog_FolkmarFamily,"19. Engelbrecht syn Bernarda. Øywot jego przypada≥ na czasy pokoju i takie teø by≥ usposobienia Engelbrechta syn Bernarda.");

B_LogEntry(BookLog_FolkmarFamily,"20. Buvran syn Dietwina. Zasnπ≥ snem wieczny, doøywszy 87 lat. Przez ca≥e swe øycie nigdy nie opuúci≥ swego majπtku ziemskiego, ktÛry ukocha≥ nade wszystko.");

B_LogEntry(BookLog_FolkmarFamily,"Kolejne karty tej ksiπøki zapisze nieuchronny czasÖ Spisane piÛrem Eudamona, maga ognia z Klasztoru w Khorinis");

B_LogEntry(BookLog_FolkmarFamily,"KONIEC");

};



























































/////////////////////////////////////////////////////////////////////

// DZIEDZICTWO PRADAWNYCH

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG”W WODY/BIBLIOTEKA MAG”W OGNIA

// KATEGORIA: ZWYCZAJNE - MOØNA T• KSI G  DOSTA∆ U HANDLARZY, LUB ZNALEè∆ W OG”LNODOST PNYCH MIEJSCACH

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_HeritageOfAncestors (C_ITEM)

{

name ="Dziedzictwo Pradawnych";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_03.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autor: Mag Wody†Calamus";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_HeritageOfAncestors;

};

FUNC VOID Use_Book_HeritageOfAncestors()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "BOOK_ER_L.tga", 0);

Doc_SetPage ( nDocID,  1, "BOOK_ER_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Dziedzictwo Pradawnych");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[O wpÛ≥ywie cywilizacji staroøytnego Varantu na úwiat myrtaÒski, a takøe o zwiπzkach Imperium Pradawnych z dzisiejszym Varantem.]");

Doc_SetMargins( nDocID,  -1,  15, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_HeritageOfAncestors,LOG_NOTE);

B_LogEntry(BookLog_HeritageOfAncestors,"Dziedzictwo Pradawnych");

B_LogEntry(BookLog_HeritageOfAncestors,"Imperium Varanckie kilkanaúcie wiekÛw temu†stanowi≥o najwiÍkszπ potÍgÍ na Kontynencie MyrtaÒskim. Zjednoczone przez Wiecznego WÍdrowca rozciπgnÍ≥o swe w≥adztwo na ca≥y Varant i po≥udniowe tereny Krain Centralnych. Zosta≥o unicestwione przez Adanosa, gdy Pradawni podjÍli siÍ budowy portalu za pomocπ ktÛrego Innos mia≥ przekroczyÊ oddzielajπcπ oba wymiary barierÍ i przyjúÊ do Wymiaru Ludzi.");

B_LogEntry(BookLog_HeritageOfAncestors,"Imperium zdo≥a≥o jednak wytworzyÊ kulturÍ i religiÍ, ktÛra przetrwa≥a upadek samego paÒstwa i sta≥a siÍ podstawπ cywilizacji rozprzestrzeniajπcej siÍ nastÍpnie na zielone krainy Myrtany, skuty lodem Nordmar i na liczne wyspy i wysepki po≥oøone na wschÛd od Kontynentu.");

B_LogEntry(BookLog_HeritageOfAncestors,"Po unicestwieniu Pradawnych, na lπd powtÛrnie wy≥aniajπcy siÍ z g≥Íbin, przybywali ludzie z gÛr leøπcych na zachodzie. Zwali sie oni koczownikami. Nowi mieszkaÒcy nie byli poganami, choÊ w przeciwieÒstwie do Pradawnych VarantczykÛw nie oddawali czci Innosowi, lecz wyznawali Pana Wody - Adanosa. Wed≥ug legendy, plemiona te mia≥y pochodziÊ od wyklÍtego w≥adcy Varantu - Kalhira II. Wygnany ze swego paÒstwa za prÛbÍ obalenia kultu Innosa i zastπpienia go kultem Adanosa, zbieg≥ w gÛry, gdzie nawraca≥ tamtejsze plemiona KoczownikÛw. Poczπtkowo przyby≥e do Varantu ludy gÛrskie, przemierza≥y wyja≥owiony i zamieniony przez bogÛw w pustyniÍ lπd, kroczπc szlakiem Wiecznego WÍdrowca. Jednak z biegiem lat coraz wiÍcej ludzi decydowa≥o siÍ na osiad≥y tryb øycia. W oazach zaczÍ≥y wiÍc powstawaÊ wioski i miasta. ");

B_LogEntry(BookLog_HeritageOfAncestors,"NastÍpnym etapem by≥o powstanie paÒstw. Na czele owych czÍsto rywalizujπcych ze sobπ krÛlestw, stawali adanosyccy w≥adcy. NajpotÍøniejszymi mia≥y siÍ okazaÊ Mora Sul i Bakareshu. Niebawem ludy pustyni mia≥y same siebie przezwaÊ Varantczykami, przejmujπc tym samym nazwÍ dawnych mieszkaÒcÛw tej krainy. Mimo to pamiÍÊ o poczπtkach kaza≥a im zachowaÊ pierwotnπ nazwÍ swego ludu, wiÍc od wiekÛw prowadzπcy osiad≥y tryb øycia mieszkaÒcy Varantu okreúlajπ siÍ rÛwnieø mianem KoczownikÛw.†");

B_LogEntry(BookLog_HeritageOfAncestors,"KONIEC");

};






















































/////////////////////////////////////////////////////////////////////

// PIEå— O WYZWOLENIU

// SUGEROWANA LOKACJA: LOCHY STAREGO OBOZU (PUSTA CELA, PE£NA KOåCIOTRUP”W). KSI GA PRZY JEDNYM ZE SZKIELET”W

// KATEGORIA: UNIKATOWE - TYLKO JEDNA 

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_IsNomineVacans (C_ITEM)

{

name ="PieúÒ o wyzwoleniu";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_03.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autor: Mag Ognia†Telavio";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_IsNomineVacans;

};

FUNC VOID Use_Book_IsNomineVacans()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "BOOK_ER_L.tga", 0);

Doc_SetPage ( nDocID,  1, "BOOK_ER_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "PieúÒ o wyzwoleniu");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Dociekania poúwiÍcone zagadkowemu hymnowi.]");

Doc_SetMargins( nDocID,  -1,  15, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_IsNomineVacans,LOG_NOTE);

B_LogEntry(BookLog_IsNomineVacans,"PieúÒ o wyzwoleniu");

B_LogEntry(BookLog_IsNomineVacans,"Is nomine vacans liberabit vobis ex servitus. Is nomine vacans reddet vobis ars magica. Is nomine vacans liberabit vobis ex servitus. Movemini Vengarderis solum locus liber mundi. ");

B_LogEntry(BookLog_IsNomineVacans,"Advemini custos templorum. Is nomine vacans liberabit vobis ex servitus. Movemini Vengarderis solum locus liber mundi. Advemini custos templorum.†");

B_LogEntry(BookLog_IsNomineVacans,"PieúÒ o wyzwoleniu zalicza siÍ do najstarszych i najbardziej tajemniczych tekstÛw, ktÛrych geneza ginie w mrokach dziejÛw. Zosta≥a ona napisana w jednym z dialektÛw jÍzyka Pradawnych ñ w jÍzyku kap≥anÛw Innosa. Jest to mowa archaiczna, gdyø pos≥ugiwali siÍ niπ w≥aúciwie jedynie najwyøsi kap≥ani Imperium Pradawnych. Skπd wiÍc w tekúcie pojawiajπ siÍ s≥owa o Vengardzie, ktÛry nigdy nie popad≥ w zaleønoúÊ od potÍønego paÒstwa Pradawnych?");

B_LogEntry(BookLog_IsNomineVacans,"Czy tekst traktuje o wydarzeniach z przesz≥oúci i nadziei tamtych ludzi na wybawienie przez tajemniczego bohatera, czy teø jest to moøe forma przepowiedni, ktÛra dopiero ma siÍ wype≥niÊ?†Czym jest teø owa moc magiczna, ktÛra ma zostaÊ przywrÛcona przez nieznanego z imienia bohatera? Czy rzecz siÍ tyczy staroøytnych czarÛw, ktÛre zosta≥y utracone w momencie zag≥ady Imperium Pradawnych? Odzyskanie tej wiedzy by≥oby zapewne istnym przewrotem w dziedzinie nauk magicznych.");

B_LogEntry(BookLog_IsNomineVacans,"Kwestia autorstwa rÛwnieø pozostaje nierozwiπzana. JÍzyk wskazywa≥by na kap≥anÛw Varantu, lub krÍgi duchowne pozostajπce pod wp≥ywem Imperium. Najpopularniejsze z hipotez mÛwiπ o ocala≥ych Pradawnych, ktÛrzy op≥akiwali upadek swej cywilizacji i øywili wiarÍ w to, øe uda siÍ zachowaÊ jego dziedzictwo, a nawet odbudowaÊ utraconπ wielkoúÊ. ");

B_LogEntry(BookLog_IsNomineVacans,"Moøliwe teø, øe okrπøeni z wszystkich stron przez barbarzyÒcÛw Pradawni z niezatopionych pÛ≥nocnych ziem dawnego krÛlestwa, w cudownym wybraÒcu bogÛw upatrywali swego wybawiciela. Skπd wiÍc wziπ≥ siÍ w pieúni Vengard?");

B_LogEntry(BookLog_IsNomineVacans,"Nie wykluczajπc powyøszych przypuszczeÒ, moøna siÍ pokusiÊ o innπ teoriÍ. OtÛø mog≥a powstaÊ w czasach zagroøenia jakiejú innosyckiej spo≥ecznoúci, ktÛra byÊ moøe utraci≥a swych magÛw i co za tym idzie, rÛwnieø magicznπ moc. Wyraøa wiÍc ona wiarÍ w powrÛt utraconej wiedzy. Bohaterem by≥by wiÍc cz≥owiek obcy, przyby≥y z innych stron, ktÛrego imiÍ by≥oby im wczeúniej nieznane. ByÊ moøe chodzi≥o od pos≥aÒca bogÛw.");

B_LogEntry(BookLog_IsNomineVacans,"Pomimo niezrozumia≥ego jÍzyka, a moøe w≥aúnie dziÍki temu pieúÒ siÍ rozpowszechni≥a w ca≥ej Myrtanie. Moøna przypuszczaÊ, øe archaiczne brzmienie jej s≥Ûw musia≥o przywodziÊ na myúl zaklÍcia, z czym wiπza≥oby siÍ nadawanie utworowi w≥aúciwoúci magicznych.");

B_LogEntry(BookLog_IsNomineVacans,"Uczeni wspominajπ, øe po zdobyciu Gothy przez wojska Monteriusa II, d≥ugo jeszcze niegodzπcy siÍ z klÍskπ, ukrywajπcy siÍ po lasach partyzanci úpiewali tπ pieúÒ. DomyúlaÊ siÍ moøna, øe owi rycerze zamiast Vengardu wymieniali nazwÍ zdobytego swego miasta, ktÛro znalaz≥o ku ich rozpaczy znalaz≥o siÍ w rÍkach wroga.");

B_LogEntry(BookLog_IsNomineVacans,"Najstarszy jednak spisany tekst pieúni pochodzi od Reginalda, ktÛry w swych ëHymnach Myrtanyí zawar≥ jπ w wersji vengardzkiej. Reginald milczy jednak o tym, kiedy powsta≥a i w jakich okolicznoúciach zosta≥a odúpiewana.");

B_LogEntry(BookLog_IsNomineVacans,"PieúÒ o wyzwoleniu zapewne pobrzmiewa≥a jeszcze na ziemiach Krain Centralnych w czasach podbojÛw RhobarydÛw, kiedy to dzielni krÛlowie jednoczyli rozbitπ na szereg krÛlestw zielonπ MyrtanÍ. Wraz ze zrastaniem siÍ ziem zjednoczonych pod ber≥em RhobarydÛw, pieúÒ ta uleg≥a zapomnieniu, aø w koÒcu nikt juø jej nie wznosi≥. Oby juø nigdy w KrÛlestwie Myrtany jej s≥owa nie rozleg≥y siÍ na nowo po lasach i skalnych ostÍpachÖ");

B_LogEntry(BookLog_IsNomineVacans,"KONIEC");

};






























































/////////////////////////////////////////////////////////////////////

// KODEKS MARKWARTA. TOM I

// SUGEROWANA LOKACJA: MAGAZYN W LOCHACH STAREGO OBOZU. KODEKS RZUCI∆ MI DZY INNE RUPIECIE.

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_Markwart1 (C_ITEM)

{

name ="Kodeks Markwarta. Tom I";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_03.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autor: Socius z Vengardu";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_Markwart1;

};

FUNC VOID Use_Book_Markwart1()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "BOOK_ER_L.tga", 0);

Doc_SetPage ( nDocID,  1, "BOOK_ER_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Kodeks Markwarta. Tom I");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Zebrane w kodeks ch≥opskie prawo zwyczajowe z okolic Montery, rozciπgniÍte na ludnoúÊ wieúniaczπ ca≥ego KrÛlestwa Myrtany. Po utworzeniu magicznej bariery w GÛrniczej Dolinie i objÍciu wiÍkszej iloúci przestÍpstw karπ zes≥ania do Kolonii Karnej, spisane tu prawa straci≥y na znaczeniu.]");

Doc_SetMargins( nDocID,  -1,  15, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_Markwart1,LOG_NOTE);

B_LogEntry(BookLog_Markwart1,"Kodeks Markwarta. Tom I");

B_LogEntry(BookLog_Markwart1,"Dla poøytku potomnoúci, uczony Markwart, zebra≥ ch≥opskie prawo zwyczajowe obowiπzujπce w okolicach Montery i wyda≥ w kilku tomach. Za zgodπ i z b≥ogos≥awieÒstwem KrÛla, podjπ≥ siÍ opracowania jednolitego sposobu postÍpowania w sprawach wiejskich, by w ca≥ym paÒstwie obowiπzywa≥o wspÛlne prawo w tej materii. ");

B_LogEntry(BookLog_Markwart1,"ZbiÛr praw uwzglÍdnia tylko przypadki mogπce mieÊ miejsce w úrodowisku ch≥opskim. PominiÍto przy tym miasta, gdyø te posiadajπ odrÍbne przywileje dane im od monarchÛw i panÛw feudalnych.  W spisie tym prÛøno szukaÊ odpowiedzi na pytania, w jaki sposÛb karaÊ zabÛjstwa, oszustwa, czy krzywoprzysiÍstwo. ");

B_LogEntry(BookLog_Markwart1,"Wymienionych wyøej przestÍpstw jako mogπcych mieÊ miejsce rÛwnieø poza wsiπ, naleøy szukaÊ w bardziej ogÛlnych zbiorach praw, ktÛrych zapisy obowiπzujπ takøe ch≥opÛw.†Z woli mi≥oúciwego krÛla Rhobara II, jedynego w≥adcy Myrtany i namiestnika Innosa na ziemi, do rπk czytelnika trafia nowe wydanie tego dzie≥a.");

B_LogEntry(BookLog_Markwart1,"Ku Chwale Pana Ognia, co bogiem jest prawa i porzπdku. Redagowa≥†Socius z Vengardu");

B_LogEntry(BookLog_Markwart1,"Rozdzia≥ I: O pozwie");

B_LogEntry(BookLog_Markwart1,"ß1. Jeøeli zgodnie z krÛlewskimi prawami ktoú zostanie pozwany przed sπd i nie stawi siÍ przed jego oblicze, zostanie zasπdzony na zap≥atÍ 300 sztuk z≥ota, o ile nie powstrzyma≥a go od stawienia siÍ si≥a przemoøna.");

B_LogEntry(BookLog_Markwart1,"ß2. Ten zaú kto pozwa≥ innego a sam nie stawi≥ siÍ przed oblicze sπdu, jeøeli go nie powstrzyma≥a si≥a przemoøna zap≥aci 300 sztuk z≥ota.");

B_LogEntry(BookLog_Markwart1,"KONIEC TOMU I");

};
























































/////////////////////////////////////////////////////////////////////

// KODEKS MARKWARTA. TOM II

// SUGEROWANA LOKACJA: MAGAZYN W LOCHACH STAREGO OBOZU. KODEKS RZUCI∆ MI DZY INNE RUPIECIE.

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_Markwart2 (C_ITEM)

{

name ="Kodeks Markwarta. Tom II";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_03.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autor: Socius z Vengardu";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_Markwart2;

};

FUNC VOID Use_Book_Markwart2()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "BOOK_ER_L.tga", 0);

Doc_SetPage ( nDocID,  1, "BOOK_ER_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Kodeks Markwarta. Tom II");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Zebrane w kodeks ch≥opskie prawo zwyczajowe z okolic Montery, rozciπgniÍte na ludnoúÊ wieúniaczπ ca≥ego KrÛlestwa Myrtany. Po utworzeniu magicznej bariery w GÛrniczej Dolinie i objÍciu wiÍkszej iloúci przestÍpstw karπ zes≥ania do Kolonii Karnej, spisane tu prawa straci≥y na znaczeniu.]");

Doc_SetMargins( nDocID,  -1,  15, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_Markwart2,LOG_NOTE);

B_LogEntry(BookLog_Markwart2,"Kodeks Markwarta. Tom II");

B_LogEntry(BookLog_Markwart2,"Rozdzia≥ II: O kradzieøy wieprzÛw†");

B_LogEntry(BookLog_Markwart2,"ß1. Jeøeli ktoú ukradnie prosiÍ od maciory z zagrody i zostanie mu to udowodnione bÍdzie zasπdzony na 24 sztuk z≥ota†");

B_LogEntry(BookLog_Markwart2,"ß2. Jeøeli ktoú ukradnie prosiÍ mogπce øyÊ bez maciory i zostanie mu to udowodnione, bÍdzie zasπdzony na 36 sztuk z≥ota");

B_LogEntry(BookLog_Markwart2,"ß3. Jeøeli ktoú ukradnie dwuletniπ úwiniÍ bÍdzie zasπdzony na 50 sztuk z≥ota oraz zap≥atÍ szkody i kwoty za zw≥okÍ.");

B_LogEntry(BookLog_Markwart2,"ß4. Jeøeli ktoú ukradnie odyÒca zostanie zasπdzony na 50 sztuk z≥ota oraz zap≥atÍ jego wartoúci i kwoty za zw≥okÍ.");

B_LogEntry(BookLog_Markwart2,"ß5. Jeøeli ktoú ukradnie karmiπcπ maciorÍ zap≥aci 60 sztuk z≥ota, a ponadto zap≥aci odszkodowanie i kwotÍ za zw≥okÍ.");

B_LogEntry(BookLog_Markwart2,"ß6. Jeøeli ktoú ukradnie wieprza przeznaczonego na ofiarÍ, a ten kto go postrada≥ przy pomocy úwiadkÛw udowodni, øe by≥o to zwierzÍ ofiarne bÍdzie zasπdzony na 75 sztuk z≥ota, oprÛcz odszkodowania i kwoty za zw≥okÍ.");

B_LogEntry(BookLog_Markwart2,"ß7. Jeøeli ktoú ukradnie wieprza nie przeznaczonego na ofiarÍ bÍdzie zasπdzony na 40 sztuk z≥ota, oprÛcz odszkodowania i kwoty za zw≥okÍ.");

B_LogEntry(BookLog_Markwart2,"KONIEC TOMU II");

};
























































/////////////////////////////////////////////////////////////////////

// KODEKS MARKWARTA. TOM III

// SUGEROWANA LOKACJA: MAGAZYN W LOCHACH STAREGO OBOZU. KODEKS RZUCI∆ MI DZY INNE RUPIECIE.

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_Markwart3 (C_ITEM)

{

name ="Kodeks Markwarta. Tom III";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_03.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Socius z Vengardu";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_Markwart3;

};

FUNC VOID Use_Book_Markwart3()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "BOOK_ER_L.tga", 0);

Doc_SetPage ( nDocID,  1, "BOOK_ER_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Kodeks Markwarta. Tom III");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Zebrane w kodeks ch≥opskie prawo zwyczajowe z okolic Montery, rozciπgniÍte na ludnoúÊ wieúniaczπ ca≥ego KrÛlestwa Myrtany. Po utworzeniu magicznej bariery w GÛrniczej Dolinie i objÍciu wiÍkszej iloúci przestÍpstw karπ zes≥ania do Kolonii Karnej, spisane tu prawa straci≥y na znaczeniu.]");

Doc_SetMargins( nDocID,  -1,  15, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_Markwart3,LOG_NOTE);

B_LogEntry(BookLog_Markwart3,"Kodeks Markwarta. Tom III");

B_LogEntry(BookLog_Markwart3,"Rozdzia≥ III: O kradzieøy krÛw");

B_LogEntry(BookLog_Markwart3,"ß1. Jeøeli ktoú ukradnie cielÍ od krowy i zostanie mu to udowodnione zasπdzony bÍdzie na 340 sztuk z≥ota.");

B_LogEntry(BookLog_Markwart3,"ß2. Jeøeli ktoú ukradnie cielÍ mogπce øyÊ bez krowy i zostanie mu to udowodnione, bÍdzie zasπdzony na 54 sztuk z≥ota.");

B_LogEntry(BookLog_Markwart3,"ß3. Jeøeli ktoú ukradnie dwuletniπ krowÍ zostanie zasπdzony na 70 sztuk z≥ota oraz zap≥atÍ szkody i kwoty za zw≥okÍ.");

B_LogEntry(BookLog_Markwart3,"ß4. Jeøeli ktoú ukradnie byka zostanie zasπdzony na 80 sztuk z≥ota oraz zap≥atÍ jego wartoúci i kwoty za zw≥okÍ.");

B_LogEntry(BookLog_Markwart3,"ß5. Jeøeli ktoú ukradnie karmiπcπ krowÍ zap≥aci 80 sztuk z≥ota, a ponadto zap≥aci odszkodowanie i kwotÍ za zw≥okÍ.");

B_LogEntry(BookLog_Markwart3,"ß6. Jeøeli ktoú ukradnie byka przeznaczonego na ofiarÍ, a ten kto go postrada≥ przy pomocy úwiadkÛw udowodni, øe by≥o to zwierzÍ ofiarne zostanie zasπdzony na 80 sztuk z≥ota, oprÛcz odszkodowania i kwoty za zw≥okÍ.");

B_LogEntry(BookLog_Markwart3,"ß7. Jeøeli ktoú ukradnie wieprza nie przeznaczonego na ofiarÍ zostanie zasπdzony na 70 sztuk z≥ota, oprÛcz odszkodowania i kwoty za zw≥okÍ.");

B_LogEntry(BookLog_Markwart3,"KONIEC TOMU III");

};























































/////////////////////////////////////////////////////////////////////

// KODEKS MARKWARTA. TOM IV

// SUGEROWANA LOKACJA: MAGAZYN W LOCHACH STAREGO OBOZU. KODEKS RZUCI∆ MI DZY INNE RUPIECIE.

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_Markwart4 (C_ITEM)

{

name ="Kodeks Markwarta. Tom IV";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_03.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autor: Socius z Vengardu";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_Markwart4;

};

FUNC VOID Use_Book_Markwart4()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "BOOK_ER_L.tga", 0);

Doc_SetPage ( nDocID,  1, "BOOK_ER_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Kodeks Markwarta. Tom IV");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Zebrane w kodeks ch≥opskie prawo zwyczajowe z okolic Montery, rozciπgniÍte na ludnoúÊ wieúniaczπ ca≥ego KrÛlestwa Myrtany. Po utworzeniu magicznej bariery w GÛrniczej Dolinie i objÍciu wiÍkszej iloúci przestÍpstw karπ zes≥ania do Kolonii Karnej, spisane tu prawa straci≥y na znaczeniu.]");

Doc_SetMargins( nDocID,  -1,  15, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_Markwart4,LOG_NOTE);

B_LogEntry(BookLog_Markwart4,"Kodeks Markwarta. Tom IV");

B_LogEntry(BookLog_Markwart4,"Rozdzia≥ IV: O kradzieøy owiec i kÛz†");

B_LogEntry(BookLog_Markwart4,"ß1. Jeøeli ktoú ukradnie jagniÍ, kozy zostanie zasπdzony na 7 sztuk z≥ota oraz sp≥atÍ odszkodowania i kwoty za zw≥okÍ.");

B_LogEntry(BookLog_Markwart4,"ß2. Jeøeli ktoú ukradnie rocznego lub dwuletniego barana zostanie skazany na 120 sztuk z≥ota oraz zap≥atÍ odszkodowania i kwoty za zw≥okÍ.");

B_LogEntry(BookLog_Markwart4,"ß3. Jeøeli ktoú ukradnie owce zostanie skazany na 20 sztuk z≥ota oraz zap≥atÍ odszkodowania i kwoty za zwlokÍ.");

B_LogEntry(BookLog_Markwart4,"ß4. Jeøeli ktoú ukradnie ma≥π kozÍ zostanie zasπdzony na 7 sztuk z≥ota oraz sp≥atÍ odszkodowania i kwoty za zw≥okÍ.");

B_LogEntry(BookLog_Markwart4,"ß5. Jeøeli ktoú ukradnie rocznego lub dwuletniego koz≥a zostanie skazany na 12 sztuk z≥ota oraz zap≥atÍ odszkodowania i kwoty za zw≥okÍ.");

B_LogEntry(BookLog_Markwart4,"ß6. Jeøeli ktoú ukradnie kozÍ, zostanie skazany na 20 sztuk z≥ota oraz zap≥atÍ odszkodowania i kwoty za zw≥okÍ.");

B_LogEntry(BookLog_Markwart4,"KONIEC TOMU IV");

};

























































/////////////////////////////////////////////////////////////////////

// KODEKS MARKWARTA. TOM V

// SUGEROWANA LOKACJA: MAGAZYN W LOCHACH STAREGO OBOZU. KODEKS RZUCI∆ MI DZY INNE RUPIECIE.

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_Markwart5 (C_ITEM)

{

name ="Kodeks Markwarta. Tom V";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_03.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autor: Betto Malintus";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_Markwart5;

};

FUNC VOID Use_Book_Markwart5()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "BOOK_ER_L.tga", 0);

Doc_SetPage ( nDocID,  1, "BOOK_ER_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Kodeks Markwarta. Tom V");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Zebrane w kodeks ch≥opskie prawo zwyczajowe z okolic Montery, rozciπgniÍte na ludnoúÊ wieúniaczπ ca≥ego KrÛlestwa Myrtany. Po utworzeniu magicznej bariery w GÛrniczej Dolinie i objÍciu wiÍkszej iloúci przestÍpstw karπ zes≥ania do Kolonii Karnej, spisane tu prawa straci≥y na znaczeniu.]");

Doc_SetMargins( nDocID,  -1,  15, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_Markwart5,LOG_NOTE);

B_LogEntry(BookLog_Markwart5,"Kodeks Markwarta. Tom V");

B_LogEntry(BookLog_Markwart5,"Rozdzia≥ V: O kradzieøy psÛw i pszczÛ≥");

B_LogEntry(BookLog_Markwart5,"ß1. Jeøeli ktoú ukradnie tresowanego psa ≥owieckiego zostanie skazany na 40 sztuk z≥ota oraz zap≥atÍ odszkodowania i kwoty za zw≥okÍ.");

B_LogEntry(BookLog_Markwart5,"ß2. Jeøeli ktoú ukradnie charta - naganiacza zostanie skazany na 40 sztuk z≥ota oraz zap≥atÍ odszkodowania i kwoty za zw≥okÍ.");

B_LogEntry(BookLog_Markwart5,"ß3. Jeøeli ktoú ukradnie lub zabije psa pasterskiego zostanie skazany na 120 sztuk z≥ota oraz zap≥atÍ odszkodowania i kwoty za zw≥okÍ.");

B_LogEntry(BookLog_Markwart5,"ß4. Kto ukradnie jeden lub wiÍcej pni pszczÛ≥ pozostajπcych w zamkniÍciu i pod dachem zostanie skazany na 80 sztuk z≥ota, oprÛcz odszkodowania i kwoty za zwlokÍ.");

B_LogEntry(BookLog_Markwart5,"ß5. Kto ukradnie jeden lub wiÍcej uli z pszczo≥ami pozostajπcymi na otwartej przestrzeni zostanie skazany na 50 sztuk z≥ota,†oprÛcz odszkodowania i kwoty za zwlokÍ.");

B_LogEntry(BookLog_Markwart5,"KONIEC TOMU V");

};






















































/////////////////////////////////////////////////////////////////////

// KODEKS MARKWARTA. TOM IX

// SUGEROWANA LOKACJA: MAGAZYN W LOCHACH STAREGO OBOZU. KODEKS RZUCI∆ MI DZY INNE RUPIECIE.

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_Markwart9 (C_ITEM)

{

name ="Kodeks Markwarta. Tom IX";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_03.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autor: Socius z Vengardu";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_Markwart9;

};

FUNC VOID Use_Book_Markwart9()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "BOOK_ER_L.tga", 0);

Doc_SetPage ( nDocID,  1, "BOOK_ER_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Kodeks Markwarta. Tom IX");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Zebrane w kodeks ch≥opskie prawo zwyczajowe z okolic Montery, rozciπgniÍte na ludnoúÊ wieúniaczπ ca≥ego KrÛlestwa Myrtany. Po utworzeniu magicznej bariery w GÛrniczej Dolinie i objÍciu wiÍkszej iloúci przestÍpstw karπ zes≥ania do Kolonii Karnej, spisane tu prawa straci≥y na znaczeniu.]");

Doc_SetMargins( nDocID,  -1,  15, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_Markwart9,LOG_NOTE);

B_LogEntry(BookLog_Markwart9,"Kodeks Markwarta. Tom IX");

B_LogEntry(BookLog_Markwart9,"Rozdzia≥ IX: O szkodach wyrzπdzonych w zasiewach, lub w innych ogrodzonych uprawach");

B_LogEntry(BookLog_Markwart9,"ß1. Kto cudze zwierzÍ, konia lub wo≥u oznakuje zostanie skazany na 180 sztuk z≥ota, oprÛcz odszkodowania i kwoty za zw≥okÍ.");

B_LogEntry(BookLog_Markwart9,"ß2. Kto zastanie w swoich zasiewach cudze byd≥o, nie moøe go zabiÊ. Gdyby to uczyni≥ i obwieúci≥, winien wynagrodziÊ szkodÍ, a to co zabi≥ zachowa dla siebie. Jeøeli jednak tego nie og≥osi≥ a zostanie mu to udowodnione, bÍdzie on skazany na 150 sztuk z≥ota oraz zap≥atÍ odszkodowania i kwoty za zw≥okÍ.");

B_LogEntry(BookLog_Markwart9,"ß3. Kto w swoich zasiewach zastanie cudze byd≥o bez nadzoru i zamknie je w ukryciu nie og≥aszajπc tego, a czÍúÊ byd≥a zdechnie zostanie on skazany na 160 sztuk z≥ota, oprÛcz odszkodowania i kwoty za zw≥okÍ.");

B_LogEntry(BookLog_Markwart9,"ß4. Kto przez swoje niedbalstwo wyrzπdzi krzywdÍ u wo≥u lub innego zwierzÍcia i wyzna to swojemu panu winien wynagrodziÊ szkodÍ. Jeøeli jednak k≥amie, a zostanie mu to udowodnione zostanie on skazany na 120 sztuk z≥ota, oprÛcz wynagrodzenia szkody i kwoty za zw≥okÍ.");

B_LogEntry(BookLog_Markwart9,"ß5. Kto czyjeú úwinie lub byd≥o pozostajπce pod straøπ pastucha wpÍdzi w cudze zasiewy i mimo jego wykrÍtÛw zostanie mu to udowodnione zostanie on skazany na 200 sztuk z≥ota, oprÛcz odszkodowania strat i kwoty za zw≥okÍ.");

B_LogEntry(BookLog_Markwart9,"ß6. Jeøeli czyjeú zwierze zostanie zajÍte z powodu wyrzπdzonych szkÛd na cudzym polu, w≥aúciciel zwierzÍcia wynagrodzi poniesione straty a nadto zap≥aci 100 sztuk z≥ota.");

B_LogEntry(BookLog_Markwart9,"ß7. Jeøeli ktoú kierujπc siÍ wrogoúciπ lub zuchwa≥oúciπ waøy siÍ si≥π odebraÊ byd≥o zajÍte z tytu≥u szkÛd wyrzπdzonych w polu lub wykraúÊ je spod zamkniÍcia zastanie skazany na 200 sztuk z≥ota.");

B_LogEntry(BookLog_Markwart9,"ß8. Kto otwiera cudze ogrodzenia i na jakiekolwiek uprawy skieruje trzodÍ, co zostanie przez úwiadkÛw udowodnione, zostanie on skazany na rzecz poszkodowanego na wyrÛwnanie szacowanych strat a ponadto na 200 sztuk z≥ota.†");

B_LogEntry(BookLog_Markwart9,"KONIEC TOMU IX");

};




/////////////////////////////////////////////////////////////////////

// DZIEJE VARANTU. TOM I

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG”W WODY

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_HistoryOfVarant1 (C_ITEM)

{

name ="Dzieje Varantu. Tom I";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_03.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autorzy: Amiridion z Jelkali, Krug syn Amirindiona i Kap≥an Darandir z Trellium";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_HistoryOfVarant1;

};

FUNC VOID Use_Book_HistoryOfVarant1()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "BOOK_ER_L.tga", 0);

Doc_SetPage ( nDocID,  1, "BOOK_ER_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Dzieje Varantu. Tom I");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Dwunastotomowe dzie≥o opisujπce narodziny, rozwÛj i upadek staroøytnego Imperium Pradawnych z Varantu.]");

Doc_SetMargins( nDocID,  -1,  15, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_HistoryOfVarant1,LOG_NOTE);

B_LogEntry(BookLog_HistoryOfVarant1,"Dzieje Varantu. Tom I");

B_LogEntry(BookLog_HistoryOfVarant1,"O, Imperium Prastare!†PiÍkno Twe przez piaski pustyni rzewnie zasypane; Twe dzieje z g≥Íbi wiekÛw na nowo dziú przywo≥ane! Niechaj Ty, ktÛre rÍkπ gniewnego Adanosa na zag≥adÍ skazane; W pieúni chwalebnej, piÛrem kronikarza øywym przez chwilÍ siÍ stanie! O wielkie monarchy, Innosa dawne s≥ugi!Od Wiecznego WÍdrowca wyúcie Pana Ognia wybraÒce; Dziú za sprawπ dziejopisa; Na ziemski padÛ≥ powracajcie!  A Ty spÛjrz cz≥owiecze, spÛjrzcie po wiekach nastÍpujπcy po nich potomni; S≥ysz modlitwÍ piachu i modlitwÍ wiekÛw, niech pamiÍÊ o Imperium nigdy nie ustπpi. ");

B_LogEntry(BookLog_HistoryOfVarant1,"W czasach zamierzch≥ych, gdy úwiat by≥ jeszcze m≥odym, wszelki duch ziemie zamieszkujπcy przed Innosem i Adanosem bi≥ pok≥ony i mod≥y poboøne ku nim zanosi≥. NastÍpowa≥y wiÍc po sobie kolejne pokolenia, mija≥y lata i wieki, oddalajπc ludzkoúÊ od pierwotnej czystoúci i prawdy. Piach zapomnienia zakrywa≥ z wolna pamiÍÊ o latach b≥ogos≥awionych, gdy ludzie øyli w prawdzie i w szczÍúciu. Z pokolenia na pokolenie rodzaj cz≥owieczy z drogi prawoúci coraz bardziej zstÍpowa≥ i w bezeceÒstwie siÍ pogrπøa≥.");

B_LogEntry(BookLog_HistoryOfVarant1,"W swym zapomnieniu ludzie zwrÛcili swe serca ku ba≥wanom, ktÛre sobie uczynili i ku demonom nieczystym, ktÛre zwiod≥y wielu.†I nasta≥y czasy, gdy w b≥Ídzie pogaÒstwa pogrπøy≥y siÍ niemal wszystkie ludy. Jedynie nieliczni pozostali wierni prawdziwym bogom, doznajπc przez to z rπk ba≥wochwalcÛw krzyw wiele i ucisku. Powo≥a≥ wiÍc Innos jednego spoúrÛd prawych, by wyruszy≥ ku krajom b≥πdzπcym. Nakaza≥ mu opuúciÊ dom swÛj rodzinny i udaÊ siÍ z innosyckim pos≥annictwem do szczepÛw pogrπøonych w odstÍpstwie.");

B_LogEntry(BookLog_HistoryOfVarant1,"Zostawiwszy dom ojca swego, cz≥owiek sta≥ siÍ Wiecznym WÍdrowcem i nauczycielem ludÛw. Przemierza≥ odtπd ca≥y øyzny Varant z uczniami swemi, rozjaúniajπc mroki pogaÒskiego zabobonu. NiÛs≥ on oczyszczenie s≥owem i ogniem, s≥awiπc imiÍ Pana Ognia.");

B_LogEntry(BookLog_HistoryOfVarant1,"I przemierza≥ Wieczny WÍdrowiec Varant przez lat siedemnaúcie i szeúÊdziesiπt osiem dni, a wielu za jego sprawπ odmieni≥o swπ wiarÍ i porzuci≥o b≥Ídy pogaÒstwa. Ros≥a wiÍc liczba tych, ktÛrych Wieczny WÍdrowiec prowadzi≥.");

B_LogEntry(BookLog_HistoryOfVarant1,"Wejrza≥ wtedy Innos na coraz liczniejsze szeregi podπøajπcych za nauczycielem ludÛw i uzna≥, øe Wieczny WÍdrowiec gotÛw jest juø wype≥niÊ swoje przeznaczenie.");

B_LogEntry(BookLog_HistoryOfVarant1,"Pan Ognia przeto powtÛrnie przemÛwi≥ do Wiecznego WÍdrowca: 'Od≥Ûø swÛj Kostur', a w jego miejsce Innos da≥ mu Ber≥o i Wieczny WÍdrowiec zosta≥ Jego s≥ugπ. Tak oto Wieczny WÍdrowiec przesta≥ byÊ tu≥aczym pielgrzymem, a sta≥ siÍ wybraÒcem i namiestnikiem Innosa na ziemi.");

B_LogEntry(BookLog_HistoryOfVarant1,"On to mia≥ przywrÛciÊ ziemiÍ varanckπ prawdziwym bogom i zaprowadziÊ krÛlestwo Innosa na ziemiÖ");

B_LogEntry(BookLog_HistoryOfVarant1,"KONIEC TOMU I");

};


/////////////////////////////////////////////////////////////////////

// DZIEJE VARANTU. TOM II

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG”W WODY

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_HistoryOfVarant2 (C_ITEM)

{

name ="Dzieje Varantu. Tom II";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_03.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autorzy: Amiridion z Jelkali, Krug syn Amirindiona i Kap≥an Darandir z Trellium";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_HistoryOfVarant2;

};

FUNC VOID Use_Book_HistoryOfVarant2()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "BOOK_ER_L.tga", 0);

Doc_SetPage ( nDocID,  1, "BOOK_ER_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Dzieje Varantu. Tom II");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Dwunastotomowe dzie≥o opisujπce narodziny, rozwÛj i upadek staroøytnego Imperium Pradawnych z Varantu]");

Doc_SetMargins( nDocID,  -1,  15, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_HistoryOfVarant2,LOG_NOTE);

B_LogEntry(BookLog_HistoryOfVarant2,"Dzieje Varantu. Tom II");

B_LogEntry(BookLog_HistoryOfVarant2,"Ujrza≥ tedy Beliar, øe Innos pragnie zaprowadziÊ swoje krÛlestwo w Varancie i uczyniÊ ziemie varanckπ pos≥usznπ swemu s≥owu. I p≥onπ≥ gniew Beliara, a cieÒ jego pad≥ w serca czcicieli Pana Ciemnoúci. ");

B_LogEntry(BookLog_HistoryOfVarant2,"I przebudzili siÍ szamani orkowych szczepÛw, a szczepy ich jednoczy≥y siÍ pod czarnymi sztandarami Mrocznego Boga. Na wezwanie Beliara odpowiedzia≥y plemiona prastarej rasy jaszczuroludzi, przezywanej teø od ojca ich ojcÛw Hiradhorianami, lub Hiradami. ");

B_LogEntry(BookLog_HistoryOfVarant2,"PoúrÛd si≥ cienia znaleüli siÍ teø odszczepieÒcy, ktÛrzy czeúÊ oddawali demonom i rozmaitym ba≥wanom. Ci za podszeptem czczonych bestii, ktÛre nÍdznymi s≥ugami by≥y Beliara, przystali do wrogÛw Innosa. Pod sztandar cienia wspÛlny przybyli rÛwnieø sojusznicy, ktÛrzy nie z czci dla Beliara na düwiÍk czarnego rogu odpowiedzieli, ino ze strachu przed zwyciÍstwem Pana Ognia. Ci oto w rosnπcej potÍdze wyznawcÛw Innosa widzieli zagroøenie dla swych fa≥szywych bogÛw.");

B_LogEntry(BookLog_HistoryOfVarant2,"I trwa≥y wojny krwawe lat wiele, i w rwπcej szkar≥atnej rzece ≥πczy≥a siÍ krew wrogÛw úmiertelnych. W jednym ponurym biegu spajajπc tych, ktÛrych nienawiúÊ wyznawanych bogÛw dzieli≥a. ");

B_LogEntry(BookLog_HistoryOfVarant2,"Przeminπ≥ øywot Wiecznego WÍdrowca i trafi≥ on do niebios, gdy w czasie jednej z bitew przez wrogÛw bÍdπc osaczonym, rÍkπ Innosa zosta≥ øywcem zabrany do wiecznoúci. Tak oto Pan Ognia nagrodzi≥ Swego s≥ugÍ. Po nim panowa≥ Akheld ñ syn jego, zaú brat Akhelda - †Semmir zakoÒczy≥ wojnÍ za sprawπ úwiÍtych relikwii danych mu przez Adanosa. DziÍki nim rozgromiono ostatecznie armiÍ wszetecznego wroga i skalano jego obrzydliwe gniazdo w Eresh-Ugall na po≥udniu, a niedobitki paskudztwa wygnano z Varantu.");

B_LogEntry(BookLog_HistoryOfVarant2,"Po nim nasta≥y kolejne pokolenia krÛlÛw, panujπcych w s≥odkim Varancie z wyøyn tronu miasta Al.-Shedim. NastÍpujπcy kolejno w≥adcy budowali KrÛlestwo Innosa, wznoszπc wspania≥e úwiπtynie ku czci ukochanego przez nich Pana Ognia.");

B_LogEntry(BookLog_HistoryOfVarant2,"Niech s≥awiπ siÍ imiona dwÛch synÛw Semmirowych Akhelda II i Tellosa I,†ZwyciÍskich w≥adcÛw, co wielki najazd barbarzyÒskiego PraveÒczyka odpierali!†Niech po wsze czasy przetrwa imiÍ walecznego i dzielnego krÛla, Teminnara;†Co Trellium pogaÒstwu bezecnemu wydar≥ i do o≥tarza Innnosa do≥πczy≥.†Chwa≥a Seminnarowi III co Velucii przyniÛs≥ imiÍ Innosowe!†Chwa≥a Tellosowi III co kraj PraveÒczykÛw uczyni≥ sobie pos≥usznym!†Chwa≥a budowniczym úwiπtyÒ i w≥adcom wiekÛw dawnych!†");

B_LogEntry(BookLog_HistoryOfVarant2,"KONIEC TOMU II");


};


/////////////////////////////////////////////////////////////////////

// DZIEJE VARANTU. TOM III

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG”W WODY

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_HistoryOfVarant3 (C_ITEM)

{

name ="Dzieje Varantu. Tom III";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_03.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autorzy: Amiridion z Jelkali, Krug syn Amirindiona i Kap≥an Darandir z Trellium";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_HistoryOfVarant3;

};

FUNC VOID Use_Book_HistoryOfVarant3()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "BOOK_ER_L.tga", 0);

Doc_SetPage ( nDocID,  1, "BOOK_ER_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Dzieje Varantu. Tom III");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Dwunastotomowe dzie≥o opisujπce narodziny, rozwÛj i upadek staroøytnego Imperium Pradawnych z Varantu.]");

Doc_SetMargins( nDocID,  -1,  15, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_HistoryOfVarant3,LOG_NOTE);

B_LogEntry(BookLog_HistoryOfVarant3,"Dzieje Varantu. Tom III");

B_LogEntry(BookLog_HistoryOfVarant3,"Nadszed≥ zmierzch øycia Tellosa III, ktÛry to doøywszy wieku sÍdziwego, nie doczeka≥ siÍ upragnionego dziedzica. Dopiero, gdy duch dobrego w≥adcy opuúci≥ leciwe cia≥o, na úwiat przyszed≥ syn jego i jedyny nastÍpca varanckiego tronu. Pogrobowiec otrzyma≥ imiÍ ojca, pragnπc by wszelkie ≥aski jakie sp≥ynÍ≥y na wielkiego rodzica, sta≥y siÍ udzia≥em dziedzica korony. MπdroúÊ, zwyciÍstwo i d≥ugowiecznoúÊ ñ oto b≥ogos≥awieÒstwa panowania Tellosa III.");

B_LogEntry(BookLog_HistoryOfVarant3,"Los jednak chcia≥ by tylko spoúrÛd tych trzech b≥ogos≥awieÒstw zyska≥ czwarty w≥adca tego imienia. Z nadziejπ poddani wyczekiwali dnia, w ktÛrym m≥ody krÛl przejmie samodzielne rzπdy, gdyø mπdroúÊ i wiedza ch≥opca zapowiada≥a b≥ogos≥awione panowanie. Mieliúmy wielkich w≥adcÛw ñ powiada≥ podÛwczas lud Varantu ñ ktÛrzy uczynili nasz kraj wielkim i potÍønym. Ten jednak pomnoøy tπ potÍgÍ jak nikt przed nim i Imperium Innosa siÍgnie podnÛøy skutych lodem gÛr Nordmaru!");

B_LogEntry(BookLog_HistoryOfVarant3,"W dziewiπtym roku regencji st≥umiono powstanie PraveÒczykÛw, ktÛrzy prÛbowali oderwaÊ siÍ na powrÛt od Innosyckiego Imperium. Pobito i zmuszono do odejúcia takøe pogaÒskich JelkalÛw z pÛ≥nocnych lasÛw, ktÛrzy wyszyli ze swych siedzib, by wesprzeÊ bunt ludÛw wybrzeøa. Tak oto udzia≥em tego panowania sta≥o siÍ zwyciÍstwo, ktÛre wszyscy poczytywali za zapowiedü przysz≥ych pomyúlnoúci.†Nie dane jednak by≥o Tellosowi IV spe≥niÊ pok≥adanych w nim nadziei, gdyø w czternastym roku swego øywota zapad≥ ciÍøko na zdrowiu. PonoÊ zawaøy≥ tu ciÍøki grzech jego rodzicielki ñ Nasiry, ktÛra wzgardziwszy pamiÍciπ swego zmar≥ego mÍøa, odda≥a swe serce jednemu z moønych panÛw Imperium. Bogowie ukarali niewiernπ øonÍ úmierciπ jej jedynego syna. ");

B_LogEntry(BookLog_HistoryOfVarant3,"Tak oto przez wzglπd na wielkie czyny potomkÛw Tellosa IV, nie dane mu by≥o oglπdaÊ juø wiÍcej sromoty jakiej dopuúci≥a siÍ jego rodzicielka. Zmoøony chorobπ i trawiony okropnπ gorπczkπ m≥odziutki w≥adca, odszed≥ do wiecznoúci, nie objπwszy samodzielnych rzπdÛw. ");

B_LogEntry(BookLog_HistoryOfVarant3,"Na Tellosie IV wygas≥a pradawna dynastia AkhelidÛw, wywodzπca siÍ od Wiecznego WÍdrowca. Dawni krÛlowie zasnÍli b≥ogos≥awionym snem nieprzespanym, ≥πczπc siÍ na wieki z Innosem ñ bogiem, ktÛremu wszyscy oni s≥uøyli.†Rozpacz niewys≥owiona wla≥a siÍ w serca dumnego ludu Varantu. Oto odeszli panowie przyrodzeni, w≥adcy nasi i opiekunowie! ñ mÛwili Varantczycy - KtÛø nad nich by≥ wyøszy i ktÛø im rÛwnym byÊ moøe?");

B_LogEntry(BookLog_HistoryOfVarant3,"KONIEC TOMU III");

};

/////////////////////////////////////////////////////////////////////

// DZIEJE VARANTU. TOM IV

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG”W WODY

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_HistoryOfVarant4 (C_ITEM)

{

name ="Dzieje Varantu. Tom IV";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_03.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autorzy: Amiridion z Jelkali, Krug syn Amirindiona i Kap≥an Darandir z Trellium";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_HistoryOfVarant4;

};

FUNC VOID Use_Book_HistoryOfVarant4()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "BOOK_ER_L.tga", 0);

Doc_SetPage ( nDocID,  1, "BOOK_ER_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Dzieje Varantu. Tom IV");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Dwunastotomowe dzie≥o opisujπce narodziny, rozwÛj i upadek staroøytnego Imperium Pradawnych z Varantu.]");

Doc_SetMargins( nDocID,  -1,  15, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_HistoryOfVarant4,LOG_NOTE);

B_LogEntry(BookLog_HistoryOfVarant4,"Dzieje Varantu. Tom IV");

B_LogEntry(BookLog_HistoryOfVarant4,"Smutek i øa≥oba po úmierci m≥odziutkiego pogrobowca, niebawem ustπpi≥y szczÍkowi orÍøa i wojennej poøodze. Oto wy≥onili siÍ kolejni pretendenci, ksiπøÍta, panowie, ktÛrzy topiπc kraj we krwi walk pobratymczych, wyrπbywali swπ drogÍ do ber≥a Varantu. Wygranπ mia≥a byÊ tutaj upragniona korona dla jednego z panÛw varanckich, a cenÍ za ambicjÍ moønych p≥aci≥o Imperium i sami Varantczycy. Ileø to z≥a wywo≥a≥ jeden postÍpek niewiernej krÛlowej Nasiry!");

B_LogEntry(BookLog_HistoryOfVarant4,"Niebawem w wielkiej haÒbie od Imperium odpad≥o Praven, ktÛre niegdyú Tellos III zdoby≥ i przyprowadzi≥ pod o≥tarz Innosowy. BarbarzyÒcy dokonali rzezi magÛw ognia i rozbili úwiÍte posπgi, bezczeszczπc úwiπtynie i oddajπc owe úwiÍte przybytki pogaÒskim ba≥wanom. Najazd JelkalÛw, SundmarczykÛw i GuldernÛw nawiedzi≥ ziemie Veluki, straszliwie je pustoszπc. DziÍki ≥asce Innosa osta≥o siÍ jednak miasto, w ktÛrym przed ostrzem barbarzyÒcy schroni≥o siÍ wielu. Warowni veluckiej, ktÛra w przysz≥oúci otrzyma imiÍ Monteriusa, a zdobytej niegdyú przez Semmira III, broni≥ patriarcha innosycki Mergellon, co bratem by≥ niewiernej krÛlowej.†");

B_LogEntry(BookLog_HistoryOfVarant4,"Nasta≥y straszliwe lata wojen i poøogi. Oto Innosyta morduje InnosytÍ, czyniπc to z rÛwnπ zaciek≥oúciπ i okrucieÒstwem, jakoby czyni≥ to barbarzyÒca. Ujrza≥y s≥aboúÊ Varantu pogaÒskie plemiona i jak hieny ruszy≥y na ranionego lwa, by na jego ciele urzπdziÊ sobie ucztÍ. I nie by≥o krainy w Imperium, gdzie by nie s≥yszano rogu poprzedzajπcego pochÛd wszelakiego barbarzyÒcy. Owe plemiona przybywa≥y nie tylko wiedzione øπdzπ z≥ota, ale teø wzywali ich liczni pretendenci.");

B_LogEntry(BookLog_HistoryOfVarant4,"Moøni pragnπc wykorzystaÊ barbarzyÒcÛw w walce o ber≥o Varantu, op≥acali ich nie z≥otem ze swych skarbcÛw, lecz krwiπ i cierpieniem poddanych Imperium. Chcecie z≥ota i zap≥aty, to weücie jπ z varanckich wiosek i miast!†Niechaj przeklÍci bÍdπ ksiπøÍta, co øyciem InnosytÛw kupczyli. Niechaj przeklÍci bÍdπ moøni panowie, co lud swÛj na pastwÍ barbarzyÒcy wydaliÖ");

B_LogEntry(BookLog_HistoryOfVarant4,"Magowie ognia widzπc ogieÒ, jaki zap≥onπ≥ w Varrancie postanowili ukryÊ relikwie Adanosa w swych úwiπtyniach, by ni poganie, ni pretendenci do tronu ich swπ rÍkπ nie sprofanowali i do boju bratobÛjczego nie wykorzystali. Wszeteczni pretendenci gotowi byli jednak wyciπgnπÊ swe nieczyste rÍce po relikwie Adanosa, ktÛre niegdyú Pan Wody powierzy≥ Akheldowi I. Ci przyprowadzali swe wojska przed bramy miast úwiπtynnych, zbrojnie prÛbujπc zmusiÊ mÍøÛw Innosa do wydania úwiÍtych artefaktÛw, lecz bram úwiπtynnych nie przemogli.");

B_LogEntry(BookLog_HistoryOfVarant4,"Tak mija≥y lata pe≥ne niepokoju i wojen, wyniszczajπcych Imperium Varantu. PaÒstwa bÍdπcego dzie≥em Innosa i jego wybraÒcÛwÖ");

B_LogEntry(BookLog_HistoryOfVarant4,"KONIEC TOMU IV");

};

/////////////////////////////////////////////////////////////////////

// DZIEJE VARANTU. TOM V

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG”W WODY

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_HistoryOfVarant5 (C_ITEM)

{

name ="Dzieje Varantu. Tom V";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_03.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autorzy: Amiridion z Jelkali, Krug syn Amirindiona i Kap≥an Darandir z Trellium";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_HistoryOfVarant5;

};

FUNC VOID Use_Book_HistoryOfVarant5()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "BOOK_ER_L.tga", 0);

Doc_SetPage ( nDocID,  1, "BOOK_ER_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Dzieje Varantu. Tom V");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Dwunastotomowe dzie≥o opisujπce narodziny, rozwÛj i upadek staroøytnego Imperium Pradawnych z Varantu.]");

Doc_SetMargins( nDocID,  -1,  15, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_HistoryOfVarant5,LOG_NOTE);

B_LogEntry(BookLog_HistoryOfVarant5,"Dzieje Varantu. Tom V");

B_LogEntry(BookLog_HistoryOfVarant5,"Wojny trwa≥y d≥ugo. Spustoszono kraje Varantu, zasiano ziarno podzia≥u zatruwajπcego krew pobratymczπ. W tych latach úmierÊ zebra≥a nadzwyczaj sowite øniwo na ziemiach Imperium i na d≥ugo zamilk≥y hymny pochwalne na czeúÊ Innosa, ustÍpujπc b≥agalnym i pokutnym pieúniom. Nie godzi siÍ kalaÊ kart tej ksiÍgi imionami tej rzeszy moønych, ktÛrzy tyle nieszczÍúÊ na kraj swÛj sprowadzili. Niechaj teø imiÍ owego wszetecznika, z ktÛrym krÛlowa dopuúci≥a siÍ sromu, bÍdzie po wszystkie czasy zapomniane, co by w øadnej modlitwie ono nie pad≥o.");

B_LogEntry(BookLog_HistoryOfVarant5,"MinÍ≥o 12 lat ciÍøkiej wojny, gdy na stolicy zasiad≥ imperator. Duøo by opowiadaÊ o tym, co dzia≥o siÍ w czasach wojen. DoúÊ rzec, øe na tronie zasiad≥ cz≥owiek roztropny i mπdry. On to odrzuci≥ swe stare imiÍ i koronowa≥ siÍ jako Akheld III. Uczyni≥ on to na znak tego, øe jak pierwsi Akhelidzi budowali o≥tarz Pana Ognia, tak on go odnawia i do potÍgi zamierza przywrÛciÊ. Godny to czyn i pe≥ny pokory, gdyø w≥adca Ûw postanowi≥ budowaÊ chwa≥Í Imperium, nie zaú s≥awÍ swego imienia, czy rodu. Odrzuciwszy przeto imiÍ grzeszne i krwiπ pobratymczπ skalane, da≥ poczπtek dynastii Odnowicieli. Akheld III panowa≥ 27 lat, przywracajπc ≥ad tam, gdzie smuta porzπdek zburzy≥a.");

B_LogEntry(BookLog_HistoryOfVarant5,"Po nim panowa≥ jego syn co Kalhirem ObroÒcπ zosta≥ przezwany, albowiem powstrzyma≥ najazd barbarzyÒcÛw z Praven, p≥acπc za zwyciÍstwo w≥asnym øywotem. Podania g≥oszπ, øe w przededniu bitwy mia≥ widzenie. Ujrza≥ on Wiecznego Wedrowca, dzierøπcego w jednej rÍce tarczÍ, a w drugiej wagÍ. Kalhir us≥ysza≥, øe dopiero jego w≥asna krew uøyüniajπca pola wokÛ≥ Trellium, zapewni dwadzieúcia lat pokoju od napadÛw barbarzyÒcÛw z wybrzeøa. Majπc w pamiÍci s≥owa za≥oøyciela Imperium Varanckiego, Kalhir nazajutrz poprowadzi≥ swych øo≥nierzy do boju.");

B_LogEntry(BookLog_HistoryOfVarant5,"W czasie walk, szala zwyciÍstwa przechyli≥a siÍ na stronÍ PraveÒczykÛw, tak, øe doradcy poczÍli namawiaÊ w≥adcÍ, do tego by opuúci≥ pole bitwy. Ten siÍ jednak stanowczo siÍ sprzeciwi≥ tym radom. Wiedzπc, øe wygrana bitwa zapewni pokÛj Imperium, zebra≥ swych rozproszonych øo≥nierzy i ruszy≥ do ataku, w czasie ktÛrego poleg≥. Bitwa pozostawa≥a nierozstrzygniÍta, gdyø obie strony poniÛs≥szy dotkliwe straty, poniecha≥y dalszej walki.");

B_LogEntry(BookLog_HistoryOfVarant5,"Proroctwo jednak siÍ wype≥ni≥o i przez dwadzieúcia trzy lata ziemie Varantu nie widzia≥y najazdu PraveÒczykÛw.");

B_LogEntry(BookLog_HistoryOfVarant5,"KONIEC TOMU V");

};
/////////////////////////////////////////////////////////////////////

// DZIEJE VARANTU. TOM VI

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG”W WODY

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_HistoryOfVarant6 (C_ITEM)

{

name ="Dzieje Varantu. Tom VI";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_03.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autorzy: Amiridion z Jelkali, Krug syn Amirindiona i Kap≥an Darandir z Trellium";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_HistoryOfVarant6;

};

FUNC VOID Use_Book_HistoryOfVarant6()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "BOOK_ER_L.tga", 0);

Doc_SetPage ( nDocID,  1, "BOOK_ER_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Dzieje Varantu. Tom VI");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Dwunastotomowe dzie≥o opisujπce narodziny, rozwÛj i upadek staroøytnego Imperium Pradawnych z Varantu.]");

Doc_SetMargins( nDocID,  -1,  15, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_HistoryOfVarant6,LOG_NOTE);

B_LogEntry(BookLog_HistoryOfVarant6,"Dzieje Varantu. Tom VI");

B_LogEntry(BookLog_HistoryOfVarant6,"Trzecim spoúrÛd w≥adcÛw z dynastii Odnowicieli by≥ Kalhir II, syn Kalhira I ObroÒcy. Ten powiÛd≥ raz jeszcze synÛw Varantu w kraj PraveÒczykÛw i wydar≥ im zachodniπ czÍúÊ wybrzeøa, gdzie wybudowa≥ warowny grÛd w Trellium. Pragnπ≥ teø ruszyÊ dalej, ku Jelkali i Nordmarowi, jednak moøni wyraünie siÍ temu sprzeciwiali, gdyø pragnÍli pokoju i obawiali siÍ wzrostu znaczenia imperatora.");

B_LogEntry(BookLog_HistoryOfVarant6,"Nowa dynastia nie mia≥a jednak rÛwnie silnej pozycji, co Akhelidzi. Moøni panowie pragnÍli widzieÊ w Odnowicielach jedynie wyniesionych na wyøyny moønow≥adcÛw. Czynili przeto owym krÛlom wiele wstrÍtÛw i ciπgle knuli przeciwko nim. ");

B_LogEntry(BookLog_HistoryOfVarant6,"M≥ody Kalhir, pragnπc przywrÛciÊ imperatorom poprzednia potÍgÍ, zwrÛci≥ siÍ wtedy do kap≥anÛw ognia by ci wydali mu úwiÍte relikwie Adanosa. Pragnπ≥ dziÍki mocy owych artefaktÛw, zmusiÊ moønow≥adcÛw do pos≥uchu. åwiπtobliwi magowie odmÛwili jednak ambitnemu w≥adcy, gdyø nie takie by≥o przeznaczenie daru Adanosa. Od wiekÛw artefakty by≥y otaczane úwiπtobliwπ czciπ i takie pos≥uøenie siÍ nimi mia≥oby wymiar úwiÍtokradztwa.");

B_LogEntry(BookLog_HistoryOfVarant6,"Kalhir uzna≥ przeto, øe magowie ognia rÛwnieø dπøπ do os≥abienia pozycji krÛla. Posπdza≥ teø ich o chÍÊ przejÍcia realnej w≥adzy w paÒstwie i o wspÛ≥pracÍ z moønow≥adcami. Imperator powoli zaczπ≥ sk≥aniaÊ siÍ ku kultowi Adanosa, w magach wody szukajπc przeciwwagi dla potÍgi kap≥anÛw Innosa. Pojawi≥y siÍ nawet g≥osy, øe krÛl zamierza odebraÊ najwaøniejsze úwiπtynie magom ognia i przekazaÊ je Adanosytom. Starajπc siÍ pomniejszyÊ potÍgÍ InnosytÛw, zaczπ≥ domagaÊ siÍ udzia≥u w wyborze innosyckich arcymagÛw.");

B_LogEntry(BookLog_HistoryOfVarant6,"Magowie ognia t≥umaczyli krÛlowi, øe jest to wbrew prawom i obyczajom, lecz w≥adca nie s≥ucha≥ mπdroúci kap≥anÛw, lecz wola≥ polegaÊ na radach nierozumnych ludzi.†SpÛr majπcy doprowadziÊ do upadku w≥adcy rozgorza≥ dopiero po úmierci arcymaga Salima, kiedy to krÛl samowolnie namaúci≥ Ragheba na nastÍpcÍ pierwszego spoúrÛd kap≥anÛw Innosa. Tak oto Kalhir II przeciw prawom úwiÍtym wystπpi≥, pragnπc w miejsce regu≥ tradycjπ uúwiÍconych, tyraÒskπ swπ wolÍ zaprowadziÊ.");

B_LogEntry(BookLog_HistoryOfVarant6,"Nie zwaøajπc na napomnienia i przestrogi, ktÛrych dobrzy doradcy i úwiÍci mÍøowie mu nie szczÍdzili, øπdzπ krÛl zaúlepiony, trwa≥ w swym szaleÒstwie. Dusza jego pomys≥ wnet przebieg≥y zrodzi≥a. Postanowi≥ Kalhir magÛw do swego pa≥acu zaprosiÊ, co by z nimi pertraktowaÊ i zgodÍ osiπgnπÊ. Kaza≥ wiÍc w≥adca rozes≥aÊ pisma do úwiÍtych mÍøÛw, proszπc ich o przybycie.†Magowie ognia prÍdko spisek w tym dostrzegli. Zebrawszy siÍ na naradzie, rÛønie pragnÍli czyniÊ. Najzacieklejsi w krÛlu heretyka juø dostrzegli i przeciw niemu radzili siÍ juø sposobiÊ.");

B_LogEntry(BookLog_HistoryOfVarant6,"Drudzy przed pochopnoúciπ ostrzegali i miÍdzy odmowπ przybycia, a innym miejscem spotkania siÍ stawiali. G≥os zabra≥ przeto mag Udin, co dotπd w milczeniu s≥owom swych braci siÍ przys≥uchiwa≥:†ëKtÛø z nas weümie na siebie krew? W≥adca nasz kroczy úcieøkπ, by dotrzeÊ niebawem tam, skπd nie bÍdzie juø powrotu. Oto Kalhir jeszcze raz za siÍ spoglπda, w czym odmiana jego drogi byÊ moøe. Czyø zdradziecki zamiar siÍ za tym kryje? Serce jego przed oczyma naszemi zakryte, lecz ktÛø zdrajcπ bÍdzie, jeøeli ostatniej prÛby ratowania pokoju, Wiary i krÛlestwa siÍ nie podejmiemy! OdmÛwimy goúciny w jego pa≥acu? Tedyø on ku nam w goúcinÍ przybÍdzie, wojska swe na úwiπtynne miasto prowadzπc! PrzybÍdziemy na wezwanie do jego pa≥acu? Tedyø on bÍdzie mia≥ úwiÍty zakon magÛw ognia w swej tyraÒskiej mocy! Trzech przeto braci poúrÛd nas wybierzmy i niechaj oni w imieniu úwiπtyni przed Kalhirem przemawiajπ!í.");

B_LogEntry(BookLog_HistoryOfVarant6,"Magowie przychylili siÍ do s≥Ûw Udina, wysy≥ajπc jego oraz dwÛch wybranych poúrÛd zgromadzenia. Trzej stawili siÍ przeto przed obliczem krÛla. W zapamiÍtaniu swym Kalhir zaøπda≥, by po wszystkie czasy, to krÛlowie arcymagÛw mianowali, jako urzÍdnikÛw krÛlewskich i dworakÛw siÍ mianuje.");

B_LogEntry(BookLog_HistoryOfVarant6,"W≥adca oszala≥y, wzgardziwszy zgodπ, g≥uchym by≥ na g≥os úwiÍtych mÍøÛw Innosa. W pa≥acu swym uwiÍziwszy Udina i jego towarzyszy, obleg≥ on úwiπtyniÍ, ktÛrπ wczeúniej zarzπdza≥ Salim, øπdajπc by magowie ognia uznali uzurpatora nowym arcymagiem. Wiedziano jednak, øe Kalhir nie pragnie wcale pokoju i spÛr ten jest czÍúciπ planu zdobycia relikwii Adanosa.†Kap≥ani wezwali przeto lud do obrony úwiÍtego przybytku. WyklÍto jednoczeúnie doradcÛw krÛla, ktÛrych obwiniano o namawianie w≥adcy do tych szaleÒczych czynÛw.");

B_LogEntry(BookLog_HistoryOfVarant6,"Varant odpowiedzia≥ na wezwanie kap≥anÛw. D≥ugo jeszcze ludzie przychodzili do krÛla b≥agajπc go by zaniecha≥ dzia≥aÒ g≥upich i nie sprowadza≥ zguby na paÒstwo. Na nic jednak b≥agania i namowy, wobec pychy zaúlepiajπcej serce Kalhira. Tak oto rozpoczÍ≥a siÍ wojna, ktÛrej koniec wiÛd≥ pod mury stolicy.");

B_LogEntry(BookLog_HistoryOfVarant6,"KONIEC TOMU VI");

};



/////////////////////////////////////////////////////////////////////

// DZIEJE VARANTU. TOM VII

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG”W WODY

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_HistoryOfVarant7 (C_ITEM)

{

name ="Dzieje Varantu. Tom VII";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_03.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autorzy: Amiridion z Jelkali, Krug syn Amirindiona i Kap≥an Darandir z Trellium";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_HistoryOfVarant7;

};

FUNC VOID Use_Book_HistoryOfVarant7()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "BOOK_ER_L.tga", 0);

Doc_SetPage ( nDocID,  1, "BOOK_ER_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Dzieje Varantu. Tom VII");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Dwunastotomowe dzie≥o opisujπce narodziny, rozwÛj i upadek staroøytnego Imperium Pradawnych z Varantu.]");

Doc_SetMargins( nDocID,  -1,  15, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_HistoryOfVarant7,LOG_NOTE);

B_LogEntry(BookLog_HistoryOfVarant7,"Dzieje Varantu. Tom VII");

B_LogEntry(BookLog_HistoryOfVarant7,"Walki trwa≥y d≥ugo. Powstali synowie Varantu przeciw sobie, jedni przy krÛlu swym, inni przy kap≥anach. DoúÊ rzec, øe Kalhirowi wielu dobrych ludzi poczπtkowo s≥uøy≥o, lecz z czasem go odstÍpowali, gdyø na jego czyny godziÊ siÍ nie mogli. Podobnie przy úwiπtyni, obok szczerych wyznawcÛw Innosa, stanÍli ci, ktÛrym silna w≥adza krÛlewska przykrπ zawsze by≥a. Powoli jednak szala zaczyna≥a przechylaÊ siÍ na stronÍ magÛw ognia i ich sojusznikÛw.");

B_LogEntry(BookLog_HistoryOfVarant7,"W poszukiwaniu sprzymierzeÒcÛw Kalhir zwrÛci≥ siÍ do plemion barbarzyÒskich, wysy≥ajπc do nich swych wiernych ludzi z obietnicπ skarbÛw i zachÍcajπc ich do ≥upienia przygranicznych posiad≥oúci moønow≥adcÛw.†Wojna jednak zaprowadzi≥a wojska úwiπtyni aø pod mury stolicy w Al-Shedim, gdzie musia≥ siÍ chroniÊ úwiÍtokradca. OblÍøony w swym zamku przez VarantczykÛw Kalhir, wyczekiwa≥ przybycia wiernych mu ostatnich oddzia≥Ûw varanckich. Wierni mu dowÛdcy mieli przyprowadziÊ ze sobπ rÛwnieø najemnikÛw z pogaÒskich plemion pÛ≥nocy. W≥adca zdawa≥ sobie sprawÍ, øe jego panowanie jest zagroøone. Z kaødπ kolejnπ klÍskπ, topnia≥a w nim zaciek≥oúÊ i wola walki.");

B_LogEntry(BookLog_HistoryOfVarant7,"Wreszcie Kalhir postanowi≥ wezwaÊ przed swe oblicze Udina oraz dwÛch towarzyszπcych mu magÛw. åwiÍty mπø przemÛwi≥ jednak do swego w≥adcy tymi s≥owami:†ëPrzybyliúmy jako pos≥aÒcy pokoju i zgody, a staliúmy siÍ wiÍüniami krÛla Varantu, lecz i imperator dziú jest uwiÍziony. Czterech mÍøÛw to wiÍüniowie, lecz tylko jeden gniewu bogÛw winien siÍ obawiaÊ! By≥ dawniej czas wyboru, lecz wybÛr dokonany czynami krÛla zosta≥ przypieczÍtowany...í");

B_LogEntry(BookLog_HistoryOfVarant7,"Ujrza≥ wtedy Kalhir, øe nie ma juø drogi powrotnej. Wojna zatru≥a krew pobratymczπ, a krÛl sprowadzajπc na swÛj kraj barbarzyÒcÛw sta≥ siÍ w oczach wielu swych poddanych renegatem. Oto úwiπtynia w triumfach swych podesz≥a aø pod mury stolicy, a wojska jej i kap≥ani pragnπ z≥oøyÊ go z≥amaÊ. Za radπ fa≥szywego arcymaga, Ragheba, postanowi≥ Kalhir zdobyÊ siÍ na czyn straszliwy. Ku Praven swe oczy przeto zwraca, nie z mieczem w d≥oni, lecz z nadziejπ pomocy ze strony barbarzyÒcy. ");

B_LogEntry(BookLog_HistoryOfVarant7,"Pos≥a≥ monarcha do swych dawnych wrogÛw propozycjÍ przymierza, wydarte im niegdyú przez niego Trellium obiecujπc w zamian. Tak oto ziemie przywiedzione przez Kalhira II do o≥tarza Innosa, ten sam Kalhir na pastwÍ barbarzyÒcÛw wydawa≥.");

B_LogEntry(BookLog_HistoryOfVarant7,"Praven odpowiedzia≥o na wezwanie imperatora i ruszy≥o w granicÍ KrÛlestwa Innosa. Na rozkaz Kalhira wiÍkszoúÊ garnizonu pod wodzπ Omrana opuúci≥a twierdzÍ trellijskπ, lecz czÍúÊ øo≥nierzy odmÛwi≥a uczynienia tego i zamknÍ≥a siÍ w zamku. Owi wierni synowie varanckiej ziemi skupili siÍ wokÛ≥ najstarszego z nich rangπ, dobrego Sargona Tarczownika. Rozsierdzi≥o to wielce barbarzyÒcÛw, ktÛrzy zakrzyknπwszy ÑZdrada!î, rzucili siÍ na opuszczajπcych twierdzÍ øo≥nierzy Omrana. Sam dowÛdca garnizonu nie uszed≥ rzezi, jakπ zgotowali mu ësojusznicyí.");

B_LogEntry(BookLog_HistoryOfVarant7,"Najeüdücy rozpoczÍli oblÍøenie warowni, ktÛra bohatersko broni≥a siÍ przez cztery ksiÍøyce. Z tego teø powodu wiÍksza czÍúÊ PraveÒczykÛw zosta≥a na pÛ≥nocy, gdzie oblega≥a Trellium i nie ruszy≥a z krÛlewskimi wojskami na odsiecz imperatorowi. CzÍúÊ jednak z barbarzyÒskich sprzymierzeÒcÛw krÛla, wespÛ≥ z najemnikami i oddzia≥ami wiernymi Kalhirowi ruszy≥a ku murom Al-Shedim.†Odsiecz, bÍdπca jedynπ nadziejπ krÛla, nie zdo≥a≥a przerwaÊ oblÍøenia i przebiÊ siÍ do zamku. Stolica zosta≥a niebawem zdobyta, a krÛla wydano triumfujπcym Varantczykom.");

B_LogEntry(BookLog_HistoryOfVarant7,"Pojmany Kalhir czekaÊ mia≥ na wyrok magÛw, zamkniÍty w areszcie w jednej ze úwiπtyÒ. W zdobytym zamku nie odnaleziono jednak fa≥szywego arcymaga ñ Regheba. Po upadku w≥adcy, ktÛry prÛbowa≥ wynieúÊ Regheba na miejsce nie przystojπce temu cz≥owiekowi, uciekinier nie stanowi≥ juø jednak zagroøenia.");

B_LogEntry(BookLog_HistoryOfVarant7,"Uwolniony Udin sta≥ siÍ bohaterem i jako taki, zosta≥ wybrany przez mÍøÛw Innosa arcymagiem. Pozostawa≥ jeszcze problem oblÍøonego Trellium i grasujπcych po Varancie band, ktÛre na wieúÊ o klÍsce Kalhira, odrzuci≥y dowÛdztwo genera≥Ûw i powrÛci≥y do swych siedzib na pÛ≥nocy, po drodze biorπc jeÒcÛw i ≥upy. Genera≥owie i pozostali jeszcze przy nich øo≥nierze od≥πczyli siÍ od tego pochodu, lecz wnet zostali rozbici przez wojska Varantu. Niebawem teø Varantczycy przybyli z odsieczπ obroÒcom Trellium, pobijajπc PraveÒczykÛw w bitwie.†");

B_LogEntry(BookLog_HistoryOfVarant7,"Po powrocie do stolicy, postanowiono zdetronizowaÊ Kalhira II. Jednoczeúnie krÛlem Varantu okrzykniÍto Tizgara, brata ustÍpujπcego w≥adcy. Samego teø Kalhira uznano za przeklÍtego i skazano na wieczne wygnanie. ");

B_LogEntry(BookLog_HistoryOfVarant7,"Kalkhir PrzeklÍty wraz z kilkoma swymi s≥ugami uda≥ siÍ wtedy ku gÛrom na wschodzie, gdzie wúrÛd tamtejszych plemion mia≥ spÍdziÊ resztÍ øycia. Jemu to tamtejsze ludy zawdziÍczajπ przyjÍcie kultu Adanosa, ktÛremu do Kalhir po kres swoich dni pozosta≥ wierny. Cz≥owiek ten nigdy juø nie pojawi≥ siÍ w Varancie, choÊ raz jeden spotka≥ siÍ ze swoim bratem, krÛlem Tizgarem, lecz nawet wtedy øaden z braci nie przekroczy≥ granicznej rzeki.");

B_LogEntry(BookLog_HistoryOfVarant7,"Potomkowie Kalhira II PrzeklÍtego mieli po wielkim potopie zejúÊ z gÛr i zasiedliÊ ca≥y pustynny juø Varant. Tak oto sta≥ siÍ on protoplastπ dzisiejszych mieszkaÒcÛw po≥udniowej czÍúci Kontynentu Myrtany. Jemu teø Varant zawdziÍcza adanosycki charakter tej krainy, gdyø potomkowi Kalhira, podobnie jak on sam byli wyznawcami Pana Wody. O ile wiÍc Pradawni zwali Kalhira PrzeklÍtym, o tyle Koczownicy wolπ go nazywaÊ Kalhirem Praojcem.");

B_LogEntry(BookLog_HistoryOfVarant7,"KONIEC TOMU VII");

};






















































/////////////////////////////////////////////////////////////////////

// DZIEJE VARANTU. TOM VIII

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG”W WODY

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_HistoryOfVarant8 (C_ITEM)

{

name ="Dzieje Varantu. Tom VIII";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_03.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autorzy: Amiridion z Jelkali, Krug syn Amirindiona i Kap≥an Darandir z Trellium";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_HistoryOfVarant8;

};

FUNC VOID Use_Book_HistoryOfVarant8()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "BOOK_ER_L.tga", 0);

Doc_SetPage ( nDocID,  1, "BOOK_ER_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Dzieje Varantu. Tom VIII");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Dwunastotomowe dzie≥o opisujπce narodziny, rozwÛj i upadek staroøytnego Imperium Pradawnych z Varantu.]");

Doc_SetMargins( nDocID,  -1,  15, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_HistoryOfVarant8,LOG_NOTE);

B_LogEntry(BookLog_HistoryOfVarant8,"Dzieje Varantu. Tom VIII");

B_LogEntry(BookLog_HistoryOfVarant8,"NastÍpcπ Kalhira PrzeklÍtego by≥ Tizgar zwany Chromym. By≥ on cz≥owiekiem úwiat≥ym i wykszta≥conym, gdyø przez wzglπd na starszeÒstwo Kalhira i wrodzone kalectwo, nie chowano go na krÛla, ino na maga. åwiÍtym mÍøom teø tron zawdziÍcza≥, gdyø po upadku Kalhira PrzeklÍtego, niektÛrzy moøni pragnÍli haÒbÍ upad≥ego na ca≥y rÛd krÛlewski rozciπgnπÊ i od w≥adzy dynastiÍ tπ odsunπÊ. Tak teø chcieli niektÛrzy magowie, lecz roztropny Udin przejrza≥ zamiary moønow≥adcÛw i do rzeczy podobnych nie dopuúci≥.");

B_LogEntry(BookLog_HistoryOfVarant8,"Tizgar okaza≥ siÍ w≥adcπ dobrym i mπdrym. Wyrzek≥ siÍ drogi swego brata i po wszystkie czasy uczyni≥ kap≥anÛw ognia straønikami relikwii, ktÛre niegdyú zapewni≥y Semmirowi I zwyciÍstwo nad hordami Beliara. Nowy krÛl troszczy≥ siÍ o kult Innosa, wspierajπc misje na ziemie barbarzyÒcÛw. On teø rozpoczπ≥ budowÍ úwiπtyni w Veluce, ku przeb≥aganiu za grzechy brata i krew przelanπ w walkach o tron przez swego dziada.†Nie mÛg≥ on podejmowaÊ wypraw wojennych na pogan, gdyø w≥adzÍ krÛlewskπ zasta≥ on s≥abszπ niø poprzednicy jego. Ileø mu wstrÍtÛw moøni czynili! DziÍki jego jednak staraniom podnoszono kraj z ruiny, zaú na zgliszczach odradza≥o siÍ z wolna to, co wojna odebra≥a. Po okresie wojen na ziemiach na po≥udnie od Zatoki PraveÒskiej zapanowa≥ upragniony pokÛj. Jedynie pÛ≥nocne rubieøe krÛlestwa wciπø by≥y trapione przez zwyczajowe juø najazdy barbarzyÒcÛw.");

B_LogEntry(BookLog_HistoryOfVarant8,"Za sprawπ Tizgara Chromego wydano wiele sprawiedliwych praw, ktÛre na rÛwni z dzie≥em odbudowy kraju, uczyni≥y postaÊ tego krÛla, tak mi≥π sercu trzech kronikarzy, spisujπcych jego historiÍ. Do jego niewπtpliwych zas≥ug naleøy teø utrzymanie jednoúci paÒstwa, zagroøonej przez ambicje moønych. By≥by wiÍcej on zapewne dobrego uczyni≥ i byÊ moøe, panujπc w kraju niezniszczonym wojnπ, zas≥uøy≥ sobie na przydomek ÑWielkiî, lecz nie sposÛb odpowiedzieÊ jednoznacznie na to pytanie.");

B_LogEntry(BookLog_HistoryOfVarant8,"KrÛl ten w zwyczaju mia≥ wieczory spÍdzaÊ s≥uchajπc úpiewu s≥owikÛw w swych pa≥acowych ogrodach. Dnia pewnego, doøywszy juø sÍdziwego wieku, usnπ≥ raczπc siÍ owπ ukochanπ melodiπ. Zasypiajπc, zapad≥ wtenczas w sen wieczny. Takπ oto pociechπ bogowie os≥odzili poczciwemu krÛlowi wiek starczy i przemijanie.");

B_LogEntry(BookLog_HistoryOfVarant8,"Mπø Ûw poboøny nie zostawi≥ po sobie syna, wiÍc w≥adzÍ po nim przejÍli potomkowie wuja Akhelda III zwanego Tufailem, a od zamku przez nich posiadanego nazwani Mussanitami. Niemniej ich w≥adza nie dorÛwnywa≥a w≥adzy AkhelidÛw i Odnowicieli, albowiem wyniesieni spoúrÛd moønych, nie mieli podobnego powaøania ludu jak poprzednia dynastia. Pierwszym krÛlem z dynastii MussanitÛw by≥ Nelzar I, ktÛry po úmierci Tizgara wstπpi≥ na tron.");

B_LogEntry(BookLog_HistoryOfVarant8,"KONIEC TOMU VIII");


};




























































/////////////////////////////////////////////////////////////////////

// DZIEJE VARANTU. TOM IX

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG”W WODY

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_HistoryOfVarant9 (C_ITEM)

{

name ="Dzieje Varantu. Tom IX";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_03.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autorzy: Amiridion z Jelkali, Krug syn Amirindiona i Kap≥an Darandir z Trellium";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_HistoryOfVarant9;

};

FUNC VOID Use_Book_HistoryOfVarant9()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "BOOK_ER_L.tga", 0);

Doc_SetPage ( nDocID,  1, "BOOK_ER_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Dzieje Varantu. Tom IX");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Dwunastotomowe dzie≥o opisujπce narodziny, rozwÛj i upadek staroøytnego Imperium Pradawnych z Varantu.]");

Doc_SetMargins( nDocID,  -1,  15, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_HistoryOfVarant9,LOG_NOTE);

B_LogEntry(BookLog_HistoryOfVarant9,"Dzieje Varantu. Tom IX");

B_LogEntry(BookLog_HistoryOfVarant9,"Nie godzi≥ siÍ jednak Nelezar, aby emirowie mu dyktat czynili, toteø pragnπ≥ wzmocniÊ swe panowanie. Na podobieÒstwo poprzedniego w≥adcy zdecydowa≥ otaczaÊ siÍ poboønymi kap≥anami Innosa, w ktÛrych Tizgar odnajdywa≥ za swych rzπdÛw wsparcie. Nelzar dokoÒczy≥ rozpoczÍtπ przez poprzednika budowÍ wspania≥ej úwiπtyni Innosa w Veluce. ZwieÒczone dzie≥o sk≥oni≥o m≥odego w≥adcÍ do snucia wizji nawrÛcenia pogaÒskich szczepÛw, zamieszkujπcych ziemie na pÛ≥noc od Zatoki PraveÒskiej.");

B_LogEntry(BookLog_HistoryOfVarant9,"Imperium oddane przez Tizgara nastÍpcom, nie by≥o juø tym pogorzeliskiem wycieÒczonym wojnπ domowπ. Myúl o wyprawie wojennej i ostatecznym zaøegnaniu zagroøenie ze strony PraveÒczykÛw, cieszy≥a siÍ aprobatπ m≥odego i ambitnego arcymaga Kalido, widzπcego w tym okazjÍ do umocnienia pozycji kap≥anÛw Innosa. W ciπgu swego panowania Nelzar poprowadzi≥ ≥πcznie piÍÊ wypraw na Praven, ostatecznie luüno uzaleøniajπc kraj ten od Imperium. Nie uda≥o siÍ jednak zaprowadziÊ w kraju tym wiary w Innosa, zaú wszelkie prÛby uczynienia tego koÒczy≥y siÍ úmierciπ kap≥anÛw, lub wybuchem buntu i kolejnπ wyprawπ wojennπ. Porzucono wiÍc starania o nawrÛcenie PraveÒczykÛw, zadawalajπc siÍ jedynie daninπ i bezpieczeÒstwem od atakÛw ze strony tego ludu barbarzyÒskiego.");

B_LogEntry(BookLog_HistoryOfVarant9,"Kres d≥ugiego panowania Nelezara I przyniÛs≥ kolejne niepokoje, albowiem przeciw nastÍpujπcemu po zmar≥ym Semmirowi III wystπpi≥ jego przyrodni brat z ≥oøa nieprawego. Ohyda jego czynu skaza≥a zdrajcÍ na zapomnienie, toteø imiÍ jego zostanie przemilczane. OdstÍpca zyska≥ wsparcie wielu moønych, ktÛrzy znaleüli w tym pretekst do wystπpienia przeciw w≥adzy krÛla. Sta≥o siÍ tak, øe Semmir musia≥ zbiegaÊ z zagroøonej stolicy do dworu w Mussan, a Al Shedim zasiad≥ uzurpator. £aska Innosa úwieci≥a jednak nad prawowitym krÛlem i ten niebawem zrzuci≥ zdrajcÍ z tronu.");

B_LogEntry(BookLog_HistoryOfVarant9,"Cena sporu by≥a jednak ogromna, albowiem za≥ama≥a siÍ w≥adza centralna. Od tej chwili w≥adca Wielkiego Imperium Varanckiego sta≥ siÍ jedynie nominalnym zwierzchnikiem emirÛw, zaú jego rzπdy ogranicza≥y siÍ do terenÛw przyleg≥ych do stolicy w Al Shedim. W obliczu zawieruchy, w≥adzÍ zwierzchniπ Varantu zrzucili PraveÒczycy, ktÛrzy na nowo zaczÍli najeødøaÊ pogranicze...");

B_LogEntry(BookLog_HistoryOfVarant9,"KONIEC TOMU IX");

};























































/////////////////////////////////////////////////////////////////////

// DZIEJE VARANTU. TOM X

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG”W WODY

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_HistoryOfVarant10 (C_ITEM)

{

name ="Dzieje Varantu. Tom X";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_03.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autorzy: Amiridion z Jelkali, Krug syn Amirindiona i Kap≥an Darandir z Trellium";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_HistoryOfVarant10;

};

FUNC VOID Use_Book_HistoryOfVarant10()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "BOOK_ER_L.tga", 0);

Doc_SetPage ( nDocID,  1, "BOOK_ER_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Dzieje Varantu. Tom X");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Dwunastotomowe dzie≥o opisujπce narodziny, rozwÛj i upadek staroøytnego Imperium Pradawnych z Varantu.]");

Doc_SetMargins( nDocID,  -1,  15, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_HistoryOfVarant10,LOG_NOTE);

B_LogEntry(BookLog_HistoryOfVarant10,"Dzieje Varantu. Tom X");

B_LogEntry(BookLog_HistoryOfVarant10,"W czasach pierwszych MussanitÛw na po≥udniu zalÍg≥y siÍ stworzenia, ktÛre przepÍdzone przez Akhelda I, znÛw rozpostar≥y mrok w swych dawnych siedzibach. I rozleg≥y mod≥y ku czci Beliara i demonÛw jego w krainach, a úpiewy obrazoburcze na haÒbÍ Innosa siÍ w gnieüdzie tym, w Eresh-Ugall na nowo zalÍg≥y. Czymøe by≥ wtedy Varant rozbity na w≥adztwa udzielnych emirÛw? KrÛla w≥adza w stolicy uwiÍziona, zaú jedynym spoiwem dawnej jednoúci stali siÍ magowie ognia, tak przez imperatora wspierani.");

B_LogEntry(BookLog_HistoryOfVarant10,"Wnet jednak emirowie poznali siÍ, øe przez mÍøÛw Innosyckich krÛl wzmacnia swe w≥adanie. Wywyøszyli wiÍc magÛw wody ponad czcicieli ognia, by ci ostojπ ich panowania siÍ stali. Semmir dwadzieúcia lat swe rzπdy monarsze sprawowa≥, wyprawiajπc siÍ bez zwyciÍstwa dwa razy na PraveÒczykÛw.");

B_LogEntry(BookLog_HistoryOfVarant10,"Po nim nasta≥ syn jego Asmatila. Syn Semmirowy znalaz≥ sojusznika w Troghdanie jednym spoúrÛd wodzÛw pÛ≥nocnych, ktÛry przyjπ≥ wiarÍ z rπk Koúcio≥a Innosyckiego i namaszczony na krÛla wszystkich JelkalÛw najecha≥ wespÛ≥ z krÛlem ziemie emirÛw, czyniπc sobie na powrÛt poddanymi emirÛw Tahira i Dakhusa. LÍkajπcy siÍ o swe panowanie pozostali emirowie zawiπzali wtedy spisek niecny i wystπpili przeciwko imperatorowi, dajπc poczπtek nowej wojnie, ktÛra sprowadzi≥a na Varant najeüdücÛw z pÛ≥nocy.");

B_LogEntry(BookLog_HistoryOfVarant10,"W niej to si≥y zjednoczone pod ber≥em Asmatili wspierane by≥y przez jelkalskie posi≥ki krÛla Troghdana i DhirimijczykÛw, zaú buntownicy pod wodzπ emira Nelacha prowadzili u swego boku PraveÒczykÛw.");

B_LogEntry(BookLog_HistoryOfVarant10,"Dwa lata armie krÛlewskie i emirowskie czyni≥y spustoszenie na ziemiach Varantu, by po nierozstrzygniÍtej bitwie przyznaÊ znaczniejszym emirom tytu≥y krÛlewskie, a mniejszym Panom ksiπøÍce. Przy Asmatili mia≥y pozostaÊ dotychczas zdobyte ziemie i nominalne prawo do rozsπdzania sporÛw miÍdzy emirami.");

B_LogEntry(BookLog_HistoryOfVarant10,"Wielki krÛl nie zrezygnowa≥ jednak z planu zjednoczenia w≥adztwa Innosyckiego i juø po smierci emira Vinkila w Kaldhice i wstπpieniu na tron brata zmar≥ego, wyruszy≥ z wyprawπ majπcπ na celu osadzenie tam wygnanπ krÛlowπ i pogrobowca.");

B_LogEntry(BookLog_HistoryOfVarant10,"LÍkajπcy siÍ o swe panowanie emir Salim, wezwa≥ wiÍc na pomoc orkÛw, ktÛrymi teø obsadzi≥ swÛj zamek. Wyprawa krÛlewska zosta≥a odparta, a Asmatila by≥ zmuszony powrÛciÊ do Al Shedim, uwoøπc ze sobπ wdowÍ i pogrobowca. Emir Salim niebawem w ohydnym czynie wygna≥ ze swojego miasta kap≥anÛw Innosa i w ich miejsce sprowadzi≥ czarnych magÛw. Za jego potwornym uczynkiem cieÒ pad≥ na KhaldikÍ i pogrπøy≥ siÍ ona beliaryckim b≥Ídzie.");

B_LogEntry(BookLog_HistoryOfVarant10,"KONIEC TOMU X");



};
























































/////////////////////////////////////////////////////////////////////

// DZIEJE VARANTU. TOM XI

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG”W WODY

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_HistoryOfVarant11 (C_ITEM)

{

name ="Dzieje Varantu. Tom XI";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_03.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autorzy: Amiridion z Jelkali, Krug syn Amirindiona i Kap≥an Darandir z Trellium";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_HistoryOfVarant11;

};

FUNC VOID Use_Book_HistoryOfVarant11()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "BOOK_ER_L.tga", 0);

Doc_SetPage ( nDocID,  1, "BOOK_ER_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Dzieje Varantu. Tom XI");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Dwunastotomowe dzie≥o opisujπce narodziny, rozwÛj i upadek staroøytnego Imperium Pradawnych z Varantu.]");

Doc_SetMargins( nDocID,  -1,  15, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_HistoryOfVarant11,LOG_NOTE);

B_LogEntry(BookLog_HistoryOfVarant11,"Dzieje Varantu. Tom XI");

B_LogEntry(BookLog_HistoryOfVarant11,"I nasta≥ czas walki, kiedy to Varant øyünia≥ krwiπ Beliara i Innosa. Na satrapÛw, co w swym bluünierstwie krÛlami siÍ mienili, spad≥ gniew Innosa rÍkami barbarzyÒcy wymierzony. Szala≥ wiÍc lud pierwotny, co swe siedziby mia≥ na pÛ≥nocy Zatoki PraveÒskiej.");

B_LogEntry(BookLog_HistoryOfVarant11,"Sprawiedliwoúci na emirach dopomina≥ siÍ Gorghian prowadzπcy dzielnych JelkalÛw. ”w panowa≥ w Gocie po bracie swym Troghdanie, a choÊ niecnie tron zdoby≥, dzielnym w≥adcπ i pos≥usznikiem Innosa siÍ okaza≥. Z pÛ≥nocnych puszcz Dhirim, wyjawi≥o siÍ pogaÒscy Dhirmijczycy z Guldern, co niesprzymierzeni z krÛlem, na wzÛr PraveÒczykÛw biczem boøym siÍ jawili. Czy prawdπ jest li to, øe ludzie Zatoki w przymierze z plugastwem Beliarowym weszli? Skromny kap≥an nie rozsπdzi. Krew la≥a siÍ strumieniami na wszystkich granicach, by niczym rzeka jednoczπca strumienie, imperium do jednoúci przywo≥aÊ. Kolejni satrapowie do przyjaüni z krÛlem przychodzili, by odeprzeÊ PraveÒczykÛw i gÛrniczych GuldernÛw. Wielki KrÛl zatrzyma≥ lud ze wschodu i GuldernijcÛw do przyjaüni nak≥oni≥. ");

B_LogEntry(BookLog_HistoryOfVarant11,"Wzesz≥o wiÍc ponownie s≥oÒce nad zjednoczonym Imperium. Nie by≥a to jednak si≥a AkhelidÛw i Odnowicieli, albowiem nie jeden satrapa, uznajπc w≥adzÍ Al Shedim, wciπø krÛlem siÍ mieni≥. Rodzi≥o siÍ nowe paÒstwo, ktÛre podobnie jak øycie ludzkie w bÛlach na úwiat przychodzi. Mierzyli siÍ wiÍc Beliaryci z Innosytami, a øaden nie by≥ w stanie zniszczyÊ drugiego. Innos przemÛwi≥ do swych s≥ug: Ñ Wznieúcie dla mnie portal, abym mÛg≥ rzπdziÊ w tej czÍúci úwiata przez ca≥π wiecznoúÊ.î I Jego s≥udzy spe≥nili to øπdanie. Podobnie uczynili Beliaryci, wznoszπc portal dla swego boga. Asmatila rozkaza≥ teø wynieúÊ artefakty Adanosa ze úwiπtyÒ, albowiem chcia≥ ich uøyÊ przeciw wrogowi. Usta≥y wtedy wielkie bitwy i jedynie drobne potyczki na granicach przypomina≥y o trwajπcej wojnie. Beliaryci pierwsi wznieúli swÛj portal i sprowadzili na úwiat bestie Beliara pod wodzπ potÍønego najstarszego ze smokÛw. WkrÛtce obie armie spotka≥y siÍ na granicach, gdzie mia≥a siÍ rozstrzygnπÊ wojna bogÛw. Armii Varantu towarzyszy≥y posi≥ki z Guldern, Jelkali, a nawet z Vengardu.");

B_LogEntry(BookLog_HistoryOfVarant11,"Orkowie, jaszczuroludzie i bestie Beliara na czele ze smokami zwerbowali nie tylko gobliny, ogry i shraty, ale teø potÍøne trolle. Oba wojska sta≥y przed sobπ twarzπ w twarz, zaú kap≥ani obu stron odprawiali kolejne przedbitewne obrzÍdy ku czci swych bogÛw. Wnet rytualne trπby zamilk≥y, ustÍpujπc wojskowym rogom dajπcym sygna≥ do walki. Dzikie  hordy na czele z trollami ruszy≥y przeciw zwartym oddzia≥om varranckim. Nagle oczom walczπcych ukaza≥a siÍ wielka niczym gÛra Archolos fala, ktÛra chwilÍ potem przykry≥a ca≥e pole bitwy, idπc dalej w g≥πb krainy. Kolejno w wodzie pogrπøa≥y siÍ miasta, wsie, lasy, ≥πki, a nawet gÛry, oga≥acajπc te miejsca z wszelkiego øycia. Woda poch≥onÍ≥a Kostur i Ber≥o, zaú piÍÊ boskich artefaktÛw kap≥ani ognia umieúcili w úwiπtyniach.");

B_LogEntry(BookLog_HistoryOfVarant11,"KONIEC TOMU XI");

};






















































/////////////////////////////////////////////////////////////////////

// DZIEJE VARANTU. TOM XII

// SUGEROWANA LOKACJA: BIBLIOTEKA MAG”W WODY

// NAPISANE PRZEZ WYZYSKKA 

/////////////////////////////////////////////////////////////////////

INSTANCE ItWr_HistoryOfVarant12 (C_ITEM)

{

name ="Dzieje Varantu. Tom XII";

mainflag =ITEM_KAT_DOCS;

flags =0;

value =60;

visual ="ItWr_Book_02_03.3ds";

material =MAT_LEATHER;

scemeName="MAP";

description= name;

TEXT[2] ="Autorzy: Amiridion z Jelkali, Krug syn Amirindiona i Kap≥an Darandir z Trellium";

TEXT[3] ="";

TEXT[5]= NAME_Value;

COUNT[5]= value;

on_state[0]=Use_Book_HistoryOfVarant12;

};

FUNC VOID Use_Book_HistoryOfVarant12()

{

var int nDocID;

nDocID = Doc_Create();

Doc_SetPages( nDocID,  2);

Doc_SetPage ( nDocID,  0, "BOOK_ER_L.tga", 0);

Doc_SetPage ( nDocID,  1, "BOOK_ER_R.tga", 0);

Doc_SetMargins( nDocID,  0,  275, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  0, "font_15_book.tga");

Doc_PrintLines( nDocID,  0, "Dzieje Varantu. Tom XII");

Doc_SetFont ( nDocID,  0, "font_10_book.TGA");

Doc_PrintLine( nDocID,  0, "");

Doc_PrintLines( nDocID,  0, "[Dwunastotomowe dzie≥o opisujπce narodziny, rozwÛj i upadek staroøytnego Imperium Pradawnych z Varantu.]");

Doc_SetMargins( nDocID,  -1,  15, 20, 30, 20, 1);

Doc_SetFont ( nDocID,  1, "font_10_book.TGA");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLine( nDocID,  1, "");

Doc_PrintLines( nDocID,  1, "(Aby poznaÊ pe≥nπ treúÊ ksiÍgi zajrzyj do kategorii 'Pozosta≥e' twojego dziennika.)");

Doc_Show( nDocID );

Log_CreateTopic(BookLog_HistoryOfVarant12,LOG_NOTE);

B_LogEntry(BookLog_HistoryOfVarant12,"Dzieje Varantu. Tom XII");

B_LogEntry(BookLog_HistoryOfVarant12,"Fale da≥y kres wielkiemu Imperium Varantu, ktÛre od Wiecznego WÍdrowca do Asmatila istnia≥o 437 lat. ChoÊ morze po kilku latach poczÍ≥o ustÍpowaÊ, ods≥oniÍty lπd rÛøni≥ siÍ od dawnego obrazu krainy. W miejsce urodzajnej i øyznej ziemi, zjawi≥y siÍ nieprzebyte piaski. Owe piaski poch≥onÍ≥y dawne miasta i rzeki, czyniπc Varant niepodobnym do starego. PÛ≥nocne miasta dawnego imperium poczÍ≥y upadaÊ pod naporem wyzwalajπcej siÍ ludnoúci tubylczej i jej kolejnych najazdÛw. Trwa≥e okaza≥y siÍ dzieci tego tworu, gdzie Korona Troghdana podjÍ≥a p≥aszcz dziedzictwa Varantu. ");

B_LogEntry(BookLog_HistoryOfVarant12,"RÛwnieø wúrÛd NordmarczykÛw kwit≥ kult Innosa, przyniesiony przez jednego z niewolnikÛw do tej nieprzyjaznej krainy. LudnoúÊ, ktÛra mia≥a tworzyÊ nowy Varant by≥a inna od dawnych jego gospodarzy. Wywodzi≥a siÍ ona z wypÍdzonych w gÛry przez AkhelidÛw pogan, ktÛrzy pod wp≥ywem maga wody Almira przyjeli kult Adanosa w czasach dynastii MussanitÛw. Na pÛ≥nocy dzisiejszej pustyni osiedlili siÍ z rzadka PraveÒczycy, zaú na wschodzie nie brakowa≥o przybyszy z Wysp Po≥udniowych. Wieúci te spisali ku pamiÍci potomnoúci Amiridion z Jelkali, Krug syn Amirindiona i Kap≥an Darandir z Trellium. ");

B_LogEntry(BookLog_HistoryOfVarant12,"W£ADCY PRADAWNYCH Z DYNASTII AKHELID”W");

B_LogEntry(BookLog_HistoryOfVarant12,"1. Wieczny WÍdrowiec ");

B_LogEntry(BookLog_HistoryOfVarant12,"2. Akheld I syn Wiecznego WÍdrowcy");

B_LogEntry(BookLog_HistoryOfVarant12,"3. Semmir I syn Wiecznego WÍdrowcy");

B_LogEntry(BookLog_HistoryOfVarant12,"4. Akheld II syn Semmira I");

B_LogEntry(BookLog_HistoryOfVarant12,"5. Tellos I syn Semmira I");

B_LogEntry(BookLog_HistoryOfVarant12,"6. Teminnar I syn Tellosa I");

B_LogEntry(BookLog_HistoryOfVarant12,"7. Semmir II  syn Teminnara I");

B_LogEntry(BookLog_HistoryOfVarant12,"8. Tellos II syn Semmira II");

B_LogEntry(BookLog_HistoryOfVarant12,"9. Tellos III syn Tellosa II");

B_LogEntry(BookLog_HistoryOfVarant12,"10. Tellos IV syn Tellosa III");

B_LogEntry(BookLog_HistoryOfVarant12,"W£ADCY PRADAWNYCH Z DYNASTII ODNOWICIELI ");

B_LogEntry(BookLog_HistoryOfVarant12,"Akheld III");

B_LogEntry(BookLog_HistoryOfVarant12,"Kalhir I ObroÒca syn Akhelda III ");

B_LogEntry(BookLog_HistoryOfVarant12,"Kalhir II PrzeklÍty syn Kalhira I");

B_LogEntry(BookLog_HistoryOfVarant12,"Tizgar I Chromy syn Kalhira I");

B_LogEntry(BookLog_HistoryOfVarant12,"W£ADCY PRADAWNYCH Z DYNASTII MUSSANIT”W");

B_LogEntry(BookLog_HistoryOfVarant12,"Nelezar I syn Delezara Mussanity ");

B_LogEntry(BookLog_HistoryOfVarant12,"Semmir III syn Nelezara I");

B_LogEntry(BookLog_HistoryOfVarant12,"Asmatila I ZwyciÍzca syn Semmira III ");

B_LogEntry(BookLog_HistoryOfVarant12,"KONIEC TOMU XII, OSTATNIEGO");

};