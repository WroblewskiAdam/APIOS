//
//  wordle_model.swift
//  wordle_liczbowe
//
//  Created by apios on 03/04/2023.
//

import Foundation
import Cocoa

class WordleGame{
    var wordToGuess: [String] = [] //słowo do zgadniecia
    var guessedLetters: [String] = [] //litery podane przez uzytkownika
    var flagArray = [1,1,1,1,1] //flagi do kolorów 1- szare, 2 - pomar, 3- ziel
    
    var numClicked: Int?
    var boxClicked: Int?
    

    func createWord(){
        for i in 0..5{
            var number = String(Int.random(in: 0..<10))
            wordToGuess.append(number)
            flagArray.append(1)
        }
        let WordAsString = String(wordToGuess)
        return WordAsString
    }
    
    func newGame(){
        wordToGuess.removeAll()
        flagArray.removeAll()
        guessedLetters.removeAll()
        createWord()        
    }
    
    func Check(){
        for i in 0..5{
            var correctLetter = wordToGuess[i]
            var guessedLetter = guessedLetters[i]
            
            if guessedLetter == correctLetter{ flagArray[i] = 3 }
            else if wordToGuess.contains(guessedLetter){ flagArray[i] = 2 } 
            else{ flagArray[i] = 1 } 
        }
    }
    
    func isFinished(){
        if wordToGuess == guessedLetters{ return true }
        else{ return false }
    }
    
}
