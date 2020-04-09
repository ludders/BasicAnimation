//
//  ViewController.swift
//  BasicAnimation
//
//  Created by dludlow7 on 09/04/2020.
//  Copyright © 2020 David Ludlow. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var containerView: UIView!

    init(bgColour: UIColor) {
        containerView = UIView(frame: UIScreen.main.bounds)
        containerView.backgroundColor = bgColour
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
    }
}

