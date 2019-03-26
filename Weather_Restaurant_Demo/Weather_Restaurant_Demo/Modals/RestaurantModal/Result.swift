//
//  Object.swift
//  Weather_Restaurant_Demo
//
//  Created by Waqas Khan on 26/03/2019.
//  Copyright © 2019 test. All rights reserved.
//

import Foundation
import SwiftyJSON


class Result : NSObject, NSCoding{
    
    var geometry : Geometry!
    var icon : String!
    var id : String!
    var name : String!
    var openingHours : OpeningHour!
    var photos : [Photo]!
    var placeId : String!
    var plusCode : PlusCode!
    var priceLevel : Int!
    var rating : Float!
    var reference : String!
    var scope : String!
    var types : [String]!
    var userRatingsTotal : Int!
    var vicinity : String!
    
    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        let geometryJson = json["geometry"]
        if !geometryJson.isEmpty{
            geometry = Geometry(fromJson: geometryJson)
        }
        icon = json["icon"].stringValue
        id = json["id"].stringValue
        name = json["name"].stringValue
        let openingHoursJson = json["opening_hours"]
        if !openingHoursJson.isEmpty{
            openingHours = OpeningHour(fromJson: openingHoursJson)
        }
        photos = [Photo]()
        let photosArray = json["photos"].arrayValue
        for photosJson in photosArray{
            let value = Photo(fromJson: photosJson)
            photos.append(value)
        }
        placeId = json["place_id"].stringValue
        let plusCodeJson = json["plus_code"]
        if !plusCodeJson.isEmpty{
            plusCode = PlusCode(fromJson: plusCodeJson)
        }
        priceLevel = json["price_level"].intValue
        rating = json["rating"].floatValue
        reference = json["reference"].stringValue
        scope = json["scope"].stringValue
        types = [String]()
        let typesArray = json["types"].arrayValue
        for typesJson in typesArray{
            types.append(typesJson.stringValue)
        }
        userRatingsTotal = json["user_ratings_total"].intValue
        vicinity = json["vicinity"].stringValue
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if geometry != nil{
            dictionary["geometry"] = geometry.toDictionary()
        }
        if icon != nil{
            dictionary["icon"] = icon
        }
        if id != nil{
            dictionary["id"] = id
        }
        if name != nil{
            dictionary["name"] = name
        }
        if openingHours != nil{
            dictionary["openingHours"] = openingHours.toDictionary()
        }
        if photos != nil{
            var dictionaryElements = [[String:Any]]()
            for photosElement in photos {
                dictionaryElements.append(photosElement.toDictionary())
            }
            dictionary["photos"] = dictionaryElements
        }
        if placeId != nil{
            dictionary["place_id"] = placeId
        }
        if plusCode != nil{
            dictionary["plusCode"] = plusCode.toDictionary()
        }
        if priceLevel != nil{
            dictionary["price_level"] = priceLevel
        }
        if rating != nil{
            dictionary["rating"] = rating
        }
        if reference != nil{
            dictionary["reference"] = reference
        }
        if scope != nil{
            dictionary["scope"] = scope
        }
        if types != nil{
            dictionary["types"] = types
        }
        if userRatingsTotal != nil{
            dictionary["user_ratings_total"] = userRatingsTotal
        }
        if vicinity != nil{
            dictionary["vicinity"] = vicinity
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        geometry = aDecoder.decodeObject(forKey: "geometry") as? Geometry
        icon = aDecoder.decodeObject(forKey: "icon") as? String
        id = aDecoder.decodeObject(forKey: "id") as? String
        name = aDecoder.decodeObject(forKey: "name") as? String
        openingHours = aDecoder.decodeObject(forKey: "opening_hours") as? OpeningHour
        photos = aDecoder.decodeObject(forKey: "photos") as? [Photo]
        placeId = aDecoder.decodeObject(forKey: "place_id") as? String
        plusCode = aDecoder.decodeObject(forKey: "plus_code") as? PlusCode
        priceLevel = aDecoder.decodeObject(forKey: "price_level") as? Int
        rating = aDecoder.decodeObject(forKey: "rating") as? Float
        reference = aDecoder.decodeObject(forKey: "reference") as? String
        scope = aDecoder.decodeObject(forKey: "scope") as? String
        types = aDecoder.decodeObject(forKey: "types") as? [String]
        userRatingsTotal = aDecoder.decodeObject(forKey: "user_ratings_total") as? Int
        vicinity = aDecoder.decodeObject(forKey: "vicinity") as? String
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    func encode(with aCoder: NSCoder)
    {
        if geometry != nil{
            aCoder.encode(geometry, forKey: "geometry")
        }
        if icon != nil{
            aCoder.encode(icon, forKey: "icon")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if openingHours != nil{
            aCoder.encode(openingHours, forKey: "opening_hours")
        }
        if photos != nil{
            aCoder.encode(photos, forKey: "photos")
        }
        if placeId != nil{
            aCoder.encode(placeId, forKey: "place_id")
        }
        if plusCode != nil{
            aCoder.encode(plusCode, forKey: "plus_code")
        }
        if priceLevel != nil{
            aCoder.encode(priceLevel, forKey: "price_level")
        }
        if rating != nil{
            aCoder.encode(rating, forKey: "rating")
        }
        if reference != nil{
            aCoder.encode(reference, forKey: "reference")
        }
        if scope != nil{
            aCoder.encode(scope, forKey: "scope")
        }
        if types != nil{
            aCoder.encode(types, forKey: "types")
        }
        if userRatingsTotal != nil{
            aCoder.encode(userRatingsTotal, forKey: "user_ratings_total")
        }
        if vicinity != nil{
            aCoder.encode(vicinity, forKey: "vicinity")
        }
        
    }
    
}
