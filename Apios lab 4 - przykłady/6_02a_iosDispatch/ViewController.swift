//
//  Created by Adam Wojtasik on 13/11/14.
//  Copyright (c) 2014 Adam Wojtasik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let myDispatch = DispatchQueue(label: "mojDispacz", attributes: DispatchQueue.Attributes.concurrent)
		
        myDispatch.async(execute: { self.doSomething(tekst: "Moje zadanie A", first: 5,  sec:1000, third:10000) })
        print("Po wywolaniu Moje zadanie A");
  
        myDispatch.async(execute: { self.doSomething(tekst: "Moje zadanie B", first: 5,  sec:500, third:10000) })
        print("Po wywolaniu Moje zadanie B");

    }

 
    func doSomething(tekst text: String, first kMax: Int64, sec iMax: Int64, third jMax: Int64){
        print("\(text) - start");
        var x = 0.0
        for k in 0...kMax {
            print("\(text) - report: \(k)")
            for i in 0...iMax {
                for j in 0...jMax{
                    x = Double(j) * Double(i);
                }
            }
        }
        print("\(text) - stop \(x)");
    }
}

