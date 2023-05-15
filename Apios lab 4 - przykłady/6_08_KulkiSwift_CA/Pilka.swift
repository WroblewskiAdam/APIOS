//
//  Created by Adam Wojtasik on 23/11/2016.
//  Last changes 10/12/2018
//  Copyright © 2016–18 Institute of Microelectronics and Optoelectronics. All rights reserved.
//

import Cocoa

class Piłka: NSImageView {

	var destination = CGPoint(x:0, y: 0)

	convenience init(ballImage theImage:NSImage, superView:NSView ){
		self.init()

        // Widok musi być wyposażony w warstwy do Core Animation
		superView.addSubview(self)
		wantsLayer = true

		image = theImage

		frame.size.width = theImage.size.width
		frame.size.height = theImage.size.height
		frame.origin.y = -self.frame.size.height
        frame.origin.x = CGFloat.random(in: 0.0...(superView.frame.size.width - frame.size.width))

		destination = CGPoint(x: self.frame.origin.x, y: superView.frame.size.height)
}

	func falling(_ sekundy: Double){

        // Jeden z mechanizmów Core Animation - tranzakcje.
        // Tu wykorzystany jedynie do zdefiniowania CompletionBlock
		CATransaction.begin()
		CATransaction.setCompletionBlock({ self.removeFromSuperview() })

        // Przykłady podstawowych animacji Core Animation:
        
        // Zdefiniowanie animacji (przesuwanie się piłeczki)
		let fallAnimation = CABasicAnimation(keyPath: "position")
		fallAnimation.duration = sekundy
		fallAnimation.fromValue = NSValue(point: self.frame.origin)
		fallAnimation.toValue = NSValue(point: destination)

        // Uruchomienie animacji przez dodanie jej na warstwę animacyjną
		self.layer!.add(fallAnimation, forKey: "position")

        // Przezroczystość piłeczki
//        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
//        opacityAnimation.duration = sekundy
//        opacityAnimation.fromValue = 1
//        opacityAnimation.toValue = 0
//        self.layer!.add(opacityAnimation, forKey: "opacity")

        // Zmiana rozmiarów piłeczki
//        let scaleAnimation = CABasicAnimation()
//        scaleAnimation.valueFunction = CAValueFunction(name: CAValueFunctionName.scale)
//        scaleAnimation.fromValue = [0, 0, 0]
//        scaleAnimation.toValue = [2, 2, 2]
//        scaleAnimation.duration = sekundy
//        self.layer!.add(scaleAnimation, forKey: "transform")

        // Obracanie się piłeczki
//        let rotate = CABasicAnimation()
//        rotate.valueFunction = CAValueFunction(name: CAValueFunctionName.rotateZ)
//        rotate.fromValue = 0
//        rotate.toValue = 8*Float.pi
//        rotate.duration = sekundy
//        self.layer!.add(rotate, forKey: "transform")
        
        // Uruchomienie tranzakcji
		CATransaction.commit()

	}
}


