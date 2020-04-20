//
//  BubblyViewController.swift
//  BasicAnimation
//
//  Created by dludlow7 on 09/04/2020.
//  Copyright © 2020 David Ludlow. All rights reserved.
//

import UIKit

class BubblyViewController: UIViewController {

    var degrees: Int = 0
    var containerView: UIView!

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
        super.viewDidLoad()
        containerView.backgroundColor = UIColor.black
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(screenTapped(_:)))
        containerView.addGestureRecognizer(tapRecognizer)
    }

    @objc func screenTapped(_ sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            let boxView: UIView = {
                let view = UIView(frame: CGRect(x: 0, y: 0, width: 1, height: 1))
                view.backgroundColor = randomColour
                view.center = sender.location(in: containerView)
                if degrees + 1 > 360 {
                    degrees = 0
                } else {
                    degrees += 1
                }
                view.transform = CGAffineTransform(rotationAngle: CGFloat(integerLiteral: degrees) * (CGFloat.pi/180))
                view.layer.cornerRadius = view.bounds.height/2
                return view
            }()
            containerView.addSubview(boxView)
            UIView.animate(withDuration: 3, delay: 0, options:[.allowUserInteraction], animations: {
                boxView.transform = boxView.transform.concatenating(CGAffineTransform(scaleX: 1500, y: 1500))
                boxView.alpha = 0.0
            }) { _ in
                boxView.removeFromSuperview()
            }
        }
    }

    var randomColour: UIColor {
        let r = CGFloat.random(in: 0...1)
        let g = CGFloat.random(in: 0...1)
        let b = CGFloat.random(in: 0...1)
        return UIColor(red: r, green: g, blue: b, alpha: 0.8)
    }
}
