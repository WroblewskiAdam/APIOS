//
//  ViewController.swift
//  wordle_liczbowe
//
//  Created by apios on 03/04/2023.
//

import Cocoa

class ViewController: NSViewController {

    var wordle: Wordle = Wordle()
    var columnSelector = 0
    var clickedNumber = ""
    weak var usedLabel: NSTextField?
    
    
    @IBOutlet weak var Label1: NSTextFieldCell!
    @IBOutlet weak var Label2: NSTextFieldCell!
    @IBOutlet weak var Label3: NSTextFieldCell!
    @IBOutlet weak var Label4: NSTextFieldCell!
    @IBOutlet weak var Label5: NSTextFieldCell!
    
    @IBOutlet weak var numToGuess: NSTextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        wordle.setLinkToController(self)
        
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func getClickedNum(_ sender: NSButton) {
        clickedNumber = sender.title
        print("kliknieto liczbe: \(clickedNumber)")
        print("kolumna: \(columnSelector)")
        
        wordle.guessedLetters[columnSelector] = clickedNumber
        print("guessed word: \(wordle.guessedLetters)")
        
        if columnSelector == 0 { Label1?.stringValue = clickedNumber }
        else if columnSelector == 1 { Label2?.stringValue = clickedNumber }
        else if columnSelector == 2 { Label3?.stringValue = clickedNumber }
        else if columnSelector == 3 { Label4?.stringValue = clickedNumber }
        else if columnSelector == 4 { Label5?.stringValue = clickedNumber }

    }
    

    @IBAction func GetColumn(_ sender: NSButton) {
        let number = Int(sender.title)! - 1
        columnSelector = number
        print(columnSelector)
    }
    
    
    @IBAction func newGame(_ sender: Any) {
        wordle.newGame()
        
        numToGuess?.stringValue = wordle.wordToGuess.joined()
        
        Label1?.backgroundColor = NSColor.white
        Label2?.backgroundColor = NSColor.white
        Label3?.backgroundColor = NSColor.white
        Label4?.backgroundColor = NSColor.white
        Label5?.backgroundColor = NSColor.white
        
        Label1?.stringValue = ""
        Label2?.stringValue = ""
        Label3?.stringValue = ""
        Label4?.stringValue = ""
        Label5?.stringValue = ""

    }
    
    
    @IBAction func check(_ sender: Any) {
        wordle.check()
        let flag_array = wordle.flagArray
        
        
        //pierwsze pole
        if      flag_array[0] == 1 { Label1?.backgroundColor = NSColor.gray }
        else if flag_array[0] == 2 { Label1?.backgroundColor = NSColor.orange }
        else if flag_array[0] == 3 { Label1?.backgroundColor = NSColor.green }
        else if flag_array[0] == 0 { Label1?.backgroundColor = NSColor.white }

        
        //drugie pole
        if      flag_array[1] == 1 { Label2?.backgroundColor = NSColor.gray }
        else if flag_array[1] == 2 { Label2?.backgroundColor = NSColor.orange }
        else if flag_array[1] == 3 { Label2?.backgroundColor = NSColor.green }
        else if flag_array[0] == 0 { Label2?.backgroundColor = NSColor.white }

        //trzecie pole
        if      flag_array[2] == 1 { Label3?.backgroundColor = NSColor.gray }
        else if flag_array[2] == 2 { Label3?.backgroundColor = NSColor.orange }
        else if flag_array[2] == 3 { Label3?.backgroundColor = NSColor.green }
        else if flag_array[0] == 0 { Label3?.backgroundColor = NSColor.white }

        //czwarte pole
        if      flag_array[3] == 1 { Label4?.backgroundColor = NSColor.gray }
        else if flag_array[3] == 2 { Label4?.backgroundColor = NSColor.orange }
        else if flag_array[3] == 3 { Label4?.backgroundColor = NSColor.green }
        else if flag_array[0] == 0 { Label4?.backgroundColor = NSColor.white }

        //piate pole
        if      flag_array[4] == 1 { Label5?.backgroundColor = NSColor.gray }
        else if flag_array[4] == 2 { Label5?.backgroundColor = NSColor.orange }
        else if flag_array[4] == 3 { Label5?.backgroundColor = NSColor.green }
        else if flag_array[0] == 0 { Label5?.backgroundColor = NSColor.white }

    }
    
    
    func displayNumber(){
        numToGuess?.stringValue = wordle.wordToGuess.joined()
    }
}

