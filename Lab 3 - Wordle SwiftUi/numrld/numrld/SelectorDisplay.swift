//
//  ContentView.swift
//  numrld
//
//  Created by apios on 24/04/2023.
//

import SwiftUI

struct SelectorDisplay: View {
    @ObservedObject var wordleData: WordleData
    
    var body: some View {
        VStack{
            HStack(spacing: 30.0){
                ForEach(1..<6){ column in
                    Button(action: { wordleData.boxClicked = column - 1 } ) {
                            Text("\(column)")
                            .foregroundColor(Color.black).padding(5)
                        }.overlay(RoundedRectangle(cornerRadius: 5).stroke(lineWidth: 2))
                    }
            }
            .padding(.top, 40.0)
        
        }
    }
}



struct SelectorDisplay_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(wordleData: WordleData())
    }
}

