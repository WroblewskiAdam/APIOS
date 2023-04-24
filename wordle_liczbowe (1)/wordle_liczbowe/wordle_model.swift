//
//  wordle_model.swift
//  wordle_liczbowe
//
//  Created by apios on 03/04/2023.
//

import Foundation
import Cocoa

class Wordle{
    
    var controller: ViewController?
    func setLinkToController(_ cont:ViewController){ controller = cont}
    
    var wordToGuess: [String] = []
    var flagArray = [0, 0, 0, 0, 0] // 0- biale 1-szare, 2 -poma, 3 -ziel
    var guessedLetters = ["", "", "", "", ""]
    
    var numClicked: Int?
    var boxClicked: Int?
    
    init(){
        newGame()
        controller?.displayNumber()
    }
    
    func createNewWord(){
        for i in 0...4{
            print(i)
            let letter = String(Int.random(in: 0..<10))
            wordToGuess.append(letter)
            flagArray[i] = 0
        }
    }
    
    
    func newGame(){
        wordToGuess.removeAll()
        guessedLetters = ["", "", "", "", ""]
        createNewWord()
        print("New game word is: \(wordToGuess)")
    }
    
    
    func check(){
        for i in 0...4{
            let correctLetter = wordToGuess[i]
            let guessedLetter = guessedLetters[i]
            
            if guessedLetter == correctLetter{ flagArray[i] = 3 }
            else if wordToGuess.contains(guessedLetter){ flagArray[i] = 2 }
            else if guessedLetter == "" {flagArray[i] = 0}
            else {flagArray[i] = 1 }
        }
    }
    
    
    func isFinished() -> Bool{
        if wordToGuess == guessedLetters { return true }
        else { return false }
    }

}
