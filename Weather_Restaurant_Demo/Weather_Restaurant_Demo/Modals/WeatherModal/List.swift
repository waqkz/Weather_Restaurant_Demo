//
//  List.swift
//  Weather_Restaurant_Demo
//
//  Created by Waqas Khan on 26/03/2019.
//  Copyright © 2019 test. All rights reserved.
//

import Foundation
import SwiftyJSON


class List : NSObject, NSCoding{
    
    var clouds : Cloud!
    var dt : Int!
    var dtTxt : String!
    var main : Main!
    var rain : Rain!
    var sys : Sy!
    var weather : [Weather]!
    var wind : Wind!
    
    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        let cloudsJson = json["clouds"]
        if !cloudsJson.isEmpty{
            clouds = Cloud(fromJson: cloudsJson)
        }
        dt = json["dt"].intValue
        dtTxt = json["dt_txt"].stringValue
        let mainJson = json["main"]
        if !mainJson.isEmpty{
            main = Main(fromJson: mainJson)
        }
        let rainJson = json["rain"]
        if !rainJson.isEmpty{
            rain = Rain(fromJson: rainJson)
        }
        let sysJson = json["sys"]
        if !sysJson.isEmpty{
            sys = Sy(fromJson: sysJson)
        }
        weather = [Weather]()
        let weatherArray = json["weather"].arrayValue
        for weatherJson in weatherArray{
            let value = Weather(fromJson: weatherJson)
            weather.append(value)
        }
        let windJson = json["wind"]
        if !windJson.isEmpty{
            wind = Wind(fromJson: windJson)
        }
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if clouds != nil{
            dictionary["clouds"] = clouds.toDictionary()
        }
        if dt != nil{
            dictionary["dt"] = dt
        }
        if dtTxt != nil{
            dictionary["dt_txt"] = dtTxt
        }
        if main != nil{
            dictionary["main"] = main.toDictionary()
        }
        if rain != nil{
            dictionary["rain"] = rain.toDictionary()
        }
        if sys != nil{
            dictionary["sys"] = sys.toDictionary()
        }
        if weather != nil{
            var dictionaryElements = [[String:Any]]()
            for weatherElement in weather {
                dictionaryElements.append(weatherElement.toDictionary())
            }
            dictionary["weather"] = dictionaryElements
        }
        if wind != nil{
            dictionary["wind"] = wind.toDictionary()
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        clouds = aDecoder.decodeObject(forKey: "clouds") as? Cloud
        dt = aDecoder.decodeObject(forKey: "dt") as? Int
        dtTxt = aDecoder.decodeObject(forKey: "dt_txt") as? String
        main = aDecoder.decodeObject(forKey: "main") as? Main
        rain = aDecoder.decodeObject(forKey: "rain") as? Rain
        sys = aDecoder.decodeObject(forKey: "sys") as? Sy
        weather = aDecoder.decodeObject(forKey: "weather") as? [Weather]
        wind = aDecoder.decodeObject(forKey: "wind") as? Wind
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    func encode(with aCoder: NSCoder)
    {
        if clouds != nil{
            aCoder.encode(clouds, forKey: "clouds")
        }
        if dt != nil{
            aCoder.encode(dt, forKey: "dt")
        }
        if dtTxt != nil{
            aCoder.encode(dtTxt, forKey: "dt_txt")
        }
        if main != nil{
            aCoder.encode(main, forKey: "main")
        }
        if rain != nil{
            aCoder.encode(rain, forKey: "rain")
        }
        if sys != nil{
            aCoder.encode(sys, forKey: "sys")
        }
        if weather != nil{
            aCoder.encode(weather, forKey: "weather")
        }
        if wind != nil{
            aCoder.encode(wind, forKey: "wind")
        }
        
    }
    
}
