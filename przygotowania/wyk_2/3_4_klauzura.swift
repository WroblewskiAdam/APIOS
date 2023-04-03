// Różne przykłady definiowania i wykorzystywania klauzur


// Definicja funkcji, której trzecim argumentem jest klauzura
// (w tym przykładzie to klauzura zdefiniowana jako (_:Double,_:Double)->Bool
// czyli o dwóch argumentach typu Doublie zwracająca Bool)

func funkcjaTestowa(_ val: Double, _ tekst: String, toJestKlauzura: (_:Double,_:Double)->Bool ) -> Int{
    print(tekst)
	var i:Int = 1000
	if toJestKlauzura(val, 7.0) { i = 2000 }
	return i
}


// Jak zdefiniować i przekazać klauzurę do funkcji testowej?


// Wywołanie funkcji ze zdefiniowaną wyrażeniową kauzurą na liście argumentów
// Zauważmy przy okazji, że funkcja (klauzura) jest typem
var coś = funkcjaTestowa( 6.0, "Wyrażeniowa",
    toJestKlauzura:
// definicja klauzury
	{
		(arg1: Double, arg2: Double) -> Bool // argumenty i typ zwracany
		
		in // ciało klauzury
		
		var ret:Bool = false
		if arg1 == arg2 { ret = true }
		return ret
	}
)
print(coś)





// Wywołanie funkcji ze zdefiniowaną kauzurą w postaci tzw. trailing closure
// (możliwe jedynie kiedy klauzura jest ostatnim argumentem funkcji)
// Uzyskujemy uproszczony syntaks
coś = funkcjaTestowa(7.0, "Trailing"){
    (arg1: Double, arg2: Double) -> Bool
	in
	var ret:Bool = false
	if arg1 == arg2 { ret = true }
	return ret
}

print(coś)





// Użycie funkcji globalnej jako argumentu
func mojaFunkcja(arg1: Double, arg2: Double) -> Bool{
	var ret:Bool = true
	if arg1 == arg2 { ret = false }
	return ret
}

coś = funkcjaTestowa(8.0, "Global", toJestKlauzura: mojaFunkcja)
print(coś)





// Użycie metody klasy jako argumentu
class Test{
	func metoda(arg1: Double, arg2: Double) -> Bool{
		var ret:Bool = true
		if arg1 == arg2 { ret = false }
		return ret
	}
}
var temp = Test()

coś = funkcjaTestowa(9.0, "Metoda", toJestKlauzura: temp.metoda )
print(coś)



//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Uproszczenie syntaksu

// Wywołanie funkcji ze zdefiniowaną wyrażeniową kauzurą na liście argumentów
// Ponieważ funkcjaTestowa ma trzeci argument, który powinien być klauzurą
// o dwóch argumentach typu Double - nie musimy tego typu podawać wprost.
// Jest on domyślny.
coś = funkcjaTestowa( 6.0, "Wyrażeniowa z uproszczeniem",
    toJestKlauzura:
// definicja klauzury
    {
        arg1, arg2 -> Bool // parametry i typ zwracany
        
        in // ciało klauzury
        
        var ret:Bool = false
        if arg1 == arg2 { ret = true }
        return ret
    }
)
print(coś)
