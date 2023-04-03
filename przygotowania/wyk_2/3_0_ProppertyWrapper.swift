//
//  Created by Adam Wojtasik on 20/10/2019.
//  Copyright © 2020 Institute of Microelectronics and Optoelectronics. All rights reserved.
//  Last modifications on 23/04/2020.
//

// Property opakowane
// Cytat z manuala: "Wykonanie obudowania property dodaje warstwę separacji między kodem, który zarządza
// sposobem przechowywania tego property, a kodem, który to property definiuje".

//--------------------------------------------------------------------------------------------------
// Definicja "opakowanego" property - wykorzystuje się do tego celu strukturę
@propertyWrapper
struct PropertyOne{
    private var value: Int = 0

// Należy zdefiniować property obliczane o nazwie wrappedValue (nazwa obowiązkowa)
    var wrappedValue: Int{
        get{ return value }
        set{ value = checkValue(newValue) } // newValue - standardowa nazwa argumentu setera (kiedy nie definiujemy argumentu setera)
//         set(nowe){ value = checkValue(nowe) } // powyższy zapis i ten "klasyczny" są równoważne
   }

    // Należy zdefiniować inicjalizator property - będzie on wywoływany pośrednio przez inicjalizatory obiektów używających tego property
    init(wrappedValue: Int){ value = checkValue(wrappedValue) }

    // Prywatna funkcja pomocnicza
    private func checkValue(_ val: Int) ->Int { return val < 0 ? -val : val}
 
    //=================
    // Można tworzyć własne funkcje dla tego property
     func message(){ print("Custom function") }
     func kwadrat() -> Int { return  value*value }
 }
// Koniec definicji opakowanego property
//--------------------------------------------------------------------------------------------------



// Testowanie opakowanego property
class Test{
    // Użycie "opakowanego" property jako atrybutów klasy
    @PropertyOne var x: Int
    @PropertyOne var y: Int
    
    init(_ jeden: Int, _ dwa: Int){
        x = jeden
        y = dwa
     }
    convenience init(){ self.init(0,0) }
    
    // wywołanie funkcji "custom" dla property x (tu wymaga to pobrania referencji do tego property, czyli trzeba użyć _x i _y)
    func message(){ _x.message() }
    func kwadraty() -> String {
        return String(_x.kwadrat()) + " " + String(_y.kwadrat())
    }
}


// Testowanie setera
var test1 = Test() // "Pusty" obiekt (dokładnie to: x = y = 0)
test1.x = -9 // tu używamy setera
test1.y = 11 // tu używamy setera
print(test1.x, test1.y) // tu wykorzystano geter

test1.message()
print()



// Testowanie inicjalizatora
var test2 = Test(5,-17)
print(test2.x, test2.y,"\n")

print(test1.kwadraty(), test2.kwadraty())
print()

