//
//  RestaurantViewController.swift
//  Weather_Restaurant_Demo
//
//  Created by Waqas Khan on 24/03/2019.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit

class RestaurantViewController: BaseViewController {
    
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
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = restaurantTableView.dequeueReusableCell(withIdentifier: String.init(describing: RestaurantTableViewCell.self)) as! RestaurantTableViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  SizeUtil.convertIphone6SizeToOtherPhonesRespectively(size: 150)
    }
}
