//
//  Alert.swift
//  Weather_Restaurant_Demo
//
//  Created by Waqas Khan on 23/03/2019.
//  Copyright © 2019 test. All rights reserved.

import UIKit
import Foundation
import MBProgressHUD
import CDAlertView

class Alert: NSObject {
    
    static let sharedInstance: Alert = Alert()
    
    private override init(){}
    
    var loadingAlert : MBProgressHUD!
    
    func showLoader(message : String){
        loadingAlert = MBProgressHUD.showAdded(to: AppDelegate.getInstance().window!, animated: true)
        loadingAlert.label.text = message
    }
    
    func hideLoader(){
        MBProgressHUD.hide(for: AppDelegate.getInstance().window!, animated: true)
    }
    
    func showAlert(title : String,message : String){
        
        let alert = UIAlertController(title: title as String, message: message as String, preferredStyle: UIAlertController.Style.alert)
        
        let alertAction = UIAlertAction(title: NSLocalizedString("OK", comment: "") , style: UIAlertAction.Style.default) { (action) -> Void in
            // do something after completation
        }
        alert.addAction(alertAction)
        AppDelegate.getInstance().window?.rootViewController!.present(alert, animated: true, completion: nil)
        
    }
    
    func showCDAlert(title : String,message : String , type: CDAlertViewType){
        
        let alert = CDAlertView(title: title, message: message, type: type)
        alert.customView?.alpha = 1
        let doneAction = CDAlertViewAction(title: "OK")
        doneAction.buttonTextColor = UIColor.red
        alert.add(action: doneAction)
        alert.show()
    }
    
    func showToast(message:String){
        
        loadingAlert = MBProgressHUD.showAdded(to: AppDelegate.getInstance().window!, animated: true)
        loadingAlert.label.text = message
        loadingAlert.label.font = UIFont(name:"Arial", size: SizeUtil.convertIphone6SizeToOtherPhonesRespectively(size: 13))!
        loadingAlert.mode = MBProgressHUDMode.text
        loadingAlert.margin = 15
        loadingAlert.offset.y = 200
        loadingAlert.removeFromSuperViewOnHide = true
        loadingAlert.hide(animated:true, afterDelay: 1.5)
    }
}
