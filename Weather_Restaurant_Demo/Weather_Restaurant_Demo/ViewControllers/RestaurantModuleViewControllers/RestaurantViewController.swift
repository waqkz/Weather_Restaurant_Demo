//
//  RestaurantViewController.swift
//  Weather_Restaurant_Demo
//
//  Created by Waqas Khan on 24/03/2019.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import CoreLocation

class RestaurantViewController: BaseViewController {
    
    let locationManager = CLLocationManager()
    
    var nearbyRestaurants:NearbyRestaurantModal?
    
    @IBOutlet weak var restaurantTableView: UITableView!
    
    class func instantiateFromStoryboard() -> RestaurantViewController {
        let MAIN_UI_STORYBOARD = UIStoryboard(name: Constants.MAIN_STORYBOARD, bundle: nil)
        return MAIN_UI_STORYBOARD.instantiateViewController(withIdentifier: String(describing: self)) as! RestaurantViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let nib = UINib.init(nibName: String(describing: RestaurantTableViewCell.self), bundle: nil)
        self.restaurantTableView.register(nib, forCellReuseIdentifier: String(describing: RestaurantTableViewCell.self))
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        //self.nearbyRestaurantService(lat: "\(-33.8670522)", lon: "\(151.1957362)")
        self.locationManager.startUpdatingLocation()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
        self.locationManager.stopUpdatingLocation()
    }
}

extension RestaurantViewController {
    // MARK: Actions
    
    @IBAction func restaurantBackAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension RestaurantViewController: UITableViewDataSource, UITableViewDelegate {
    // MARK: UITableview
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.nearbyRestaurants?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = restaurantTableView.dequeueReusableCell(withIdentifier: String.init(describing: RestaurantTableViewCell.self)) as! RestaurantTableViewCell
        
        cell.setCellData(result: self.nearbyRestaurants?.results[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  SizeUtil.convertIphone6SizeToOtherPhonesRespectively(size: 150)
    }
}

extension RestaurantViewController {
    // MARK: API Calls
    
    func nearbyRestaurantService(lat:String, lon:String) {
        
        var param:[String:Any] = [String:Any]()
        
        param["location"] = "\(lat),\(lon)"
        param["radius"] = 1500
        param["type"] = "restaurant"
        param["key"] = Constants.RESTAURANT_ID
        
        RestaurantServices.sharedInstance.getNearbyRestaurants(param: param) { (success, response, error) in
            
            if success == true{
                
                let restaurant = response
                self.nearbyRestaurants = NearbyRestaurantModal.init(fromJson: restaurant)
                self.restaurantTableView.reloadData()
            }
        }
    }
}

extension RestaurantViewController: CLLocationManagerDelegate {
    // MARK: Core Locations
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        guard status == .authorizedWhenInUse else {
            return
        }
        
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            return
        }
        
        self.nearbyRestaurantService(lat: "\(location.coordinate.latitude)", lon: "\(location.coordinate.longitude)")
    }
}
