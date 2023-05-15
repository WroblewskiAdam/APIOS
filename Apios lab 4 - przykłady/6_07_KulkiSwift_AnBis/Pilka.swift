//
//  Created by Adam Wojtasik on 23/11/2016.
//  Last changes 8/04/2019
//  Copyright © 2016–19 Institute of Microelectronics and Optoelectronics. All rights reserved.
//

import Cocoa

class Piłka: NSImageView {

	var destinationDown = CGPoint(x:0, y: 0)
	var destinationUp = CGPoint(x:0, y: 0)

	convenience init(ballImage theImage:NSImage, superView:NSView ){
		self.init()
        let size = Double.random(in: 15...45)
		theImage.size = NSSize(width: size, height: size)

		superView.addSubview(self)
		wantsLayer = true

		image = theImage

		frame.size.width = theImage.size.width
		frame.size.height = theImage.size.height
		frame.origin.y = -self.frame.size.height

        frame.origin.x = CGFloat.random(in: 0.0...(superView.frame.size.width - frame.size.width))

		destinationUp = CGPoint(x: self.frame.origin.x, y: 0)
		destinationDown = CGPoint(x: self.frame.origin.x, y: superView.frame.size.height - theImage.size.height)
    }


	func falling_down(){
        NSAnimationContext.current.duration = Double.random(in: 0.5...10.0)
		NSAnimationContext.current.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
		
		NSAnimationContext.runAnimationGroup(
			{ (NSAnimationContext) in
				let animator = self.animator()
                
                // W animatorze może być kilka różnych animacji
				animator.frame.origin = destinationDown
				animator.alphaValue = 0
		},
			completionHandler: { self.falling_up() }
		)
	}

	func falling_up(){
        NSAnimationContext.current.duration = Double.random(in: 0.5...10.0)
		
		NSAnimationContext.runAnimationGroup(
			{ (NSAnimationContext) in
				let animator = self.animator()
				animator.frame.origin = destinationUp
				animator.alphaValue = 1
		},
			completionHandler: { self.falling_down() }
		)
	}
}


