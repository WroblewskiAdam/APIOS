//
//  ContentView.swift
//  SwiftUI-3
//
//  Created by awaw on 22/04/2021.
//

import SwiftUI

struct ContentView: View {
    @State var number = 0
    var body: some View {
        VStack{
            Text("\(number)")

            Button("push me", action: { self.number += 1})
                .rameczka() // własny modyfikator
      
            Text("Hej")
                .rameczka() // własny modyfikator
       }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
























// Definicja własnego modyfikatora

struct Rameczka: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.caption2)
            .foregroundColor(Color.blue)
            .padding(40)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(lineWidth: 2)
            )
    }
}


extension View {
    func rameczka() -> some View {
        modifier(Rameczka())
    }
}
