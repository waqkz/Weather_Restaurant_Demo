//
//  CustomNavigationController.swift
//  Weather_Restaurant_Demo
//
//  Created by Waqas Khan on 24/03/2019.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit

class CustomNavigationController: UINavigationController {
    
    class func instantiateFromStoryboard() -> CustomNavigationController {
        let storyboard = UIStoryboard(name: Constants.MAIN_STORYBOARD, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: String(describing: self)) as! CustomNavigationController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.navigationBar.barTintColor = UIColor.hexStringToUIColor(hex: ColorConstant.THEME_COLOR)
        
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.hexStringToUIColor(hex: ColorConstant.THEME_COLOR)/*,NSAttributedString.Key.font: UIFont(name: "Poppins-Regular", size: 14)!*/]
        self.navigationBar.titleTextAttributes = textAttributes
        
        self.StatusBar()
        self.navigationController?.TransparentNavigationBar()
    }
    
    func StatusBar(){
        let statusBarView = UIView(frame: UIApplication.shared.statusBarFrame)
        let statusBarColor = UIColor.hexStringToUIColor(hex: ColorConstant.THEME_COLOR)
        statusBarView.backgroundColor = statusBarColor
        view.addSubview(statusBarView)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
