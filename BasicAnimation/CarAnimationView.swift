//
//  CarAnimationView.swift
//  BasicAnimation
//
//  Created by dludlow7 on 21/04/2020.
//  Copyright © 2020 David Ludlow. All rights reserved.
//

import Foundation
import UIKit

class CarAnimationView: UIView {

    var dottedPathView: DottedPathView!
    var carView: UIImageView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureSubviews() {
        backgroundColor = UIColor.black
        dottedPathView = DottedPathView(lineWidth: 4.0, frame: CGRect.zero)
        addSubview(dottedPathView)

        dottedPathView.translatesAutoresizingMaskIntoConstraints = false
        let constraints: [NSLayoutConstraint] = [
            dottedPathView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            dottedPathView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 30),
            dottedPathView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, constant: -60),
            dottedPathView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, constant: -60)
        ]
        NSLayoutConstraint.activate(constraints)

        carView = UIImageView(image: UIImage(named: "car"))
        carView.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        addSubview(carView)

        carView.translatesAutoresizingMaskIntoConstraints = false
        let carConstraints: [NSLayoutConstraint] = [
            carView.centerXAnchor.constraint(equalTo: dottedPathView.leftAnchor, constant: dottedPathView.lineWidth/2),
            carView.centerYAnchor.constraint(equalTo: dottedPathView.topAnchor, constant: dottedPathView.lineWidth/2),
            carView.heightAnchor.constraint(equalToConstant: 50),
            carView.widthAnchor.constraint(equalToConstant: 50)
        ]
        NSLayoutConstraint.activate(carConstraints)
    }

    func startAnimation() {
        let pathDrawAnimation = CABasicAnimation(keyPath: "strokeEnd")
        pathDrawAnimation.fromValue = 0.0
        pathDrawAnimation.toValue = 1.0
        pathDrawAnimation.duration = 8.0
        dottedPathView.shapeLayer.add(pathDrawAnimation, forKey: "strokeEnd")
        dottedPathView.shapeLayer.strokeEnd = 1.0

        let carAnimation = CAKeyframeAnimation(keyPath: "position")
        carAnimation.duration = 8.0
        carAnimation.path = dottedPathView.shapeLayer.path
        carAnimation.isAdditive = true
        carAnimation.fillMode = .forwards
        carAnimation.calculationMode = .paced
        carAnimation.rotationMode = .rotateAuto
        carAnimation.isRemovedOnCompletion = false
        carView.layer.add(carAnimation, forKey: "position")
    }
}
