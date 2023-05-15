//
//  ViewController.swift
//  Anim_Swift
//
//  Created by Adam Wojtasik on 20/11/14.
//  Copyright (c) 2014 Adam Wojtasik. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var theRedView: UIView!

    @IBAction func pushMove(_ sender: UIButton) {

        // Obliczenie położenia docelowego
		let theEndRect = CGRect  (x: self.theRedView.frame.origin.x + 250,
		                          y: self.theRedView.frame.origin.y,
		                          width: self.theRedView.frame.size.width,
		                          height: self.theRedView.frame.size.height)

        // Zdefiniowanie animacji
        UIView.animateKeyframes( withDuration: 1.5, delay: 2.0, options: [.autoreverse, .repeat],
            animations: {
				UIView.addKeyframe(withRelativeStartTime: 0.0,
				            relativeDuration: 1.0,
				            animations: {
								self.theRedView.frame = theEndRect
				})
				UIView.addKeyframe(withRelativeStartTime: 0.0,
						   relativeDuration: 1.0,
						   animations: { self.theRedView.alpha = 0.0 })
           },
            completion: nil
        );
    }
}

