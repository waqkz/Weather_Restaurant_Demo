//
//  RestaurantServices.swift
//  Weather_Restaurant_Demo
//
//  Created by Waqas Khan on 26/03/2019.
//  Copyright © 2019 test. All rights reserved.
//

import Foundation
import SwiftyJSON

class RestaurantServices{
    
    static let sharedInstance: RestaurantServices = RestaurantServices()
    
    private init(){}
    
    func getNearbyRestaurants(param:[String:Any],
                            completionHandler:@escaping (_ success:Bool,_ response:JSON,_ error:Any?)->Void){
        
        Servicelayer.requestWithGETWithParam(parameters: param , apiName: EndPoints.BaseApi.RestaurantUrl) { (status:Bool, response:JSON, error:AnyObject?) in
            
            
            if response["status"] == "OK"
            {
                completionHandler(true, response, nil)
            }
            else
            {
                Alert.sharedInstance.hideLoader()
                completionHandler(false, response["message"],response["message"].string)
            }
        }
    }
}
