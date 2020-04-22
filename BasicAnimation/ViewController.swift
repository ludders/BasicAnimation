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
    var arrivalView: UILabel!
    var carAnimationView: CarAnimationView!
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
        addSubViews()
    }

    private func addSubViews() {
        arrivalView = UILabel(frame: containerView.frame)
        arrivalView.backgroundColor = UIColor.white
        arrivalView.text = "You Have Arrived!"
        arrivalView.textColor = UIColor.black
        arrivalView.textAlignment = .center
        arrivalView.font = UIFont.systemFont(ofSize: 40)
        containerView.addSubview(arrivalView)

        carAnimationView = CarAnimationView(frame: containerView.frame)
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(playCarAnimation(_:)))
        carAnimationView.addGestureRecognizer(tapRecognizer)
        containerView.addSubview(carAnimationView)
    }

    @objc func playCarAnimation(_ sender: UIGestureRecognizer) {
        if sender.state == .ended {
            carAnimationView.animationDelegate = self
            carAnimationView.startAnimation()
            carAnimationView.gestureRecognizers = nil
        }
    }

    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        UIView.animate(withDuration: 1.0, animations: {
            self.carAnimationView.transform = CGAffineTransform(scaleX: 10.0, y: 10.0)
        })
        UIView.animate(withDuration: 1.0, delay: 0.5, animations: {
            self.carAnimationView.alpha = 0.0
        }) { _ in
            self.carAnimationView.removeFromSuperview()
        }
    }
}
