//  Created by Adam Wojtasik on 11/11/2017.
//  Last revision on 25/11/2021.
//  Copyright © 2017-2021 AW. All rights reserved.
//

// Model Kalkulatora - zajmuje się "logiką biznesową" naszego projektu:
// przechowuje dane, różnego rodzaju informacje, zapamiętuje sekwencje
// naciskania przycisków i wykonuje obliczenia

import Cocoa

class CalcModel{

//-------------------------------------------------------------
// Atrybuty stanu kalkulatora

// przechowywanie informacji o aktualnie wybranym działaniu
	private enum CurrFunc{
		case none, plus, minus, mul, div

        init(){ self = .none }

		mutating func set(_ operation:Int){
			switch operation {
                case 1:  self = .plus
                case 2:  self = .minus
                case 3:  self = .div
                default: self = .mul
			}
		}
	}
	private var currFunc = CurrFunc()

// flaga wystąpienia kropki w aktualnie wybieranej sekwencji cyfr
	private var dotFlag = false

// flaga początku obliczeń
	private var startFlag = true

// poprzednia wartość liczbowa
	private var prevValue: Double = 0.0;

    

//----------------------
// string, jaki powinien pojawić się na wyświetlaczu - jest obserwowany przez kontroler:
// zmiana tego tekstu skłoni kontroler do zmiany zawartości wyświetlacza
    var displayStringValue = "0.0"{
        didSet{
            let notificationCenter = NotificationCenter.default
            let notification = Notification(name: Notification.Name(rawValue: "resultChangedNotification"), object: nil)
            notificationCenter.post(notification)
        }
    }
//-------------------------------------------------------------

    
    
    
//-----------------------------------------------------------------------------
// Metody przeznaczone do interpretowania sygnałów pochodzących z kontrolera

// metoda interpretująca naciśnięcie przycisku numerycznego lub kropki
	func numericPush(_ numberPushed: String){
		// ustawianie wyświetlacza przy rozpoczynaniu nowych obliczeń
		if startFlag {
			startFlag = false
			if numberPushed == "." {
				displayStringValue = "0."
				dotFlag = true
			}
			else { displayStringValue = "" }
		}

		// wpisywana jest tylko pierwsza kropka, następne są ignorowane
		// pozostałe znaki (znaki cyfr) są zawsze dodawane na koniec tekstu dla wyświetlacza
        var newString = numberPushed
        if numberPushed == "." {
           if dotFlag { newString = "" }
           else { dotFlag = true }
        }

        displayStringValue += newString
	}

// metoda interpretująca naciśnięcie przycisku "="
	func resultPush(){
		var currNumericValue = Double(displayStringValue)!
        
        print(prevValue)
        print(currNumericValue)

		// obliczenie wyniku dla aktualnego działania
		switch currFunc{
            case .none:  prevValue  = currNumericValue
            case .plus:  currNumericValue += prevValue
            case .minus: currNumericValue  = prevValue-currNumericValue
            case .mul:   currNumericValue *= prevValue
            case .div:   currNumericValue  = prevValue/currNumericValue
		}

		// wstawienie wyniku w postaci stringu dla wyświetlacza
		displayStringValue = String(currNumericValue)
		
		// przygotowanie do następnych obliczeń
		prevValue = currNumericValue
		currFunc  = .none
		dotFlag   = false
		startFlag = true
	}

// metoda interpretująca naciśnięcie przycisku funkcyjnego
	func functionPush(_ operation: Int){
		if currFunc == .none{
			prevValue = Double(displayStringValue)!
			dotFlag   = false
			startFlag = true
		}
		else { resultPush() }
		currFunc.set(operation)
	}

// metoda interpretująca naciśnięcie przycisku "C"
	func clearPush(){
		// wyzerowanie wszystkiego - przygotowanie do liczenia "od zera"
		displayStringValue = "0.0"
		currFunc  = .none
		prevValue = 0.0
		dotFlag   = false
		startFlag = true
	}
}
