//
//  Created by Adam Wojtasik on 23/11/2016.
//  Last changes 10/12/2018
//  Copyright © 2016–18 Institute of Microelectronics and Optoelectronics. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

	@IBOutlet weak var window: NSWindow!
	@IBOutlet weak var fallingView: FallingView!

	var theQueue:OperationQueue?

	func applicationDidFinishLaunching(_ aNotification: Notification) {
		theQueue = OperationQueue()
		theQueue!.qualityOfService = QualityOfService.userInteractive
		theQueue!.maxConcurrentOperationCount = 5
	}


	@IBAction func NewBall(_ sender: NSButton) {
		var name:NSImage.Name
        switch Int.random(in: 1...7){
            case 1: name = "Baseball"
            case 2: name = "Basketball"
            case 3: name = "Billiardball"
            case 4: name = "Football"
            case 5: name = "Golfball"
            case 6: name = "Tennisball"
            default: name = "Volleyball"
        }
        let image = NSImage(named: name)!
        image.size = NSSize(width: 40, height: 40)
		let pilka = Piłka(ballImage: NSImage(named: name)!, superView: fallingView!)
	
        theQueue!.addOperation( { pilka.falling(Double.random(in: 5.0...60.0)) } )
	}
}
