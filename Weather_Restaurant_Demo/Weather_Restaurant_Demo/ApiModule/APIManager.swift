//
//  APIManager.swift
//  Weather_Restaurant_Demo
//
//  Created by Waqas Khan on 24/03/2019.
//  Copyright © 2019 test. All rights reserved.
//

import Foundation
import Alamofire

class APIManager {
    
    class func headers() -> HTTPHeaders {
        var headers: HTTPHeaders = [
            //  "Content-Type": "application/x-www-form-urlencoded",
            //  "Accept": "application/json",
            // "Accept-Language":"en"
            //  "Content-Type": "application/json"
            "Accept": "application/json",
            "Accept-Language": Bundle.main.preferredLocalizations[0]
        ]
        
        if let authToken = UserDefaults.standard.string(forKey: UserDefaultConstant.auth_token_userDefault) {
            headers["Authorization"] = "Bearer" + " " + authToken
        }
        
        return headers
    }
    
    class func headersForJsonEncoding() -> HTTPHeaders {
        var headers: HTTPHeaders = [
            "Accept": "application/json"
        ]
        
        if let authToken = UserDefaults.standard.string(forKey: UserDefaultConstant.auth_token_userDefault) {
            headers["Authorization"] = "Bearer" + " " + authToken
        }
        
        return headers
    }
    
    class func getAccessToken()->[String:Any]{
        var param:[String:Any] =  [String:Any]()
        if let authToken = UserDefaults.standard.string(forKey: UserDefaultConstant.auth_token_userDefault) {
            param["Authorization"] = "Bearer" + " " + authToken
        }
        
        return param
    }
}
