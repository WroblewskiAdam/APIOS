//
//  Created by Adam Wojtasik on 22/04/2021.
// Last modifications: 5.05.2022.
//

// Własny modyfikator animujący - synchronizacja animacji

import SwiftUI

let durationSec = 3.0

struct ContentView: View {
    
    @State var opacity: Double = 0.0
    @State var flag: Bool = false

    var body: some View {
        VStack {
            ZStack{
                Rectangle()
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                // pierwsza animacja
                .mójAnimatorOpacity(animValue: opacity, finalValue: 1.0)
                    { // Klauzura przekazywana do animatora jako onFinish.
                      // Uruchamia drugą animację
                        flag = false
                        withAnimation(.easeInOut(duration: durationSec)) {
                            self.opacity = 0.0 // wartość docelowa transparentności
                            flag = true
                        }
                     }

                if flag {
                    Text("Koniec")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(.black)
                }
            }

            
            Button("Animuj") {
                flag = false // skasowanie "Koniec"
                // Uruchomienie pierwszej animacji
                withAnimation(.easeInOut(duration: durationSec)) {
                    self.opacity = 1.0 // wartość docelowa transparentności
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


// Definicja własnego animatora

struct OpacityAnimModifier: AnimatableModifier {

  var animValue: Double
  var finalValue: Double
  var onFinish: () -> () = { }

  private var currOpacity: Double { animValue } // klauzura ta jest domyślnie geterem

  var animatableData: Double {
    get { animValue }
    set {
      animValue = newValue
      checkIfFinished()
    }
  }

// Zdefiniowanie funkcji sprawdzającej czy trwa animacja
// i uruchamiającej onFinish po osiągnięciu stanu docelowego animacji
  func checkIfFinished() -> () {
    if animValue == finalValue {
        DispatchQueue.main.async {
            self.onFinish()
        }
    }
 }

    
    
  func body(content: Content) -> some View {
    content
    .opacity(currOpacity)
  }
}


// Definicja własnego modyfikatora
extension View {
    func mójAnimatorOpacity(animValue: Double,
                            finalValue: Double,
                            onFinish: @escaping ()->()) -> some View {
        modifier(
            OpacityAnimModifier(
                animValue: animValue,
                finalValue: finalValue,
                onFinish: onFinish
            )
        )
    }
}

