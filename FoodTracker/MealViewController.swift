//
//  MealViewController.swift
//  FoodTracker
//
//  Created by Brendan Leder on 2016-10-25.
//  Copyright © 2016 Brendan Leder. All rights reserved.
//

import UIKit

class MealViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
	//MARK: Properties
	@IBOutlet weak var nameTextField: UITextField!
	@IBOutlet weak var photoImageView: UIImageView!
	@IBOutlet weak var ratingControl: RatingControl!
	@IBOutlet weak var saveButton: UIBarButtonItem!
	
	var meal: Meal?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		//Handle the text field's user input through delegate calls
		nameTextField.delegate = self
		//Set the view controller to the delegating object
		
	}
	//MARK: UITextFieldDelegate
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return true
	}
	func textFieldDidEndEditing(_ textField: UITextField) {
	}
	//MARK: UIImagePickerDelegate
	
	func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
		dismiss(animated: true, completion: nil)
	}
	
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
		let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
		photoImageView.image = selectedImage
		dismiss(animated: true, completion: nil)
	}
	//MARK: Navigation
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let senderObject = sender as AnyObject? {
			if saveButton === senderObject {
				let name = nameTextField.text ?? ""
				let photo = photoImageView.image
				let rating = ratingControl.rating
				meal = Meal(name: name, photo: photo, rating: rating)
			}
		}
	}
	//MARK: Actions
	@IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
		nameTextField.resignFirstResponder()
		let imagePickerController = UIImagePickerController()
		imagePickerController.sourceType = .photoLibrary
		imagePickerController.delegate = self
		present(imagePickerController, animated: true, completion: nil)
	}
	
}
