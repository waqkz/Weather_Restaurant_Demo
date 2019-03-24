//
//  UIView+Extensions.swift
//  Weather_Restaurant_Demo
//
//  Created by Waqas Khan on 23/03/2019.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit

extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable var shadow: Bool {
        get {
            return layer.shadowOpacity > 0.0
        }
        set {
            if newValue == true {
                self.addShadow()
            }
        }
    }
    
    func addShadow(shadowColor: CGColor = UIColor.lightGray.cgColor,
                   shadowOffset: CGSize = CGSize(width: 0, height: 0.5),
                   shadowOpacity: Float = 0.6,
                   shadowRadius: CGFloat = 1) {
        
        layer.shadowColor = shadowColor
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
    
    @IBInspectable var bottomShadowHeight: CGFloat {
        get {
            return self.bottomShadowHeight
        }
        set {
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowOffset = CGSize.init(width: 0, height: newValue)
            self.layer.shadowOpacity = 0.05;
            self.layer.shadowRadius = 5;
            self.layer.masksToBounds = false;
        }
    }
    
    @IBInspectable var isCircleMe: Bool {
        get {
            return self.isCircleMe
        }
        set {
            if newValue == true {
                let radius = self.bounds.width / 2
                self.layer.cornerRadius = radius
                self.layer.masksToBounds = true
                self.clipsToBounds = true
            }
        }
    }
    
    @IBInspectable var topRightRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: .topRight, cornerRadii: CGSize(width: newValue, height: newValue))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            self.layer.mask = mask
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var bottomRightRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: .bottomRight, cornerRadii: CGSize(width: newValue, height: newValue))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            self.layer.mask = mask
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var bottomLeftRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: .bottomLeft, cornerRadii: CGSize(width: newValue, height: newValue))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            self.layer.mask = mask
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var topLeftRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: .topLeft, cornerRadii: CGSize(width: newValue, height: newValue))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            self.layer.mask = mask
            layer.masksToBounds = newValue > 0
        }
    }
}
