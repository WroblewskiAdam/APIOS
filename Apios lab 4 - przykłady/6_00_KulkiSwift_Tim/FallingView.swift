//
//  Created by Adam Wojtasik on 23/11/2016.
//  Copyright © 2016 Institute of Microelectronics and Optoelectronics. All rights reserved.
//

import Cocoa

// Odwrócenie układu współrzędnych
class FallingView: NSView {
	override var isFlipped:Bool { get{ return true } }
}
