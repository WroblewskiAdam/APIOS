//
//  Created by Adam Wojtasik on 3/04/2018.
//  Copyright © 2023 Institute of Microelectronics and Optoelectronics. All rights reserved.
//  Last modifications on 30/03/2023.
//


// Prosty program do budowania kontenera z drzewem poszukiwań binarnych (BST)
// zawierający obsługę sytuacji wyjątkowych

// Klasa do przechowywania danych w drzewie (dane + klucz)
class Data{
    private let value: Any
    private let key: Int

    // metoda zwracająca klucz rekordu
	func getKey() -> Int { return key }
    
    init(_ inp:Any, _ inkey:Int){
        value = inp
        key = inkey
    }
}



// Definicja wyjątków dla obsługi drzewa (tryb wyliczeniowy implementujący protokół Error)
enum TreeError:Error {
	case unknownError
	case keyAlreadyExists(key:Int) // z pozycją typu wyliczeniowego można stowarzyszyć jakieś dodatkowe dane
	case keyNotFound(key:Int)

	func description(){
		switch self{
		case .unknownError:              print("Unknown Error")
		case .keyAlreadyExists(let key): print("Key already exists: \(key)")
		case .keyNotFound(let key):      print("Key not found: \(key)")
		}
		// nie ma default, bo opisane są wszystkie przypadki
	}
}



// Struktura reprezentująca drzewo
class BSTree{
	// wewnętrzna klasa dla liści drzewa
	private class Node{
		static var idGlob: Int64 = 1
		
		// property obserwowane do numerowania elementów
		var id: Int64 = 0{ didSet(newValue){ BSTree.Node.idGlob += 1 }}
		func setId(){ id = BSTree.Node.idGlob }

		let data:Data?
		
		// łącza drzewa
		var left:Node? = nil
		var right:Node? = nil
		
        // Linki "w górę"
		weak var father:Node? // referencja miękka
		unowned let head:BSTree  // referencja unowned - gdy nie ma opcjonalności

		init(_ dat:Data,_ fath:Node?,_ head:BSTree){
			data = dat
			father = fath
			self.head = head
			setId()
		}
		
		// dodawanie nowego nowego liścia do drzewa
		func add(_ dat: Data,_ fath:Node?,_ head:BSTree) throws { // metoda może rzucić wyjątek

			// guard - służy do sprawdzania warunków (np. poprawności danych wejściowych)
			// i umożliwia tzw. early exit
            // musi zawierać jedną z instrukcji: return, break, continue, throw
			guard dat.getKey() != data!.getKey() else {
                throw TreeError.keyAlreadyExists(key: dat.getKey()) // wyjątek jest rzucany jako pozycja typu wyliczeniowego z dodatkową informacją
			}

			// organizacja potomków w drzewie
			if dat.getKey() < data!.getKey(){
				if left == nil { left = Node(dat, fath, head)}
				else{ try left!.add(dat, self, head) } // ponieważ wywoływana metoda może rzucić wyjątek, trzeba dać z przodu try
			}
			else{
				if right == nil { right = Node(dat, fath, head)}
				else{ try right!.add(dat, self, head) } // ponieważ wywoływana metoda może rzucić wyjątek, trzeba dać z przodu try
			}
		}
	} // koniec definicji klasy wewnętrznej
	
	private var root:Node? // korzeń drzewa
	
	init(){ root = nil } // W zasadzie nie jest potrzebne, bo zmienne opcjonalne z definicji inicjalizowane są nilem

	// dodawanie nowych danych do drzewa
	func add(_ dat: Data) throws { // funkcja może rzucać wyjątki

		// kod defer wykonywany jest zawsze na końcu bloku, w którym został zdefiniowany
		// niezależnie, czy był wcześniej rzucony wyjątek, czy też nie
		defer{
			print("wykonanie kodu kończącego (defer) metody add \(dat.getKey())\n")
		}

		if root == nil { root = Node(dat, nil, self) }
		else{
			try root!.add(dat, nil, self) // ponieważ wywoływana metoda może rzucić wyjątek, trzeba dać z przodu try
		}
		print("\"normalne\" wykonywanie ostaniego kawałka kodu metody add \(dat.getKey()) ")
		// kod defer wykona się dopiero w tym miejscu
	}
}


var theTree:BSTree? = BSTree()

//blok kodu chronionego: do - catch
do{
	try theTree!.add(Data(6,6))
	try theTree!.add(Data("2",2))
    try theTree!.add(Data(3.14,3))
	try theTree!.add(Data("ABC",1))
	try theTree!.add(Data(-8,12))
	try theTree!.add(Data("aaa",8))
	
	try theTree!.add(Data(2.2,3)) // próba wstawienia rekortu o kluczu, który już jest w drzewie
}
// catch łapiący konkretny wyjątek
catch TreeError.keyAlreadyExists(let key){
	print("\nZłapano wyjątek: Already exists: \(key)")
}
	

// catch łapiący wszystkie wyjątki należące do rodzaju TreeError
catch let err as TreeError{
	err.description()
}


// catch łapiący absolutnie wszystkie wyjątki (standardowo wyjątek jest wtedy umieszczany w zmiennej error)
catch{
	if error is TreeError { (error as! TreeError).description() }
	else{ print(error) }
}
