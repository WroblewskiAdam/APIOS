//  Created by Adam Wojtasik on 23/04/20.
//  Last miodifications: 24/03/2021
//  Copyright (c) 2020 Adam Wojtasik. All rights reserved.


protocol FunkcjeInstrumentu{
    func info() -> String
}

//----------------------------------------
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



//*******************************************************
// Protokół jako typ (tzw. typ protokołowy)
//*******************************************************

//-----------------------------
protocol Muzyk{
    var instr: Instrument {get}
    func gramNa() -> Instrument
}



//----------------------------------------
// Struktury mogą implementować protokół
struct Pianista: Muzyk{
    let instr = Instrument.fortepian
    func gramNa() -> Instrument { return instr }
}

struct Skrzypek: Muzyk{
    let instr = Instrument.skrzypce
    func gramNa() -> Instrument { return instr }
}


// Zmienna referencyjna na obiekt, który implementuje dany protokół
// Tu: grajek jest referencją do instancji PROTOKOŁU Muzyk
var grajek: Muzyk?


grajek = Skrzypek()   // grajek może zawierać referencję do instancji STRUKTURY - Skrzypek,
                      // bo Skrzypek implementuje protokół Muzyk
let i = grajek!.gramNa().info()
print(i)

grajek = Pianista()   // grajek może zawierać referencję do instancji INNEJ STRUKTURY - Pianista,
                      // bo Pianista implementuje protokół Muzyk

let ii = grajek!.gramNa().info()
print(ii)






//----------------------------------------
// Klasa może implementować protokół
class Trębacz: Muzyk{
    let instr = Instrument.trąbka
    func gramNa() -> Instrument { return instr }
}


grajek = Trębacz()               // grajek może zawierać referencję do instancji KLASY Trębacz
                                 // bo Trębacz implementuje protokół Muzyk
let iii = grajek!.gramNa().info()
print(iii)
print()






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

grajek = Śpiewak()  // grajek może zawierać referencję do instancji typu wyliczeniowego Śpiewak
                    // bo Śpiewak implementuje protokół Muzyk

let iiii = grajek!.gramNa().info()
print(iiii)
