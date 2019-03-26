//
//  WeatherCollectionViewCell.swift
//  Weather_Restaurant_Demo
//
//  Created by Waqas Khan on 23/03/2019.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var forcastDay: UILabel!
    @IBOutlet weak var forcastTemp: UILabel!
    @IBOutlet weak var forcastImage: UIImageView!
    
    func setCellData(list: List?){
        
        if let list = list {
            
            let day = DateManager.sharedInstance.returnServerStringInFormattedStringSS(serverDateInString: list.dtTxt, serverDatePattern: "yyyy-MM-dd HH:mm:ss", toFormateDatePattern: "EEE")
            
            self.forcastDay.text = day
            
            let tempInCelcius = Double((list.main.temp ?? 0.0 - 32) * 0.5556)
            let celciusDouble = Double(String(format: "%.2f", tempInCelcius))
            
            self.forcastTemp.text = "\(celciusDouble ?? 0.0)°C"
            
            
            self.forcastImage.setImageUrlWithAppendedBaseUrlAndPlaceHolder(urlStr: "\(EndPoints.BaseApi.WeatherForcastImageUrl)\(String(describing: list.weather[0].icon ?? "10d")).png", placeHolder: UIImage.init(named: "default_image"))
        }
    }
}
