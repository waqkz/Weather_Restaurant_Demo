//
//  UIImageView+Extensions.swift
//  Weather_Restaurant_Demo
//
//  Created by Waqas Khan on 26/03/2019.
//  Copyright © 2019 test. All rights reserved.
//

import Foundation
import Kingfisher
import Alamofire

extension UIImageView{
    
    func setImageFromUrl(urlStr:String){
        
        let url = URL(string: urlStr)!
        print(url)
        self.kf.indicatorType = .activity
        self.kf.setImage(with: url,
                         placeholder: nil,
                         options: [.transition(.fade(1))],
                         progressBlock: nil,
                         completionHandler: nil)
        
        
        
        
    }
    
    func setImageUrlWithAppendedBaseUrlAndPlaceHolder(urlStr:String,placeHolder:UIImage?){
        
        if !urlStr.isEmpty{
            
            let str = urlStr
            print(str)
            let url = URL(string: str)!
            print(url)
            self.kf.indicatorType = .activity
            self.kf.setImage(with: url,
                             placeholder: placeHolder,
                             options: [.transition(.fade(1))],
                             progressBlock: nil,
                             completionHandler: nil)
        }
        
    }
    
    
    func setImageFromUrlWithPlaceHolder(urlStr:String,placeHolder:UIImage?){
        
        if !urlStr.isEmpty{
            
            let url = URL(string: urlStr)!
            print(url)
            self.kf.indicatorType = .activity
            self.kf.setImage(with: url,
                             placeholder:placeHolder ,
                             options: [.transition(.fade(1))],
                             progressBlock: nil,
                             completionHandler: nil)
        }
    }
}
