//
//  Created by Adam Wojtasik on 31.03.2015.
//  Last modifications: 31.03.2021.
//  Copyright (c) 2021 Institute of Microelectronics and Optoelectronics. All rights reserved.
//

import UIKit

class FirstModel: NSObject {
	var upperColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1){
		didSet{
			let notificationCenter = NotificationCenter.default
			let notification = Notification(name: Notification.Name(rawValue: "upperColorChangedNotification"), object: upperColor)
			notificationCenter.post(notification)
		}
	}
	
    
    func newColor(){
        let r = CGFloat.random(in: 0.0...1.0) // został użyty Close Range Operator
        let g = CGFloat.random(in: 0.0...1.0)
        let b = CGFloat.random(in: 0.0...1.0)
        let a = CGFloat.random(in: 0.0...1.0)
        upperColor = UIColor(red: r, green: g, blue: b, alpha: a)
    }
}
