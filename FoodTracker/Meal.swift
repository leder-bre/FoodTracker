//
//  Meal.swift
//  FoodTracker
//
//  Created by Brendan Leder on 2016-11-05.
//  Copyright © 2016 Brendan Leder. All rights reserved.
//

import UIKit

class Meal {
	//MARK: Properties
	var name: String = ""
	var photo: UIImage?
	var rating: Int
	
	init?(name: String, photo: UIImage?, rating:Int){
		self.name = name
		self.photo = photo
		self.rating = rating
		if name.isEmpty || rating < 0 {
			return nil
		}
	}
}
