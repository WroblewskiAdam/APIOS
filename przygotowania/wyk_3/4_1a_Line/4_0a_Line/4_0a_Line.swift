//
//  Created by Adam Wojtasik on 10/11/2020.
//

import Cocoa

// Pomocnicz struktura rysująca linię
struct Line{
    init(_ start: CGPoint, _ end: CGPoint){
        let myPath = NSBezierPath()
 // definiowanie ścieżki
        myPath.move(to: start)
        myPath.line(to: end)
// narysowanie ścieżki
        myPath.stroke()
    }
}


























//_ = Line(CGPoint(x: 20, y: 20), CGPoint(x: 100, y: 100))
