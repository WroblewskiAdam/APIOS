//
//  Created by Adam Wojtasik on 22/04/2021.
//

// Własny modyfikator animujący

import SwiftUI

struct ContentView: View {
    
    @State var percentage: Double = 0.0
    @State var percentage1: Double = 1.0
    @State var flag = true

    var body: some View {
        VStack {
            Rectangle()
            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            .mójAnimatorOpacity(percentage: percentage)
            
            Text("TEST")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .mójAnimatorOpacity(percentage: percentage1)

            Button("Animuj") {
                withAnimation(.easeInOut(duration: 4.0)) {
                    self.percentage = flag ? 1.0 : 0.0
                    self.percentage1 = flag ? 0.0 : 1.0
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

  var percentage: Double

  private var currOpacity: Double { percentage } // klauzura ta jest domyślnie geterem

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
extension View {
    func mójAnimatorOpacity(percentage: Double) -> some View {
        modifier(
            OpacityAnimModifier(
                percentage: percentage
            )
        )
    }
}

