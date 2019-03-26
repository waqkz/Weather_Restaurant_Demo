//
//  ServiceApiEndPoints.swift
//  Weather_Restaurant_Demo
//
//  Created by Waqas Khan on 26/03/2019.
//  Copyright © 2019 test. All rights reserved.
//

import Foundation
import UIKit

struct EndPoints {
    struct BaseApi {
        static let BaseUrl =  "https://api.openweathermap.org"
        static let WeatherForcastUrl = "\(BaseUrl)/data/2.5/forecast"
        static let WeatherForcastImageUrl = "\(BaseUrl)/img/w/"
    }
}
