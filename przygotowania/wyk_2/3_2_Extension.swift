import Foundation

class JakaśKlasa{
     var atrA: Double
    private var atrB: Double

	// init, w którym nazwy wewnętrzne i zewnętrzne argumentów są takie same
    init(a: Double, b: Double){
        atrA = a
        atrB = b
    }
}


//// Atrybuty są prywatne, więc nie ma do nich dostępu z klasy pochodnej - błąd kompilacji
//class KlasaPochodna : JakaśKlasa{
//	func dodaj() -> Double { return atrA + atrB }
//}


var cos = JakaśKlasa(a: 5, b: 6)

// protokół - wymaga implementacji metody "dodaj"
protocol DodajAtrybuty{
    func dodaj() -> Double
}

// protokół - implementacja metody "odejmij" nie jest konieczna,
// konieczna jest natomiast implementacja property "średnia""
@objc protocol OdejmijAtrybuty{
	var średnia: Double { get }
	@objc optional func odejmij() -> Double
}

// Rozszerzenie klasy (implementuje dwa protokoły)
extension JakaśKlasa : DodajAtrybuty, OdejmijAtrybuty{
	
	// implementacja "średnia" możliwa jest jedynie w postaci property obliczalnego
	// (rozszerzenie nie może zmieniać alokacji obiektu)
    var średnia: Double{
        get{ return (atrA + atrB)/2.0 }
    }

    // Uwaga: kompilator domyśla się z kontekstu syntaktycznego, że chodzi o geter,
    //więc można to zapisać w sposób uproszczony:
//    var średnia: Double{
//        (atrA + atrB)/2.0
//    }

    func dodaj() -> Double { return atrA + atrB }
	
	func odejmij() -> Double { return atrA - atrB }

}

print( cos.średnia )
print( cos.dodaj() )
print( cos.odejmij() )

