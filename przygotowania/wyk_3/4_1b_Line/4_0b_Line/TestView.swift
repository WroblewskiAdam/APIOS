//
//  TestView.swift
//  4_0b_Line
//
//  Created by apios on 10/11/2021.
//

import UIKit

class TestView: UIView {

    override func draw(_ rect: CGRect) {
        _ = Line(CGPoint(x: 20, y: 20), CGPoint(x: 100, y: 100))
    }

}
