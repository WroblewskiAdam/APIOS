
import Cocoa

// Rozszerzać można również typy "wbudowane"
extension Int{
    // rozszerzenie może dodać funkcję
	func kwadrat() -> (Int){ return self * self }
    
    // rozszerzenie może dodać property obliczeniowe
    var sześcian: Int{
        get{ return kwadrat() * self }
    }
}

let liczba : Int = 5

print( liczba.kwadrat() )
print( 46.kwadrat() )
print()

print( liczba.sześcian )
print( 6.sześcian )
