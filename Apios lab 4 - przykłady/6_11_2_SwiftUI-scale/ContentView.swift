//
//  ContentView.swift
//  Animation_2
//
//  Created by apios on 24/11/2019.
//  Copyright © 2019 apios. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var skala: CGFloat = 4

    var body: some View {
        VStack {
            HStack(){
                Spacer()
 
                Stepper("Skala:", value: self.$skala, in: 1...4)
                .frame(width: 150, alignment: .trailing)
                .padding()
            }
            Spacer()
              .frame(width: 10.0, height: 85.0)
            
            VStack(alignment: .center){
                Image("panorama-warszawy")
                    .scaleEffect(0.5)
                    .padding(.horizontal, -282)
                    .padding(.vertical, -112)
                    .clipShape(Circle())
// animacja
                    .scaleEffect(self.skala / 2.5)
                    .animation(
                        Animation.easeInOut(duration: 1.0),
//                       Animation.interpolatingSpring(stiffness: 30, damping: 1),
                       value: self.skala)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
