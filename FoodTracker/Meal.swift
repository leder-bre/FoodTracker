//
//  Meal.swift
//  FoodTracker
//
//  Created by Brendan Leder on 2016-11-05.
//  Copyright © 2016 Brendan Leder. All rights reserved.
//

import UIKit

class Meal: NSObject, NSCoding {
	//MARK: Properties
	var name: String = ""
	var photo: UIImage?
	var rating: Int
	static let DocumentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
	static let ArchiveURL = DocumentsDirectory[0].appendPathComponent("meals")
	
	init?(name: String, photo: UIImage?, rating:Int){
		self.name = name
		self.photo = photo
		self.rating = rating
		super.init()
		if name.isEmpty || rating < 0 {
			return nil
		}
	}
	//MARK: Types
	struct PropertyKey {
		static let nameKey = "name"
		static let photoKey = "photo"
		static let ratingKey = "rating"
	}
	//MARK: NSCoding
	func encode(with aCoder: NSCoder) {
		aCoder.encode(name, forKey: PropertyKey.nameKey)
		aCoder.encode(photo, forKey: PropertyKey.photoKey)
		aCoder.encode(rating, forKey: PropertyKey.ratingKey)
	}
	required convenience init?(coder aDecoder: NSCoder) {
		let name = aDecoder.decodeObject(forKey: PropertyKey.nameKey) as! String
		let photo = aDecoder.decodeObject(forKey: PropertyKey.photoKey) as? UIImage
		let rating = aDecoder.decodeObject(forKey: PropertyKey.ratingKey) as! Int
		self.init(name: name, photo: photo, rating: rating)
	}
}
