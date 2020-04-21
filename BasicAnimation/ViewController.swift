//
//  ViewController.swift
//  BasicAnimation
//
//  Created by dludlow7 on 09/04/2020.
//  Copyright © 2020 David Ludlow. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CAAnimationDelegate {

    var degrees: Int = 0
    var containerView: UIView!
    var carAnimationView: CarAnimationView!
    var carView: UIImageView!
    var displayLink: CADisplayLink?

    init() {
        containerView = UIView(frame: UIScreen.main.bounds)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = containerView
    }

    override func viewDidLoad() {
        carAnimationView = CarAnimationView(frame: containerView.frame)
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(playAnimation(_:)))
        carAnimationView.addGestureRecognizer(tapRecognizer)
        containerView.addSubview(carAnimationView)
    }

    @objc func playAnimation(_ sender: UIGestureRecognizer) {
        if sender.state == .ended {
            carAnimationView.startAnimation()
            carAnimationView.gestureRecognizers = nil
        }
    }
}
