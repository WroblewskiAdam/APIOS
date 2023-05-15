//
//  Created by Adam Wojtasik on 11/11/14.
//  Last modifications: 21.04.2022
//  Copyright (c) 2014-22 Adam Wojtasik. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!

    //-------------------------------------------------
    // Symulacja działania
    func doSomething(tekst text: String, first kMax: Int64, sec iMax: Int64, third jMax: Int64){
        print("\(text) -----------> start");
        var x = 0.0
        for k in 0...kMax {
            print("\(text) - report: \(k)")
            for i in 0...iMax {
                for j in 0...jMax{
                    x = Double(j) * Double(i);
                }
            }
        }
        print("\(text) -----------> stop \(x)");
    }
    //-------------------------------------------------

    
    @IBAction func push(_ sender: NSButton) {

// "własna" kolejka równoległa
//	let myDispatch = DispatchQueue(label: "mojDispacz", attributes: DispatchQueue.Attributes.concurrent)

// "własna" kolejka szeregowa
//        let myDispatch = DispatchQueue(label: "mojDispacz")
		
// globalna kolejka równoległa o priorytecie utility (trzecia z czterech)
// od najwyższego priorytetu: userInteractive, userInitiated, default, background

//		let myDispatch = DispatchQueue.global(qos: DispatchQoS.QoSClass.utility)
		
// główna kolejka aplikacji
		let myDispatch = DispatchQueue.main
//		print ("\(myDispatch.qos)\n")
// Uwaga: do głównej kolejki nie można synchronicznie wkładać zadań

		
        myDispatch.async(execute: {() in self.doSomething(tekst: "Zadanie A", first: 3,  sec:500, third:10000) })
        print("Po wstawieniu do kolejki zadania A")

		// Zadanie może być wstawione do kolejki i natychmiast uruchomione
		myDispatch.async(execute: { self.doSomething(tekst: "Zadanie B", first: 5,  sec:500, third:10000) })
		print("Po wstawieniu do kolejki zadania B")

		// lub uruchomione przez kolejkę z opóźnieniem 5 sekund
		myDispatch.asyncAfter(
			deadline: DispatchTime.now() + Double(Int64(5.0*Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC),
			execute: { self.doSomething(tekst: "Zadanie C", first: 5,  sec:500, third:10000) })
        print("Po wstawieniu do kolejki zadania C")
		
        myDispatch.async(execute: { self.doSomething(tekst: "Zadanie D", first: 5,  sec:800, third:10000) })
        print("Po wstawieniu do kolejki zadania D")
        
        print("----- Koniec działania funkcji wywołującej w głównym wątku aplikacji -----")

	}
}

