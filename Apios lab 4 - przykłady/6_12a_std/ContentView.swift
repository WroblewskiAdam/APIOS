//
//  Created by apios on 03/12/2020.
//

import SwiftUI


struct ContentView: View {
    @State private var opacityValue = 0.0
    @State var flag = true

    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .opacity(opacityValue)
                    .animation(Animation.linear(duration: 3.0))
            }
            
            Button(action: {
                opacityValue = flag ? 1.0 : 0.0
                flag.toggle()
            }
            ){
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
