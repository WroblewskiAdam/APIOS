//
//  Created by apios on 12/11/2019.
//  Last modifications: 8-12-2021
//  Copyright © 2019-2021 apios. All rights reserved.
//


import SwiftUI
import Combine

//-----------------------------------
// Model kalkulatora
//-----------------------------------

// Typ wyliczeniowy dla przechowywania informacji o aktualnie wybranym działaniu
enum KalkulatorCurrFunc {
    case kalkulatorAddition, kalkulatorSubtraction, kalkulatorMultiplication, kalkulatorDivision
    case kalkulatorNone
    init(){ self = .kalkulatorNone }
    
    static func getIndexed(_ inx: Int) -> KalkulatorCurrFunc {
        switch inx{
        case 0:  return .kalkulatorAddition
        case 1:  return .kalkulatorSubtraction
        case 2:  return .kalkulatorMultiplication
        case 3:  return .kalkulatorDivision
        default: return .kalkulatorNone
        }
    }
}


// Model kalkulatora

final class KalkulatorData: ObservableObject  {
    
    // Wartość wyjściowa powiązana z interfejsem
    @Published var dispValue = 0.0
    
    // flaga wystąpienia kropki w aktualnie wybieranej sekwencji cyfr
    private var dotFlag = false

    // mnożnik do kolejnej cyfry po wystąpieniu kropki
    var dotMult = 0.1
    
    // poprzednia wartość liczbowa
    private var prevValue: Double = 0.0;

    // aktualnie wybrana funkcja
    private var currFunc = KalkulatorCurrFunc()

    // flaga początku obliczeń
    private var startFlag = true

//--------------------------------------------------------------
// Metody wywoływane z interfejsu graficznego:
    
// metoda interpretująca naciśnięcie przycisku numerycznego
    func numericPush(_ inpData: Int){
        if startFlag {
            dispValue = 0.0
            startFlag = false
        }
 
        if dotFlag {
            dispValue += Double(inpData)*dotMult
            dotMult *= 0.1
        }
        else {
            dispValue = dispValue*10 + Double(inpData)
        }
    }

// metoda wywoływana po naciśnięciu kropki
    func dotPush(){ dotFlag = true }

// metoda wywoływana po naciśnięciu CE
    func clearPush(){
        dispValue = 0.0
        prevValue = 0.0
        dotMult = 0.1
        currFunc = .kalkulatorNone
        dotFlag = false
        startFlag = true
    }

// metoda interpretująca naciśnięcie przycisku "="
    func resultPush(){

        // obliczenie wyniku dla aktualnego działania
        switch currFunc{
            case .kalkulatorNone:           prevValue  = dispValue
            case .kalkulatorAddition:       dispValue += prevValue
            case .kalkulatorSubtraction:    dispValue  = prevValue-dispValue
            case .kalkulatorMultiplication: dispValue *= prevValue
            case .kalkulatorDivision:       dispValue  = prevValue/dispValue
        }
        
        // przygotowanie do następnych obliczeń
        prevValue = dispValue
        currFunc = .kalkulatorNone
        dotFlag = false
        startFlag = true
    }

// metoda interpretująca naciśnięcie przycisku funkcyjnego
    func functionPush(_ operation: KalkulatorCurrFunc){
        if currFunc == .kalkulatorNone{
            prevValue = dispValue
            dotFlag = false
            startFlag = true
        }
        else { resultPush() }

        currFunc = operation
        dispValue = 0.0
        dotMult = 0.1
    }
}
