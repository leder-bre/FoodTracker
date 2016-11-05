//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Brendan Leder on 2016-11-02.
//  Copyright © 2016 Brendan Leder. All rights reserved.
//

import UIKit

class RatingControl: UIView {
	// MARK: Properties
	var rating = 0
	var ratingButtons = [UIButton]()
	let spacing = 5
	let starCount = 5
	// MARK: Initialization
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		let filledStarImage = #imageLiteral(resourceName: "filledStar")
		let emptyStarImage = #imageLiteral(resourceName: "emptyStar")
		for _ in 0...(starCount-1) {
			let button = UIButton()
			button.setImage(emptyStarImage, for: .normal)
			button.setImage(filledStarImage, for: .selected)
			button.setImage(filledStarImage, for: [.highlighted, .selected])
			//button.backgroundColor = UIColor.red
			button.adjustsImageWhenHighlighted = false
			button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchDown)
			ratingButtons += [button]
			addSubview(button)
		}
	}
	override func layoutSubviews() {
		let buttonSize = Int(frame.size.height)
		print("height2: \(buttonSize)")
		var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
		for(index,button) in ratingButtons.enumerated() {
			buttonFrame.origin.x = CGFloat(index * (44 + spacing))
			button.frame = buttonFrame
		}
	}
	override public var intrinsicContentSize: CGSize {
		get {
			let buttonSize = Int(frame.size.height)
			let width = (buttonSize * starCount) + (spacing * (starCount-1))
			print("height: \(buttonSize)")
			return CGSize(width: width, height: 44) //ERROR: buttonSize is always 1000 despite being 44 in layoutSubviews, meaning this is called before frame setup
		}
	}
	// MARK: Button Action
	func ratingButtonTapped(button: UIButton) {
		print("Button Pressed")
	}
}
