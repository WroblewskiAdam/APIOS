//
//  ContentView.swift
//  numrld
//
//  Created by apios on 24/04/2023.
//

import SwiftUI

struct KeyboardDisplay: View {
    @ObservedObject var wordleData: WordleData
    
    var body: some View {
        VStack{
            HStack(spacing: 23.0){
                ForEach(1..<11){ column in
                    Button(
                        action: {wordleData.guessedLetters[wordleData.curr_row][wordleData.boxClicked] = String(column - 1)}
                    ) {
                            Text("\(column - 1)")
                            .foregroundColor(Color.black).padding(3)
                    }.overlay(RoundedRectangle(cornerRadius: 5).stroke(lineWidth: 2))
                }
            }
            
            .padding(.top, 10.0)
        
        }
    }
}



struct KeyboardDisplay_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(wordleData: WordleData())
    }
}

