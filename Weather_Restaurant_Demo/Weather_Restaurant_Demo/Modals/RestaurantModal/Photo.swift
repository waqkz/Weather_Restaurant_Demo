//
//  Photo.swift
//  Weather_Restaurant_Demo
//
//  Created by Waqas Khan on 26/03/2019.
//  Copyright © 2019 test. All rights reserved.
//

import Foundation
import SwiftyJSON

class Photo : NSObject, NSCoding{
    
    var height : Int!
    var htmlAttributions : [String]!
    var photoReference : String!
    var width : Int!
    
    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        height = json["height"].intValue
        htmlAttributions = [String]()
        let htmlAttributionsArray = json["html_attributions"].arrayValue
        for htmlAttributionsJson in htmlAttributionsArray{
            htmlAttributions.append(htmlAttributionsJson.stringValue)
        }
        photoReference = json["photo_reference"].stringValue
        width = json["width"].intValue
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if height != nil{
            dictionary["height"] = height
        }
        if htmlAttributions != nil{
            dictionary["html_attributions"] = htmlAttributions
        }
        if photoReference != nil{
            dictionary["photo_reference"] = photoReference
        }
        if width != nil{
            dictionary["width"] = width
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        height = aDecoder.decodeObject(forKey: "height") as? Int
        htmlAttributions = aDecoder.decodeObject(forKey: "html_attributions") as? [String]
        photoReference = aDecoder.decodeObject(forKey: "photo_reference") as? String
        width = aDecoder.decodeObject(forKey: "width") as? Int
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    func encode(with aCoder: NSCoder)
    {
        if height != nil{
            aCoder.encode(height, forKey: "height")
        }
        if htmlAttributions != nil{
            aCoder.encode(htmlAttributions, forKey: "html_attributions")
        }
        if photoReference != nil{
            aCoder.encode(photoReference, forKey: "photo_reference")
        }
        if width != nil{
            aCoder.encode(width, forKey: "width")
        }
        
    }
    
}
