//
//  Created by Adam Wojtasik on 20/11/14.
//  Last modifications 2/12/20.
//  Copyright (c) 2014 Adam Wojtasik. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    // firstView - kwadracik wczytany z zasobów (istnieje cały czas)
    @IBOutlet weak var firstView: UIView!

    // Obiekty do przechowywania parametrów początkowych i końcowych trzech kwadratów
	var firstViewRectStart:CGRect?
    var firstViewRectEnd:CGRect?

    var secViewRectStart:CGRect?
	var secViewRectEnd:CGRect?

    var thirdViewRectStart:CGRect?
	var thirdViewRectEnd:CGRect?

    // secView - kwadracik będący atrybutem (istnieje cały czas)
	let secView = UIView()

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	override func viewDidLoad() {
        // Wyznaczenie parametrów początkowych i końcowych trzech kwadratów
		firstViewRectStart = CGRect(x: firstView.frame.origin.x,
							  y: self.firstView.frame.origin.y,
							  width: self.firstView.frame.size.width,
							  height: self.firstView.frame.size.height)
		firstViewRectEnd = firstViewRectStart
		firstViewRectEnd!.origin.x += 270
		
		secViewRectStart = firstViewRectStart
		secViewRectStart!.origin.y += 80
		secViewRectEnd = firstViewRectEnd
		secViewRectEnd!.origin.y += 80
		
		thirdViewRectStart = secViewRectStart
		thirdViewRectStart!.origin.y += 80
		thirdViewRectEnd = secViewRectEnd
		thirdViewRectEnd!.origin.y += 80

        // Wyznaczenie parametrów kwadratu będącego atrybutem klasy (secView)
        // i wstawienie go do widoku
		secView.frame = secViewRectStart!
		secView.backgroundColor = UIColor(red: 0.2, green: 0.1, blue: 0.8, alpha: 1)
		secView.isOpaque = false
        secView.alpha = 0.01
 		view.addSubview(secView)
	}
	

    @IBAction func pushMove(_ sender: UIButton) {

        // thirdView - kwadracik tymczasowy tworzony tylko na czas trwania animacji
		let thirdView = UIView()
		thirdView.frame = thirdViewRectStart!
		thirdView.backgroundColor = UIColor(red: 0.05, green: 0.7, blue: 0.05, alpha: 1)
		thirdView.isOpaque = false
        thirdView.alpha = 0.01
		view.addSubview(thirdView)

        // Animacje
        UIView.animateKeyframes( withDuration: 2, delay: 0.0, options: [],
            animations: {
				self.firstView.frame = self.thirdViewRectEnd!
				self.secView.frame = self.secViewRectEnd!
				thirdView.frame = self.firstViewRectEnd!

				self.firstView.alpha = 0.01
				self.secView.alpha = 1
				thirdView.alpha = 1
           },
            // "Powrotna" animacja jest zdefiniowana w CompletionBlock pierwszej animacji
			completion: { (_: Bool) in
				UIView.animateKeyframes( withDuration: 2, delay: 0.0, options: [],
					 animations: {
						UIView.addKeyframe(withRelativeStartTime: 0.0,
						   relativeDuration: 1.0,
						   animations: {
								self.firstView.frame = self.firstViewRectStart!
								self.secView.frame = self.secViewRectStart!
								thirdView.frame = self.thirdViewRectStart!
							
								self.firstView.alpha = 1.0
								self.secView.alpha = 0.01
								thirdView.alpha = 0.01
						})
				},
                 // Usunięcie kwadracika tymczasowego po zakończeniu animacji
				 completion: { (_: Bool) in thirdView.removeFromSuperview() })
			}
        )
    }
}
