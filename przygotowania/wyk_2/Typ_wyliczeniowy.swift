
//
//  Created by Adam Wojtasik on 27/11/14.
//  Last miodifications: 22/10/2020
//  Copyright (c) 2014-2020 Adam Wojtasik. All rights reserved.
//

//--------------------------------------------------------
// Typ wyliczeniowy
enum TypInita: Int8 {
    case pierwszyInit = 1
    case drugiInit
    case trzeciInit, secondInit
    case czwartyInit, piątyInit

    // Typ wyliczeniowy może mieć swoje metody
    func opis() -> String {
        switch self {
        case .pierwszyInit:
            return "init - nazwaPojazdu"
        case .drugiInit:
            return "init - drugaNazwaPojazdu"
        case .secondInit:
            return "init - secondVehicleName"
        case .trzeciInit:
            return "init - bez nazwy zewnętrznej"
        case .czwartyInit:
            return "init - failable"
        default:
            return String(self.rawValue)
        }
    }

    // Typ wyliczeniowy może mieć inicjalizatory
    init(){ self = .pierwszyInit }
    init(_ typ: TypInita){ print("inicjalizator enum-a"); self = typ }

    // nie ma deinita, typ wyliczeniowy tak jak struktura jest niemutowalny, odwrotnie jak klasa 
}
//--------------------------------------------------------


//--------------------------------------------------------
// Klasa bazowa
class Pojazd{
    // atrybuty stałe (property o stałej zawartości)
    let identyfikator: TypInita
    
    // atrybuty zmienne (property o zmiennej zawarości)
    var nazwa: String
    var ileKół: Int8
    
    // atrybut wyliczeniowy (computed property)
    var ileOpon: Int8 {
        get{ return ileKół+1 }
        set(koła){ ileKół = koła-1 }
    }
    
    // inicjalizator, który może być wywoływany przez inne inicjalizatory
    init(_ typ: TypInita, _ nam:String, _ koła:Int8){
        identyfikator = TypInita(typ) // wykorzystanie inicjalizatora typu wyliczeniowego
        nazwa = nam
        ileKół = koła
    }
    
// Różne inicjalizatory (konstruktory) mające jako argument jeden String
    
    convenience init(nazwaPojazdu nowaNazwa: String){ // inicjalizator wywołujący inny inicjalizator
        self.init(TypInita.pierwszyInit, nowaNazwa, 4)
        print("Pojazd:", identyfikator.opis())
    }

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

    init(drugaNazwaPojazdu nowaNazwa: String){
        identyfikator = TypInita.drugiInit // pełna nazwa pozycji typu wyliczeniowego
        nazwa = nowaNazwa
        ileKół = 4
        print("Pojazd:", identyfikator.opis())
    }
    init(secondVehicleName nowaNazwa: String){ // przeciążenie funkcji - inna nazwa zewnętrzna
        identyfikator = .secondInit // skrócona nazwa pozycji typu wyliczeniowego
        nazwa = nowaNazwa
        ileKół = 4
        print("Pojazd", identyfikator.opis())
    }
    init(_ nowaNazwa: String){
        identyfikator = TypInita.trzeciInit
        nazwa = nowaNazwa
        print("Pojazd - konstruktor", identyfikator)
        ileKół = 4
    }
    
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    // init, który może zakończyć się niepowodzeniem ( failable init )
    init?(jakaNazwa nowanazwa: String) {
        if nowanazwa.isEmpty { return nil }
        identyfikator = TypInita.czwartyInit
        nazwa = nowanazwa
        print("Pojazd - konstruktor", identyfikator)
        ileKół = 4
    }
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

    // metoda
    func podajNazwe(){ print(nazwa) }
    
    // metoda zwraca czteroelementową krotkę
    func coTo() -> (raz:String, dwa:Int8, trzy:Int8, cztery:Int8){
        return (nazwa, identyfikator.rawValue, ileKół, ileOpon)
    }
    
    // deinicjalizator
    deinit{ print("deinit Pojazd ", identyfikator, nazwa) }
}
//--------------------------------------------------------


//********************************************************
// tu utworzenie obiektu się nie uda (stosujemy init, który dopuszcza nieutworzenie obiektu)
let samochód:Pojazd? = Pojazd(jakaNazwa: "")
print(samochód as Any) // rzutowanie (cast) - Any: referencja pokazująca na dowolny obiekt referencyjny
print("\n\n")
//********************************************************



//--------------------------------------------------------
// Klasa pochodna
class Rower: Pojazd{
	let identyfikatorRower: Int8
	
	// inicjalizator
	init(){
		identyfikatorRower = 0
		super.init(drugaNazwaPojazdu: "Kross")
		ileOpon = 3
		print("Rower - konstruktor", identyfikatorRower)
	}
	// deinicjalizator
	deinit{
		print("deinit Rower", identyfikatorRower)
	}
	
	// metoda wirtualna
	override func coTo() -> (raz:String, dwa:Int8, trzy:Int8, cztery:Int8){
		return ("Jestem rower " + nazwa + ".", identyfikator.rawValue, ileKół, ileOpon)
	}
}

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Polimorfizm

// Utworzenie "pustej" zmiennej referencyjnej do Pojazdu (zmiennej opcjonalnej)
var testowyPojazd: Pojazd? = nil

// Utworzenie obiektu klasy Rower i wstawienie referencji do niego do zmiennej referencyjnej na Pojazd
testowyPojazd = Rower()

print(testowyPojazd!.coTo().raz, "Utworzony z użyciem =", testowyPojazd!.coTo().dwa, "\n")

// Utorzenie obiektu, do którego zapisywana jest zwracana krotka

var retValue = testowyPojazd!.coTo()
//var retValue: (raz:String, dwa:Int8, trzy:Int8, cztery:Int8) = testowyPojazd!.coTo() // definicja z określeniem typu
print(retValue.raz, "Utworzony z użyciem =", retValue.dwa, "Mam ", retValue.trzy, " kółka i ",retValue.cztery, " opony\n")

// "Uwolnienie" obiektu klasy Rower
testowyPojazd = nil


