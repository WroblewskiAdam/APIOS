//
//  Created by Adam Wojtasik on 23/11/2016.
//  Last changes 25/11/2020
//  Copyright © 2016-2020 Institute of Microelectronics and Optoelectronics. All rights reserved.
//

import Cocoa

class Piłka: NSImageView {

    // Status piłki (na jakim etapie się znajduje)
	enum Status{
		case waiting, moving, finished
		init(){ self = .waiting }
	}
	var status = Status()

    // Zmienne wykorzystywane do określania szybkości spadania piłki
	var moveAttempt = 0
	var currAttempt = 0

	convenience init(ballImage theImage:NSImage, width: CGFloat, delay: Int){
		self.init()
		moveAttempt = delay
		
		image = theImage

        // Obliczenie rozmiaru piłki
        frame.size.width = theImage.size.width
		frame.size.height = theImage.size.height
        
        // Obliczenie położenia piłki
		frame.origin.y = -frame.size.height
		frame.origin.x = CGFloat.random(in: 0.0...(width - frame.size.width))
	}
}

