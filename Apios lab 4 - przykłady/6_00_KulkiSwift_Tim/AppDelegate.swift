 //
//  Created by Adam Wojtasik on 23/11/2016.
//  Last changes 28.04.2023
//  Copyright © Institute of Microelectronics and Optoelectronics. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

	@IBOutlet weak var window: NSWindow!
	@IBOutlet weak var fallingView: FallingView!

	var activeBalls = 0
	
	@IBAction func NewBall(_ sender: NSButton) {
        // Tworzenie nowej piłki
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
		let pilka = Piłka(ballImage: image, width: fallingView.frame.size.width, delay: Int.random(in: 1...30))

        // Piłki są wstawiane jako podwidoki do widoku fallingView (który jest podwidokiem głównego widoku okna)
        fallingView.addSubview(pilka)
	}


    func applicationDidFinishLaunching(_ aNotification: Notification) {

        // Zdefiniowanie timera
        let theTimer = Timer.scheduledTimer(withTimeInterval: 0.001, repeats: true){
            // Procedura "obsługi" piłek - podana w formie trailing closure
            _ in
            var toBeRemoved: NSView? = nil;
            
            // Przeglądamy tablicę podwidoków w poszukiwaniu piłek
            for theView in self.fallingView.subviews {
                if theView is Piłka { // czy to subview to rzeczywiście piłka
                    let thePilka = theView as! Piłka
                    
                    switch thePilka.status {
                    case .waiting:
                        if self.activeBalls < 5 {
                            thePilka.status = .moving
                            self.activeBalls += 1
                        }
                        
                    case .moving:
                        if thePilka.currAttempt < thePilka.moveAttempt { thePilka.currAttempt += 1 } // opóźnienie spadania
                        else{
                            thePilka.currAttempt = 0
                            thePilka.frame.origin.y += 1
                        }
                        if thePilka.frame.origin.y > self.fallingView.frame.size.height { thePilka.status = .finished }
                        
                    case .finished:
                        if toBeRemoved == nil {
                            // przeznaczamy piłkę do usunięcia
                            toBeRemoved = thePilka;
                            self.activeBalls -= 1
                        }
                    }
                }
            }
            if toBeRemoved != nil { toBeRemoved!.removeFromSuperview() }
        }
        // koniec procedury obsługującej przesuwanie się piłek
        
        // Uruchomienie timera
        theTimer.fire()
    }
}

