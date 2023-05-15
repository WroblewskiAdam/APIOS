//
//  Created by Adam Wojtasik on 22/04/2021
// Last modifications: 20.04.2023
//

// Własny modyfikator animujący (złożony)

import SwiftUI

struct ContentView: View {
    
    @State var percentage: Double = 0.3
    @State var color: Color = .blue
    @State var flag = true

    var body: some View {
        VStack {
            Rectangle()
            .foregroundColor(color)
            .mójAnimator(percentage: percentage, color: color)

            Button("Animuj") {
                withAnimation(.linear(duration: 3.0)) {
                    self.percentage = flag ? 1 : 0.3
                    self.color = flag ? .green : .blue
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

struct AnimModifier: AnimatableModifier {

    // Wartość docelowa stanu obiektu animowanego
    // przekazywana w inicjalizatorze animatora
  var percentage: Double
  var color: Color

  // aktualny stan obiektu animowanego
  private var currOpacity: Double { percentage } // klauzura ta jest domyślnie geterem
  private var currColor: Color { color } // klauzura ta jest domyślnie geterem

  // Specjalne property wyliczeniowe do dostępu do stanu obkektu animowanego
  // (tak się musi nazywać)
  var animatableData: (Double,Color) {
    get { (percentage,color) }
      set { percentage = newValue.0; color = newValue.1 }
  }

  func body(content: Content) -> some View {
    content
    .opacity(currOpacity)
    .foregroundColor(currColor)
 }
}


// Definicja własnego modyfikatora
// - roszerzenie View
extension View {
    func mójAnimator(percentage: Double, color: Color) -> some View {
        modifier(
            AnimModifier(
                percentage: percentage,
                color: color
            )
        )
    }
}

