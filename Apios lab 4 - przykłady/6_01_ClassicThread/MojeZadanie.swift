//
//  Created by Adam Wojtasik on 11/11/2017.
//  Last modifications 20.04.2023
//  Copyright © 2017-23 AW. All rights reserved.
//

import Foundation

// Clasa dziedzisząca po standardowym wątku
class MojeZadanie: Thread{
    
// Pomocniczy numerator wątków utworzonych w ten sposób
	private struct Numerator {
		static var globNumber: Int = 0
		let threatID = globNumber
		init(){ Numerator.globNumber += 1 }
	}
    private let myID = Numerator()
	func getID() -> Int { return myID.threatID }

    // Funkcja wywoływana przy starcie wątku
	override func main() {
    
        // Informacja, że wątek został uruchomiony
		NotificationCenter.default.post(name: Notification.Name(rawValue: "ThreadDidStart"), object: self)

        doSomething(tekst: "MojeZadanie: \(myID.threatID) - działam", first: 5, sec: 1000, third: 10000)
	}

}
