//
//  Wirnik.swift
//  Animation_4
//
//  Created by apios on 24/11/2019.
//  Copyright © 2019 apios. All rights reserved.
//

import SwiftUI

struct Wirnik: View {
    @State private var rotation: Double = 0.0

    var body: some View {
        Image("panorama-warszawy")
            .scaleEffect(0.5)
            .padding(.horizontal, -282)
            .padding(.vertical, -112)
            .clipShape(Circle())
            .rotation3DEffect(.degrees(rotation), axis: (x: 0, y: 0, z: 1))
            .animation(
                Animation.linear(duration: 4)
                 .repeatForever(autoreverses: false)
            )
        .onAppear {
            self.rotation -= 360
        }

    }
}

struct Wirnik_Previews: PreviewProvider {
    static var previews: some View {
        Wirnik()
    }
}




















//.onAppear {
//    self.rotation += 360
//}
