//
//  Created by Adam Wojtasik on 22/04/2021.
//

// Własny modyfikator animujący

import SwiftUI

struct ContentView: View {
    
    @State var percentage: Double = 0.0
    @State var flag = true

    var body: some View {
        VStack {
            Rectangle()
            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            .mójAnimatorOpacity(percentage: percentage)
            
            Button("Animuj") {
                withAnimation(.easeInOut(duration: 3.0)) {
                    self.percentage = flag ? 1.0 : 0.0
              }
                flag.toggle()
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

    // Wartość docelowa stanu obiektu animowanego
    // przekazywana w inicjalizatorze animatora
  var percentage: Double

  // aktualny stan obiektu animowanego
  private var currOpacity: Double { percentage } // klauzura ta jest domyślnie geterem

  // Specjalne property wyliczeniowe do dostępu do stanu obkektu animowanego
  // (tak się musi nazywać)
  var animatableData: Double {
    get { percentage }
    set { percentage = newValue }
  }

  func body(content: Content) -> some View {
    content
    .opacity(currOpacity)
   }
}


// Definicja własnego modyfikatora
// - roszerzenie View
extension View {
    func mójAnimatorOpacity(percentage: Double) -> some View {
        modifier(
            OpacityAnimModifier(
                percentage: percentage
            )
        )
    }
}

