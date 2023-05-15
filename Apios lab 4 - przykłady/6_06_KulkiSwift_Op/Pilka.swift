//
//  Pilka.swift
//  KulkiSwift
//
//  Created by Adam Wojtasik on 23/11/2016.
//  Last changes 8/04/2019
//  Copyright © 2016–19 Institute of Microelectronics and Optoelectronics. All rights reserved.
//

import Cocoa

class Piłka: NSImageView {
	private var destination:CGFloat = 0
	convenience init(ballImage theImage:NSImage, superView: NSView){
		self.init()
		superView.addSubview(self)

		image = theImage
		frame.size.width = theImage.size.width
		frame.size.height = theImage.size.height
		frame.origin.y = -frame.size.height
        frame.origin.x = CGFloat.random(in: 0...(superView.frame.size.width - frame.size.width))

		destination = superView.frame.size.height
	}
	
	func falling(_ sekundy: Double){
        // Zdefiniowanie przesunięcia piłki o jeden jako klauzury automatycznej
		let move = { () -> CGFloat in
			var ret:CGFloat = 0
			DispatchQueue.main.sync {
				self.frame.origin.y += 1
				ret = self.frame.origin.y
			}
			return ret
		}

        var lowerLine:CGFloat = 0
		repeat {
			lowerLine = move()
			DispatchQueue.main.sync { self.display() }
			Thread.sleep(forTimeInterval: sekundy/1000.0)
		} while lowerLine < destination

		DispatchQueue.main.sync { self.removeFromSuperview() }
	}
}
