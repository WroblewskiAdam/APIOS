//
//  Created by Adam Wojtasik on 28/11/2017.
//  Last modifications: 14.05.2020
//  Copyright © 2017 Politechnika Warszawska. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
	
	let theWorker = Robotnik()

	@IBAction func startButton(_ sender: NSButton) {

		// tworzenie różnych operacji
		let theOperation1 = MyOperation(1)
		let theOperation2 = MyOperation(2)
		let theOperation3 = MyOperation(3)
		let theOperation4 = MyOperation(4)
	
		// Zmiana completionBlock w operacji
		theOperation1.completionBlock = { print("gotowe\n") }
		// wykonanie operacji w bieżącym wątku
		theOperation1.start()
		
		// Wykonywanie operacji w kolejce:

		// Stworzenie kolejki operacji i ustawienie maksymalnej liczby zadań, jakie mogą się wykonywać jednocześnie
		let theQueue = OperationQueue()
		theQueue.maxConcurrentOperationCount = 3

		// dodanie operacji do kolejki
		theQueue.addOperation(theOperation2)

		// dodanie kilku operacji do kolejki
		theQueue.addOperations([theOperation3, theOperation4], waitUntilFinished: false)

		// dodanie zadania do kolejki
		theQueue.addOperation{ Robotnik.doSomething(tekst: "Zadanie A", first: 5,  sec:500, third:10000) }

		// utworzenie bloku i dodanie do niego dwóch zadań
		let theBlock = BlockOperation()
		theBlock.addExecutionBlock( { Robotnik.doSomething(tekst: "Zadanie B", first: 5,  sec:500, third:10000) } )
		theBlock.addExecutionBlock( { Robotnik.doSomething(tekst: "Zadanie C", first: 5,  sec:500, third:10000) } )

		// dodanie do kolejki bloku
		theQueue.addOperation(theBlock)

        print("========= po wrzuceniu wszystkich zadań ==========\n")
		theQueue.waitUntilAllOperationsAreFinished()

	}
}

