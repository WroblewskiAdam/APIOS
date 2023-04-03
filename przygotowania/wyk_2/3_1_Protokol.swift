//
//  Created by Adam Wojtasik on 15/04/2017.
//  Copyright © 2017 Institute of Microelectronics and Optoelectronics. All rights reserved.
//  Last modifications on 4/11/2020.
//

import Foundation // trzeba zaimportowac, gdy używamy @objc (patrz niżej)

// Protokół, który wymaga od impementujących go klas istnienia dwóch properties
protocol CoMaByć{
	//
	var ileKół: Int {set get} // musi być property typu Int mający seter i geter
	var ileOpon: Int {get}    // musi być property typu Int mający seter
}

// Protokół "opcjonalny" (w Swift 5 musi być "protokołem ściśle współpracjującym z Objective-C")
// W implementującej klasie nie musi być takiej metody, ale jeżeli będzie, to musi być właśnie taka
@objc protocol CoMaByć_Dwa{
	@objc optional func prędkość() -> Double
}

// Protokół może implementować inny protokół (można powiedzieć, protokołu mogą "dziedziczyć" po sobie)
// Protokół wymagający tego samego co "CoMaByć" i dodatkowo implementacji jednej metody
protocol CoMaByć_Trzy : CoMaByć{
	func jakiePaliwo() -> String
}

// Można iplementować wiele protokołów
// np. klasa iplementująca dwa protokoły:
class Pojazd: CoMaByć_Trzy, CoMaByć_Dwa{

	// property implementowane jako alokowalne (nie trzeba tworzyć setera i getera, bo tego
	// rodzaju property mają te metody "z definicji"
	var ileKół: Int

	// property implementowane jako obliczeniowe
    var ileOpon: Int {
        get{ return ileKół+1 }
    }
	
	// implementacja metody wymaganej przez protokół
    func jakiePaliwo() -> String{ return "?????" }
 
    init(ile: Int){ ileKół = ile }
}

// Klasa pochodna ma swoją wersję metody wymaganej przez protokół
class Rower: Pojazd{
    override func jakiePaliwo() -> String{ return "mięśnie" }
}

var samochód = Pojazd(ile: 5)
print(samochód.ileKół)
print(samochód.ileOpon)

var mojRower: Pojazd = Rower(ile: 2)
print(mojRower.jakiePaliwo())
