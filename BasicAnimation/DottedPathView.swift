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

    override class var layerClass: AnyClass {
        return CAShapeLayer.self
    }

    public var shapeLayer: CAShapeLayer {
        return self.layer as! CAShapeLayer
    }

    private var linePath: CGPath {
        //Path Setup
        let path = CGMutablePath()
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

        return path
    }

    private func setupLayer() {
        shapeLayer.lineWidth = self.lineWidth
        shapeLayer.strokeColor = UIColor.white.cgColor
        shapeLayer.lineDashPattern = [10,5,5,5,5,10,5,5,10,10,5,5,5,5,5,5,10,10,5,10]
        shapeLayer.strokeEnd = 0.0
    }

    init(lineWidth: CGFloat, frame: CGRect) {
        self.lineWidth = lineWidth
        super.init(frame: frame)
        setupLayer()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        shapeLayer.path = linePath
    }
}
