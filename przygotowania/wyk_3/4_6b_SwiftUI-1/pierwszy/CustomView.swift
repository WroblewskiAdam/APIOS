//
//  Created by apios on 03/11/2019.
//  Copyright © 2019 apios. All rights reserved.
//

import SwiftUI

struct CustomView: View {
   @State var value: Int
   @EnvironmentObject var obiektObserwowany: ObiektObserwowany

    var body: some View {
        VStack {
            HStack {
                ForEach(0 ..< 10) { item in
                    Text("+")
                }
            }
            .background(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/)

            Stepper(value: $value, in: 1...7, onEditingChanged: { _ in
// Wykorzystanie EnvironmentObject
                self.obiektObserwowany.licznik += 1
                print("\(self.value)")
            } ) {
                Text("Stepper")
            }

            Text("Wartość: \(value)")
            Text("ObiektObserwowany: \(obiektObserwowany.licznik)")
        }
    }
}


struct CustomView_Previews: PreviewProvider {
    static var previews: some View {
        CustomView(value: 1)
        .environmentObject(ObiektObserwowany())
    }
}
