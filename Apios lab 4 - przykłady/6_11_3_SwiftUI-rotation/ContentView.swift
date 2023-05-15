//
//  Created by apios on 24/11/2019.
// Last modifications: 30/09/2022
//  Copyright © 2022 apios. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var rotation: Double = 0.0
    @State private var direction: Bool = true

    var body: some View {
        VStack {
            
              Button("Obróć"){
 //                 withAnimation(Animation.linear(duration: 2.0)){
//                withAnimation(Animation.easeInOut(duration: 2.0)){
//              withAnimation(.interpolatingSpring(mass: 50, stiffness: 100, damping: 300, initialVelocity: 1)) {
                withAnimation(.interpolatingSpring(mass: 50, stiffness: 100, damping: 300, initialVelocity: 10)) {
 
                    self.rotation += direction ? 360 : -360
                }
            }

            Spacer()
              .frame(width: CGFloat(1.0), height: CGFloat(85.0))
            
            Image("panorama-warszawy")
                .scaleEffect(0.5)
                .padding(.horizontal, -282)
                .padding(.vertical, -112)
                .clipShape(Circle())
                .rotation3DEffect(.degrees(rotation), axis: (x:1, y: 1, z: 1))
            Spacer()
              .frame(width: CGFloat(1.0), height: CGFloat(85.0))
            Button(direction ? "Clockwise" : "Counterclockwise") {
                direction = !direction
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//withAnimation(.interpolatingSpring(stiffness: 30, damping: 3))
//withAnimation(.linear(duration: 3))
//withAnimation(.interpolatingSpring(mass: 50, stiffness: 100, damping: 30, initialVelocity: 1))

