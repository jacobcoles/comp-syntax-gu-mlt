--# -path=.:../abstract
concrete MicroLangSwe of MicroLang = open MicroResSwe, Prelude in {

-----------------------------------------------------
---------------- Grammar part -----------------------
-----------------------------------------------------

  lincat
    Utt = {s : Str} ;
    
    S  = {s : Str} ;
    VP = {verb : Verb ; compl : Str} ; ---s special case of Mini
    Comp = {s : Str} ;
    AP = Adjective ;
    CN = Noun ;
    NP = {s : Case => Str ; a : Agreement} ;
    Pron = {s : Case => Str ; a : Agreement} ;
    Det = {s : Str ; n : Number} ;
    Prep = {s : Str} ;
    V = Verb ;
    V2 = Verb2 ;
    A = Adjective ;
    N = Noun ;
    Adv = {s : Str} ;

  lin
    UttS s = s ;
    UttNP np = {s = np.s ! Acc} ;

    PredVPS np vp = {
      s = np.s ! Nom ++ vp.verb.s ! agr2vform np.a ++ vp.compl
      } ;
      
    UseV v = {
      verb = v ;
      compl = [] ;
      } ;
      
    ComplV2 v2 np = {
      verb = v2 ;
      compl = v2.c ++ np.s ! Acc  -- NP object in the accusative, preposition first
      } ;
      
    UseComp comp = {
      verb = be_Verb ;     -- the verb is the copula "be"
      compl = comp.s
      } ;
      
    CompAP ap = ap ;
      
    AdvVP vp adv =
      vp ** {compl = vp.compl ++ adv.s} ;
      
    DetCN det cn = {
      s = \\c => det.s ++ cn.s ! det.n ;
      a = Agr det.n ;
      } ;
      
    UsePron p = p ;
            
    a_Det = {s = pre {"a"|"e"|"i"|"o" => "an" ; _ => "a"} ; n = Sg} ; --- a/an can get wrong
    aPl_Det = {s = "" ; n = Pl} ;
    the_Det = {s = "the" ; n = Sg} ;
    thePl_Det = {s = "the" ; n = Pl} ;
    
    UseN n = n ;
    
    AdjCN ap cn = {
      s = table {n => ap.s ++ cn.s ! n}
      } ;

    PositA a = a ;

    PrepNP prep np = {s = prep.s ++ np.s ! Acc} ;

    in_Prep = {s = "in"} ;
    on_Prep = {s = "on"} ;
    with_Prep = {s = "with"} ;

    he_Pron = {
      s = table {Nom => "he" ; Acc => "him"} ;
      a = Agr Sg ;
      } ;
    she_Pron = {
      s = table {Nom => "she" ; Acc => "her"} ;
      a = Agr Sg ;
      } ;
    they_Pron = {
      s = table {Nom => "they" ; Acc => "them"} ;
      a = Agr Pl ;
      } ;

-----------------------------------------------------
---------------- Lexicon part -----------------------
-----------------------------------------------------

lin already_Adv = mkAdv "redan" ;
lin animal_N = mkN "djur" ;
lin apple_N = mkN "äpple" ;
lin baby_N = mkN "bäbis" ;
lin bad_A = mkA "dålig" ;
lin beer_N = mkN "öl" ;
lin big_A = mkA "stor" ;
lin bike_N = mkN "cykel" ;
lin bird_N = mkN "fågel" ;
lin black_A = mkA "svart" ;
lin blood_N = mkN "blod" ;
lin blue_A = mkA "blå" ;
lin boat_N = mkN "båt" ;
lin book_N = mkN "bok" ;
lin boy_N = mkN "pojke" ;
lin bread_N = mkN "bröd" ;
lin break_V2 = mkV2 (mkV "bryter" "bröt" "brutit") ;
lin buy_V2 = mkV2 (mkV "köpa" "köpte" "köpt") ;
lin car_N = mkN "bil" ;
lin cat_N = mkN "katt" ;
lin child_N = mkN "barn";
lin city_N = mkN "city" ;
lin clean_A = mkA "ren" ;
lin clever_A = mkA "listig" ;
lin cloud_N = mkN "moln" ;
lin cold_A = mkA "kall" ;
lin come_V = mkV "kommer" "kom" "kommit" ;
lin computer_N = mkN "dator" ;
lin cow_N = mkN "ku" ;
lin dirty_A = mkA "smutsig" ;
lin dog_N = mkN "hung" ;
lin drink_V2 = mkV2 (mkV "dricker" "drack" "druckit") ;
lin eat_V2 = mkV2 (mkV "äter" "åt" "ätit") ;
lin find_V2 = mkV2 (mkV "finner" "fann" "funnit") ;
lin fire_N = mkN "brand" ;
lin fish_N = mkN "fisk";
lin flower_N = mkN "blomma" ;
lin friend_N = mkN "vän" ;
lin girl_N = mkN "flicka" ;
lin good_A = mkA "bra" ;
lin go_V = mkV "går" "gick" "gått" ;
lin grammar_N = mkN "grammatik" ;
lin green_A = mkA "grön" ;
lin heavy_A = mkA "tung" ;
lin horse_N = mkN "häst" ;
lin hot_A = mkA "het" ;
lin house_N = mkN "hus" ;
-- lin john_PN = mkPN "John" ;
lin jump_V = mkV "hoppa" ;
lin kill_V2 = mkV2 "döda" ;
-- lin know_VS = mkVS (mkV "vet" "visste" "vetat") ;
lin language_N = mkN "språk" ;
lin live_V = mkV "leva" ;
lin love_V2 = mkV2 (mkV "älska") ;
lin man_N = mkN "man" "män" ;
lin milk_N = mkN "mjölk" ;
lin music_N = mkN "musik" ;
lin new_A = mkA "ny" ;
lin now_Adv = mkAdv "nu" ;
lin old_A = mkA "gammal" ;
-- lin paris_PN = mkPN "Paris" ;
lin play_V = mkV "spela" ;
lin read_V2 = mkV2 (mkV "läser" "läste" "läst") ;
lin ready_A = mkA "redo" ;
lin red_A = mkA "röd" ;
lin river_N = mkN "å" ;
lin run_V = mkV "springer" "sprang" "sprungit" ;
lin sea_N = mkN "sjö" ;
lin see_V2 = mkV2 (mkV "ser" "såg" "sett") ;
lin ship_N = mkN "skepp" ;
lin sleep_V = mkV "sover" "sov" "sovit" ;
lin small_A = mkA "liten" ;
lin star_N = mkN "sjärna" ;
lin swim_V = mkV "simmar" "simmade" "simmat" ;
lin teach_V2 = mkV2 (mkV "lär" "lärde" "lärt") ;
lin train_N = mkN "tåg" ;
lin travel_V = mkV "åka" ;
lin tree_N = mkN "trä" ;
lin understand_V2 = mkV2 (mkV "förstå" "förstådd" "förstått") ;
lin wait_V2 = mkV2 "vänta" "för" ;
lin walk_V = mkV "gå" ;
lin warm_A = mkA "varm" ;
lin water_N = mkN "vatten" ;
lin white_A = mkA "vit" ;
lin wine_N = mkN "vin" ;
lin woman_N = mkN "kvinna" ;
lin yellow_A = mkA "gul" ;
lin young_A = mkA "ung" ;

---------------------------
-- Paradigms part ---------
---------------------------

oper
  mkN = overload {
    mkN : Str -> Noun   -- predictable noun, e.g. car-cars, boy-boys, fly-flies, bush-bushes
      = \n -> lin N (smartNoun n) ;
    mkN : Str -> Str -> Noun  -- irregular noun, e.g. man-men
      = \sg,pl -> lin N (mkNoun sg pl) ;
    } ;

  mkA : Str -> A
    = \s -> lin A {s = s} ;

  mkV = overload {
    mkV : (inf : Str) -> V  -- predictable verb, e.g. play-plays, cry-cries, wash-washes
      = \s -> lin V (smartVerb s) ;
    mkV : (inf,pres,part : Str) -> V  -- irregular verb, e.g. drink-drank-drunk
      = \inf,pres,part -> lin V (irregVerb inf pres part) ;
    } ;

  mkV2 = overload {
    mkV2 : Str -> V2          -- predictable verb with direct object, e.g. "wash"
      = \s   -> lin V2 (smartVerb s ** {c = []}) ;
    mkV2 : Str  -> Str -> V2  -- predictable verb with preposition, e.g. "wait - for"
      = \s,p -> lin V2 (smartVerb s ** {c = p}) ;
    mkV2 : V -> V2            -- any verb with direct object, e.g. "drink"
      = \v   -> lin V2 (v ** {c = []}) ;
    mkV2 : V -> Str -> V2     -- any verb with preposition
      = \v,p -> lin V2 (v ** {c = p}) ;
    } ;

  mkAdv : Str -> Adv
    = \s -> lin Adv {s = s} ;
  
  mkPrep : Str -> Prep
    = \s -> lin Prep {s = s} ;

}
