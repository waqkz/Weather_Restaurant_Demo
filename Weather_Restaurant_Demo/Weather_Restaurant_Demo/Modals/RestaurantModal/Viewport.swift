//
//  Viewport.swift
//  Weather_Restaurant_Demo
//
//  Created by Waqas Khan on 26/03/2019.
//  Copyright © 2019 test. All rights reserved.
//

import Foundation
import SwiftyJSON


class Viewport : NSObject, NSCoding{
    
    var northeast : Northeast!
    var southwest : Southwest!
    
    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        let northeastJson = json["northeast"]
        if !northeastJson.isEmpty{
            northeast = Northeast(fromJson: northeastJson)
        }
        let southwestJson = json["southwest"]
        if !southwestJson.isEmpty{
            southwest = Southwest(fromJson: southwestJson)
        }
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if northeast != nil{
            dictionary["northeast"] = northeast.toDictionary()
        }
        if southwest != nil{
            dictionary["southwest"] = southwest.toDictionary()
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        northeast = aDecoder.decodeObject(forKey: "northeast") as? Northeast
        southwest = aDecoder.decodeObject(forKey: "southwest") as? Southwest
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    func encode(with aCoder: NSCoder)
    {
        if northeast != nil{
            aCoder.encode(northeast, forKey: "northeast")
        }
        if southwest != nil{
            aCoder.encode(southwest, forKey: "southwest")
        }
        
    }
    
}
