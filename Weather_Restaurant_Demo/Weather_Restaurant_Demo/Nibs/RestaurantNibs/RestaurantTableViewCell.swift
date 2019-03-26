//
//  RestaurantTableViewCell.swift
//  Weather_Restaurant_Demo
//
//  Created by Waqas Khan on 24/03/2019.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import Cosmos

class RestaurantTableViewCell: UITableViewCell {
    
    @IBOutlet weak var restaurantName: UILabel!
    @IBOutlet weak var restaurantImage: UIImageView!
    @IBOutlet weak var restaurantCity: UILabel!
    @IBOutlet weak var restaurantType: UILabel!
    @IBOutlet weak var numberOfReview: UILabel!
    @IBOutlet weak var cosmosRating: CosmosView!
    
    func setCellData(result: Result?){
        
        self.restaurantName.text = result?.name ?? ""
        
        let image = EndPoints.BaseApi.RestaurantPhotoUrl + (result?.photos[0].photoReference)! + EndPoints.BaseApi.RestaurantPhotoKey;
        self.restaurantImage.setImageUrlWithAppendedBaseUrlAndPlaceHolder(urlStr: image, placeHolder: UIImage.init(named: "default_image"))
        
        self.restaurantCity.text = result?.vicinity ?? ""
        self.restaurantType.text = result?.types[0] ?? ""
        self.numberOfReview.text = "\(result?.userRatingsTotal ?? 0) reviews"
        self.cosmosRating.rating = Double(result?.rating ?? 0.0)
    }
}
