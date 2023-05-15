//
//  Created by apios on 03/12/2020.
//  Last modifications: 22.04.2021
//

import SwiftUI

let durationSec = 3.0

// Klauzura służąca do uruchomienia jakiejś czynności (function) po określonym czasie
// Ponieważ function będzie uruchamiana poza poniższą klauzurą,
// trzeba użyć typu @escaping
let completionAfter = { (_ afterSec: Double, _ function: @escaping ()->Void) -> Void
    in
    let theQueue = DispatchQueue.global(qos: DispatchQoS.QoSClass.utility)
    theQueue.asyncAfter(
        deadline: DispatchTime.now() + Double(Int64(afterSec * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC),
        execute: { function() }
    )
}




struct ContentView: View {
    @State private var opacityValue = 0.0
    @State private var koniec = false

    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .opacity(opacityValue)
                    // animacja ma trwać durationSec sekund
                    .animation(Animation.linear(duration: durationSec))

                if koniec {
                    Text("Koniec")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(.black)
                }
            }
            
            Button(action: {
                   koniec = false
                   opacityValue = 1.0
                // po czasie przeznaczonym na animację będzie wykonana następna czynność:
                // animacja powrotna
                    completionAfter( durationSec, {
                        opacityValue = 0.0
                        // po zakończeniu animacji powrotnej będzie pokazany napis
                        completionAfter( durationSec, { koniec.toggle() } )
                    } )
            }) {
                Text("Animuj")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
