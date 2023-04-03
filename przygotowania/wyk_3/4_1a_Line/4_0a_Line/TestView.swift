//
//  TestView.swift
//  4_0a_Line
//
//  Created by apios on 10/11/2021.
//

import Cocoa

class TestView: NSView {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        _ = Line(CGPoint(x: 20, y: 20), CGPoint(x: 100, y: 100))
    }
    
}
