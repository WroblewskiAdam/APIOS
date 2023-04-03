//
//  Created by Adam Wojtasik on 10/11/2020.
//

import UIKit

// Pomocnicz struktura rysująca linię
struct Line{
    init(_ start: CGPoint, _ end: CGPoint){
        let myPath = UIBezierPath()
 // definiowanie ścieżki
        myPath.move(to: start)
        myPath.addLine(to: end)
// narysowanie ścieżki
        myPath.stroke()
    }
}


























//_ = Line(CGPoint(x: 20, y: 20), CGPoint(x: 100, y: 100))
