//
//  Created by Adam Wojtasik on 11/11/2017.
//  Last modifications 20.04.2023
//  Copyright © 2017-23 AW. All rights reserved.
//

import Cocoa


@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

	@IBOutlet weak var window: NSWindow!

	func applicationDidFinishLaunching(_ aNotification: Notification) {

        // Procedura obsługi informacji o starcie wątku typu MojeZadanie
        // (z użyciem klauzury typu trailing)
        NotificationCenter.default.addObserver(
            forName: NSNotification.Name(rawValue: "ThreadDidStart"),
            object:  nil,
            queue:   nil
        ){ (theNotification:Notification) -> Void in
            print("startuje MojeZadanie: \((theNotification.object as! MojeZadanie).getID())")
        }

        // Procedura obsługi informacji o końcu działania  wątku
		NotificationCenter.default.addObserver(
			forName: NSNotification.Name.NSThreadWillExit,
			object: nil,
            queue:  nil
        ){ (theNotification:Notification) -> Void in
            let thisThread = Thread.current
            if thisThread is MojeZadanie {
                print("kończy się działanie wątku typu MojeZadanie: \((theNotification.object as! MojeZadanie).getID())")
            }
            else{
                print("kończy się działanie wątku nie będącego w związku z MojeZadanie")
            }
        }

        // Procedura obsługi informacji o końcu działania wątku "standardowego"
        // ze zdefiniowną klauzurą startową
         NotificationCenter.default.addObserver(
              forName: NSNotification.Name(rawValue: "ThreadWillStop"),
              object:  nil,
              queue:   nil
          ){ (theNotification:Notification) -> Void in
              print("kończy się działanie wątku startowanego z użyciem startowej klauzury")
          }
      }
	
	
// Uruchamianie wątku dziedziczącego po Thread (czyli typu MojeZadanie)
	@IBAction func pushStart(_ sender: Any) {
		let test = MojeZadanie()
		test.start()
	}
    
    
    
//*********************************************************************************************************

// Uruchamianie innych wątków (nie związanych z MojeZadanie))
	@IBAction func pushInny(_ sender: Any) {
        
        // uruchamianie wątku przez wysłanie selektora do funkcji startowej
		Thread.detachNewThreadSelector(#selector(startingFunction), toTarget: self, with: nil)

        // uruchamianie wątku przez podanie kauzury jako funkcji startowej
        Thread.detachNewThread(startingClosure) // klauzura-funkcja globalna

        // uruchamianie wątku przez podanie kauzury jako funkcji startowej
        Thread.detachNewThread(){ // klauzura typu trailing
            print("startuje wątek uruchomiony z trailing closure jako funkcją startową")
            doSomething(tekst: "TralingClosure - działam", first: Int64.random(in: 3...5), sec: 1000, third: 10000)
            NotificationCenter.default.post(name: Notification.Name(rawValue: "ThreadWillStop"), object: self)
       }
    }

    // funkcja startowa wątku (dla uruchamiania z selektorem)
    @objc func startingFunction(){
        print("startuje wątek uruchomiony z selektorem funkcji startowej")
        doSomething(tekst: "Selektor - działam", first: Int64.random(in: 3...5), sec: 1000, third: 10000)
        NotificationCenter.default.post(name: Notification.Name(rawValue: "ThreadWillStop"), object: self)
   }

    // klazura startowa wątku
	func startingClosure(){
		print("startuje wątek uruchomiony z klauzurą globalną jako funkcją startową")
        doSomething(tekst: "Globalna - działam", first: Int64.random(in: 3...5), sec: 1000, third: 10000)
        NotificationCenter.default.post(name: Notification.Name(rawValue: "ThreadWillStop"), object: self)
	}
}
