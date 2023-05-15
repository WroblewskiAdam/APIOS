//
//  ContentView.swift
//  Animation_1
//
//  Created by apios on 24/11/2019.
//  Copyright © 2019 apios. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    @State private var isPictureVisible = false


    var body: some View {
        VStack() {
            Button(action: {self.isPictureVisible.toggle()} ) {
                Text(isPictureVisible ? "skasuj obrazek" : "pokaż obrazek")
            }
           .animation(Animation.linear(duration: 2), value: isPictureVisible)


            
            if isPictureVisible {
               Image("panorama-warszawy")
                .clipShape(Circle())
                .transition(AnyTransition.slide) // sposób pojawiania się i znikania
                .animation(
                    Animation.linear(duration: 2)
//                  Animation.interpolatingSpring(stiffness: 30, damping: 1)
//                  Animation.easeInOut(duration: 2)
//                      .repeatCount(2, autoreverses: false)
                )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}














//    .transition(AnyTransition.slide.combined(with: AnyTransition.opacity.animation(Animation.linear(duration: 3))))
