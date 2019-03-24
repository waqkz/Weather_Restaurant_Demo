//
//  UIButton+Extensions.swift
//  Weather_Restaurant_Demo
//
//  Created by Waqas Khan on 23/03/2019.
//  Copyright © 2019 test. All rights reserved.
//

import Foundation
import UIKit

extension UIButton{
    func setleftImageEdgeInsert(){
        self.contentEdgeInsets = UIEdgeInsets(top: 0, left: -25.0, bottom: 0, right: 0)
    }
    func setRightImageEdgeInsert(){
        self.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -25.0)
    }
}
