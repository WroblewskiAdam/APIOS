//
//  Created by Adam Wojtasik on 15/11/2019.
//  Copyright © 2019 Institute of Microelectronics and Optoelectronics. All rights reserved.
//  Last modifications on 22/04/2020.
//


// Obsługa sytuacji wyjątkowych: z użyciem try-throw-catch (od Swift 2) i typu Result (od Swift 5)

// Przykładowa funkcja ma zwracać liczbę pseudolosową z zakresu od 5 do upper, gdzie upper jest daną wejściową,
// która nie może przekroczyć 20

let input = 15

// obiekt reprezentujący rodzaj błędu
enum LimesError: Error {
	case belowMinimum
	case aboveMaximum
}


//********************************************************************
// Z użyciem try-throw-catch (klasyczna obsługa sytuacji wyjątkowych)

// Funkcja zwraca wynik - liczbę typu Int
func generateRandomNumber1(upper: Int) throws -> Int  {
	// Rzucanie wyjątku dla danej wejściowej spoza wyznaczonych granic
	guard upper >= 5 else  { throw LimesError.belowMinimum }
	guard upper <= 20 else { throw LimesError.aboveMaximum }

	let number = Int.random(in: 5...upper)
	return number
}

// testowanie działania funkcji generateRandomNumber1
var intResult1: Int? = 0
do{
	try intResult1 = generateRandomNumber1(upper: input)
	print("sukces")
}
catch let err as LimesError {
	print(err)
}
print(intResult1 as Any)
print("------------------------------\n")



//********************************************************************
// Z użyciem Result -- funkcja zwraca failure lub success

// Funkcja zwraca obiekt Result - generyk sparametryzowany wynikiem (Int) i rodzajem błędu (LimesError)
func generateRandomNumber(upper: Int) -> Result<Int, LimesError> {
	guard upper >= 5 else  { return .failure(.belowMinimum) }
	guard upper <= 20 else { return .failure(.aboveMaximum) }
	
	let number = Int.random(in: 5...upper)
	return .success(number)
}


// testowanie działania funkcji generateRandomNumber

// Pełna wersja
var intResult2: Int? = 0

switch generateRandomNumber(upper: input) {
    case .success(let res):
		intResult2 = res        // jeżeli był sukces, trzeba wyjąc wynik z Result
		print("sukces")
	case .failure(let error):   // a jeżeli błąd - trzeba wyjąć rodzaj błędu
		print(error)
}
print(intResult2 as Any)
print("\n")


// Wersja "kompaktowa"
let result = generateRandomNumber(upper: input)

var intResult3 = try? result.get() // jeżeli był success zwracana jest wyznaczona liczba, jeżeli failure - nil

print(intResult3 as Any)
print("\n")




