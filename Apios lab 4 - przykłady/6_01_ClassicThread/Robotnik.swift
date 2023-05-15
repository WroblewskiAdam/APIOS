//
//  Created by apios on 20/04/2023.
//  Copyright © 2023 AW. All rights reserved.
//

import Foundation

//-------------------------------------------------
// Symulacja działania
func doSomething(tekst text: String, first kMax: Int64, sec iMax: Int64, third jMax: Int64){
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
