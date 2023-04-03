//
//  MyModel.swift
//  NotifTestSwift
//
//  Created by Adam Wojtasik on 05.12.2015.
//  Copyright © 2015 Institute of Microelectronics and Optoelectronics. All rights reserved.
//

import Cocoa

class MyModel {
	
	var pushNumber = 0 {
		didSet(newValue){
			NotificationCenter.default.post(name: Notification.Name(rawValue: "MyPushNotification"), object: self)
		}
	}
	
	func pushMe() { pushNumber += 1 }
}
    
