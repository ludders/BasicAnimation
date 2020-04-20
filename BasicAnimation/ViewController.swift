//
//  ViewController.swift
//  BasicAnimation
//
//  Created by dludlow7 on 09/04/2020.
//  Copyright © 2020 David Ludlow. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
        let dottedPathView = DottedPathView(lineWidth: 6.0, frame: CGRect.zero)
        dottedPathView.tintColor = UIColor.orange
        containerView.addSubview(dottedPathView)

        dottedPathView.translatesAutoresizingMaskIntoConstraints = false
        let constraints: [NSLayoutConstraint] = [
            dottedPathView.topAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.topAnchor, constant: 20),
            dottedPathView.leftAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.leftAnchor, constant: 20),
            dottedPathView.heightAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.heightAnchor, constant: -40),
            dottedPathView.widthAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.widthAnchor, constant: -40)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
