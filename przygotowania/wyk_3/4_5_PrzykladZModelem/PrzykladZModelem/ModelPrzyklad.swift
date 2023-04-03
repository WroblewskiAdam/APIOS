//
//  Created by Adam Wojtasik on 29/10/14.
//  Last modifications by Adam Wojtasik on 31/03/21.
//  Copyright (c) 2014-2017 Adam Wojtasik. All rights reserved.
//

import Foundation
import UIKit

// Model
class ModelPrzyklad{
    
    // referencja do kontrolera
    var controller: ViewController?
    func setLinkToController(_ cont: ViewController){ controller = cont }
    
    // properties (inicjalizowane wartościami startowymi)
	// przechowują informację o ostatnio wciśniętych guzikach
	// każda zmiana tych danych powoduje obliczenie nowego wyniku
	private var pierwsza = 1.0 { didSet{ ustawWynik() } }
    private var druga = 1.0    { didSet{ ustawWynik() } }
    var wynikTekst = "suma"    { didSet{ ustawWynik() } }
	// wynik obliczany z ostatnio wciśniętych guzików z użyciem aktualnego działania
    var wynik: Double = 2.0 { didSet{ controller?.displayModel() }} // Informacja o zmianie wyniku jest przesyłana jest do kontrolera

    // properties obliczeniowe
    private var suma:    Double{ get{ return pierwsza+druga } }
	private var różnica: Double{ get{ return pierwsza-druga } }
    private var średnia: Double{ get{ return suma/2.0 } }

	// pomocnicza metoda do wykonywania aktualnego działania
    private func ustawWynik(){
        switch wynikTekst{
        case "suma":    wynik = suma
        case "różnica": wynik = różnica
        case "średnia": wynik = średnia
		default:        wynik = 0.0
        }
    }

	// Metody odbierające sygnały od kontrolera
    func ustawDziałanie(_ tekst: String){ wynikTekst = tekst }
	func ustawPierwszą(_ theString: String){ pierwsza = Double(theString)! }
	func ustawDrugą(_ theString: String){ druga = Double(theString)! }
}

