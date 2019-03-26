//
//  WeatherViewController.swift
//  Weather_Restaurant_Demo
//
//  Created by Waqas Khan on 23/03/2019.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherViewController: BaseViewController {
    
    let locationManager = CLLocationManager()
    var forcastList : [List] = [List]()
    var weatherForcasts:Forcast?
    
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var windSpeed: UILabel!
    @IBOutlet weak var weatherHumidity: UILabel!
    @IBOutlet weak var weatherPercipitation: UILabel!
    @IBOutlet weak var weatherTemperature: UILabel!
    @IBOutlet weak var weatherForcast: UILabel!
    @IBOutlet weak var weatherDay: UILabel!
    @IBOutlet weak var weatherCity: UILabel!
    @IBOutlet weak var weatherForcastCollectionView: UICollectionView!
    
    class func instantiateFromStoryboard() -> WeatherViewController {
        let MAIN_UI_STORYBOARD = UIStoryboard(name: Constants.MAIN_STORYBOARD, bundle: nil)
        return MAIN_UI_STORYBOARD.instantiateViewController(withIdentifier: String(describing: self)) as! WeatherViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let nib = UINib.init(nibName: String(describing: WeatherCollectionViewCell.self), bundle: nil)
        self.weatherForcastCollectionView.register(nib, forCellWithReuseIdentifier: String(describing: WeatherCollectionViewCell.self))
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.weatherForcastService(lat: "\(35)", lon: "\(139)")
    }
    
    func setWeatherData() {
        
        self.weatherCity.text = self.weatherForcasts?.city?.name ?? ""
        
        let day = DateManager.sharedInstance.returnServerStringInFormattedStringSS(serverDateInString: self.weatherForcasts?.list[0].dtTxt ?? "", serverDatePattern: "yyyy-MM-dd HH:mm:ss", toFormateDatePattern: "EEEE")
        
        self.weatherDay.text = day
        self.weatherForcast.text = self.weatherForcasts?.list[0].weather[0].descriptionField ?? ""
        self.weatherImage.setImageUrlWithAppendedBaseUrlAndPlaceHolder(urlStr: "\(EndPoints.BaseApi.WeatherForcastImageUrl)\(String(describing: self.weatherForcasts?.list[0].weather[0].icon ?? "10d")).png", placeHolder: UIImage.init(named: "default_image"))
        
        let tempInCelcius = Double((self.weatherForcasts?.list[0].main.temp ?? 0.0 - 32) * 0.5556)
        let celciusDouble = Double(String(format: "%.2f", tempInCelcius))
        
        self.weatherTemperature.text = "\(celciusDouble ?? 0.0)"
        self.weatherPercipitation.text =  "\(self.weatherForcasts?.list[0].main.pressure ?? 0.0) hPa"
        self.weatherHumidity.text = "\(self.weatherForcasts?.list[0].main.humidity ?? 0)%"
        
        let windSpeed = Double((self.weatherForcasts?.list[0].wind.speed ?? 0.0) * 3.6)
        let doubleStr = Double(String(format: "%.2f", windSpeed))
        self.windSpeed.text = "\(doubleStr ?? 0.0) Km/h"
    }
}

extension WeatherViewController {
    // MARK: Actions
    
    @IBAction func popularRestaurantAction(_ sender: Any) {
        
        let restaurantVC = RestaurantViewController.instantiateFromStoryboard()
        self.navigationController?.pushViewController(restaurantVC, animated: true)
    }
}

extension WeatherViewController {
    // MARK: API Calls
    
    func weatherForcastService(lat:String, lon:String) {
        
        var param:[String:Any] = [String:Any]()
        
        param["lat"] = lat
        param["lon"] = lon
        param["appid"] = Constants.APP_ID
        
        WeatherServices.sharedInstance.getWeatherForcasts(param: param) { (success, response, error) in
            
            if success == true{
                
                let forcast = response
                self.weatherForcasts = Forcast.init(fromJson: forcast)
                
                self.weatherForcastCollectionView.reloadData()
                self.setWeatherData()
            }
        }
    }
}

extension WeatherViewController:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    // MARK: UICollectionView
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.weatherForcasts?.list.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String.init(describing: WeatherCollectionViewCell.self), for: indexPath) as!  WeatherCollectionViewCell
        
        cell.setCellData(list: self.self.weatherForcasts?.list[indexPath.row])
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let numberOfColumns: CGFloat = 5.5
        let collectionViewCellSpacing:CGFloat = 0
        
        var collectionViewSize = (collectionView.frame.size )
        collectionViewSize.width = (collectionViewSize.width - collectionViewCellSpacing)/numberOfColumns //Display Five elements.
        collectionViewSize.height = SizeUtil.convertIphone6SizeToOtherPhonesRespectively(size: 200)
        
        return collectionViewSize
    }
}

extension WeatherViewController: CLLocationManagerDelegate {
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
        
        self.weatherForcastService(lat: "\(location.coordinate.latitude)", lon: "\(location.coordinate.longitude)")
    }
}
