//
//  AdaptiveLayoutConstraint.swift
//  testUI
//
//  Created by Nikesh Shakya on 11/8/19.
//  Copyright © 2019 Nikesh Shakya. All rights reserved.
//

import UIKit

class AdaptiveLayoutConstraint: NSLayoutConstraint {
    
    @IBInspectable var setAdaptiveLayout: Bool = false {
        didSet {
        }
    }
    
    override func awakeFromNib() {
        if setAdaptiveLayout {
            self.constant = self.constant.relativeToIphone8Width()
            
            if let firstView = self.firstItem as? UIView {
                firstView.layoutIfNeeded()
            }
            if let secondVIew = self.secondItem as? UIView {
                secondVIew.layoutIfNeeded()
            }
        }
    }
    
}
