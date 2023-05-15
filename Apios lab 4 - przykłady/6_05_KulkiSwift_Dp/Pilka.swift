//
//  Created by Adam Wojtasik on 23/11/2016.
//  Last changes 8/04/2019
//  Copyright © 2016–19 Institute of Microelectronics and Optoelectronics. All rights reserved.
//

import Cocoa

class Piłka: NSImageView {
	private var destination:CGFloat = 0.0

    convenience init(ballImage theImage:NSImage, superView: NSView){
        self.init()
        destination = superView.frame.size.height

        // Piłka "sama się dodaje" do swojego superwidoku
		superView.addSubview(self)
		
        // Ustawienie rozmiaru i położenia piłki
		image = theImage
		frame.size.width = theImage.size.width
		frame.size.height = theImage.size.height
		frame.origin.y = -frame.size.height
        frame.origin.x = CGFloat(CGFloat.random(in: 0.0...(superView.frame.size.width - frame.size.width)))
  	}

    // Definicja procedury spadania piłki
	func falling(_ sekundy: Double){

        // Zdefiniowanie procedury spadania jako klauzury automatycznej (autoclosure)
        let move = { () -> CGFloat in
			var ret:CGFloat = 0

            // Odrysowywanie będzie działało poprawnie tylko, gdy będzie się odbywać z udziałem kolejki głównej aplikacji
			DispatchQueue.main.sync {
				self.frame.origin.y += 1
				ret = self.frame.origin.y
			}
			return ret
		}

        var lowerLine:CGFloat = 0
		repeat {
			lowerLine = move() // tu uruchamiana jest autoclosure
            // Odrysowywanie będzie działało poprawnie tylko, gdy będzie się odbywać z udziałem kolejki głównej aplikacji
			DispatchQueue.main.sync { self.display() } // Rysowanie
            // Opóźnienie spadania
			Thread.sleep(forTimeInterval: sekundy/1000.0)
		} while lowerLine < destination

        // Piłka wyszała poza okno - trzeba ją usunąć z FallingView
		DispatchQueue.main.sync { self.removeFromSuperview() }
	}
}

