//
//  AppHelper.swift
//  Weather_Restaurant_Demo
//
//  Created by Waqas Khan on 24/03/2019.
//  Copyright © 2019 test. All rights reserved.
//

import Foundation
import UIKit

class AppHelper{
    
    static let sharedInstance = AppHelper()
    
    private init(){}
    
    func navigateToWeather(){
        let nav = CustomNavigationController()
        nav.isNavigationBarHidden = true
        let loginVc = WeatherViewController.instantiateFromStoryboard()
        nav.setViewControllers([loginVc], animated: true)
        AppDelegate.getInstance().window?.rootViewController = nav
    }
}
