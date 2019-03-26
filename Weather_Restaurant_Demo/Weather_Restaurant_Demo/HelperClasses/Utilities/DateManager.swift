//
//  DateManager.swift
//  Weather_Restaurant_Demo
//
//  Created by Waqas Khan on 26/03/2019.
//  Copyright © 2019 test. All rights reserved.
//

import Foundation

class DateManager {
    
    static let sharedInstance: DateManager = DateManager()
    
    private init(){}
    
    func returnServerStringInFormattedStringSS(serverDateInString:String, serverDatePattern:String, toFormateDatePattern:String) -> String{
        
        let format = DateFormatter()
        format.locale = Locale(identifier: "en_US_POSIX")
        
        format.dateFormat =  serverDatePattern //"yyyy-MM-dd HH:mm:ss"
        let serverFormattedDate = format.date(from: serverDateInString)
        format.dateFormat = toFormateDatePattern //"dd MMM yyyy" "yyyy-MM-dd"
        let toPresentFormatedDateInString = format.string(from: serverFormattedDate!)
        
        return toPresentFormatedDateInString
    }
    
    func returnServerDateInFormattedDateDD(serverDate:Date, serverDatePattern:String, toFormateDatePattern:String) -> Date{
        
        let format = DateFormatter()
        format.locale = Locale(identifier: "en_US_POSIX")
        
        format.dateFormat =  serverDatePattern //"yyyy-MM-dd HH:mm:ss"
        let serverFormattedDate = format.string(from: serverDate)
        format.dateFormat = toFormateDatePattern //"dd MMM yyyy"
        let toPresentFormatedDateInDate = format.date(from: serverFormattedDate)
        
        return toPresentFormatedDateInDate!
    }
    
    func returnServerDateInFormattedStringDS(serverDate:Date, serverDatePattern:String, toFormateDatePattern:String) -> String{
        
        let format = DateFormatter()
        format.locale = Locale(identifier: "en_US_POSIX")
        
        format.dateFormat =  serverDatePattern //"yyyy-MM-dd HH:mm:ss"
        let serverFormattedDateString = format.string(from: serverDate)
        let serverFormattedDate = format.date(from: serverFormattedDateString)
        format.dateFormat = toFormateDatePattern //"dd MMM yyyy"
        let toPresentFormatedDateInString = format.string(from: serverFormattedDate!)
        
        return toPresentFormatedDateInString
    }
    
    func returnServerDateStringInFormattedDate(serverDateInString:String, serverDatePattern:String) -> Date{
        
        let format = DateFormatter()
        format.locale = Locale(identifier: "en_US_POSIX")
        
        format.dateFormat =  serverDatePattern //"yyyy-MM-dd HH:mm:ss"
        let toPresentFormatedDate = format.date(from: serverDateInString)
        
        return toPresentFormatedDate!
    }
    
    func returnServerDateInFormattedString(serverDate:Date, serverDatePattern:String) -> String{
        
        let format = DateFormatter()
        format.locale = Locale(identifier: "en_US_POSIX")
        
        format.dateFormat =  serverDatePattern //"yyyy-MM-dd HH:mm:ss"
        let toPresentFormatedDateInString = format.string(from: serverDate)
        
        return toPresentFormatedDateInString
    }
    
}
