//
//  WeatherViewController.swift
//  Weather_Restaurant_Demo
//
//  Created by Waqas Khan on 23/03/2019.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit

class WeatherViewController: BaseViewController {
    
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
    }
}

extension WeatherViewController {
    // MARK: Actions
    
    @IBAction func popularRestaurantAction(_ sender: Any) {
        
        let restaurantVC = RestaurantViewController.instantiateFromStoryboard()
        self.navigationController?.pushViewController(restaurantVC, animated: true)
    }
}

extension WeatherViewController:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    // MARK: UICollectionView
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String.init(describing: WeatherCollectionViewCell.self), for: indexPath) as!  WeatherCollectionViewCell
        
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
