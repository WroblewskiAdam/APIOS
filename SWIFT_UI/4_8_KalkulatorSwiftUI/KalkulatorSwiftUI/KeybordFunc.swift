//
//  Created by apios on 12/11/2019.
//  Last modifications: 8-12-2021
//  Copyright © 2019-2021 apios. All rights reserved.
//

import SwiftUI

//-----------------------------------
// Definicja klawiatury funkcyjnej
//-----------------------------------


struct KeybordFunc: View {
    @ObservedObject var kalkulatorData: KalkulatorData
    
    let functionSign = ["+","-","*","/"]

    var body: some View {
        VStack {
            // Przyciski funkcyjne (+,-,*,/)
            Group {
                ForEach(0 ..< 4) { itemIn in
                    Button(action: { self.kalkulatorData.functionPush(KalkulatorCurrFunc.getIndexed(itemIn)) } ) {
                        Text(functionSign[itemIn])
                    }
                        .frame(width: 45, height: 33)
                        .background(Color.white)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                    Spacer()
                        .frame(width: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/, height: 9.0)
                }
            }
            .foregroundColor(Color.black)

            Spacer()
                .frame(width: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/, height: 3.0)
            
            // Przycisk =
            Button(action: { self.kalkulatorData.resultPush() } ) {
                Text("=")
            }
            .frame(width: 45, height: 33)
            .background(Color.white)
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
        }
        .foregroundColor(Color.black)
        
     }
}

struct KeybordFunc_Previews: PreviewProvider {
    static var previews: some View {
        KeybordFunc(kalkulatorData: KalkulatorData())
    }
}
