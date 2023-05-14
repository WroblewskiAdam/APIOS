//
//  ContentView.swift
//  numrld
//
//  Created by apios on 24/04/2023.
//

import SwiftUI

struct GameFieldsDisplay: View {
    @ObservedObject var wordleData: WordleData
    
    var body: some View {
        VStack{
//          pola gry
            ForEach(1..<6){ row in
                HStack{
                    ForEach(1..<6){ column in
                        Text(wordleData.guessedLetters[row-1][column-1])
                            .padding().overlay(RoundedRectangle(cornerRadius: 0).stroke(lineWidth: 2))
                            .background(wordleData.flagArray[row-1][column-1])
                    }
                }
            }
        }
    }
}



struct GameFieldsDisplay_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(wordleData: WordleData())
    }
}

