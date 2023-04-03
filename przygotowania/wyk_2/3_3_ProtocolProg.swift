//
//  Created by Adam Wojtasik on 20/11/2017.
//  Copyright © 2017 AW. All rights reserved.
//  Ostatnie poprawki: 23.04.2020
//
// Przykład pokazujący ideę programowania protokołowego w Swifcie

// Na dwuwymiarowej planszy znajdują się różne obiekty:
// - Roboty mogące przesuwać się na ograniczoną odległość na planszy
// - "Pchły" mogące "skakać" na dowolną odległość
// - nieruchome Baterie, w których Roboty ładują swe akumulatory
// - nieruchome Pułapki, w które mogą wpaść Roboty i Pchły
// Pchły po wpadnięciu do pułapki są niszczone,
// Roboty mogą zniszczyć pułapkę, jeżeli ich "moc" jest większa od "mocy" pułapki

import Foundation

// Definicja stałych
struct Dimensions{
    // rozmiary tablicy
    static let dx = 50
    static let dy = 50

    // stałe pomocnicze zależne od rozmiarów tablicy
    static var low: Int { get{ return dx/3 } }
    static var upp: Int { get{ return 2*dx/3 } }
}

// Położenie w tablicy będzie przechowywane w dwuelementowej krotce (Int,Int)
// Uwaga: krotka to też typ

// Zdefiniowanie aliasu dla krotki dwuelementowej przechowującej współrzędne
typealias Point = (Int,Int)




//-------------------------------------------------------------------------------
// protokół wymagań lokacyjnych dla obiektu znajdującego się na planszy
protocol Location {
    // Lokalizacja zapisana w dwuelementowej krotce Point
    // Zastosowano tu dwa property - jedno będzie alokowalne, a drugie obliczalne.
    // Dzięki temu zabiegowi będzie można tak zmodyfikować setter, by wstawianie do location
    // miało zawsze sprawdzanie poprawności wstawianych współrzędnych.
    var _location: Point { get set }
    var  location: Point { get set }

    // prototyp funkcji usuwającej wskazany przez indeks obiekt z tablicy obiektów implementujących protokół Location
    // i zwracającej referencję do zmienionej tablicy
    func destroy(_ index: Int, from coll: [Location]) -> [Location]
    
    // prototyp pomocniczej funkcji zwracającej rodzaj obiektu na planszy (opis tekstowy)
    func kind() -> String
}





//-------------------------------------------------------------------------------
// protokoły "rozszerzające" typ protokołowy Location ze względu na możliwość likwidowania
// obiektów, które implementują dany protokół
protocol Destructible : Location{}
protocol NonDestructible : Location{}







// rozszerzenie protokołu Location:
// - w rozszerzeniu tym mogą być ciała funkcji, a nie tylko ich prototypy
// - rzeczy tu zdefiniowane są "defaultowe" dla typów implementujących ten protokół

extension Location{
    // dodefiniowanie obliczalnego property location i powiązanie go z alokowalnym property _location
    var location: Point {
        set(newLocation){ _location = checkLocation(theLocation: newLocation) }
        get{ return _location }
    }
    
    // Pomocnicza lokalna funkcja sprawdzająca, czy współrzędne nie wychodzą poza planszę
    // Jeżeli wychodzą - współrzędne są „obcinane” do rozmiarów tablicy
    internal func checkLocation(theLocation: Point) -> Point{
        // Sprawdzenie, czy obiekt nie jest umieszczony poza planszą (horyzontalnie)
        var xx : Int
        if(theLocation.0 > Dimensions.dx){ xx = Dimensions.dx }
        else if theLocation.0 < 0 { xx = 0 }
        else { xx = theLocation.0 }
        
        // Sprawdzenie, czy obiekt nie jest umieszczony poza planszą (vertykalnie)
        var yy : Int
        if(theLocation.1 > Dimensions.dy){ yy = Dimensions.dy }
        else if theLocation.1 < 0 { yy = 0 }
        else { yy = theLocation.1 }
        
        return (xx, yy)
    }

    // Funkcja pomocnicza generująca przypadkowe współrzędne
    func randomLocation() -> Point { return (Int.random(in: 0...Dimensions.dx), Int.random(in: 0...Dimensions.dy)) }

    //pomocnicza funkcja do wydruku współrzędnych
    func printLocation(str: String) { print("\(str) \(_location)") }
}





// rozszerzenie warunkowe protokołu Location - realizowane jest tylko wtedy, gdy
// typ implementujący protokół spełnia wskazany warunek:
// jeżeli dany typ implementuje także protokół Destructible, to realizuj rozszerzenie
extension Location where Self: Destructible {
    // dodefiniowanie funkcji usuwającej obiekt z tablicy
    func destroy(_ index: Int, from coll: [Location])-> [Location] {
        var arr = coll
        arr.remove(at: index)
        return arr
    }
}
// rozszerzenie warunkowe protokołu Location - realizowane jest tylko wtedy, gdy
// typ implementujący protokół spełnia wskazany warunek:
// jeżeli dany typ implementuje także protokół NonDestructible, to realizuj rozszerzenie
extension Location where Self: NonDestructible {
    // tutaj dodefiniowanie funkcji jest tylko zaślepką, bo nie powinno być usuwania
    func destroy(_ index: Int, from coll: [Location])-> [Location] { return coll }
}





//-------------------------------------------------------------------------------
// protokół dla mogącego się przesuwać obiektu - wymaganie implementacji funkcji ustalającej owe położenie
protocol Moveable : Location {
    mutating func setNewLocation(newLocation: Point )
}



