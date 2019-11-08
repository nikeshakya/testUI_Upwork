//
//  RoundedView.swift
//  testUI
//
//  Created by Nikesh Shakya on 11/8/19.
//  Copyright © 2019 Nikesh Shakya. All rights reserved.
//

import UIKit

@IBDesignable
class RoundView: UIView {
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    
    @IBInspectable var isCircular: Bool = false {
        didSet {
            if isCircular {
                cornerRadius = self.frame.width / 2
            }
        }
    }
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
            self.layer.masksToBounds = true
        }
    }
    
    @IBInspectable var displayShadow: Bool = false
    
    func addShadow() {
        let layer = self.layer
        
        layer.masksToBounds = false
        
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 4
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4).cgColor
        layer.shadowPath = UIBezierPath(roundedRect: layer.bounds, cornerRadius: layer.cornerRadius).cgPath
        
        let bColor = self.backgroundColor?.cgColor
        self.backgroundColor = nil
        layer.backgroundColor =  bColor
        layer.cornerRadius = self.cornerRadius
    }
    
    override func awakeFromNib() {
        if isCircular {
            self.cornerRadius = self.frame.width / 2
        }
        else {
            self.layer.cornerRadius = cornerRadius.relativeToIphone8Width()
        }
        self.layer.borderWidth = borderWidth.relativeToIphone8Width()
        if displayShadow {
            addShadow()
        }
    }
    
    override func layoutSubviews() {
        if isCircular {
            self.cornerRadius = self.frame.width / 2
        }
        if displayShadow {
            addShadow()
        }
    }
}
