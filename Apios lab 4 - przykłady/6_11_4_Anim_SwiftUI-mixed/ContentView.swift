//
//  ContentView.swift
//  Animation_4
//
//  Created by apios on 24/11/2019.
//  Copyright © 2019 apios. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var shapeKind: Bool = true
    @State private var isBlured: Bool = false

    var body: some View {
        VStack {
            HStack {
                Button(action: {self.shapeKind.toggle()} ) {
                    Text("Kształt")
                }
                Button(action: {self.isBlured.toggle()} ) {
                    Text("Rozmazanie")
                }
            }

            Spacer()
              .frame(width: 1.0, height: 85.0)
            
            Image("panorama-warszawy")
                .scaleEffect(0.5)
                .padding(.horizontal, -282)
                .padding(.vertical, -112)

                .clipShape(RoundedRectangle(cornerRadius: shapeKind ? 150 : 0))
                .animation(.linear(duration: 2))

                .blur(radius: isBlured ? 10 : 0)
                .animation(.interpolatingSpring(stiffness: 50, damping: 1))

            Spacer()
              .frame(width: 1.0, height: 85.0)

            Wirnik()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
