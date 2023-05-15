//
//  Created by Adam Wojtasik on 26/11/2019.
//  Last modifications on 21/05/2020.
//  Copyright © 2019 Adam Wojtasik. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var show1 = true
    @State private var show2 = true

    @State private var done = false

    @State private var rotation: Double = 0.0

    var body: some View {
        
        VStack {
            Spacer()
            if show1 && show2 {
// pierwsza piłka
                Image(getBall())
                    // pojawia się i znika w różny sposób
                    .transition(
                        .asymmetric(
                            insertion: AnyTransition.opacity.animation(.linear(duration: Double.random(in: 5...9))),
                            removal: AnyTransition.scale.animation(.easeInOut(duration: Double.random(in: 1...6)))
                        )
                    )
// kiedy piłka zniknie wysyłany jest sygnał do powtórnego pojawienia się
                    .onDisappear{
                        self.show1.toggle()
                    }
            }

            if show1 && show2 {
            // druga piłka
                Image(getBall())
                    .transition(
                        .asymmetric(
                            // pojawia się i znika w różny sposób
                            insertion: AnyTransition.opacity.animation(.linear(duration: Double.random(in: 1...5))),
                            removal: AnyTransition.scale.animation(.easeInOut(duration: Double.random(in: 4...7)))
                        )
                    )
// kiedy piłka zniknie wysyłany jest sygnał do powtórnego pojawienia się
                    .onDisappear{
                        self.show2.toggle()
                    }
            }

            Spacer()

            Button("Click") {
                self.show1.toggle()
                self.show2.toggle()
}
            .padding(20)

         }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// pomocnicza funkcja generująca "przypadkową" piłeczkę
func getBall() -> String {
    switch Int.random(in: 0...6) {
    case 0: return "Baseball"
    case 1: return "Basketball"
    case 2: return "Billiardball"
    case 3: return "Football"
    case 4: return "Golfball"
    case 5: return "Tennisball"
    default: return "Volleyball"
    }
}




