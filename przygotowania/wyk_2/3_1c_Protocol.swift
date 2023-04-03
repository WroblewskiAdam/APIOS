//  Created by Adam Wojtasik on 23/04/20.
//  Last miodifications: 23/03/2022
//  Copyright (c) 2022 Adam Wojtasik. All rights reserved.

//++++++++++++++++++++++++++++++++++++
// Protokół jako typ cz. 2
//++++++++++++++++++++++++++++++++++++

protocol FunkcjeInstrumentu{
    func info() -> String
}

// Typ wyliczeniowy może implementować protokół
enum Instrument: FunkcjeInstrumentu{
    case skrzypce
    case fortepian
    case trąbka
    case żaden

    func info() -> String{
        switch self {
            case .skrzypce:  return "skrzypce"
            case .fortepian: return "fortepian"
            case .trąbka:    return "trąbka"
            case .żaden:     return "żaden"
        }
    }
}

//-----------------------------
protocol Muzyk{
    func gramNa() -> Instrument
}


// Struktura implementująca protokół
struct Pianista: Muzyk{
    var konserwatorium: Bool // to nie jest zainicjalizowane
    let instrument = Instrument.fortepian
    func gramNa() -> Instrument { return instrument }

    // Uwaga! Nie ma inicjalizatora. Struktura może mieć inicjalizator domyślny
}

// Struktura implementująca protokół
struct Skrzypek: Muzyk{
    var konserwatorium: Bool
    let instrument = Instrument.skrzypce
    func gramNa() -> Instrument { return instrument }
}

// Klasa implementująca protokół
class Trębacz: Muzyk{
    var konserwatorium: Bool
    let instrument = Instrument.trąbka
    func gramNa() -> Instrument { return instrument }
    
    // Uwaga! Jeżeli klasa ma niezainicjalizowane property, to musi mieć zdefiniowany inicjalizator
    init(konserwatorium k: Bool) { konserwatorium = k }
}

//----------------------------------------
// Enum też może być stosowany z protokołem podobnie jak klasa i struktura
enum Śpiewak: Muzyk{
    case tenor
    case baryton
    case bas
    
    func gramNa() -> Instrument {
        return instr
    }
 
    // Enum może mieć tylko properties wyliczeniowe
    var instr: Instrument{
        get{return Instrument.żaden }
    }
    
    init(){ self = .tenor }
}




//++++++++++++++++++++++++++++++++++++


// Funkcja "generująca" muzyka: zwraca typ protokołowy
func dajMuzyka(_ j: Int) -> Muzyk {
    var ret: Muzyk
    switch j{
        case 1: ret = Pianista(konserwatorium: true)  // wykorzystujemy inicjalizator domyślny
        case 2: ret = Skrzypek(konserwatorium: true)  // wykorzystujemy inicjalizator domyślny
        case 3: ret = Trębacz(konserwatorium: false) // wykorzystujemy inicjalizator zdefiniowany
        default: ret = Śpiewak()
    }

    return ret
}


// zmienna referencyjna na obiekt dowolnego rodzaju -- ale taki, który implementuje protokół,
// czyli grajek to "referencja na protokół" (jest typu protokołowego)
var grajek: Muzyk = dajMuzyka(2)

let i = grajek.gramNa().info()
print(i)

// Można sprawdzić o jaki typ implementuje nasz protokół
if grajek is Pianista { print("Grajek to Pianista") }
else { print("Grajek nie jest Pianistą") }
if grajek is Skrzypek { print("Grajek to Skrzypek") }
else { print("Grajek nie jest Skrzypkiem") }
if grajek is Trębacz { print("Grajek to Trębacz") }
else { print("Grajek nie jest Trębaczem") }
if grajek is Śpiewak { print("Grajek to Śpiewak") }
else { print("Grajek nie jest Śpiewakiem") }


