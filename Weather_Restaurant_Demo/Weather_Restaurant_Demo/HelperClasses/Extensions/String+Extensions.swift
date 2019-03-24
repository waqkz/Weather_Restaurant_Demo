//
//  String+Extensions.swift
//  Weather_Restaurant_Demo
//
//  Created by Waqas Khan on 23/03/2019.
//  Copyright © 2019 test. All rights reserved.
//

import Foundation

extension String {
    
    func isEmptyOrWhitespace() -> Bool {
        if(self.isEmpty) {
            return true
        }
        return self.trimmingCharacters(in: NSCharacterSet.whitespaces) == ""
    }
    
    func  removePlusFromPhoneNumber() -> String {
        
        return self.replacingOccurrences(of: "+", with: "")
    }
    
    var dropLast: String {
        return dropLast()
    }
    
    func dropLast(_ n: Int = 1) -> String {
        return String(characters.dropLast(n))
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
}
