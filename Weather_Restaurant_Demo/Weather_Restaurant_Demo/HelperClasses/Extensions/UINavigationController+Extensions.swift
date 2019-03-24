//
//  UINavigationController+Extensions.swift
//  Weather_Restaurant_Demo
//
//  Created by Waqas Khan on 23/03/2019.
//  Copyright © 2019 test. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationController {
    
    func TransparentNavigationBar() {
        self.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationBar.isTranslucent = true
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.backgroundColor = UIColor.clear
        setNavigationBarHidden(false, animated: true)
    }
    
    func ThemedNavigationBar() {
        self.navigationBar.barTintColor = UIColor.hexStringToUIColor(hex: ColorConstant.THEME_COLOR)
        self.navigationBar.isTranslucent = false
    }
    
    func ChangeNavigationBarColor(color: UIColor) {
        self.navigationBar.barTintColor = color
        self.navigationBar.isTranslucent = false
    }
    
    func HideNavigationBar() {
        self.isNavigationBarHidden = true
    }
    
    func ShowNavigationBar() {
        self.isNavigationBarHidden = false
    }
    
    func ChangeTitleColor(color: UIColor) {
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: color]
    }
    
    func placeImageOnTitleOfNavigationBar(){
        
        let logo = UIImage(named: "navbarLogo")
        let imageView = UIImageView(image:logo)
        self.topViewController!.navigationItem.titleView = imageView
    }
}
