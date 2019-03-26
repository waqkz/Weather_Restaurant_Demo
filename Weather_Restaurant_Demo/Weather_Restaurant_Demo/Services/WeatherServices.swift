//
//  WeatherServices.swift
//  Weather_Restaurant_Demo
//
//  Created by Waqas Khan on 26/03/2019.
//  Copyright © 2019 test. All rights reserved.
//

import Foundation
import SwiftyJSON

class WeatherServices{
    
    static let sharedInstance: WeatherServices = WeatherServices()
    
    private init(){}
    
    func getWeatherForcasts(param:[String:Any],
                        completionHandler:@escaping (_ success:Bool,_ response:JSON,_ error:Any?)->Void){
        
        Servicelayer.requestWithGETWithParam(parameters: param , apiName: EndPoints.BaseApi.WeatherForcastUrl) { (status:Bool, response:JSON, error:AnyObject?) in
            
            
            if "\(response["cod"].rawValue)" == "200"
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
