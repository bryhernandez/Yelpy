//
//  ViewController.swift
//  Yelpy
//
//  Created by Memo on 5/21/20.
//  Copyright © 2020 memo. All rights reserved.
//

import UIKit
import AlamofireImage

class RestaurantsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    // ––––– TODO: Add storyboard Items (i.e. tableView + Cell + configurations for Cell + cell outlets)
    // ––––– TODO: Next, place TableView outlet here
    @IBOutlet weak var tableView: UITableView!
    
    
    // –––––– TODO: Initialize restaurantsArray
    var restaurantsArray: [[String: Any?]] = []
    
    
    // ––––– TODO: Add tableView datasource + delegate
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 150
        
        getAPIData()
    }
    
    
    // ––––– TODO: Get data from API helper and retrieve restaurants
    func getAPIData(){
        API.getRestaurants(){(restaurants) in
            guard let restaurants = restaurants else {
                return
            }
            print(restaurants)
            self.restaurantsArray = restaurants
            self.tableView.reloadData() //reload the data onto screen
        }
    }

    // ––––– TODO: Create tableView Extension and TableView Functionality
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantsArray.count //number of cells that there will be
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell") as! RestaurantCell
        let restaurant = restaurantsArray[indexPath.row]
        
        cell.restaurantName.text = restaurant["name"] as? String ?? "" //set label to restaurant name for each cell
        
        if let imageUrlString = restaurant["image_url"] as? String{ //set restaurnat image for each cell
            let imageUrl = URL(string: imageUrlString)
            cell.restaurantImage.af.setImage(withURL: imageUrl!)
        }
        
        cell.phoneNumberLabel.text = restaurant["display_phone"] as? String ?? "" //sets the restaurnats phone number
        
        //will set the ratings pictures in assets
        if restaurant["rating"] as! Double == 0 {
            let image = UIImage(named: "small_0")
            cell.ratingImage.image = image
        } else if restaurant["rating"] as! Double == 1 {
            let image = UIImage(named: "small_1")
            cell.ratingImage.image = image
        } else if restaurant["rating"] as! Double == 1.5 {
            let image = UIImage(named: "small_1_half")
            cell.ratingImage.image = image
        } else if restaurant["rating"] as! Double == 2 {
            let image = UIImage(named: "small_2")
            cell.ratingImage.image = image
        } else if restaurant["rating"] as! Double == 2.5 {
            let image = UIImage(named: "small_2_half")
            cell.ratingImage.image = image
        } else if restaurant["rating"] as! Double == 3 {
            let image = UIImage(named: "small_3")
            cell.ratingImage.image = image
        } else if restaurant["rating"] as! Double == 3.5 {
            let image = UIImage(named: "small_3_half")
            cell.ratingImage.image = image
        } else if restaurant["rating"] as! Double == 4 {
            let image = UIImage(named: "small_4")
            cell.ratingImage.image = image
        } else if restaurant["rating"] as! Double == 4.5 {
            let image = UIImage(named: "small_4_half")
            cell.ratingImage.image = image
        } else if restaurant["rating"] as! Double == 5 {
            let image = UIImage(named: "small_5")
            cell.ratingImage.image = image
        }
        
        cell.numberRatings.text = restaurant["review_count"] as? String ?? ""
    
        
        return cell
    }
}


