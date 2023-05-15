//
//  Created by Adam Wojtasik on 23/11/2016.
//  Last changes 8/04/2019
//  Copyright © 2016–19 Institute of Microelectronics and Optoelectronics. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

	@IBOutlet weak var window: NSWindow!
    @IBOutlet weak var fallingView: FallingView!
    
	let myDispatch = DispatchQueue.global(qos: .userInteractive)

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
		let pilka = Piłka(ballImage: NSImage(named: name)!, superView: self.fallingView)
        
        // Wrzucenie spadania piłki do kolejki
		myDispatch.async(execute: {
			pilka.falling(Double.random(in: 5.0...60.0))
		})
	}
}

