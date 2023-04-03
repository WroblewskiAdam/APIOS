
class Samochód{
	let nazwa: String
	let pojemnośćBaku: Double
	var spalanie: Double
	var zasięg: Double{ get{ return pojemnośćBaku/spalanie*100.0 } }
	
	init(_ naz: String,_ poj: Double,_ spal: Double){
		nazwa = naz
		pojemnośćBaku = poj
		spalanie = spal
	}
}

// utworzenie dwuelementowej tablicy Samochodów
var tablica: [Samochód]? = [Samochód("bmw",55,10.5), Samochód("skoda",45,7.5)]

// rozszerzenie warunkowe tablicy - tylko gdy jest to tablica Samochodów
extension Array where Element: Samochód{
	func print(){
		for kolejnySamochód in self{
			Swift.print("\(kolejnySamochód.nazwa) \(kolejnySamochód.zasięg)")
		}
		Swift.print()
	}
}


// Zdefiniowanie closure jako typu (wykonanie kalauzury się tu nie odbywa)
let druk = { tablica!.print() }

// dodanie nowych elementów do tablicy
tablica?.append(Samochód("opel", 50, 9.4))
tablica? += [Samochód("volvo", 60, 9.0)]

// wydruk - wywołanie klauzury
druk()

// Chcemy posortować tablicę Samochodów ze względu na zasięg
var tablicaPosortowana:  [Samochód]?

// Pomocniczo przeciążmy operator porównania
func > (pierwszy: Samochód, drugi: Samochód) -> Bool{ return pierwszy.zasięg > drugi.zasięg }


//--------------------------------------------------------------------------------
// Sortowanie tablicy
// Wykorzystamy "standardową" procedurę każdej tablicy w Swifcie (sorted),
// której trzeba dostarczyć informacę o wzajemnych relacjach elementów tej tablicy



tablicaPosortowana = tablica?.sorted(by: > )





tablicaPosortowana?.print()









/*
//===========================================================================
//===========================================================================
/// FUNKCJA

// Definiujemy klauzurę jako funkcję globalną i "wysyłamy" ją jako warunek sortowania

func większyZasięg(pierwszy: Samochód, drugi: Samochód) -> Bool
{
 return pierwszy > drugi
}

// Argument: closure zdefiniowane jako funkcja
tablicaPosortowana = tablica?.sorted(by: większyZasięg )


//===========================================================================
//===========================================================================
// CLOSURE NA LISCIE

// Closure zdefiniowane na liście argumentów jako argument
tablicaPosortowana = tablica?.sorted(by:
{
(pierwszy: Samochód, drugi: Samochód) -> Bool
in
return pierwszy > drugi
}
)

 
 
//===========================================================================
/===========================================================================
// TRAILING CLOSURE

// Closure zdefiniowane na liście argumentów trailing closure
tablicaPosortowana = tablica?.sorted() {
(pierwszy: Samochód, drugi: Samochód) -> Bool
in
return pierwszy > drugi
}

 
 
 
 
 
 
//===========================================================================
//===========================================================================
// TRAILING CLOSURE z nieco uproszczonym syntaksem

// Closure zdefiniowane na liście argumentów trailing closure
// typy argumentów i typ zwracany wynikają z kontekstu
tablicaPosortowana = tablica?.sorted(){
pierwszy, drugi
in
return pierwszy > drugi
}

 
 
 
 
 
//===========================================================================
//===========================================================================
// TRAILING CLOSURE z jeszcze bardziej uproszczonym syntaksem

// liczba argumentów też wynika z kontekstu, a ich nazwy nie sa potrzebne
tablicaPosortowana = tablica?.sorted(){ $0 > $1 }

 
 
 
 
 
 
 
 
 
//===========================================================================
//===========================================================================
// CLOSURE z ekstremalnie już uproszczonym syntaksem
 // bo przecież dla kompilatora prawie wszystko jest tu domyślne

 tablicaPosortowana = tablica?.sorted(by: > )

//===========================================================================
//===========================================================================

*/
