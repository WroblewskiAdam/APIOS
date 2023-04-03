//
//  ViewController.swift
//  Kalkulator
//
//  Created by Adam Wojtasik on 11/11/2017.
//  Last revision on 17/11/2020.
//  Copyright © 2017-2020 AW. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
	
	@IBOutlet weak var displayField: NSTextField!
	static let kalkulator: CalcModel = CalcModel()

	override func viewDidLoad() {
		super.viewDidLoad()
		
		// rejestracja obserwatora stringu dla wyświetlacza
        NotificationCenter.default.addObserver(
            forName: NSNotification.Name(rawValue: "resultChangedNotification"),
            object:  nil,
            queue:   nil
        ){ (theNotification:Notification) -> Void in
            // zmiana wartości stringu wynikowego w modelu -> wyświetlenie go na wyświetlaczu
            self.displayField.stringValue = ViewController.kalkulator.displayStringValue
        }
 	}
	

	// metody "user action" reagujące na kliknięcie w guziki
	@IBAction func pushClearButton   (_ sender: NSButton) { ViewController.kalkulator.clearPush() }
	@IBAction func pushNumericButton (_ sender: NSButton) { ViewController.kalkulator.numericPush(sender.title) }
	// w poniższej metodzie wykorzystano tagi nadane guzikom funkcyjnym w Interface Builderze
	@IBAction func pushFunctionButton(_ sender: NSButton) { ViewController.kalkulator.functionPush(sender.tag) }
	@IBAction func pushResultButton  (_ sender: NSButton) { ViewController.kalkulator.resultPush() }
}

