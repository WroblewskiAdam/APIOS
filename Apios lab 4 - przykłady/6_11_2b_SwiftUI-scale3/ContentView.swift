//
//  Created by apios on 24/11/2019.
//  Last modifications 03/12/2020
//  Copyright © 2019 apios. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var skala: CGFloat = 4
    @State private var value: CGFloat = 4

    var body: some View {
        VStack {
            HStack(){
                Spacer()

                Stepper(
                    "Skala:",
                    value: $value ,
                    in: 1...4
                ){_ in
                   withAnimation(.easeInOut(duration: 1 ), { skala = value } )
                }
            }
            Spacer()
              .frame(width: 1.0, height: 85.0)
            
            VStack(alignment: .center){
                Image("panorama-warszawy")
                    .scaleEffect(0.5)
                    .padding(.horizontal, -282)
                    .padding(.vertical, -112)
                    .clipShape(Circle())
                    .scaleEffect(self.skala / 2.5)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

