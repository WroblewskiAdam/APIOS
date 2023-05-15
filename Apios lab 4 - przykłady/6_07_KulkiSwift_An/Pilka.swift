//
//  Created by Adam Wojtasik on 23/11/2016.
//  Last changes 8/04/2019
//  Copyright © 2016–19 Institute of Microelectronics and Optoelectronics. All rights reserved.
//

import Cocoa

class Pilka: NSImageView {

	var destination = CGPoint(x:0, y: 0)

	convenience init(ballImage theImage:NSImage, superView:NSView ){
		self.init()

		superView.addSubview(self)
		wantsLayer = true

		image = theImage

		frame.size.width = theImage.size.width
		frame.size.height = theImage.size.height
		frame.origin.y = -self.frame.size.height
        frame.origin.x = CGFloat.random(in: 0.0...(superView.frame.size.width - frame.size.width))

		destination = CGPoint(x: self.frame.origin.x, y: superView.frame.size.height)
    }

	func falling(_ sekundy: Double){
		NSAnimationContext.current.duration = sekundy
        // Określenie "sposobu upływu czasu"
        NSAnimationContext.current.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
		
		NSAnimationContext.runAnimationGroup(
			{ (NSAnimationContext) in
				self.animator().frame.origin = destination
			},
			completionHandler: { self.removeFromSuperview() }
		)
	}
}

