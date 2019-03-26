//
//  Geometry.swift
//  Weather_Restaurant_Demo
//
//  Created by Waqas Khan on 26/03/2019.
//  Copyright © 2019 test. All rights reserved.
//

import Foundation
import SwiftyJSON


class Geometry : NSObject, NSCoding{
    
    var location : Location!
    var viewport : Viewport!
    
    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        let locationJson = json["location"]
        if !locationJson.isEmpty{
            location = Location(fromJson: locationJson)
        }
        let viewportJson = json["viewport"]
        if !viewportJson.isEmpty{
            viewport = Viewport(fromJson: viewportJson)
        }
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if location != nil{
            dictionary["location"] = location.toDictionary()
        }
        if viewport != nil{
            dictionary["viewport"] = viewport.toDictionary()
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        location = aDecoder.decodeObject(forKey: "location") as? Location
        viewport = aDecoder.decodeObject(forKey: "viewport") as? Viewport
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    func encode(with aCoder: NSCoder)
    {
        if location != nil{
            aCoder.encode(location, forKey: "location")
        }
        if viewport != nil{
            aCoder.encode(viewport, forKey: "viewport")
        }
        
    }
    
}
