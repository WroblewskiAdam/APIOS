//
//  wordle_model.swift
//  wordle_liczbowe
//
//  Created by apios on 03/04/2023.
//

import Foundation
import SwiftUI

final class WordleData: ObservableObject{
    
    
    var curr_row = 0
    
    var wordToGuess: [String] = []
    @Published var flagArray:[[Color]] = [[Color.white, Color.white, Color.white, Color.white, Color.white],
                                          [Color.white, Color.white, Color.white, Color.white, Color.white],
                                          [Color.white, Color.white, Color.white, Color.white, Color.white],
                                          [Color.white, Color.white, Color.white, Color.white, Color.white],
                                          [Color.white, Color.white, Color.white, Color.white, Color.white]]// 0- biale 1-szare, 2 -poma, 3 -ziel
                     
    @Published var guessedLetters = [[" ", " ", " ", " ", " "],
                                     [" ", " ", " ", " ", " "],
                                     [" ", " ", " ", " ", " "],
                                     [" ", " ", " ", " ", " "],
                                     [" ", " ", " ", " ", " "]]
    
    
    var numClicked = 0
    var boxClicked = 0
    
    init(){
        newGame()
    }
    
    func createNewWord(){
        for i in 0...4{
            print(i)
            let letter = String(Int.random(in: 0..<10))
            wordToGuess.append(letter)
        }
    }
    
    
    func newGame(){
        wordToGuess.removeAll()
        guessedLetters = [[" ", " ", " ", " ", " "],
                          [" ", " ", " ", " ", " "],
                          [" ", " ", " ", " ", " "],
                          [" ", " ", " ", " ", " "],
                          [" ", " ", " ", " ", " "]]
        
        flagArray = [[Color.white, Color.white, Color.white, Color.white, Color.white],
                     [Color.white, Color.white, Color.white, Color.white, Color.white],
                     [Color.white, Color.white, Color.white, Color.white, Color.white],
                     [Color.white, Color.white, Color.white, Color.white, Color.white],
                     [Color.white, Color.white, Color.white, Color.white, Color.white]]
        
        createNewWord()
        print("New game word is: \(wordToGuess)")
    }
    
    
    func check(){// 0- biale 1-szare, 2 -poma, 3 -ziel
        for i in 0...4{
            let correctLetter = wordToGuess[i]
            let guessedLetter = guessedLetters[curr_row][i]
            
            if guessedLetter == correctLetter{
                flagArray[curr_row][i] = Color.green
                
            }
            else if wordToGuess.contains(guessedLetter){
                flagArray[curr_row][i] = Color.orange
                
            }
            else if guessedLetter == " " {
                flagArray[curr_row][i] = Color.white
                
            }
            else {flagArray[curr_row][i] = Color.gray }
        }
        curr_row = curr_row + 1
        boxClicked = 0
    }
    
    
    func isFinished() -> Bool{
        if wordToGuess == guessedLetters[curr_row] { return true }
        else { return false }
    }
    
    
    func debug(){
        print(wordToGuess)
        print("numClicked: \(numClicked)")
        print("boxClicked: \(boxClicked)")
        
        print(guessedLetters[0])
        print(guessedLetters[1])
        print(guessedLetters[2])
        print(guessedLetters[3])
        print(guessedLetters[4])
        print(flagArray[0])
        print(flagArray[1])
        print(flagArray[2])
        print(flagArray[3])
        print(flagArray[4])
    }

}