// dodatkowe protokoły wymagań dla poszczególnych obiektów, które mogą się poruszać:
// - dla obiektu mogącego skakać na dowolną odległość
protocol Jumper : Moveable{}
// - dla obiektu mogącego przesuwać się co najwyżej o ustalony "krok"
protocol Stepper : Moveable {
    var step: Int { get }
}





// Rozszerzenia warunkowe protokołu Moveable:

// postać funkcji ustalającej nowe współrzędne w przypadku, gdy rozpatrywany będzie Stepper
extension Moveable where Self: Stepper {
    mutating func setNewLocation(newLocation: Point){
        print("I am Stepper - moved from \(_location)")
        // ustalenie kierunku "skoku"
        var xx: Int
        if newLocation.0 <= Dimensions.low { xx = -1 }
        else if newLocation.0 > Dimensions.upp { xx = 1 }
        else { xx = 0 }
        var yy: Int
        if newLocation.1 <= Dimensions.low { yy = -1 }
        else if newLocation.1 > Dimensions.upp { yy = 1 }
        else { yy = 0 }
        
        // ustalenie nowych współrzędnych
        xx = location.0 + xx*step
        yy = location.1 + yy*step
        location = (xx, yy)      // uwaga: zabezpieczenie przed wyjściem z tablicy znajduje się w seterze location
        printLocation(str: "        to new location: ")
    }
}
// postać funkcji ustalającej nowe współrzędne w przypadku, gdy rozpatrywany będzie Jumper
extension Moveable where Self: Jumper {
    mutating func setNewLocation(newLocation: Point){
        print("I am Jumper - moved from  \(_location)")
        location = newLocation      // uwaga: ograniczenie skoku do rozmiaru tablicy znajduje się w seterze location
        printLocation(str: "        to new location: ")
    }
}





//-------------------------------------------------------------------------------
// protokół dla typów mających "moc"
protocol Power {
    var power: Double {set get}
}


// itd., itp.



//****************************************************************************************************************
// Definicje typów obiektów mogących "przebywać" na planszy
class Robot : Destructible, Stepper, Power {
    internal var _location: Point = (0,0)
    var power = 100.0
    init(){
        print("tworzę robota")
        _location = randomLocation()
    }
    deinit{ print("kasuję robota") }

    var step = Int.random(in: 1...2)
 
    func kind() -> String { return "Robot" }
}




class Flea : Destructible, Jumper {
    internal var _location: Point = (0,0)
    init(){
        print("tworzę pchłę")
        _location = randomLocation()
    }
    deinit{ print("kasuję pchłę") }
    func kind() -> String { return "Pchła" }
}

class Trap : Destructible, Power {
    internal var _location: Point = (0,0)
    var power = 100.0
    init(){
        print("tworzę pułapkę")
        _location = randomLocation()
    }
    deinit{ print("kasuję pułapkę") }
    func kind() -> String { return "Pułapka" }
}

class Battery : NonDestructible, Power {
    internal var _location: Point = (0,0)
    var power = 500.0
    init(){
        print("tworzę baterię")
        _location = randomLocation()
    }
    deinit{ print("kasuję baterię") }
    func kind() -> String { return "Bateria" }
}


//****************************************************************************************************************
// Plansza
class Map {
    private var objects = [Location]()
    init(){
        // tworzenie obiektów na planszy
        objects.append(Robot())
        objects.append(Flea())
        objects.append(Trap())
        objects.append(Battery())
        for _ in 0 ..< 10 { objects.append(randomObject()) }
    }
    
    var count: Int{ get{ return objects.count } }
    
    func get(_ idx: Int) -> Location { return objects[idx]}
    
    func destroy(_ idx: Int){ objects = get(idx).destroy(idx, from: objects) }

    private func randomObject() -> Location {
        switch Int.random(in: 0...3) {
        case 0:  return Robot()
        case 1:  return Flea()
        case 2:  return Trap()
        default: return Battery()
        }
    }
    
    // Metoda pomocnicza do wyprowadzenia zawartości mapy na konsolę
    func printContent(){
        // Uwaga: wywołanie funkcji kind() jest wirtualne, choć nie mamy w tym kodzie żadnego dziedziczenia klas
        print("---------------------------------------------")
        for idx in 0 ..< objects.count { objects[idx].printLocation(str: objects[idx].kind() ) }
        print("---------------------------------------------")
     }
}


//****************************************************************************************************************
// Testowanie podstawowych funkcjonalności obiektów znajdujących się na planszy
struct Simulation<T: Map>{ // struktura generyczna
    var map: T
    
    func run() {
         map.printContent()

        // presuwanie obiektów na planszy
        for idx in 0 ..< map.count {
            if map.get(idx) is Moveable {
                // W poniższym zapisie po raz kolejny widać, że prototyp jest typem
                // move jest typu moveable, czyli obiektem klasy iplementującej protokół Moveable
                var move = map.get(idx) as! Moveable
                move.setNewLocation(
                    newLocation: (Int.random(in: 0...Dimensions.dx), Int.random(in: 0...Dimensions.dy))
                )
            }
        }
         map.printContent()

        
        // usuwanie obiektów z planszy
        externalLoop: while map.count != 0 {
            var curr = 0
            internalLoop: while curr <= map.count {
                if curr == map.count{ break externalLoop }
                if map.get(curr) is Destructible { break internalLoop }
                curr += 1
            }
            map.destroy(curr)
        }
        map.printContent()
    }
    
 }


let simulation = Simulation(map: Map()) // Tworzenie struktury generycznej z bezpośrednim inicjalizowaniem atrybutów
simulation.run()      // uruchomienie symulacji



