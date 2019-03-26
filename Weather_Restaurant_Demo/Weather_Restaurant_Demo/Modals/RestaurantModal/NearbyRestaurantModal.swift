//
//  NearbyRestaurantModal.swift
//  Weather_Restaurant_Demo
//
//  Created by Waqas Khan on 26/03/2019.
//  Copyright © 2019 test. All rights reserved.
//

import Foundation
import SwiftyJSON

class NearbyRestaurantModal : NSObject, NSCoding{
    
    var htmlAttributions : [AnyObject]!
    var nextPageToken : String!
    var results : [Result]!
    var status : String!
    
    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        htmlAttributions = [Int]() as [AnyObject]
        let htmlAttributionsArray = json["html_attributions"].arrayValue
        for htmlAttributionsJson in htmlAttributionsArray{
            htmlAttributions.append(htmlAttributionsJson as AnyObject)
        }
        nextPageToken = json["next_page_token"].stringValue
        results = [Result]()
        let resultsArray = json["results"].arrayValue
        for resultsJson in resultsArray{
            let value = Result(fromJson: resultsJson)
            results.append(value)
        }
        status = json["status"].stringValue
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if htmlAttributions != nil{
            dictionary["html_attributions"] = htmlAttributions
        }
        if nextPageToken != nil{
            dictionary["next_page_token"] = nextPageToken
        }
        if results != nil{
            var dictionaryElements = [[String:Any]]()
            for resultsElement in results {
                dictionaryElements.append(resultsElement.toDictionary())
            }
            dictionary["results"] = dictionaryElements
        }
        if status != nil{
            dictionary["status"] = status
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        htmlAttributions = aDecoder.decodeObject(forKey: "html_attributions") as? [AnyObject]
        nextPageToken = aDecoder.decodeObject(forKey: "next_page_token") as? String
        results = aDecoder.decodeObject(forKey: "results") as? [Result]
        status = aDecoder.decodeObject(forKey: "status") as? String
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    func encode(with aCoder: NSCoder)
    {
        if htmlAttributions != nil{
            aCoder.encode(htmlAttributions, forKey: "html_attributions")
        }
        if nextPageToken != nil{
            aCoder.encode(nextPageToken, forKey: "next_page_token")
        }
        if results != nil{
            aCoder.encode(results, forKey: "results")
        }
        if status != nil{
            aCoder.encode(status, forKey: "status")
        }
        
    }
    
}
