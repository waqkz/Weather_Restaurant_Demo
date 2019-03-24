//
//  SplashViewController.swift
//  Weather_Restaurant_Demo
//
//  Created by Waqas Khan on 24/03/2019.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit

class SplashViewController: BaseViewController {
    
    var timer = Timer()
    var count:Int = 0
    
    class func instantiateFromStoryboard() -> SplashViewController {
        let storyboard = UIStoryboard(name: Constants.MAIN_STORYBOARD, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: String(describing: self)) as! SplashViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.changeProgressValue), userInfo: nil, repeats: true)
    }
    
    @objc func changeProgressValue(){
        count += 10
        if count > 100{
            timer.invalidate()
            AppHelper.sharedInstance.navigateToWeather()
        }
    }
}
