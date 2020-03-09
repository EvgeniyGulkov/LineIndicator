//
//  ViewController.swift
//  LineIndicator
//
//  Created by Admin on 09.03.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var indicator: LineActivityIndicator!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.indicator = LineActivityIndicator(frame: self.view.frame)
        self.indicator.yPosition = 100
        self.view.addSubview(indicator)
    }
}

