//
//  Created by Adam Wojtasik on 31.03.2015.
//  Copyright (c) 2015 Institute of Microelectronics and Optoelectronics. All rights reserved.
//

import UIKit

class UpperView: UIView {
    override func draw(_ rect: CGRect){
        super.draw(rect)
        print("maluje view \(Int.random(in: 0..<100))")  // został użyty half-open range operator
    }
}
