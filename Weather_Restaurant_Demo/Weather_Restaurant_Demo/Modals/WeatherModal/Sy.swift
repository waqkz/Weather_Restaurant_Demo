//
//  Sy.swift
//  Weather_Restaurant_Demo
//
//  Created by Waqas Khan on 26/03/2019.
//  Copyright © 2019 test. All rights reserved.
//

import Foundation
import SwiftyJSON

class Sy : NSObject, NSCoding{
    
    var pod : String!
    
    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        pod = json["pod"].stringValue
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if pod != nil{
            dictionary["pod"] = pod
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        pod = aDecoder.decodeObject(forKey: "pod") as? String
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    func encode(with aCoder: NSCoder)
    {
        if pod != nil{
            aCoder.encode(pod, forKey: "pod")
        }
        
    }
    
}
