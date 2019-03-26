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
        
        static let RestaurantBaseUrl =  "https://maps.googleapis.com"
        static let RestaurantUrl = "\(RestaurantBaseUrl)/maps/api/place/nearbysearch/json"
        static let RestaurantPhotoUrl =  "\(RestaurantBaseUrl)/maps/api/place/photo?maxwidth=400&photoreference="
        static let RestaurantPhotoKey =  "&key=AIzaSyASsrdsiQ9XYq0Pd6lU-o4lxBRrFE_hUno"
    }
}
