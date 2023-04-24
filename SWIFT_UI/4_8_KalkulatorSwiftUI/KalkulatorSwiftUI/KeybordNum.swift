//
//  Created by apios on 12/11/2019.
//  Last modifications: 8-12-2021
//  Copyright © 2019-2021 apios. All rights reserved.
//

import SwiftUI

//-----------------------------------
// Definicja klawiatury numerycznej
//-----------------------------------

struct KeybordNum: View {
    @ObservedObject var kalkulatorData: KalkulatorData

    var body: some View {
        VStack {
            // pierwsze trzy rzędy klawiszy
            ForEach(0 ..< 3) { item in
                HStack {
                    ForEach(1 ..< 4) { itemIn in
                        Button(action: { self.kalkulatorData.numericPush(3*item+itemIn) } ) {
                            Text("\(3*item+itemIn)")
                               .foregroundColor(Color.black)
                        }
                        .frame(width: 45, height: 45)
                        .background(Color.white)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                    }
                }
                Spacer()
                    .frame(width: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/, height: 8.0)
                }

            // ostatni rząd klawiszy
            HStack {
                Group {
                    Button(action: { self.kalkulatorData.clearPush() } ) {
                        Text("CE")
                    }
                    Button(action: { self.kalkulatorData.numericPush(0) } ) {
                        Text("0")
                    }
                    Button(action: { self.kalkulatorData.dotPush() } ) {
                        Text(".")
                    }
                }
                .foregroundColor(Color.black)
                .frame(width: 45, height: 45)
                .background(Color.white)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

struct KeybordNum_Previews: PreviewProvider {
    static var previews: some View {
        KeybordNum(kalkulatorData: KalkulatorData())
    }
}

