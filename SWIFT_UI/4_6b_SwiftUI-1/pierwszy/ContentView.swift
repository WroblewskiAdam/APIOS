//
//  Created by apios on 03/11/2019.
//  Copyright © 2019 apios. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    @State var pressCounter: Int
    @EnvironmentObject var obiektObserwowany: ObiektObserwowany

    // "Wewnętrzne" dla widoku property obserwowane:
    // @State
    // "Zewnętrzne" dla widoku property obserwowane:
    // @EnvironmentObject - globalne
    // @ObservedObject - jeżeli używamy w wielu widokach
    // @StateObject – jeżeli używamy w jednym widoku
    
    
    
    var mySpacer: some View{
        Spacer()
            .frame(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
    }
    
    var myText: some View {
        Text("\(pressCounter)")
             .font(.largeTitle)
             .blur(radius: 2.0)
    }
    
    var body: some View {
        VStack {
            
            myText
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            mySpacer
 
            Button(action: { self.pressCounter += 1 }) {
                Text("Press me")
            }
            .padding(.horizontal,50)
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)


            CustomView(value: 1)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(pressCounter: 0)
                .environmentObject(ObiektObserwowany())
        }
    }
}
