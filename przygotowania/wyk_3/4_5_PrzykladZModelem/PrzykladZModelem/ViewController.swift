//
//  Created by Adam Wojtasik on 29/10/14.
//  Last modifications by Adam Wojtasik on 31/03/21.
//  Copyright (c) 2014 Adam Wojtasik. All rights reserved.
//


// Wersja bez notyfikacji

import UIKit

class ViewController: UIViewController {

    // referencja do modelu
    var model = ModelPrzyklad()
	
    @IBOutlet weak var theDisplay: UILabel!

    override func viewDidLoad(){
        super.viewDidLoad()
        
        // Przekazanie modelowi referencji do kontrolera
        model.setLinkToController(self)

        displayModel()
    }

    // polecenie wyświetlenia w widoku aktualnego stanu modelu
    func displayModel(){ theDisplay.text = String(format:"%@ %6.1f", model.wynikTekst, model.wynik) }
 
    // reakcje na naciśnięcie guzików z cyframi - wysyłanie do modelu odpowiedniej informacji
    @IBAction func pierwszyNaciśnięty(_ sender: UIButton) {
        model.ustawPierwszą(sender.titleLabel!.text!) // wysłanie komunikatu do modelu
    }
    @IBAction func drugiNaciśnięty(_ sender: UIButton) {
        model.ustawDrugą(sender.titleLabel!.text!) // wysłanie komunikatu do modelu
    }
    
    // reakcja na zmianę typu obliczeń
    @IBAction func zmianaWartości(_ sender: UISegmentedControl) {
        let txt = sender.titleForSegment(at: sender.selectedSegmentIndex)!
		model.ustawDziałanie(txt) // wysłanie komunikatu do modelu
    }
}

