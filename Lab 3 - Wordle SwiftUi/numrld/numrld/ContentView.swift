//
//  ContentView.swift
//  numrld
//
//  Created by apios on 24/04/2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var wordleData: WordleData
    
    var body: some View {
        VStack{
//          pola gry
            GameFieldsDisplay(wordleData: wordleData)
            
            // wybor pola
            SelectorDisplay(wordleData: wordleData)
            
            
            //klawiatura numeryczna
            KeyboardDisplay(wordleData: wordleData)
            
            
            ButtonsDisplay(wordleData: wordleData)
        
        
        }
     
    
    }

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(wordleData: WordleData())
    }
}
