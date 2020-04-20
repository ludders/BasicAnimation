//
//  LineView.swift
//  BasicAnimation
//
//  Created by dludlow7 on 17/04/2020.
//  Copyright © 2020 David Ludlow. All rights reserved.
//

import Foundation
import UIKit

class LineView: UIView {

    public var orientation: LineViewOrientation
    public var lineWidth: CGFloat

    init(lineWidth: CGFloat, orientation: LineViewOrientation, frame: CGRect) {
        self.lineWidth = lineWidth
        self.orientation = orientation
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func draw(_ rect: CGRect) {
        //Path Setup
        self.tintColor.setStroke()
        let path = UIBezierPath()
        path.lineWidth = self.lineWidth
        let pattern: [CGFloat] = [10,5,5,5,5,10,5,5,10,10,5,5,5,5,5,5,10,10,5,10]
        path.setLineDash(pattern, count: 20, phase: 0)

        //Draw Path
        path.move(to: CGPoint(x: 0, y: 0))
        let endPoint = orientation == .horizontal ? CGPoint(x: self.frame.width, y: 0) : CGPoint(x: 0, y: self.frame.height)
        path.addLine(to: endPoint)
        path.stroke()
    }
}

enum LineViewOrientation {
    case horizontal
    case vertical
}
