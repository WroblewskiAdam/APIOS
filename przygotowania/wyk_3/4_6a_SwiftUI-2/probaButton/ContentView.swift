//
//  Created by Adam Wojtasik on 16/10/2019.
//  Copyright © 2019 Adam Wojtasik. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var liczba: Int = 1
    
    fileprivate func pressButton() -> Text {
        return Text("Naciśnij")
    }
    
    var body: some View {
        VStack{
            HStack {
                Group {
                    Text("\(liczba)")
                        .foregroundColor(Color.orange)

                   Spacer()
                        .fixedSize()
                    
                    Text("\(liczba)")
                        .foregroundColor(Color.red)
                }
                .font(.largeTitle)
                .padding(10)
            }
            .background(Color.gray)
            
            ZStack {
                Ellipse()
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .opacity(0.2)
                    .scaleEffect(0.8)

                Text("ifbheuh[ehgv[oiehv[ioehbv[o")

                Button(action: {self.liczba += 1}) { pressButton() }
                    .padding(10)
                    .border(Color.green, width: 2)
                    .background(Color.yellow)
                    .rotationEffect(Angle(degrees: 10))
                
                
            }
            
            CircleTest()
                .contrast(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
            
            CircleTest()
                .background(Color.red)
                .blur(radius: 5)

            MyPicker()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
