//
//  ContentView.swift
//  numrld
//
//  Created by apios on 24/04/2023.
//

import SwiftUI

struct ButtonsDisplay: View {
    @ObservedObject var wordleData: WordleData
    
    var body: some View {
        VStack{
            HStack{
                Button(action: { wordleData.check()}) {
                        Text("Check")
                    }
                .padding( 40.0)
                
                Button(action: { wordleData.newGame()}) {
                        Text("New Game")
                    }
                .padding( 40.0)
            }
            .padding(.top, 30.0)
        
            
            Button(action: { wordleData.debug()}) {
                    Text("Debug")
                }
            .padding( 40.0)
        
        }
    }
}



struct ButtonsDisplay_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(wordleData: WordleData())
    }
}

