// Przykład zastosowania klauzury typu escaping

// referencja do klauzury, która ma być wywołana po wyjściu z funkcji, która wypełni tę referencję
var completionHandler: (()->Void)?

// funkcja wywołująca klauzurę podaną na liście argumentów ("normalna" funkcja)
func functionWithNonescapingClosure(closure: ()->Void) { closure() }

// funkcja, która ustawia w/w referencję, czyli używa klauzury podanej na liście argumentów, ale jej nie wywołuje
func functionWithEscapingClosure(closure: @escaping ()->Void) { completionHandler = closure }

class SomeClass {
	var x = 10
	func doSomethingNonEscape() {
		functionWithNonescapingClosure { x = 200 }  // ustawienie zmiennej na 200 nie jest typu escaping
	}
    func doSomethingEscape() {
        functionWithEscapingClosure { self.x = 100 } // ustawienie zmiennej na 100 jest typu escaping
    }
}


// Testowanie
let instance = SomeClass()

print("starcie ", instance.x) // x zostało ustawione na 200
instance.doSomethingNonEscape()
print("po wyjściu z doSomethingNonEscape ", instance.x) // x zostało ustawione na 200

instance.doSomethingEscape() // x dalej jest 200
print("po wyjściu z doSomethingEscape ", instance.x)

completionHandler!() // x zostaje zmienione dopiero tu - po wyjściu z funkcji i uruchomieniu klauzury typu escaping
print("po wykonaniu klauzury typu escaping ",instance.x)

