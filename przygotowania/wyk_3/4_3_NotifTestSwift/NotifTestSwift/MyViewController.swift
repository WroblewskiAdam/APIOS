//
//  MyViewController.swift
//  NotifTestSwift
//
//  Created by Adam Wojtasik on 05.12.2015.
//  Copyright © 2015 Institute of Microelectronics and Optoelectronics. All rights reserved.
//

import Cocoa

class MyViewController: NSViewController {

	@IBOutlet weak var theLabel: NSTextFieldCell!
	
	var theModel = MyModel()

	override func viewDidLoad() {
        super.viewDidLoad()
		
		NotificationCenter.default.addObserver(
			self,
			selector: #selector(MyViewController.changeLabel(_:)),
			name: NSNotification.Name(rawValue: "MyPushNotification"),
			object: nil
		)
	}


	@objc func changeLabel(_ theNotification: Notification){
		theLabel.title = String((theNotification.object as! MyModel).pushNumber)
	}

	@IBAction func pushMe(_ sender: NSButtonCell) {
		theModel.pushMe()
	}
	
}
