//
//  Created by Adam Wojtasik on 22/04/2021.
//

// Własny modyfikator animujący

import SwiftUI

struct ContentView: View {
    
    @State var percentage: Double = 0.3
    @State var color: Color = .blue
    @State var flag = true

    var body: some View {
        VStack {
            Rectangle()
            .foregroundColor(color)
            .mójAnimatorOpacity(percentage: percentage)
            .mójAnimatorColor(color: color)

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

struct ColorAnimModifier: AnimatableModifier {

    // Wartość docelowa stanu obiektu animowanego
    // przekazywana w inicjalizatorze animatora
  var color: Color

  // aktualny stan obiektu animowanego
  private var currColor: Color { color } // klauzura ta jest domyślnie geterem

  // Specjalne property wyliczeniowe do dostępu do stanu obkektu animowanego
  // (tak się musi nazywać)
  var animatableData: Color {
    get { color }
    set { color = newValue }
  }

  func body(content: Content) -> some View {
    content
    .foregroundColor(currColor)
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
extension View {
    func mójAnimatorColor(color: Color) -> some View {
        modifier(
            ColorAnimModifier(
                color: color
            )
        )
    }
}

