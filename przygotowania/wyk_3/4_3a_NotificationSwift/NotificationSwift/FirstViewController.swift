//
//  Created by Adam Wojtasik on 31.03.2021.
//  Copyright (c) 2021 Institute of Microelectronics and Optoelectronics. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    var theFirstModel = FirstModel()


    @IBOutlet weak var upperView: UpperView!

    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
	
// Rejestracja notyfikacji z użyciem klauzury
        NotificationCenter.default.addObserver(
            forName: NSNotification.Name(rawValue: "upperColorChangedNotification"),
            object:  nil,
            queue:   nil
        ){ (theNotification:Notification) -> Void in
			self.upperView.backgroundColor! = theNotification.object as! UIColor
		}
	}

    @IBAction func upperButtonPush(_ sender: UIButton) {
        theFirstModel.newColor()
    }
}
