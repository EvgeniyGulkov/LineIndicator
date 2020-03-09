//
//  LineIndicator.swift
//  LineIndicator
//
//  Created by Admin on 09.03.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class LineActivityIndicator: UIView {

    private var stopped: Bool = true
    private var gradientLayer: CAGradientLayer!
    
    var yPosition: CGFloat {
        get {
            return self.gradientLayer.position.y
        }
        set {
            if newValue < self.frame.height {
                self.gradientLayer.position.y = newValue
            } else {
                self.gradientLayer.position.y = self.frame.height
            }
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func startAnimation() {
        stopped = false
        start()
    }
    
    private func commonInit() {
        self.frame = self.bounds
        self.backgroundColor = UIColor.clear
        self.addGradientLayer()
        self.startAnimation()
    }
    
    private func addGradientLayer() {
        self.gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.white.cgColor, UIColor.white.cgColor, UIColor.white.cgColor, UIColor.clear.cgColor]
        gradientLayer.frame.size = CGSize(width: self.bounds.width*1.5, height: 2.0)
        gradientLayer.position.x = -self.bounds.width / 1.5
        gradientLayer.position.y = 1
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    private func start() {
        guard !stopped else {
            return
        }
        stopped = false
        self.gradientLayer.frame.size = CGSize(width: self.bounds.width*2, height: 2.0)
        UIView.animateKeyframes(withDuration: 2.0, delay: 0, options: [.calculationModeLinear], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.7, animations: {
                self.layer.position.x = self.bounds.width*1.75
            })
            UIView.addKeyframe(withRelativeStartTime: 0.7, relativeDuration: 0.55, animations: {
                self.layer.position.x = self.bounds.width*2.25
            })
            UIView.addKeyframe(withRelativeStartTime: 0.9, relativeDuration: 0.6, animations: {
                self.layer.position.x = self.bounds.width*3
            })
        }, completion: { _ in
            self.layer.position.x = 0
            self.gradientLayer.frame.size = CGSize(width: self.bounds.width, height: 2.0)
            UIView.animate(withDuration: 1.8, delay: 0, options: [], animations: {
                self.layer.position.x = self.bounds.width*3
            }, completion: { _ in
                self.layer.position.x = 0
                self.start()
            })
        })
    }
    
    func stopAnimation() {
        stopped = true
    }
}
