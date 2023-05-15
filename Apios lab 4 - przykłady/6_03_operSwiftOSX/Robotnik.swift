//
//  Created by Adam Wojtasik on 28/11/2017.
//  Last modifications: 01.04.2019
//  Copyright © 2017 Politechnika Warszawska. All rights reserved.
//

import Foundation


struct Robotnik {
	static internal func doSomething(tekst text: String, first kMax: Int64, sec iMax: Int64, third jMax: Int64){
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

	static func pracuj(_ text: String) {
        let loop1 = Int64.random(in: 4...6)
        let loop2 = Int64.random(in: 5000...10000)
        let loop3 = Int64.random(in: 1000...2000)
		doSomething(tekst: text, first: loop1, sec: loop2, third: loop3)
	}
}



