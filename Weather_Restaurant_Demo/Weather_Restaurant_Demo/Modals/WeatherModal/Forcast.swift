//
//  Forcast.swift
//  Weather_Restaurant_Demo
//
//  Created by Waqas Khan on 26/03/2019.
//  Copyright © 2019 test. All rights reserved.
//

import Foundation
import SwiftyJSON

class Forcast : NSObject, NSCoding{
    
    var city : City!
    var cnt : Int!
    var cod : String!
    var list : [List]!
    var message : Float!
    
    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        let cityJson = json["city"]
        if !cityJson.isEmpty{
            city = City(fromJson: cityJson)
        }
        cnt = json["cnt"].intValue
        cod = json["cod"].stringValue
        list = [List]()
        let listArray = json["list"].arrayValue
        for listJson in listArray{
            let value = List(fromJson: listJson)
            list.append(value)
        }
        message = json["message"].floatValue
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if city != nil{
            dictionary["city"] = city.toDictionary()
        }
        if cnt != nil{
            dictionary["cnt"] = cnt
        }
        if cod != nil{
            dictionary["cod"] = cod
        }
        if list != nil{
            var dictionaryElements = [[String:Any]]()
            for listElement in list {
                dictionaryElements.append(listElement.toDictionary())
            }
            dictionary["list"] = dictionaryElements
        }
        if message != nil{
            dictionary["message"] = message
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        city = aDecoder.decodeObject(forKey: "city") as? City
        cnt = aDecoder.decodeObject(forKey: "cnt") as? Int
        cod = aDecoder.decodeObject(forKey: "cod") as? String
        list = aDecoder.decodeObject(forKey: "list") as? [List]
        message = aDecoder.decodeObject(forKey: "message") as? Float
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    func encode(with aCoder: NSCoder)
    {
        if city != nil{
            aCoder.encode(city, forKey: "city")
        }
        if cnt != nil{
            aCoder.encode(cnt, forKey: "cnt")
        }
        if cod != nil{
            aCoder.encode(cod, forKey: "cod")
        }
        if list != nil{
            aCoder.encode(list, forKey: "list")
        }
        if message != nil{
            aCoder.encode(message, forKey: "message")
        }
        
    }
    
}
