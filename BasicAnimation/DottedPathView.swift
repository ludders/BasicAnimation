//
//  DottedPathView.swift
//  BasicAnimation
//
//  Created by dludlow7 on 19/04/2020.
//  Copyright © 2020 David Ludlow. All rights reserved.
//

import Foundation
import UIKit

class DottedPathView: UIView {

    public var lineWidth: CGFloat

    init(lineWidth: CGFloat, frame: CGRect) {
        self.lineWidth = lineWidth
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
//        let pattern: [CGFloat] = [10,5]
//        path.setLineDash(pattern, count: 2, phase: 0)
        let rowHeight = (self.frame.height / 5) - (lineWidth / 2)
        let minX = lineWidth / 2
        let minY = lineWidth / 2
        let maxX = self.frame.width - (lineWidth / 2)

        //Draw Path
        path.move(to: CGPoint(x: minX, y: minY))                        //Origin
        path.addLine(to: CGPoint(x: maxX, y: minY))                     //Along >
        path.addLine(to: CGPoint(x: maxX, y: rowHeight))                //Down
        path.addLine(to: CGPoint(x: minX, y: rowHeight))                //< Along
        path.addLine(to: CGPoint(x: minX, y: rowHeight * 2))            //Down
        path.addLine(to: CGPoint(x: maxX, y: rowHeight * 2))            //Along >
        path.addLine(to: CGPoint(x: maxX, y: rowHeight * 3))            //Down
        path.addLine(to: CGPoint(x: minX, y: rowHeight * 3))            //< Along
        path.addLine(to: CGPoint(x: minX, y: rowHeight * 4))            //Down
        path.addLine(to: CGPoint(x: maxX, y: rowHeight * 4))            //Along >
        path.addLine(to: CGPoint(x: maxX, y: rowHeight * 5))            //Down
        path.addLine(to: CGPoint(x: minX, y: rowHeight * 5))            //< Along
        path.stroke()
    }
}
