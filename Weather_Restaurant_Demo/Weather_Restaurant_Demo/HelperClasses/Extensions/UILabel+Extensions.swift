//
//  UILabel+Extensions.swift
//  Weather_Restaurant_Demo
//
//  Created by Waqas Khan on 23/03/2019.
//  Copyright © 2019 test. All rights reserved.
//

import Foundation
import UIKit

extension UILabel{
    
    func makeOutLine(oulineColor: UIColor, foregroundColor: UIColor){
        let strokeTextAttributes = [
            NSAttributedString.Key.strokeColor : oulineColor,
            NSAttributedString.Key.foregroundColor : foregroundColor,
            NSAttributedString.Key.strokeWidth : -4.0,
            NSAttributedString.Key.font : self.font
            ] as [NSAttributedString.Key : Any]
        self.attributedText = NSMutableAttributedString(string: self.text ?? "", attributes: strokeTextAttributes)
    }
    
    func underline() {
        if let textString = self.text {
            let attributedString = NSMutableAttributedString(string: textString);   attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: attributedString.length))
            attributedText = attributedString
        }
    }
}
